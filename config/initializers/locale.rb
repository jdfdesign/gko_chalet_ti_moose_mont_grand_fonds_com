# set default locale to something other than :en
I18n.default_locale = :en
GkoChaletTiMoose::Application.config.to_prepare do
  Account.multi_accounts_enabled = true
end