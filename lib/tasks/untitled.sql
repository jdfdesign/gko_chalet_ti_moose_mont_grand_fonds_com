1	SET FOREIGN_KEY_CHECKS = 0
1	ALTER TABLE `accounts` CHANGE COLUMN `type` `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `id`
1	ALTER TABLE `accounts` CHANGE COLUMN `nickname` `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `type`
1	ALTER TABLE `accounts` CHANGE COLUMN `reference` `reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `nickname`
1	ALTER TABLE `accounts` DROP COLUMN `status`
1	ALTER TABLE `accounts` CHANGE COLUMN `deleted_at` `deleted_at` datetime DEFAULT NULL after `reference`
1	ALTER TABLE `accounts` CHANGE COLUMN `expires_at` `expires_at` datetime DEFAULT NULL after `deleted_at`
1	ALTER TABLE `accounts` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `expires_at`
1	ALTER TABLE `accounts` ADD INDEX `index_accounts_on_reference` USING BTREE (reference)
1	DROP TABLE `authentications`
1	ALTER TABLE `cards` DROP INDEX `index_cards_on_content_id`
1	ALTER TABLE `cards` DROP INDEX `index_cards_on_site_id`
1	ALTER TABLE `cards` CHANGE COLUMN `account_id` `account_id` int(11) DEFAULT NULL after `province_state`
1	ALTER TABLE `cards` CHANGE COLUMN `country_id` `country_id` int(11) DEFAULT NULL after `account_id`
1	ALTER TABLE `cards` CHANGE COLUMN `area_id` `area_id` int(11) DEFAULT NULL after `country_id`
1	ALTER TABLE `cards` DROP COLUMN `content_id`
1	ALTER TABLE `cards` DROP COLUMN `site_id`
1	ALTER TABLE `cards` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `pbox`
1	ALTER TABLE `categories` DROP COLUMN `site_id`
1	ALTER TABLE `categories` CHANGE COLUMN `section_id` `section_id` int(11) DEFAULT NULL after `id`
1	ALTER TABLE `categories` CHANGE COLUMN `name` `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `section_id`
1	ALTER TABLE `categories` CHANGE COLUMN `slug` `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `body`
1	ALTER TABLE `categories` CHANGE COLUMN `path` `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `categories` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `path`
1	ALTER TABLE `categories` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_title`
1	ALTER TABLE `categories` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_description`
1	ALTER TABLE `categories` CHANGE COLUMN `parent_id` `parent_id` int(11) DEFAULT NULL after `meta_keywords`
1	ALTER TABLE `categories` DROP COLUMN `lft`
1	ALTER TABLE `categories` DROP COLUMN `rgt`
1	ALTER TABLE `categories` DROP COLUMN `level`
1	ALTER TABLE `categories` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `parent_id`
1	ALTER TABLE `categorizations` DROP INDEX `index_categorizations_on_categorizable_id_and_categorizable_type`
1	ALTER TABLE `categorizations` DROP INDEX `index_categorizations_on_category_id`
1	ALTER TABLE `categorizations` CHANGE COLUMN `categorizable_id` `categorizable_id` int(11) DEFAULT NULL after `category_id`
1	ALTER TABLE `categorizations` CHANGE COLUMN `categorizable_type` `categorizable_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `categorizable_id`
1	ALTER TABLE `categorizations` ADD COLUMN `created_at` datetime DEFAULT NULL after `categorizable_type`
1	ALTER TABLE `categorizations` ADD COLUMN `updated_at` datetime DEFAULT NULL after `created_at`
1	ALTER TABLE `categorizations` ADD INDEX `category_assignments_categorizable_idx` USING BTREE (categorizable_id, categorizable_type)
1	ALTER TABLE `categorizations` ADD INDEX `index_category_assignments_on_category_id` USING BTREE (category_id)
1	ALTER TABLE `category_translations` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `body`
1	ALTER TABLE `category_translations` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `path`
1	ALTER TABLE `category_translations` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `category_translations` ADD INDEX `path_locale_category_translations_idx` USING BTREE (path, locale)
1	ALTER TABLE `content_translations` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `body`
1	ALTER TABLE `content_translations` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_title`
1	ALTER TABLE `content_translations` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `content_translations` ADD INDEX `permalink_locale_content_translations_idx` USING BTREE (slug, locale)
1	ALTER TABLE `content_translations` ADD INDEX `title_locale_content_translations_idx` USING BTREE (title, locale)
1	ALTER TABLE `contents` DROP INDEX `index_contents_on_slug`
1	ALTER TABLE `contents` DROP INDEX `index_contents_on_site_id`
1	ALTER TABLE `contents` DROP COLUMN `site_id`
1	ALTER TABLE `contents` CHANGE COLUMN `body` `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `title`
1	ALTER TABLE `contents` CHANGE COLUMN `layout` `layout` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `body`
1	ALTER TABLE `contents` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `contents` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_title`
1	ALTER TABLE `contents` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_description`
1	ALTER TABLE `contents` CHANGE COLUMN `author_name` `author_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `published_at`
1	ALTER TABLE `contents` CHANGE COLUMN `section_id` `section_id` int(11) DEFAULT NULL after `options`
1	ALTER TABLE `contents` CHANGE COLUMN `account_id` `account_id` int(11) DEFAULT NULL after `section_id`
1	ALTER TABLE `contents` CHANGE COLUMN `author_id` `author_id` int(11) DEFAULT NULL after `account_id`
1	ALTER TABLE `contents` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `author_id`
1	ALTER TABLE `contents` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `updated_at`
1	ALTER TABLE `contents` ADD INDEX `index_contents_on_account_id` USING BTREE (account_id)
1	DROP TABLE `countries`
1	DROP TABLE `document_assignments`
1	DROP TABLE `document_translations`
1	DROP TABLE `documents`
1	DROP TABLE `dynamic_files`
1	ALTER TABLE `events` DROP INDEX `index_events_on_slug`
1	ALTER TABLE `events` DROP INDEX `index_events_on_site_id`
1	ALTER TABLE `events` CHANGE COLUMN `all_day` `all_day` tinyint(1) NOT NULL DEFAULT '0' after `body`
1	ALTER TABLE `events` CHANGE COLUMN `parent_id` `parent_id` int(11) DEFAULT NULL after `end_date`
1	ALTER TABLE `events` CHANGE COLUMN `account_id` `account_id` int(11) DEFAULT NULL after `slug`
1	ALTER TABLE `events` CHANGE COLUMN `section_id` `section_id` int(11) DEFAULT NULL after `account_id`
1	ALTER TABLE `events` CHANGE COLUMN `published_at` `published_at` datetime DEFAULT NULL after `section_id`
1	ALTER TABLE `events` CHANGE COLUMN `location` `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `published_at`
1	ALTER TABLE `events` CHANGE COLUMN `contact_email` `contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `location`
1	ALTER TABLE `events` CHANGE COLUMN `more_info_url` `more_info_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `contact_email`
1	ALTER TABLE `events` CHANGE COLUMN `registration_url` `registration_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `more_info_url`
1	ALTER TABLE `events` CHANGE COLUMN `author_id` `author_id` int(11) DEFAULT NULL after `registration_url`
1	ALTER TABLE `events` DROP COLUMN `site_id`
1	ALTER TABLE `events` DROP COLUMN `image_mime_type`
1	ALTER TABLE `events` DROP COLUMN `image_name`
1	ALTER TABLE `events` DROP COLUMN `image_size`
1	ALTER TABLE `events` DROP COLUMN `image_width`
1	ALTER TABLE `events` DROP COLUMN `image_height`
1	ALTER TABLE `events` DROP COLUMN `image_uid`
1	ALTER TABLE `events` DROP COLUMN `image_ext`
1	ALTER TABLE `events` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `author_id`
1	ALTER TABLE `events` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `updated_at`
1	ALTER TABLE `events` ADD INDEX `index_events_on_permalink` USING BTREE (slug)
1	DROP TABLE `hotel_options`
1	DROP TABLE `hotel_package_options`
1	DROP TABLE `hotel_rates`
1	DROP TABLE `hotel_rooms`
1	DROP TABLE `hotel_seasons`
1	ALTER TABLE `image_assignments` DROP INDEX `index_image_assignments_on_image_id`
1	ALTER TABLE `image_assignments` DROP INDEX `index_image_assignments_on_attachable_id_and_attachable_type`
1	ALTER TABLE `image_assignments` CHANGE COLUMN `image_id` `image_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `position`
1	ALTER TABLE `image_assignments` ADD INDEX `index_asset_assignments_on_attachable_id_and_attachable_type` USING BTREE (attachable_id, attachable_type)
1	ALTER TABLE `image_assignments` ADD INDEX `index_asset_assignments_on_asset_id` USING BTREE (image_id)
1	ALTER TABLE `image_translations` DROP INDEX `index_image_translations_on_image_id`
1	ALTER TABLE `image_translations` ADD COLUMN `asset_id` int(11) DEFAULT NULL after `id`
1	ALTER TABLE `image_translations` DROP COLUMN `image_id`
1	ALTER TABLE `image_translations` ADD INDEX `index_asset_translations_on_asset_id` USING BTREE (asset_id)
1	ALTER TABLE `images` DROP INDEX `index_images_on_site_id`
1	ALTER TABLE `images` DROP INDEX `index_images_on_author_id`
1	ALTER TABLE `images` DROP INDEX `index_images_on_account_id`
1	ALTER TABLE `images` DROP COLUMN `author_id`
1	ALTER TABLE `images` DROP COLUMN `site_id`
1	ALTER TABLE `images` DROP COLUMN `image_assignments_count`
1	ALTER TABLE `images` CHANGE COLUMN `image_name` `image_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `account_id`
1	ALTER TABLE `images` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `image_name`
1	ALTER TABLE `images` ADD COLUMN `translated` tinyint(1) DEFAULT '0' after `updated_at`
1	ALTER TABLE `images` DROP COLUMN `image_mime_type`
1	ALTER TABLE `images` DROP COLUMN `image_size`
1	ALTER TABLE `images` DROP COLUMN `image_width`
1	ALTER TABLE `images` DROP COLUMN `image_height`
1	ALTER TABLE `images` DROP COLUMN `image_uid`
1	ALTER TABLE `images` DROP COLUMN `image_ext`
1	ALTER TABLE `images` DROP COLUMN `globalized`
1	ALTER TABLE `images` ADD INDEX `index_assets_on_account_id` USING BTREE (account_id)
1	DROP TABLE `inquiries`
1	DROP TABLE `rental_property_options`
1	DROP TABLE `rental_property_rates`
1	DROP TABLE `rental_property_seasons`
1	DROP TABLE `sale_property_options`
1	DROP TABLE `schema_migrations`
1	ALTER TABLE `section_translations` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `body`
1	ALTER TABLE `section_translations` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `path`
1	ALTER TABLE `section_translations` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `section_translations` DROP COLUMN `redirect_url`
1	ALTER TABLE `section_translations` CHANGE COLUMN `title` `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_description`
1	ALTER TABLE `section_translations` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `title_addon`
1	ALTER TABLE `section_translations` DROP COLUMN `menu_title`
1	ALTER TABLE `section_translations` ADD INDEX `path_locale_section_translations_idx` USING BTREE (path, locale)
1	ALTER TABLE `sections` DROP INDEX `index_sections_on_site_id`
1	ALTER TABLE `sections` DROP COLUMN `site_id`
1	ALTER TABLE `sections` CHANGE COLUMN `name` `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `title`
1	ALTER TABLE `sections` CHANGE COLUMN `layout` `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `name`
1	ALTER TABLE `sections` CHANGE COLUMN `body` `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `layout`
1	ALTER TABLE `sections` CHANGE COLUMN `parent_id` `parent_id` int(11) DEFAULT NULL after `body`
1	ALTER TABLE `sections` CHANGE COLUMN `slug` `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `parent_id`
1	ALTER TABLE `sections` CHANGE COLUMN `path` `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `slug`
1	ALTER TABLE `sections` CHANGE COLUMN `meta_title` `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `path`
1	ALTER TABLE `sections` CHANGE COLUMN `meta_description` `meta_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_title`
1	ALTER TABLE `sections` CHANGE COLUMN `meta_keywords` `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_description`
1	ALTER TABLE `sections` CHANGE COLUMN `redirect_url` `redirect_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `meta_keywords`
1	ALTER TABLE `sections` CHANGE COLUMN `options` `options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `published_at`
1	ALTER TABLE `sections` CHANGE COLUMN `link_id` `link_id` int(11) DEFAULT NULL after `options`
1	ALTER TABLE `sections` CHANGE COLUMN `link_type` `link_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `link_id`
1	ALTER TABLE `sections` DROP COLUMN `lft`
1	ALTER TABLE `sections` DROP COLUMN `rgt`
1	ALTER TABLE `sections` CHANGE COLUMN `hidden` `hidden` tinyint(1) DEFAULT '0' after `link_type`
1	ALTER TABLE `sections` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `hidden`
1	ALTER TABLE `sections` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `updated_at`
1	ALTER TABLE `sections` DROP COLUMN `menu_title`
1	ALTER TABLE `settings` DROP INDEX `index_settings_on_site_id`
1	ALTER TABLE `settings` DROP COLUMN `site_id`
1	ALTER TABLE `settings` CHANGE COLUMN `name` `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `id`
1	ALTER TABLE `settings` DROP COLUMN `form_value_type`
1	ALTER TABLE `settings` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `callback_proc_as_string`
1	DROP TABLE `shop_products`
1	DROP TABLE `site_registrations`
1	DROP TABLE `site_translations`
1	DROP TABLE `sites`
1	CREATE TABLE `special_translations` (
	`name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL) ENGINE=`MyISAM` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=DYNAMIC CHECKSUM=0 DELAY_KEY_WRITE=0
1	ALTER TABLE `sticker_translations` DROP INDEX `index_sticker_translations_on_sticker_id`
1	ALTER TABLE `sticker_translations` ADD INDEX `index_tag_translations_on_tag_id` USING BTREE (sticker_id)
1	ALTER TABLE `stickers` DROP INDEX `index_stickers_on_site_id_and_section_id`
1	ALTER TABLE `stickers` DROP INDEX `index_stickers_on_name`
1	ALTER TABLE `stickers` DROP COLUMN `site_id`
1	ALTER TABLE `stickers` DROP COLUMN `section_id`
1	ALTER TABLE `stickers` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `name`
1	ALTER TABLE `stickers` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `updated_at`
1	ALTER TABLE `stickers` ADD INDEX `index_tags_on_name` USING BTREE (`name`)
1	ALTER TABLE `stickings` DROP INDEX `index_stickings_on_sticker_id`
1	ALTER TABLE `stickings` DROP INDEX `index_stickings_on_stickable_id_and_stickable_type`
1	ALTER TABLE `stickings` ADD INDEX `index_taggings_on_taggable_id_and_taggable_type` USING BTREE (stickable_id, stickable_type)
1	ALTER TABLE `stickings` ADD INDEX `index_taggings_on_tag_id` USING BTREE (sticker_id)
1	CREATE TABLE `subscriptions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) NOT NULL,
	`subscribable_id` int(11) NOT NULL,
	`subscribable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
	`created_at` datetime DEFAULT NULL,
	`updated_at` datetime DEFAULT NULL,
	`deleted_at` datetime DEFAULT NULL,
	`confirmed_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)) ENGINE=`InnoDB` AUTO_INCREMENT=2 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=COMPACT CHECKSUM=0 DELAY_KEY_WRITE=0
