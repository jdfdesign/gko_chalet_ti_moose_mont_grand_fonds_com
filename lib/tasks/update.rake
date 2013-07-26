
 def select_all_old(table_name)
   connect_to("cms_live_hello_stbarth_com")
   ActiveRecord::Base.connection.execute("SELECT * FROM #{table_name}")
 end

 def connect_to(dbname)
   oldconnect = ActiveRecord::Base.establish_connection(
   :adapter => "mysql2",
   :encoding => "utf8",
   :reconnect => false,
   :database => dbname,
   :pool => 5,
   :username => "root",
   :password => "",
   :socket => "/tmp/mysql.sock")
 end 

 namespace :crawl do
   task :url => :environment do
     require 'anemone'
     require 'optparse'
     require 'ostruct'
     
     root = 'http://fr.stbartslive.com/'
     options = OpenStruct.new
     options.output_file = "crawl.#{Time.now.to_i}"

     Anemone.crawl(root) do |anemone|
       anemone.after_crawl do |pages|
         open(options.output_file, 'w') {|f| dump(pages, f)}
       end
     end
   end
 end

 
 namespace :patch do

   
   task :adjust => :environment do
     ####################################################
     puts "creating account"
     @account = Account.find_or_create_by_reference(
         :reference => "root",
         :nickname => "root")
     ####################################################
     Globalize.locale = "en"

     puts "creating site"
     @site = Site.find_or_create_by_host(
         :host => "0.0.0.0:3000",
         :title => "StBarts Live",
         :account_id => @account.id,
         :locales => "fr"
     ) 
     
     Globalize.locale = "fr"
     @site.title = "StBarts Live"
     @site.save!
     
     Globalize.locale = "en"
     ####################################################
     puts "creating users"
     if %w[development test dev local].include?(Rails.env)
       pwd = "cmsadmin"
     else
       pwd = (0..8).inject("") { |s, i| s << (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).rand }
     end

     User.skip_callbacks do
       User::ROLES_TYPES.each do |role|
         user = User.find_or_create_by_email(
             :email => "#{role}@example.com",
             :username => "#{role}",
             :firstname => "CMS",
             :lastname => "Administrator",
             :password => pwd,
             :password_confirmation => pwd,
             :roles => [role.to_s],
             :account_id => @account.id)

         user.site_registrations.create!(:site_id => @site.id)

         user.confirm!
       end
     end

     @user = @account.users.first

     Section.rebuild!
     Category.rebuild! 
     Globalize.locale = "en"
     
     Section.all.each do |section|
       if section.parent_id.present? 
         section.path = section.fullpath
         section.save
       end 
     end
     Globalize.locale = "fr"
     
     Section.all.each do |section|
       if section.parent_id.present? 
         section.path = section.fullpath
         section.save
       end
     end

     Image.all.each do |image|
       a = image.image_name.split(".")
       name, ext = a[0], a[1]
       file_path = "#{Rails.root}/public/uploads/assets/#{image.id.to_s}/#{name}-original.#{ext}"
       if image.image_assignments.any?
         assignment = image.image_assignments.first
         if assignment.attachable_type == "Content"
           account = Content.find_by_id(assignment.attachable_id).account
         else
           account =  @user.account
         end
       end  
       account ||=  @user.account
       
       if(file_path)
         image.image = File.new(file_path)
         image.author_id = @user.id
         image.account_id = account.id
         image.save
       end
     end
   end
   
   task :migrate => :environment do
     all_classes = %W(Section Content Category Categorization Account Card Sticker Sticking Image ImageAssignment Event TableSpecial)
     all_classes.each do |model|
       model = model.constantize
       model.delete_all
       records = select_all_old(model.name.tableize)
       connect_to("gko_stbartslive_com_development")
       records.each(:as => :hash) do |h|
         model.skip_callbacks do
           record = model.new
           h.each {|key, value| record["#{key}"] = value if record.attributes.include?(key) }
           record.site_id = 1 if record.respond_to?(:site_id)
           if record.is_a?(Section)
             record.type = "TableMenuList" if record.type == "TableMenuSection"
             record.type = "TableList" if record.type == "TableSection"
             record.type = "TableSpecialList" if record.type == "Deal"
             record.type = "Calendar" if record.type == "Agenda"
             record.type = "GalleryList" if record.type == "Portfolio"
             record.type = "TableList" if record.type == "BarClubSection"
           end
           if record.is_a?(Account)
             record.reference = record.nickname if record.reference.blank?
           end
           record.save(:validate => false) 
         end
       end
       
       if model.respond_to?(:translations_table_name)
          translation_class =  model.translation_class
          translation_class.delete_all
          records = select_all_old(model.translations_table_name) || []
          connect_to("gko_stbartslive_com_development")
          records.each(:as => :hash) do |h|
            translation_class.skip_callbacks do
              record = translation_class.new
              h.each {|key, value| record["#{key}"] = value if record.attributes.include?(key) }
              record.save(:validate => false)
            end
          end
       end
     end
   end
   task :update_card => :environment do
     Card.all.each do |card| 
       account = card.account
       if account
          puts "#{card.name} has account #{account.nickname}" 
          profile = account.profile
          if profile
             puts "-- #{account.nickname} has profile #{profile.title}"
             card.content = profile
             card.save
          else
             puts "--!!!!!!!!!! #{account.nickname} has NO profile"
          end
       else
          puts "!!!!!!!#{card.name} has NO account"
       end
     end
   end
   task :replace_images => :environment do
     @site = Site.first
     @user = User.find_by_email("superadmin@example.com")
     Image.all.each do |image|
       a = image.image_name.split(".")
       name, ext = a[0], a[1]
       file_path = "#{Rails.root}/public/uploads/assets/#{image.id.to_s}/#{name}-original.#{ext}"
       if image.image_assignments.any?
         assignment = image.image_assignments.first
         if assignment.attachable_type == "Content"
           account = Content.find_by_id(assignment.attachable_id).account
         else
           account =  @user.account
         end
       end  
       account ||=  @user.account
       
       if(file_path)
         image.image = File.new(file_path)
         image.author_id = @user.id
         image.account_id = account.id
         image.save
       end
     end
   end
   
   
 end