1	DROP TABLE `table_menu_options`
1	CREATE TABLE `table_option_translations` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`table_option_id` int(11) DEFAULT NULL,
	`locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`annual_closing` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`opening_hours` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
	`created_at` datetime DEFAULT NULL,
	`updated_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `index_3d8998b42c44cd70c88e79891a16918e1064acb9` USING BTREE (table_option_id)) ENGINE=`InnoDB` AUTO_INCREMENT=137 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=COMPACT CHECKSUM=0 DELAY_KEY_WRITE=0
1	ALTER TABLE `table_options` DROP INDEX `index_table_options_on_table_id`
1	ALTER TABLE `table_options` ADD COLUMN `annual_closing` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `id`
1	ALTER TABLE `table_options` ADD COLUMN `opening_hours` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `annual_closing`
1	ALTER TABLE `table_options` CHANGE COLUMN `for_dinner` `for_dinner` tinyint(1) DEFAULT '0' after `opening_hours`
1	ALTER TABLE `table_options` CHANGE COLUMN `for_lunch` `for_lunch` tinyint(1) DEFAULT '0' after `for_dinner`
1	ALTER TABLE `table_options` CHANGE COLUMN `for_breakfast` `for_breakfast` tinyint(1) DEFAULT '0' after `for_lunch`
1	ALTER TABLE `table_options` ADD COLUMN `card_id` int(11) DEFAULT NULL after `delivery`
1	ALTER TABLE `table_options` ADD COLUMN `area_id` int(11) DEFAULT NULL after `card_id`
1	ALTER TABLE `table_options` ADD COLUMN `content_id` int(11) DEFAULT NULL after `area_id`
1	ALTER TABLE `table_options` DROP COLUMN `service_hours`
1	ALTER TABLE `table_options` DROP COLUMN `table_id`
1	ALTER TABLE `table_options` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `content_id`
1	ALTER TABLE `table_options` ADD COLUMN `translated` tinyint(1) DEFAULT '0' after `updated_at`
1	ALTER TABLE `table_options` ADD INDEX `index_table_options_on_card_id` USING BTREE (card_id)
1	ALTER TABLE `table_options` ADD INDEX `index_table_options_on_area_id` USING BTREE (area_id)
1	ALTER TABLE `table_options` ADD INDEX `index_table_options_on_content_id` USING BTREE (content_id)
1	ALTER TABLE `table_special_translations` DROP INDEX `index_73ddd3bd2a566315032e6036391120e82c457f62`
1	ALTER TABLE `table_special_translations` ADD INDEX `index_special_translations_on_special_id` USING BTREE (table_special_id)
1	ALTER TABLE `table_specials` DROP INDEX `index_table_specials_on_author_id`
1	ALTER TABLE `table_specials` DROP INDEX `index_table_specials_on_account_id`
1	ALTER TABLE `table_specials` DROP INDEX `index_table_specials_on_section_id`
1	ALTER TABLE `table_specials` DROP INDEX `index_table_specials_on_site_id`
1	ALTER TABLE `table_specials` DROP INDEX `index_table_specials_on_table_id`
1	ALTER TABLE `table_specials` CHANGE COLUMN `price` `price` decimal(10,2) DEFAULT NULL after `id`
1	ALTER TABLE `table_specials` CHANGE COLUMN `section_id` `section_id` int(11) DEFAULT NULL after `body`
1	ALTER TABLE `table_specials` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `section_id`
1	ALTER TABLE `table_specials` CHANGE COLUMN `globalized` `globalized` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `updated_at`
1	ALTER TABLE `table_specials` CHANGE COLUMN `author_id` `author_id` int(11) DEFAULT NULL after `globalized`
1	ALTER TABLE `table_specials` CHANGE COLUMN `table_id` `table_id` int(11) DEFAULT NULL after `author_id`
1	ALTER TABLE `table_specials` DROP COLUMN `account_id`
1	ALTER TABLE `table_specials` DROP COLUMN `site_id`
1	ALTER TABLE `table_specials` ADD INDEX `index_specials_on_section_id` USING BTREE (section_id)
1	ALTER TABLE `table_specials` ADD INDEX `index_specials_on_author_id` USING BTREE (author_id)
1	ALTER TABLE `table_specials` ADD INDEX `index_specials_on_content_id` USING BTREE (table_id)
1	CREATE TABLE `user_accounts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`account_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `index_user_accounts_on_user_id_and_account_id` USING BTREE (user_id, account_id)) ENGINE=`InnoDB` AUTO_INCREMENT=70 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=COMPACT CHECKSUM=0 DELAY_KEY_WRITE=0
CREATE TABLE `user_group_memberships` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`group_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`)) ENGINE=`InnoDB` AUTO_INCREMENT=18 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=COMPACT CHECKSUM=0 DELAY_KEY_WRITE=0
1	ALTER TABLE `users` DROP INDEX `index_users_on_account_id`
1	ALTER TABLE `users` ADD COLUMN `login` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `id`
1	ALTER TABLE `users` ADD COLUMN `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `login`
1	ALTER TABLE `users` DROP COLUMN `account_id`
1	ALTER TABLE `users` CHANGE COLUMN `email` `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `nickname`
1	ALTER TABLE `users` ADD COLUMN `crypted_password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `email`
1	ALTER TABLE `users` ADD COLUMN `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `crypted_password`
1	ALTER TABLE `users` ADD COLUMN `remember_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `salt`
1	ALTER TABLE `users` ADD COLUMN `remember_token_expires_at` datetime DEFAULT NULL after `remember_token`
1	ALTER TABLE `users` ADD COLUMN `activation_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `remember_token_expires_at`
1	ALTER TABLE `users` ADD COLUMN `password_reset_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `activation_code`
1	ALTER TABLE `users` ADD COLUMN `activated_at` datetime DEFAULT NULL after `password_reset_code`
1	ALTER TABLE `users` ADD COLUMN `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'passive' after `activated_at`
1	ALTER TABLE `users` ADD COLUMN `deleted_at` datetime DEFAULT NULL after `state`
1	ALTER TABLE `users` ADD COLUMN `expires_at` datetime DEFAULT NULL after `deleted_at`
1	ALTER TABLE `users` ADD COLUMN `company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `expires_at`
1	ALTER TABLE `users` ADD COLUMN `salutation` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `company_name`
1	ALTER TABLE `users` ADD COLUMN `first_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `salutation`
1	ALTER TABLE `users` ADD COLUMN `last_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `first_name`
1	ALTER TABLE `users` DROP COLUMN `encrypted_password`
1	ALTER TABLE `users` DROP COLUMN `confirmation_token`
1	ALTER TABLE `users` DROP COLUMN `confirmed_at`
1	ALTER TABLE `users` DROP COLUMN `confirmation_sent_at`
1	ALTER TABLE `users` DROP COLUMN `reset_password_token`
1	ALTER TABLE `users` DROP COLUMN `reset_password_sent_at`
1	ALTER TABLE `users` DROP COLUMN `remember_created_at`
1	ALTER TABLE `users` DROP COLUMN `sign_in_count`
1	ALTER TABLE `users` DROP COLUMN `current_sign_in_at`
1	ALTER TABLE `users` DROP COLUMN `last_sign_in_at`
1	ALTER TABLE `users` DROP COLUMN `current_sign_in_ip`
1	ALTER TABLE `users` DROP COLUMN `last_sign_in_ip`
1	ALTER TABLE `users` CHANGE COLUMN `preferred_language` `preferred_language` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `last_name`
1	ALTER TABLE `users` ADD COLUMN `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `preferred_language`
1	ALTER TABLE `users` ADD COLUMN `skype_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `phone_number`
1	ALTER TABLE `users` ADD COLUMN `cellular_phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL after `skype_key`
1	ALTER TABLE `users` CHANGE COLUMN `created_at` `created_at` datetime DEFAULT NULL after `cellular_phone_number`
1	ALTER TABLE `users` ADD COLUMN `user_accounts_count` int(11) DEFAULT '0' after `updated_at`
1	SET FOREIGN_KEY_CHECKS = 1
