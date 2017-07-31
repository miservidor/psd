UPDATE 3xiosversionstext SET versionsnummer= '17.0.1', Datum= '2017-07-26';

### ??? ###
INSERT IGNORE INTO cms_layout_css (id, element, font, size, color, align, decoration, style, weight) VALUES (56, 'menu3_radius', NULL, '8', NULL, '0', '0', '0', '0');
UPDATE cms_layout_css SET color='#C0C0C0' WHERE  id=55;


### Datenschutzfeld in Impressum ###
ALTER TABLE cms_impressum ADD COLUMN datenschutz LONGTEXT NULL AFTER inhalt;

### ID-Spalte in cms_galerie_zuordnung hinzufügen ###
ALTER TABLE cms_galerie_zuordnung ADD COLUMN id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (id);

### Sprachauswahl im Menuemanager ###
ALTER TABLE cms_benhkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER alttext;
ALTER TABLE cms_dhkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER alttext;
ALTER TABLE cms_ghkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER alttext;
ALTER TABLE cms_hkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER ausblenden;
ALTER TABLE cms_khkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER ausblenden;
ALTER TABLE cms_layout_left ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER geheim;
ALTER TABLE cms_layout_top ADD COLUMN im_shop_menue enum('0','1') NULL DEFAULT '0' AFTER hmpssl;
ALTER TABLE cms_layout_top ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER im_shop_menue;
ALTER TABLE cms_thkat ADD COLUMN lang VARCHAR(12) NULL DEFAULT 'de' AFTER ausblenden;
ALTER TABLE cms_language ADD COLUMN flag VARCHAR(5) NOT NULL DEFAULT '' AFTER lang;

### Automatisches Update für Datum bei Newsletter und Portal ID speichern ###
ALTER TABLE `cms_nl_archiv` CHANGE COLUMN date date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE `cms_nl_archiv` ADD COLUMN `portal_id` MEDIUMINT(8) NULL AFTER `fuss`;
ALTER TABLE `cms_nl_archiv` ADD COLUMN `smtp_id` MEDIUMINT(8) NULL AFTER `portal_id`;
ALTER TABLE `cms_nl_archiv` ADD COLUMN `erfolgadr` LONGTEXT NULL AFTER `empfaenger`;

### Sprachvariablen ###
INSERT IGNORE INTO cms_lang_layout (lang, de) VALUES ('lang_rights_langselection', 'Sprachauswahl:');
INSERT IGNORE INTO cms_lang_layout_description (lang, de) VALUES ('lang_rights_langselection', 'Beschriftung: Sprachauswahl:');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_form_email', 'email');
INSERT IGNORE INTO cms_output_langtable_description (lang, de) VALUES ('lang_formdesc_email', ' Formularbeschreibung / Formularüberschrift PULLDOWN-Modul: "Email"');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_formdesc_email', 'Email');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_form_url', 'url');
INSERT IGNORE INTO cms_output_langtable_description (lang, de) VALUES ('lang_formdesc_url', ' Formularbeschreibung / Formularüberschrift PULLDOWN-Modul: "Url"');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_formdesc_url', 'Url');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_form_tel', 'tel');
INSERT IGNORE INTO cms_output_langtable_description (lang, de) VALUES ('lang_formdesc_tel', ' Formularbeschreibung / Formularüberschrift PULLDOWN-Modul: "Tel"');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_formdesc_tel', 'Tel');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_form_number', 'number');
INSERT IGNORE INTO cms_output_langtable_description (lang, de) VALUES ('lang_formdesc_number', ' Formularbeschreibung / Formularüberschrift PULLDOWN-Modul: "Number"');
INSERT IGNORE INTO cms_output_langtable (lang, de) VALUES ('lang_formdesc_number', 'Number');
INSERT IGNORE INTO cms_lang_config (lang, de) VALUES
('lang_zug_dokumente', 'zugeordnete Dokumente'),
('lang_zug_galerien', 'zugeordnete Galerien'),
('lang_zug_adressen', 'zugeordnete Adressen'),
('lang_zug_formulare', 'zugeordnete Formulare'),
('lang_teaser_link_description', ' weiter lesen'),
('lang_zug_katalog', 'zugeordnete Katalogeinträge'),
('lang_zug_news', 'zugeordnete Newseinträge'),
('lang_zug_termin', 'zugeordnete Termineinträge'),
('lang_field_required', 'Pflichtfeld'),
('lang_field_too_long', 'zu lang'),
('lang_field_too_short', 'zu kurz'),
('lang_field_verify_entries', 'Eingaben überprüfen'),
('lang_form_submit', 'Formular absenden');
UPDATE cms_lang_config SET E="zugeordnete Dokumente" WHERE lang LIKE "lang_zug_dokumente";
UPDATE cms_lang_config SET E="zugeordnete Galerien" WHERE lang LIKE "lang_zug_galerien";
UPDATE cms_lang_config SET E="zugeordnete Formulare" WHERE lang LIKE "lang_zug_formulare";
UPDATE cms_lang_config SET E="zugeordnete Katalogeinträge" WHERE lang LIKE "lang_zug_katalog";
UPDATE cms_lang_config SET E="zugeordnete Newseinträge" WHERE lang LIKE "lang_zug_news";
UPDATE cms_lang_config SET E="zugeordnete Termineinträge" WHERE lang LIKE "lang_zug_termin";
UPDATE cms_lang_config SET E="more" WHERE lang LIKE "lang_teaser_link_description";
UPDATE cms_lang_config SET E="Required field" WHERE lang LIKE "lang_field_required";
UPDATE cms_lang_config SET E="too long" WHERE lang LIKE "lang_field_too_long";
UPDATE cms_lang_config SET E="too short" WHERE lang LIKE "lang_field_too_short";
UPDATE cms_lang_config SET E="verify entries" WHERE lang LIKE "lang_field_verify_entries";
UPDATE cms_lang_config SET E="Submit Form" WHERE lang LIKE "lang_form_submit";


### Entfernen von den Ordner "uploads/" in den Links ###
UPDATE cms_ben SET imglink=SUBSTRING(imglink,9) WHERE imglink LIKE 'uploads/%';
UPDATE cms_ben SET doclink=SUBSTRING(doclink,9) WHERE doclink LIKE 'uploads/%';
UPDATE cms_benhkat SET bimglink=SUBSTRING(bimglink,9) WHERE bimglink LIKE 'uploads/%';
UPDATE cms_benkat SET bimglink=SUBSTRING(bimglink,9) WHERE bimglink LIKE 'uploads/%';
UPDATE cms_dokument SET doclink=SUBSTRING(doclink,9) WHERE doclink LIKE 'uploads/%';
UPDATE cms_dhkat SET dimglink=SUBSTRING(dimglink,9) WHERE dimglink LIKE 'uploads/%';
UPDATE cms_dkat SET dimglink=SUBSTRING(dimglink,9) WHERE dimglink LIKE 'uploads/%';
UPDATE cms_galerie_zuordnung SET imglink=SUBSTRING(imglink,9) WHERE imglink LIKE 'uploads/%';
UPDATE cms_ghkat SET gimglink=SUBSTRING(gimglink,9) WHERE gimglink LIKE 'uploads/%';
UPDATE cms_gkat SET gimglink=SUBSTRING(gimglink,9) WHERE gimglink LIKE 'uploads/%';
UPDATE cms_tm SET imglink=SUBSTRING(imglink,9) WHERE imglink LIKE 'uploads/%';
UPDATE cms_tm SET doclink=SUBSTRING(doclink,9) WHERE doclink LIKE 'uploads/%';
UPDATE cms_hkat SET imglink=SUBSTRING(imglink,9) WHERE imglink LIKE 'uploads/%';
UPDATE cms_kat SET imglink=SUBSTRING(imglink,9) WHERE imglink LIKE 'uploads/%';
UPDATE cms_ttm SET timglink=SUBSTRING(timglink,9) WHERE timglink LIKE 'uploads/%';
UPDATE cms_ttm SET tdoclink=SUBSTRING(tdoclink,9) WHERE tdoclink LIKE 'uploads/%';
UPDATE cms_thkat SET timglink=SUBSTRING(timglink,9) WHERE timglink LIKE 'uploads/%';
UPDATE cms_tkat SET timglink=SUBSTRING(timglink,9) WHERE timglink LIKE 'uploads/%';
UPDATE cms_ktm SET kdoclink=SUBSTRING(kdoclink,9) WHERE kdoclink LIKE 'uploads/%';
UPDATE cms_ktm SET kimglink=SUBSTRING(kimglink,9) WHERE kimglink LIKE 'uploads/%';
UPDATE cms_khkat SET kimglink=SUBSTRING(kimglink,9) WHERE kimglink LIKE 'uploads/%';
UPDATE cms_kkat SET kimglink=SUBSTRING(kimglink,9) WHERE kimglink LIKE 'uploads/%';

### "Datumse" mit dem Jahr 9999 auf NULL setzen ###
UPDATE cms_ktm SET kdate1 = NULL WHERE YEAR(kdate1) = 9999;
UPDATE cms_ktm SET kdate2 = NULL WHERE YEAR(kdate2) = 9999;
UPDATE cms_ttm SET tdate1 = NULL WHERE YEAR(tdate1) = 9999;
UPDATE cms_ttm SET tdate2 = NULL WHERE YEAR(tdate2) = 9999;
UPDATE cms_tm SET date1 = NULL WHERE YEAR(date1) = 9999;


### Erstellen der neuen Tabellen für Artikel-Zuordnung, Config, Portal, Formular, Menu und Templates ###
SET sql_notes = 0;

CREATE TABLE IF NOT EXISTS `cms_katart` (
        `katalog_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
        `artikel_id` VARBINARY(18) NOT NULL DEFAULT '0',
        `sortindex` MEDIUMINT(8) UNSIGNED NOT NULL
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `cms_termart` (
        `termin_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
        `artikel_id` VARBINARY(18) NOT NULL DEFAULT '0',
        `sortindex` MEDIUMINT(8) UNSIGNED NOT NULL
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `cms_newsart` (
        `news_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
        `artikel_id` VARBINARY(18) NOT NULL DEFAULT '0',
        `sortindex` MEDIUMINT(8) UNSIGNED NOT NULL
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `cms_config` (
        `meta_title` VARCHAR(75) NULL DEFAULT NULL,
        `meta_description` TEXT NULL,
        `meta_keywords` TEXT NULL,
        `google_analytics_id` VARCHAR(50) NULL DEFAULT NULL,
        `piwik_url` VARCHAR(255) NULL DEFAULT NULL,
        `piwik_id` VARCHAR(50) NULL DEFAULT NULL,
        `robots` TEXT NULL,
        `sitemap` ENUM('1','0') NULL DEFAULT NULL
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS cms_form (
        id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
        timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        titel VARCHAR(255) NOT NULL,
        email VARCHAR(255) NULL DEFAULT NULL,
        datenbank ENUM('1','0') NOT NULL DEFAULT '0',
        spamschutz ENUM('1','0') NOT NULL DEFAULT '0',
        fields TEXT NOT NULL,
        PRIMARY KEY (id)
)
ENGINE=MyISAM;
INSERT IGNORE INTO `cms_form` (`id`, `timestamp`, `titel`, `email`, `datenbank`, `spamschutz`, `fields`) VALUES
        (1, '2016-10-26 13:33:18', 'Kontakt', NULL, 1, 1, '[{"type":"text","name":"field1256","displayName":"Name","validation":{"required":true}},{"type":"email","name":"field1264","displayName":"E-Mail","validation":{"required":true}},{"type":"textarea","name":"field1276","displayName":"Anfrage","validation":{"required":true},"placeholder":"test"}]'),
        (2, '2016-10-26 13:38:10', 'Contact', NULL, 1, 1, '[{"type":"text","name":"field5703","displayName":"Name","validation":{"required":true}},{"type":"email","name":"field5701","displayName":"E-Mail","validation":{"required":true}},{"type":"textarea","name":"field5705","displayName":"Message","validation":{"required":true}}]');

CREATE TABLE IF NOT EXISTS cms_form_data (
        id BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
        form_id BIGINT(10) UNSIGNED NOT NULL DEFAULT '0',
        data TEXT NOT NULL,
        timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS cms_portal (
        id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
        timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        name VARCHAR(255) NOT NULL,
        fields TEXT NOT NULL,
        PRIMARY KEY (id)
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS cms_menu (
        id INT(11) NOT NULL,
        json LONGTEXT NULL,
        PRIMARY KEY (id)
)
ENGINE=MyISAM;
CREATE TABLE IF NOT EXISTS `cms_template` (
  `typ` varchar(50) NOT NULL,
  `template` varchar(255) NOT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=MyISAM;
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dokument', 'content/dokument/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('main', 'main/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('kopf', 'head/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('fuss', 'foot/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_bild', 'modal/bild/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_galerie', 'modal/galerie/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_login', 'modal/login/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_merkzettel', 'modal/merkzettel/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_pw', 'modal/passwort/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('dialog_warenkorb', 'modal/warenkorb/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('registrierung', 'content/shop/registrierung/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('konto', 'content/shop/konto/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('artikel_list', 'content/shop/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('artikel_detail', 'content/shop/detail/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('galerie', 'content/galerie/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('termin_detail', 'content/knt/detail/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('termin_list', 'content/knt/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('news_detail', 'content/knt/detail/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('news_list', 'content/knt/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('katalog_detail', 'content/knt/detail/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('katalog_list', 'content/knt/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('warenkorb', 'content/shop/warenkorb/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('merkzettel', 'content/shop/merkzettel/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('bestellvorschlag', 'content/shop/bestellvorschlag/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('artikel_gruppe', 'content/shop/group/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('formular', 'content/formular/detail/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('adresse', 'content/nutzer/list/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('portal', 'content/portal/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('suche', 'content/search/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('tmg', 'content/tmg/default.html');
INSERT IGNORE INTO `cms_template` (`typ`, `template`) VALUES ('style', 'style/default.css');
SET sql_notes = 1;


CREATE TABLE IF NOT EXISTS `cms_langtable` (
  `lang` varchar(255) NOT NULL,
  `de` text,
  `E` text,
  `F` text,
  `IT` text,
  PRIMARY KEY (`lang`)
) ENGINE=MyISAM;
ALTER IGNORE TABLE `cms_language` ADD UNIQUE INDEX `lang` (`lang`);
INSERT INTO `cms_language` (lang, flag,description) VALUES ('F', 'fr', 'Französisch');
INSERT INTO `cms_language` (lang, flag,description) VALUES ('IT', 'it', 'Italienisch');

INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_addition2_voucher_finish', 'Zusatz2:', "addition2:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_addition3_voucher_finish', 'Zusatz3:', "addition3:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_addition_voucher_finish', 'Zusatz:', "addition:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_alternativartikel_titel', 'Kunden kaufen auch:', "Customers also buy:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_anfragebtn', 'Anfrage', "Offer");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_eannummer', 'EAN-Nummer:', "EAN Code:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_gewicht', 'Gewicht:', "Weight:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_hstartikelnummer', 'Hst.-Artikelnummer:', "Manufacturer Model:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_matchcode', 'Matchcode:', "Matchcode:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_mengeneinheit', 'Mengeneinheit:', "Unit:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_menge', 'Menge', "Amount");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_preis', 'Neuer Preis', "New price");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_merkzettelbtn', 'Merkzettel', "Wishlist");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_preiseinheit', 'Preiseinheit:', "Price unit:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_rabattstaffel_kopf_menge', 'Menge', "Amount");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_rabatt', 'Rabatt', "rebate");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_rabattstaffel_kopf_rabatt', 'Rabatt', "rebate");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_selectfeld_text', 'Bitte wählen', "Please select");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_stuecklistenartikel_titel', 'Stücklistenartikel:', "parts list article");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_warenkorbbtn', 'Warenkorb', "shopping cart");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_zubehoerartikel_titel', 'Zubehör:', "equipment:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_pflichtzubehoerartikel_titel', 'Pflichtzubehör:', "Required Accessories:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_zurueckbtn', 'Zurück', "Back");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_zusatz', 'Zusatz:', "addition:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_zzgl_versandkosten', 'zzgl. Versandkosten', "plus shipping and handling");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_eannummer', 'EAN-Nummer:', "EAN Code:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_gewicht', 'Gewicht:', "Weight:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_hstartikelnummer', 'Hst.-Artikelnummer:', "Manufacturer Model:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_keine_ergebnisse', 'Keine Ergebnisse gefunden! ', "No Results Found!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_matchcode', 'Matchcode:', "Matchcode:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_preis_auf_anfrage', 'Preis auf Anfrage', "Price on request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_sort_artikelnummer', 'Artikelnummer', "Item number");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_sort_bezeichnung', 'Bezeichnung', "Title");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_zzgl_versand', 'zzgl. Versandkosten', "plus shipping and handling");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_bestellvorschlag_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_bestellvorschlag_preis_auf_anfrage', 'Preis auf Anfrage', "Price on request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_city_voucher_finish', 'Ort:', "City:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_company_voucher_finish', 'Firma:', "Company:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_country_voucher_finish', 'Land:', "Country:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_dokumente_zug_dokumente', 'zugeordnete Dokumente:', "assigned documents:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_email_address_voucher_finish', 'E-Mail:', "E-Mail:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_fax_voucher_finish', 'Fax:', "Fax:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_first_name_voucher_finish', 'Vorname:', "First name:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_hilfetext', 'Die mit * gekennzeichneten Felder, sind Pflichtfelder!', "Fields marked with * are mandatory");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_pflichtfeld', 'Pflichtfeld!', "Required field!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_sendbtn', 'Absenden', "Send");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_zug_formulare', 'zugeordnete Formulare:', "assigned forms:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_zu_kurz', 'Zu Kurz!', "too short!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_formular_zu_lang', 'Zu Lang!', "too long!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_galerie_zug_galerien', 'zugeordnete Galerien:', "assigned galleries:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_homepage_voucher_finish', 'Homepage:', "Homepage:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_inclusive_tax_article_detail', 'Diese Preise sind inklusive der gesetzlichen Mehrwertsteuer.', "These prices are inclusive of VAT.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_inclusive_tax_under_resultlist', 'Diese Preise sind inklusive der gesetzlichen Mehrwertsteuer.', "These prices are inclusive of VAT.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_katalog_zug_katalog', 'zugeordnete Katalogeinträge:', "assigned catalog entries");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_abortbtn', 'Abbrechen', "Abort");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_alle', 'alle Belege', "all records");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_angelegt', 'Angelegt am', "applied on");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_bearbeitet', 'Bearbeitet am', "edit on");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_erledigt', 'erledigte Belege', "completed records");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_offen', 'offene Belege', "open records");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_belege_suche', 'Geben Sie hier eine Belegnummer ein...', "Enter a record number...");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_bemerkung', 'Die mit * gekennzeichneten Felder, sind Pflichtfelder!', "Fields marked with * are mandatory");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_benutzerbtn', 'Benutzer verwalten', "manage users");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_benutzer_benutzername', 'Benutzername:', "Username:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_benutzer_erfolgsmeldung', 'Neuen Benutzer erfolgreich angelegt!', "New user created successfully!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_benutzer_passwort', 'Passwort:', "Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_emailbtn', 'E-Mail Adresse ändern', "Change E-Mail");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_alt', 'Alte E-Mail Adresse:', "old E-Mail:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_alt_falsch', 'Die eingegebene alte E-Mail Adresse stimmt nicht überein. Bitte versuchen Sie es erneut.', "The entered old email address does not match. Please try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_bereits_vorhanden', 'Die eingegebene E-Mail Adresse ist bereits registriert. Bitte versuchen Sie es erneut.', "The entered email address is already registered. Please try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_check', 'E-Mail Adresse bestätigen:', "Confirm email address:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_erfolgsmeldung', 'E-Mail Adresse erfolgreich geändert!', "Email Adresse changed successfully!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_neu', 'Neue E-Mail Adresse:', "new E-Mail:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_email_neu_check_falsch', 'Die neu eingegebenen E-Mail Adressen stimmen nicht überein. Bitte versuchen Sie es erneut.', "The newly entered e-mail addresses do not match. Please try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadressebtn', 'Lieferadresse ändern', "Change delivery address");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_erfolgsmeldung', 'Neue Lieferadresse erfolgreich angelegt!', "New delivery address successfully created!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_kopf_firma', 'Firma', "Company");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_kopf_land', 'Land', "Country");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_kopf_name', 'Name', "Name");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_kopf_ort', 'Ort', "City");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_lieferadresse_kopf_plz', 'PLZ', "Postal code");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_meinebestellungbtn', 'Meine Bestellungen', "My Orders");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_meinedatenbtn', 'Meine Daten', "My data");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_passwortbtn', 'Passwort ändern', "Change Password");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_passwort_erfolgsmeldung', 'Passwort erfolgreich geändert!', "Password changed successfully!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_paswort_alt', 'Altes Passwort:', "old Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_paswort_check', 'Passwort bestätigen:', "confirm Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_paswort_neu', 'Neues Passwort:', "new Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_preis_auf_anfrage', 'Preis auf Anfrage', "Price on request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_pw_alt_falsch', 'Das eingegebene alte Passwort stimmt nicht überein. Bitte versuchen Sie es erneut.', "The entered old password does not match. Please try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_pw_neu_check_falsch', 'Die neu eingegebenen Passwörter stimmen nicht überein. Bitte versuchen Sie es erneut.', "The newly entered passwords do not match. Please try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_rechnungsadressebtn', 'Rechnungsadresse ändern', "Change billing address");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_rechnungsadresse_erfolgsmeldung', 'Rechnungsadresse erfolgreich geändert!', "Billing adresse changed successfully!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_savebtn', 'Speichern', "Save");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_keine_belege', 'Noch keine Bestellung abgeschlossen.', "No order completed yet");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_fehlgeschlagen', 'Login fehlgeschlagen! Versuchen Sie es erneut.', "Login failed! Try it again.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_loginbtn', 'Anmelden', "Login");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_logoutbtn', 'Abmelden', "Logout");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_modal_titel', 'Anmelden', "Login");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_passwort_vergessen', 'Passwort vergessen?', "Forgot Password?");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_platzhalter_kundennr', 'KundenNr.:', "customer number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_platzhalter_passwort', 'Passwort:', "Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_login_registerbtn', 'Registrieren', "Register");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_angebot', 'Angebot', "Offer");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_agb', 'AGB', "Conditions");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_datenschutzerk', 'Datenschutzerklärung', "Privacy Policy");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_impressum', 'Impressum', "Imprint");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_kontakt', 'Kontakt', "Contact");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_lieferbed', 'Lieferbedingungen', "Delivery Condition");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_newsletter', 'Newsletter', "Newsletter");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_widerrufsbel', 'Widerrufsbelehrung', "Cancellation Terms");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_left_zahlungsbed', 'Zahlungsbedingungen', "Terms of Payment");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_menu_warenkorb', 'Warenkorb', "Shopping Cart");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_anlegenbtn', 'Anlegen', "Create");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_modal_closebtn', 'Schließen', "Close");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_platzhalter_name', 'Name des neuen Merkzettel', "Title");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_preis_auf_anfrage', 'Preis auf Anfrage', "Price on request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_merkzettel_vorhanden', 'Eigene Merkzettel', "My Favourites");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_news_zug_news', 'zugeordnete Newseinträge:', "assigned news:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_abteilung', 'Abteilung:', "Department:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_download', 'Download:', "Download:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_email', 'E-Mail:', "E-Mail:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_fax', 'Fax:', "Fax:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_firma', 'Firma:', "Company:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_funktion', 'Funktion:', "Function:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_maplink', 'Maplink:', "Maplink:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_maplink_description', 'Maplink Beschreibung:', "Maplink Description:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_ort', 'Ort:', "City:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_plz', 'PLZ:', "Postal code:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_strasse', 'Straße:', "Street:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_telefon1', 'Telefon:', "Telephone:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_telefon2', 'Telefon (mobil):', "Telephone (mobile):");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nutzer_web', 'Homepage:', "Homepage:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_passwort_modal_closebtn', 'Schließen', "Close");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_passwort_modal_label', 'Geben Sie hier ihre E-Mail Adresse oder Kundennummer ein und wir senden Ihnen eine E-Mail zu.', "Enter your e-mail address or customer number and we will send you an e-mail.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_passwort_modal_platzhalter', 'E-Mail oder KundenNr.', "E-Mail or Customer number");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_passwort_modal_titel', 'Passwort vergessen', "Forgot Password");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_paswort_modal_anfordernbtn', 'Anfordern', "Request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_plus_tax_article_detail', 'Die Preise verstehen sich zzgl. der gesetzlichen Mehrwertsteuer.', "The prices are excl. VAT.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_plus_tax_under_resultlist', 'Die Preise verstehen sich zzgl. der gesetzlichen Mehrwertsteuer.', "The prices are excl. VAT.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_postal_code_voucher_finish', 'PLZ:', "Postal code:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_postofficeboxcity_voucher_finish', 'Postfach Ort:', "Post Office City:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_postofficeboxcountry_voucher_finish', 'Postfach Land:', "Post Office Country:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_postofficeboxpostalcode_voucher_finish', 'Postfach PLZ:', "Post Office Postal code:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_postofficebox_voucher_finish', 'Postfach:', "Post Office:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_register_agb_gelesen', 'Ich habe die AGB gelesen und akzeptiere diese!', "I have read the Conditions and accept them!");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_register_bemerkung', 'Die mit * gekennzeichneten Felder, sind Pflichtfelder!', "Fields marked with * are mandatory");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_register_passwort', 'Passwort:', "Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_register_passwort_check', 'Passwort wiederholen:', "Confirm password:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_register_registerbtn', 'Registrieren', "Register");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_road_voucher_finish', 'Straße:', "Street:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_artikelnummer', 'Artikelnummer:', "Item number:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_abteilung', 'Abteilung', "Department");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_download', 'Download', "Download");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_email', 'E-Mail', "E-Mail");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_fax', 'Fax', "Fax");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_firma', 'Firma', "Company");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_funktion', 'Funktion', "Function");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_maplink', 'Maplink', "Maplink");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_maplink_description', 'Maplink Beschreibung', "Maplink Description");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_ort', 'Ort', "City");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_plz', 'PLZ', "Postal code");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_strasse', 'Straße', "Street");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_tel1', 'Telefon', "Telephone");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_tel2', 'Telefon (mobil)', "Telephone (mobile)");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_nutzer_web', 'Homepage', "Homepage");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_platzhalter', 'Suchbegriff...', "Keyword...");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_suche_preis_auf_anfrage', 'Preis auf Anfrage', "Price on request");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_surname_voucher_finish', 'Name:', "Name:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_telephone2_voucher_finish', 'Telefon2:', "Telephone2:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_telephone3_voucher_finish', 'Telefon3:', "Telephone3:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_telephone_voucher_finish', 'Telefon1:', "Telephone1:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_termine_zug_termine', 'zugeordnete Termine:', "assigned dates:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_title_voucher_finish', 'Anrede:', "Form of Address:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_without_tax_article_detail', 'Die angezeigten Preise sind mehrwertsteuerfrei.', "The prices shown are VAT-free.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_without_tax_under_resultlist', 'Die angezeigten Preise sind mehrwertsteuerfrei.', "The prices shown are VAT-free.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_registration_kundenmail_kopf', 'Vielen Dank für Ihre Registrierung in unserem Onlineshop.', "Thanks for your registration at our online shop.");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_aktionspreis_gueltig_bis', 'gültig bis:', "expires on:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_kopf_artikelnummer', 'Artikelnummer', "Item number");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_kopf_bezeichnung', 'Bezeichnung', "Title");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_kopf_preis_menge', 'PE / ME', "PU / U");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_kopf_bestand', 'VF', "VF");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikelliste_kopf_preis', 'Preis', "Price");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikel_zug_adressen', 'zugeordnete Adressen:', "assigned adress:");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_adressen_zug_artikel', 'zugeordnete Artikel:', "assigned articel:");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_impressum","Bitte füllen Sie das Impressum in der Webadministration aus!","The imprint please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_agb","Bitte füllen Sie die AGB in der Webadministration aus!","The AGB please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_lieferbedingungen","Bitte füllen Sie die Lieferbedingung in der Webadministration aus!","The delivery conditions please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_zahlungsbedingungen","Bitte füllen Sie die Zahlungsbedingung in der Webadministration aus!","The terms of payment please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_widerrufsbelehrung","Bitte füllen Sie die Widerrufsbelehrung in der Webadministration aus!","The right of revocation please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_tmg_datenschutz","Bitte füllen Sie die Datenschutzerklärung in der Webadministration aus!","The Privacy Statement please fill in the web administration!");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_konto_registration_kundenmail_ende","","");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_bestand_r","nicht auf Lager","not in stock");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_bestand_y","begrenzt verfügbar","limited availability");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_bestand_g","verfügbar","available");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_menu_lagerbuchung","Lagerbuchung","Inventory Posting");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_belegstatus_offen","offen","open");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_belegstatus_bearbeitung","in Bearbeitung","in Progress");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_belegstatus_erledigt","erledigt","finished");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_belegstatus_geloescht","gelöscht","deleted");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_belegstatus_select","Status wählen","Select Status");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_head_mail_pw_request","Hallo und guten Tag,","Hello,");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_requested_access_mail_pw_request","hier Ihre angeforderten Zugangsdaten für den Webshop","here are your requested login data for the Webshop.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_customer_number_mail_pw_request","Kundennummer:","Customer number:");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_mail_address_mail_pw_request","E-Mail-Adresse:","E-mail address:");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_password_mail_pw_request","Passwort:","Password:");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_kind_regards_mail_pw_request","Mit freundlichen Grüßen","Best regards,");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_team_mail_pw_request","Das Team von","Team");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_subject_mail_pw_request","Zugangsdaten für den Webshop","Login data for the webshop.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_notice_access_data_send_password_request","Ihre Zugangsdaten wurden an diese Adresse geschickt:","Your account data has been sent to this email address:");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_notice_no_mailaddress_password_request","Es ist keine E-Mail-Adresse für Sie hinterlegt. Wenden Sie sich bitte an den Betreiber dieser Webseite!","There is no email address available for you. Please contact the administrator of this website.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_notice_no_shopaccess_password_request","Es ist kein Shopzugang für Sie konfiguriert. Wenden Sie sich bitte an den Betreiber dieser Webseite!","There is no shop account registered for you. Please create or contact the administrator of this website.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_notice_unregistered_password_request","Die eingegebenen Daten sind nicht bei uns registriert. Bitte überprüfen Sie diese und versuchen es ggf. nochmal!","The entered information does not match any registered profile. Please check your information and try again.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_notice_ambiguous_password_request","Die eingegebenen Daten sind bei uns nicht eindeutig zuzuordnen. Kontaktieren Sie uns bitte!","The entered information could not be assigned correctly. Please contact us for clarification.");
INSERT IGNORE INTO `cms_langtable` (`lang`,`de`,`E`) VALUES ("lng_artikeldetail_artikelanhang_titel","Anhang","Downloads");
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_teaser_link_description', 'weiter lesen', 'more');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_preis_auf_anfrage', 'Preis auf Anfrage', 'Price on Request');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_verfuegbarkeit', 'Verfügbarkeit', 'availability');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_menge', 'Menge', 'Amount');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_preis_alt', 'Alter Preis', 'Old Price');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_preis_neu', 'Neuer Preis', 'New Price');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_preis', 'Preis', 'Price');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_link_bestellvorschlag', 'Bestellvorschlag', 'Order Proposal');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_form_send', 'Formular erfolgreich versendet!', 'Sent form successfully!');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_form_captchacheck', 'Sicherheitscode falsch!', 'Captcha wrong!');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_subscribe', 'Erfolgreich angemeldet!', 'Subscribed successfully');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_already_subscribed', 'Email bereits registriert!', 'Email already subscribed!');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_search_title', 'Suchergebnisse', 'Search Results');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_unsubscribe_success', 'Erfolgreich vom Newsletter abgemeldet.', 'Successfully unsubscribed from the newsletter.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_unsubscribe_already', 'Nutzer ist bereits abgemeldet!', 'User is already logged out!');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_subscribe_subject', 'Newsletter E-Mail Bestätigung.', 'Newsletter E-mail confirmation.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_subscribe_text', 'Bitte klicken Sie auf den folgen Link.', 'Please click on the following link.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_nl_subscribe_send', 'Eine Bestätigungsemail wurde versendet.', 'A confirmation mail has been sent.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegtyp_select', 'Belegtyp wählen', 'Select Document Type');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegtyp_angebot', 'Angebot', 'Offer');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegtyp_bestellung', 'Bestellung', 'Order');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegtyp_lagerbuchung', 'Lagerbuchung', 'Warehousing');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegsortierung_select', 'Sortieren nach', 'Sort by');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegsortierung_belegnummer', 'Belegnummer', 'Document Number');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegsortierung_angelegtam', 'Angelegt Am', 'Applied On');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_details_header', 'Artikeldetails', 'Article Details');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_downloads_header', 'Downloads', 'Downloads');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_titel_langtext', 'Beschreibung', 'Description');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_titel_dimensionstext', 'Dimensionstext', 'Description');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_titel_bestelltext', 'Bestelltext', 'Description');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_titel_infotext', 'Infotext', 'Description');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_januar', 'Januar', 'January');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_februar', 'Februar', 'February');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_maerz', 'März', 'March');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_april', 'April', 'April');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_mai', 'Mai', 'May');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_juni', 'Juni', 'June');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_juli', 'Juli', 'July');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_august', 'August', 'August');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_september', 'September', 'September');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_oktober', 'Oktober', 'October');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_november', 'November', 'November');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_monat_dezember', 'Dezember', 'December');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_welcome_morgen', 'Guten Morgen', 'Good Morning');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_welcome_tag', 'Guten Tag', 'Good Day');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_welcome_abend', 'Guten Abend', 'Good Evening');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_registration_success', 'Registrierung erfolgreich abgeschlossen. Sie werden direkt eingeloggt.', 'Registration completed successfully. You are logged in directly.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_konto_benutzer_erfolgsmeldung2', 'Benutzer erfolgreich bearbeitet.', 'User successfully edited.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_session_gone', 'Ihre Sitzung ist abgelaufen!\nBitte melden Sie sich erneut an.', 'Your session has expired!\nPlease log in again.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_registration_double_opt_in_success', 'Registrierung abgeschlossen. Sie haben eine Bestätigungsmail erhalten.', 'Registration completed. You have received a confirmation mail.');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegsortierung_aufsteigend', 'Aufsteigend', 'Ascending');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_belegsortierung_absteigend', 'Absteigend', 'Descending');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_warenkorb_modal_titel', 'Folgender Artikel wurde in den Warenkorb gelegt', 'The following article has been added to your shopping basket');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_angebot_modal_titel', 'Folgender Artikel wurde in die Anfrage gelegt', 'The following article has been added to your request');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_warenkorb_modal_weitershoppen', 'Weitershoppen', 'Continue shopping');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_warenkorb_modal_zum_wk', 'Zum Warenkorb', 'To shopping cart');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_warenkorb_modal_zur_anfrage', 'Zur Anfrage', 'To the request');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_warenkorb_modal_menge', 'Menge:', 'Amount:');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_einzelpreis', 'Einzelpreis:', 'Price:');
INSERT IGNORE INTO `cms_langtable` (`lang`, `de`, `E`) VALUES ('lng_artikeldetail_gesamtpreis', 'Gesamtpreis:', 'Total Price:');


ALTER IGNORE TABLE `cms_langtable` ADD COLUMN `IT` text;
ALTER IGNORE TABLE `cms_langtable` ADD COLUMN `F` text;
ALTER IGNORE TABLE `3xios_output_langtable` ADD COLUMN `IT` text;
ALTER IGNORE TABLE `3xios_output_langtable` ADD COLUMN `F` text;
UPDATE `cms_langtable` SET IT=de WHERE IT IS NULL;
UPDATE `cms_langtable` SET F=de WHERE F IS NULL;

UPDATE cms_langtable SET F="Description supplémentaire 2:" WHERE lang LIKE "lng_addition2_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Description supplémentaire 3:" WHERE lang LIKE "lng_addition3_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Description supplémentaire:" WHERE lang LIKE "lng_addition_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Les clients ont également acheté:" WHERE lang LIKE "lng_artikeldetail_alternativartikel_titel" AND F LIKE de;
UPDATE cms_langtable SET F="Offres" WHERE lang LIKE "lng_artikeldetail_anfragebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_artikeldetail_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro EAN" WHERE lang LIKE "lng_artikeldetail_eannummer" AND F LIKE de;
UPDATE cms_langtable SET F="Poids" WHERE lang LIKE "lng_artikeldetail_gewicht" AND F LIKE de;
UPDATE cms_langtable SET F="Il y a plusieurs numéros de prod. Identiques" WHERE lang LIKE "lng_artikeldetail_hstartikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Matchcode:" WHERE lang LIKE "lng_artikeldetail_matchcode" AND F LIKE de;
UPDATE cms_langtable SET F="Unité de quantité" WHERE lang LIKE "lng_artikeldetail_mengeneinheit" AND F LIKE de;
UPDATE cms_langtable SET F="Quantité" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_menge" AND F LIKE de;
UPDATE cms_langtable SET F="Nouveau prix" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_preis" AND F LIKE de;
UPDATE cms_langtable SET F="Bloc-mémo" WHERE lang LIKE "lng_artikeldetail_merkzettelbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Unité de prix:" WHERE lang LIKE "lng_artikeldetail_preiseinheit" AND F LIKE de;
UPDATE cms_langtable SET F="Quantité" WHERE lang LIKE "lng_artikeldetail_rabattstaffel_kopf_menge" AND F LIKE de;
UPDATE cms_langtable SET F="Rabais" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_rabatt" AND F LIKE de;
UPDATE cms_langtable SET F="Rabais" WHERE lang LIKE "lng_artikeldetail_rabattstaffel_kopf_rabatt" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez sélectionner" WHERE lang LIKE "lng_artikeldetail_selectfeld_text" AND F LIKE de;
UPDATE cms_langtable SET F="Articles de nomenclature" WHERE lang LIKE "lng_artikeldetail_stuecklistenartikel_titel" AND F LIKE de;
UPDATE cms_langtable SET F="Panier" WHERE lang LIKE "lng_artikeldetail_warenkorbbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Accessoires:" WHERE lang LIKE "lng_artikeldetail_zubehoerartikel_titel" AND F LIKE de;
UPDATE cms_langtable SET F="retour" WHERE lang LIKE "lng_artikeldetail_zurueckbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Description supplémentaire:" WHERE lang LIKE "lng_artikeldetail_zusatz" AND F LIKE de;
UPDATE cms_langtable SET F="plus frais d'envoi" WHERE lang LIKE "lng_artikeldetail_zzgl_versandkosten" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_artikelliste_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro EAN" WHERE lang LIKE "lng_artikelliste_eannummer" AND F LIKE de;
UPDATE cms_langtable SET F="Poids" WHERE lang LIKE "lng_artikelliste_gewicht" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro prod.:" WHERE lang LIKE "lng_artikelliste_hstartikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="résultats" WHERE lang LIKE "lng_artikelliste_keine_ergebnisse" AND F LIKE de;
UPDATE cms_langtable SET F="Matchcode:" WHERE lang LIKE "lng_artikelliste_matchcode" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_artikelliste_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_artikelliste_sort_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikelliste_sort_bezeichnung" AND F LIKE de;
UPDATE cms_langtable SET F="plus frais d'envoi" WHERE lang LIKE "lng_artikelliste_zzgl_versand" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article:" WHERE lang LIKE "lng_bestellvorschlag_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_bestellvorschlag_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="Ville:" WHERE lang LIKE "lng_city_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Entreprise:" WHERE lang LIKE "lng_company_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Pays:" WHERE lang LIKE "lng_country_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="documents connexes:" WHERE lang LIKE "lng_dokumente_zug_dokumente" AND F LIKE de;
UPDATE cms_langtable SET F="E-Mail:" WHERE lang LIKE "lng_email_address_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Fax:" WHERE lang LIKE "lng_fax_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Prénom:" WHERE lang LIKE "lng_first_name_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Les champs marqués avec * doivent être remplis correctement!" WHERE lang LIKE "lng_formular_hilfetext" AND F LIKE de;
UPDATE cms_langtable SET F="Champ obligatoire!" WHERE lang LIKE "lng_formular_pflichtfeld" AND F LIKE de;
UPDATE cms_langtable SET F="Envoyer" WHERE lang LIKE "lng_formular_sendbtn" AND F LIKE de;
UPDATE cms_langtable SET F="documents connexes:" WHERE lang LIKE "lng_formular_zug_formulare" AND F LIKE de;
UPDATE cms_langtable SET F="trop court!" WHERE lang LIKE "lng_formular_zu_kurz" AND F LIKE de;
UPDATE cms_langtable SET F="trop long!" WHERE lang LIKE "lng_formular_zu_lang" AND F LIKE de;
UPDATE cms_langtable SET F="Galerie associée:" WHERE lang LIKE "lng_galerie_zug_galerien" AND F LIKE de;
UPDATE cms_langtable SET F="Homepage:" WHERE lang LIKE "lng_homepage_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_inclusive_tax_article_detail" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_inclusive_tax_under_resultlist" AND F LIKE de;
UPDATE cms_langtable SET F="entrées de catalogue associé" WHERE lang LIKE "lng_katalog_zug_katalog" AND F LIKE de;
UPDATE cms_langtable SET F="Annuler" WHERE lang LIKE "lng_konto_abortbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_konto_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="tous les documents" WHERE lang LIKE "lng_konto_belege_alle" AND F LIKE de;
UPDATE cms_langtable SET F="Crée le" WHERE lang LIKE "lng_konto_belege_angelegt" AND F LIKE de;
UPDATE cms_langtable SET F="Modifié le" WHERE lang LIKE "lng_konto_belege_bearbeitet" AND F LIKE de;
UPDATE cms_langtable SET F="documents remplis" WHERE lang LIKE "lng_konto_belege_erledigt" AND F LIKE de;
UPDATE cms_langtable SET F="ouvrir des documents" WHERE lang LIKE "lng_konto_belege_offen" AND F LIKE de;
UPDATE cms_langtable SET F="Entrez un numéro de document" WHERE lang LIKE "lng_konto_belege_suche" AND F LIKE de;
UPDATE cms_langtable SET F="Les champs marqués avec * doivent être remplis correctement!" WHERE lang LIKE "lng_konto_bemerkung" AND F LIKE de;
UPDATE cms_langtable SET F="Gérer les utilisateurs" WHERE lang LIKE "lng_konto_benutzerbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Nom d’utilisateur" WHERE lang LIKE "lng_konto_benutzer_benutzername" AND F LIKE de;
UPDATE cms_langtable SET F="Nouvel utilisateur créé avec succès !" WHERE lang LIKE "lng_konto_benutzer_erfolgsmeldung" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_konto_benutzer_passwort" AND F LIKE de;
UPDATE cms_langtable SET F="Changer l’adresse E-Mail" WHERE lang LIKE "lng_konto_emailbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Ancienne adresse de courriel" WHERE lang LIKE "lng_konto_email_alt" AND F LIKE de;
UPDATE cms_langtable SET F="L’ancienne adresse de courriel entrée ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_konto_email_alt_falsch" AND F LIKE de;
UPDATE cms_langtable SET F="L'indirizzo email inserito è già registrato. Si prega di riprovare." WHERE lang LIKE "lng_konto_email_bereits_vorhanden" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez confirmer E-Mail" WHERE lang LIKE "lng_konto_email_check" AND F LIKE de;
UPDATE cms_langtable SET F="Adresse de messagerie a changé avec succès" WHERE lang LIKE "lng_konto_email_erfolgsmeldung" AND F LIKE de;
UPDATE cms_langtable SET F="Nouvel E-Mail" WHERE lang LIKE "lng_konto_email_neu" AND F LIKE de;
UPDATE cms_langtable SET F="Ne partage pas les adresses E-Mail nouvellement entrés. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_konto_email_neu_check_falsch" AND F LIKE de;
UPDATE cms_langtable SET F="Lieferadresse ändern" WHERE lang LIKE "lng_konto_lieferadressebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Insérer nouvelle adresse de livraison:réussie" WHERE lang LIKE "lng_konto_lieferadresse_erfolgsmeldung" AND F LIKE de;
UPDATE cms_langtable SET F="Entreprise:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_firma" AND F LIKE de;
UPDATE cms_langtable SET F="Pays:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_land" AND F LIKE de;
UPDATE cms_langtable SET F="Nom:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_name" AND F LIKE de;
UPDATE cms_langtable SET F="Ville:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_ort" AND F LIKE de;
UPDATE cms_langtable SET F="NP:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_plz" AND F LIKE de;
UPDATE cms_langtable SET F="Mes commandes" WHERE lang LIKE "lng_konto_meinebestellungbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Mes données" WHERE lang LIKE "lng_konto_meinedatenbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Changer mot de passe" WHERE lang LIKE "lng_konto_passwortbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe modifié avec succès" WHERE lang LIKE "lng_konto_passwort_erfolgsmeldung" AND F LIKE de;
UPDATE cms_langtable SET F="ancien mot de passe" WHERE lang LIKE "lng_konto_paswort_alt" AND F LIKE de;
UPDATE cms_langtable SET F="Confirmer mot de passe" WHERE lang LIKE "lng_konto_paswort_check" AND F LIKE de;
UPDATE cms_langtable SET F="nouveau mot de passe" WHERE lang LIKE "lng_konto_paswort_neu" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_konto_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="L’ancien mot de passe entré ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_konto_pw_alt_falsch" AND F LIKE de;
UPDATE cms_langtable SET F="Le nouveau mot de passe entré ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_konto_pw_neu_check_falsch" AND F LIKE de;
UPDATE cms_langtable SET F="Changer l’adresse de facturation" WHERE lang LIKE "lng_konto_rechnungsadressebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Changer l’adresse de facturation: réussie" WHERE lang LIKE "lng_konto_rechnungsadresse_erfolgsmeldung" AND F LIKE de;
UPDATE cms_langtable SET F="Sauver" WHERE lang LIKE "lng_konto_savebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Échec de la connexion. Réessayez" WHERE lang LIKE "lng_login_fehlgeschlagen" AND F LIKE de;
UPDATE cms_langtable SET F="Login:" WHERE lang LIKE "lng_login_loginbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Logout:" WHERE lang LIKE "lng_login_logoutbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Login:" WHERE lang LIKE "lng_login_modal_titel" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe oublié?" WHERE lang LIKE "lng_login_passwort_vergessen" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro client:" WHERE lang LIKE "lng_login_platzhalter_kundennr" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe" WHERE lang LIKE "lng_login_platzhalter_passwort" AND F LIKE de;
UPDATE cms_langtable SET F="S’inscrire" WHERE lang LIKE "lng_login_registerbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Offre:" WHERE lang LIKE "lng_menu_angebot" AND F LIKE de;
UPDATE cms_langtable SET F="les conditions générales" WHERE lang LIKE "lng_menu_left_agb" AND F LIKE de;
UPDATE cms_langtable SET F="Déclaration de protection des données" WHERE lang LIKE "lng_menu_left_datenschutzerk" AND F LIKE de;
UPDATE cms_langtable SET F="Impressum" WHERE lang LIKE "lng_menu_left_impressum" AND F LIKE de;
UPDATE cms_langtable SET F="contacter" WHERE lang LIKE "lng_menu_left_kontakt" AND F LIKE de;
UPDATE cms_langtable SET F="Conditions de livraison:" WHERE lang LIKE "lng_menu_left_lieferbed" AND F LIKE de;
UPDATE cms_langtable SET F="Newsletter" WHERE lang LIKE "lng_menu_left_newsletter" AND F LIKE de;
UPDATE cms_langtable SET F="Conditions de révocation" WHERE lang LIKE "lng_menu_left_widerrufsbel" AND F LIKE de;
UPDATE cms_langtable SET F="Conditions de paiement" WHERE lang LIKE "lng_menu_left_zahlungsbed" AND F LIKE de;
UPDATE cms_langtable SET F="Panier" WHERE lang LIKE "lng_menu_warenkorb" AND F LIKE de;
UPDATE cms_langtable SET F="créer" WHERE lang LIKE "lng_merkzettel_anlegenbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_merkzettel_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Fermer" WHERE lang LIKE "lng_merkzettel_modal_closebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Nom de la nouvelle liste de souhaits" WHERE lang LIKE "lng_merkzettel_platzhalter_name" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_merkzettel_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="Mes favoris" WHERE lang LIKE "lng_merkzettel_vorhanden" AND F LIKE de;
UPDATE cms_langtable SET F="associé à nouvelles entrées" WHERE lang LIKE "lng_news_zug_news" AND F LIKE de;
UPDATE cms_langtable SET F="Département" WHERE lang LIKE "lng_nutzer_abteilung" AND F LIKE de;
UPDATE cms_langtable SET F="Download:" WHERE lang LIKE "lng_nutzer_download" AND F LIKE de;
UPDATE cms_langtable SET F="E-Mail:" WHERE lang LIKE "lng_nutzer_email" AND F LIKE de;
UPDATE cms_langtable SET F="Fax:" WHERE lang LIKE "lng_nutzer_fax" AND F LIKE de;
UPDATE cms_langtable SET F="Entreprise:" WHERE lang LIKE "lng_nutzer_firma" AND F LIKE de;
UPDATE cms_langtable SET F="Fonction:" WHERE lang LIKE "lng_nutzer_funktion" AND F LIKE de;
UPDATE cms_langtable SET F="Maplink:" WHERE lang LIKE "lng_nutzer_maplink" AND F LIKE de;
UPDATE cms_langtable SET F="Maplink Caractéristiques:" WHERE lang LIKE "lng_nutzer_maplink_description" AND F LIKE de;
UPDATE cms_langtable SET F="Ville:" WHERE lang LIKE "lng_nutzer_ort" AND F LIKE de;
UPDATE cms_langtable SET F="NP:" WHERE lang LIKE "lng_nutzer_plz" AND F LIKE de;
UPDATE cms_langtable SET F="Rue:" WHERE lang LIKE "lng_nutzer_strasse" AND F LIKE de;
UPDATE cms_langtable SET F="Téléphone:" WHERE lang LIKE "lng_nutzer_telefon1" AND F LIKE de;
UPDATE cms_langtable SET F="Mobile:" WHERE lang LIKE "lng_nutzer_telefon2" AND F LIKE de;
UPDATE cms_langtable SET F="Homepage:" WHERE lang LIKE "lng_nutzer_web" AND F LIKE de;
UPDATE cms_langtable SET F="Fermer" WHERE lang LIKE "lng_passwort_modal_closebtn" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez indiquer ici le numéro client enregistré chez nous ou votre adresse e-mail; nous vous enverrons par courriel votre mot de passe." WHERE lang LIKE "lng_passwort_modal_label" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro client ou adresse e-mail:" WHERE lang LIKE "lng_passwort_modal_platzhalter" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe oublié?" WHERE lang LIKE "lng_passwort_modal_titel" AND F LIKE de;
UPDATE cms_langtable SET F="Demande" WHERE lang LIKE "lng_paswort_modal_anfordernbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_plus_tax_article_detail" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_plus_tax_under_resultlist" AND F LIKE de;
UPDATE cms_langtable SET F="NP:" WHERE lang LIKE "lng_postal_code_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Lieu de la case postale:" WHERE lang LIKE "lng_postofficeboxcity_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Pays de la case postale:" WHERE lang LIKE "lng_postofficeboxcountry_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="NP de la case postale:" WHERE lang LIKE "lng_postofficeboxpostalcode_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Case postale:" WHERE lang LIKE "lng_postofficebox_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="J’ai lu les conditions générales et les accepter !" WHERE lang LIKE "lng_register_agb_gelesen" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez vérifier vos donnés! Les champs marqués avec * doivent être remplis correctement!" WHERE lang LIKE "lng_register_bemerkung" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_register_passwort" AND F LIKE de;
UPDATE cms_langtable SET F="Répétez mot de passe:" WHERE lang LIKE "lng_register_passwort_check" AND F LIKE de;
UPDATE cms_langtable SET F="S’inscrire" WHERE lang LIKE "lng_register_registerbtn" AND F LIKE de;
UPDATE cms_langtable SET F="Rue:" WHERE lang LIKE "lng_road_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_suche_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Département" WHERE lang LIKE "lng_suche_nutzer_abteilung" AND F LIKE de;
UPDATE cms_langtable SET F="Download" WHERE lang LIKE "lng_suche_nutzer_download" AND F LIKE de;
UPDATE cms_langtable SET F="E-Mail" WHERE lang LIKE "lng_suche_nutzer_email" AND F LIKE de;
UPDATE cms_langtable SET F="Fax" WHERE lang LIKE "lng_suche_nutzer_fax" AND F LIKE de;
UPDATE cms_langtable SET F="Entreprise" WHERE lang LIKE "lng_suche_nutzer_firma" AND F LIKE de;
UPDATE cms_langtable SET F="Fonction" WHERE lang LIKE "lng_suche_nutzer_funktion" AND F LIKE de;
UPDATE cms_langtable SET F="Maplink" WHERE lang LIKE "lng_suche_nutzer_maplink" AND F LIKE de;
UPDATE cms_langtable SET F="Maplink Caractéristiques" WHERE lang LIKE "lng_suche_nutzer_maplink_description" AND F LIKE de;
UPDATE cms_langtable SET F="Ville" WHERE lang LIKE "lng_suche_nutzer_ort" AND F LIKE de;
UPDATE cms_langtable SET F="NP" WHERE lang LIKE "lng_suche_nutzer_plz" AND F LIKE de;
UPDATE cms_langtable SET F="Rue" WHERE lang LIKE "lng_suche_nutzer_strasse" AND F LIKE de;
UPDATE cms_langtable SET F="Téléphone" WHERE lang LIKE "lng_suche_nutzer_tel1" AND F LIKE de;
UPDATE cms_langtable SET F="Mobile" WHERE lang LIKE "lng_suche_nutzer_tel2" AND F LIKE de;
UPDATE cms_langtable SET F="Homepage" WHERE lang LIKE "lng_suche_nutzer_web" AND F LIKE de;
UPDATE cms_langtable SET F="Objet de la recherche:" WHERE lang LIKE "lng_suche_platzhalter" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_suche_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="Nom:" WHERE lang LIKE "lng_surname_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Téléphone2:" WHERE lang LIKE "lng_telephone2_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Téléphone3:" WHERE lang LIKE "lng_telephone3_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Téléphone1:" WHERE lang LIKE "lng_telephone_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="associés de dates:" WHERE lang LIKE "lng_termine_zug_termine" AND F LIKE de;
UPDATE cms_langtable SET F="M / Mme" WHERE lang LIKE "lng_title_voucher_finish" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix indiqués s'entendent TVA exclue." WHERE lang LIKE "lng_without_tax_article_detail" AND F LIKE de;
UPDATE cms_langtable SET F="Les prix indiqués s'entendent TVA exclue." WHERE lang LIKE "lng_without_tax_under_resultlist" AND F LIKE de;
UPDATE cms_langtable SET F="Merci de votre enregistrement." WHERE lang LIKE "lng_konto_registration_kundenmail_kopf" AND F LIKE de;
UPDATE cms_langtable SET F="adresses associées:" WHERE lang LIKE "lng_adressen_zug_adressen" AND F LIKE de;
UPDATE cms_langtable SET F="articles connexes" WHERE lang LIKE "lng_artikel_zug_artikel" AND F LIKE de;
UPDATE cms_langtable SET F="Prix valable jusqu'au:" WHERE lang LIKE "lng_artikeldetail_aktionspreis_gueltig_bis" AND F LIKE de;
UPDATE cms_langtable SET F="adresses associées:" WHERE lang LIKE "lng_artikel_zug_adressen" AND F LIKE de;
UPDATE cms_langtable SET F="articles connexes" WHERE lang LIKE "lng_adressen_zug_artikel" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer l'Impressum dans l'administration du web!" WHERE lang LIKE "lng_tmg_impressum" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer les conditions générales dans l'administration du web!" WHERE lang LIKE "lng_tmg_agb" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer les conditions de livraison dans l'administration du web!" WHERE lang LIKE "lng_tmg_lieferbedingungen" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer les conditions de livraison dans l'administration du web!" WHERE lang LIKE "lng_tmg_zahlungsbedingungen" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer les conditions de révocation dans l'administration du web!" WHERE lang LIKE "lng_tmg_widerrufsbelehrung" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez insérer la déclaration de protection des données dans l'administration du web!" WHERE lang LIKE "lng_tmg_datenschutz" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_artikelliste_kopf_artikelnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikelliste_kopf_bezeichnung" AND F LIKE de;
UPDATE cms_langtable SET F="Unité de prix / Unité de quantité" WHERE lang LIKE "lng_artikelliste_kopf_preis_menge" AND F LIKE de;
UPDATE cms_langtable SET F="Disponibilité" WHERE lang LIKE "lng_artikelliste_kopf_bestand" AND F LIKE de;
UPDATE cms_langtable SET F="Prix" WHERE lang LIKE "lng_artikelliste_kopf_preis" AND F LIKE de;
UPDATE cms_langtable SET F="pas en stock" WHERE lang LIKE "lng_bestand_r" AND F LIKE de;
UPDATE cms_langtable SET F="partiellement livrable" WHERE lang LIKE "lng_bestand_y" AND F LIKE de;
UPDATE cms_langtable SET F="livrable" WHERE lang LIKE "lng_bestand_g" AND F LIKE de;
UPDATE cms_langtable SET F="Réservation de stock" WHERE lang LIKE "lng_menu_lagerbuchung" AND F LIKE de;
UPDATE cms_langtable SET F="en attente" WHERE lang LIKE "lng_belegstatus_offen" AND F LIKE de;
UPDATE cms_langtable SET F="en élaboration" WHERE lang LIKE "lng_belegstatus_bearbeitung" AND F LIKE de;
UPDATE cms_langtable SET F="accompli" WHERE lang LIKE "lng_belegstatus_erledigt" AND F LIKE de;
UPDATE cms_langtable SET F="effacé" WHERE lang LIKE "lng_belegstatus_geloescht" AND F LIKE de;
UPDATE cms_langtable SET F="Sélectionnez l’État" WHERE lang LIKE "lng_belegstatus_select" AND F LIKE de;
UPDATE cms_langtable SET F="Bonjour et bienvenue" WHERE lang LIKE "lng_head_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="voici les données d'accès requises pour le shop online" WHERE lang LIKE "lng_requested_access_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro client:" WHERE lang LIKE "lng_customer_number_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Adresse e-mail:" WHERE lang LIKE "lng_mail_address_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_password_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Meilleures salutations" WHERE lang LIKE "lng_kind_regards_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="L'équipe de" WHERE lang LIKE "lng_team_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Données d'accès pour le shop online" WHERE lang LIKE "lng_subject_mail_pw_request" AND F LIKE de;
UPDATE cms_langtable SET F="Vos données d'accès ont été envoyées à l'adresse suivante:" WHERE lang LIKE "lng_notice_access_data_send_password_request" AND F LIKE de;
UPDATE cms_langtable SET F="Il n'y a aucune adresse e-mail pour vous. Veuillez vous adresser au gérant de cette page web!" WHERE lang LIKE "lng_notice_no_mailaddress_password_request" AND F LIKE de;
UPDATE cms_langtable SET F="Aucun accès au shop n'a été configuré pour vous. Veuillez vous adresser au gérant de cette page web!" WHERE lang LIKE "lng_notice_no_shopaccess_password_request" AND F LIKE de;
UPDATE cms_langtable SET F="Les données saisies ne sont pas enregistrées. S’il vous plaît vérifiez-le et essayez à nouveau !" WHERE lang LIKE "lng_notice_unregistered_password_request" AND F LIKE de;
UPDATE cms_langtable SET F="I dati immessi sono inconcludenti per associare con noi. Vi preghiamo di contattarci!" WHERE lang LIKE "lng_notice_ambiguous_password_request" AND F LIKE de;
UPDATE cms_langtable SET F="L’annexe" WHERE lang LIKE "lng_artikeldetail_artikelanhang_titel" AND F LIKE de;
UPDATE cms_langtable SET F="continuer la lecture" WHERE lang LIKE "lng_teaser_link_description" AND F LIKE de;
UPDATE cms_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_artikeldetail_preis_auf_anfrage" AND F LIKE de;
UPDATE cms_langtable SET F="Disponibilité" WHERE lang LIKE "lng_artikeldetail_verfuegbarkeit" AND F LIKE de;
UPDATE cms_langtable SET F="Quantité" WHERE lang LIKE "lng_artikeldetail_menge" AND F LIKE de;
UPDATE cms_langtable SET F="ancien prix" WHERE lang LIKE "lng_artikeldetail_preis_alt" AND F LIKE de;
UPDATE cms_langtable SET F="Nouveau prix" WHERE lang LIKE "lng_artikeldetail_preis_neu" AND F LIKE de;
UPDATE cms_langtable SET F="Prix" WHERE lang LIKE "lng_artikeldetail_preis" AND F LIKE de;
UPDATE cms_langtable SET F="Proposition de commande" WHERE lang LIKE "lng_konto_link_bestellvorschlag" AND F LIKE de;
UPDATE cms_langtable SET F="Formulaire envoyé avec succès" WHERE lang LIKE "lng_form_send" AND F LIKE de;
UPDATE cms_langtable SET F="Code de sécurité erroné" WHERE lang LIKE "lng_form_captchacheck" AND F LIKE de;
UPDATE cms_langtable SET F="connecté avec succès" WHERE lang LIKE "lng_nl_subscribe" AND F LIKE de;
UPDATE cms_langtable SET F="L'indirizzo email inserito è già registrato." WHERE lang LIKE "lng_nl_already_subscribed" AND F LIKE de;
UPDATE cms_langtable SET F="Résultats de recherche" WHERE lang LIKE "lng_search_title" AND F LIKE de;
UPDATE cms_langtable SET F="Accessoire est obligatoire:" WHERE lang LIKE "lng_artikeldetail_pflichtzubehoerartikel_titel" AND F LIKE de;
UPDATE cms_langtable SET F="Commande ne pas finalisé." WHERE lang LIKE "lng_konto_keine_belege" AND F LIKE de;
UPDATE cms_langtable SET F="Déconnecté avec succès de la newsletter" WHERE lang LIKE "lng_nl_unsubscribe_success" AND F LIKE de;
UPDATE cms_langtable SET F="L’utilisateur est déjà connecté au large." WHERE lang LIKE "lng_nl_unsubscribe_already" AND F LIKE de;
UPDATE cms_langtable SET F="Confirmation d’email Newsletter." WHERE lang LIKE "lng_nl_subscribe_subject" AND F LIKE de;
UPDATE cms_langtable SET F="Veuillez cliquer sur le lien suivant" WHERE lang LIKE "lng_nl_subscribe_text" AND F LIKE de;
UPDATE cms_langtable SET F="Un email de confirmation a été envoyé." WHERE lang LIKE "lng_nl_subscribe_send" AND F LIKE de;
UPDATE cms_langtable SET F="Choisissez le type de document !" WHERE lang LIKE "lng_belegtyp_select" AND F LIKE de;
UPDATE cms_langtable SET F="Offre" WHERE lang LIKE "lng_belegtyp_angebot" AND F LIKE de;
UPDATE cms_langtable SET F="Ordre" WHERE lang LIKE "lng_belegtyp_bestellung" AND F LIKE de;
UPDATE cms_langtable SET F="Réservation de stock" WHERE lang LIKE "lng_belegtyp_lagerbuchung" AND F LIKE de;
UPDATE cms_langtable SET F="Trier par" WHERE lang LIKE "lng_belegsortierung_select" AND F LIKE de;
UPDATE cms_langtable SET F="Numéro de l'ordre" WHERE lang LIKE "lng_belegsortierung_belegnummer" AND F LIKE de;
UPDATE cms_langtable SET F="Crée le" WHERE lang LIKE "lng_belegsortierung_angelegtam" AND F LIKE de;
UPDATE cms_langtable SET F="Détails article" WHERE lang LIKE "lng_artikeldetail_details_header" AND F LIKE de;
UPDATE cms_langtable SET F="Downloads" WHERE lang LIKE "lng_artikeldetail_downloads_header" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikeldetail_titel_langtext" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikeldetail_titel_dimensionstext" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikeldetail_titel_bestelltext" AND F LIKE de;
UPDATE cms_langtable SET F="Description" WHERE lang LIKE "lng_artikeldetail_titel_infotext" AND F LIKE de;
UPDATE cms_langtable SET F="janvier" WHERE lang LIKE "lng_monat_januar" AND F LIKE de;
UPDATE cms_langtable SET F="février" WHERE lang LIKE "lng_monat_februar" AND F LIKE de;
UPDATE cms_langtable SET F="mars" WHERE lang LIKE "lng_monat_maerz" AND F LIKE de;
UPDATE cms_langtable SET F="avril" WHERE lang LIKE "lng_monat_april" AND F LIKE de;
UPDATE cms_langtable SET F="mai" WHERE lang LIKE "lng_monat_mai" AND F LIKE de;
UPDATE cms_langtable SET F="juin" WHERE lang LIKE "lng_monat_juni" AND F LIKE de;
UPDATE cms_langtable SET F="juillet" WHERE lang LIKE "lng_monat_juli" AND F LIKE de;
UPDATE cms_langtable SET F="août" WHERE lang LIKE "lng_monat_august" AND F LIKE de;
UPDATE cms_langtable SET F="septembre" WHERE lang LIKE "lng_monat_september" AND F LIKE de;
UPDATE cms_langtable SET F="octobre" WHERE lang LIKE "lng_monat_oktober" AND F LIKE de;
UPDATE cms_langtable SET F="novembre" WHERE lang LIKE "lng_monat_november" AND F LIKE de;
UPDATE cms_langtable SET F="décembre" WHERE lang LIKE "lng_monat_dezember" AND F LIKE de;
UPDATE cms_langtable SET F="Bonjour" WHERE lang LIKE "lng_welcome_morgen" AND F LIKE de;
UPDATE cms_langtable SET F="Bonne journée" WHERE lang LIKE "lng_welcome_tag" AND F LIKE de;
UPDATE cms_langtable SET F="Bonsoir" WHERE lang LIKE "lng_welcome_abend" AND F LIKE de;
UPDATE cms_langtable SET F="Votre session a expiré! Connectez\nVeuillez à nouveau." WHERE lang LIKE "lng_session_gone" AND F LIKE de;


UPDATE cms_langtable SET IT="Aggiunta 2:" WHERE lang LIKE "lng_addition2_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Aggiunta 3:" WHERE lang LIKE "lng_addition3_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Aggiunta:" WHERE lang LIKE "lng_addition_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="I clienti hanno acquistato anche:" WHERE lang LIKE "lng_artikeldetail_alternativartikel_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Offerte" WHERE lang LIKE "lng_artikeldetail_anfragebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_artikeldetail_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero EAN" WHERE lang LIKE "lng_artikeldetail_eannummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Peso" WHERE lang LIKE "lng_artikeldetail_gewicht" AND IT LIKE de;
UPDATE cms_langtable SET IT="Si sono trovati diversi numeri di prod. Uguali" WHERE lang LIKE "lng_artikeldetail_hstartikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Matchcode" WHERE lang LIKE "lng_artikeldetail_matchcode" AND IT LIKE de;
UPDATE cms_langtable SET IT="Unità di quantità" WHERE lang LIKE "lng_artikeldetail_mengeneinheit" AND IT LIKE de;
UPDATE cms_langtable SET IT="Quantità" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_menge" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nuovo prezzo" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_preis" AND IT LIKE de;
UPDATE cms_langtable SET IT="Blocco note" WHERE lang LIKE "lng_artikeldetail_merkzettelbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Unità di prezzo:" WHERE lang LIKE "lng_artikeldetail_preiseinheit" AND IT LIKE de;
UPDATE cms_langtable SET IT="Quantità" WHERE lang LIKE "lng_artikeldetail_rabattstaffel_kopf_menge" AND IT LIKE de;
UPDATE cms_langtable SET IT="Riduzione" WHERE lang LIKE "lng_artikeldetail_mengenstaffel_kopf_rabatt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Riduzione" WHERE lang LIKE "lng_artikeldetail_rabattstaffel_kopf_rabatt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Si prega di selezionare" WHERE lang LIKE "lng_artikeldetail_selectfeld_text" AND IT LIKE de;
UPDATE cms_langtable SET IT="Articoli DBA" WHERE lang LIKE "lng_artikeldetail_stuecklistenartikel_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Carrello" WHERE lang LIKE "lng_artikeldetail_warenkorbbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Accessori:" WHERE lang LIKE "lng_artikeldetail_zubehoerartikel_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="indietro" WHERE lang LIKE "lng_artikeldetail_zurueckbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Aggiunta:" WHERE lang LIKE "lng_artikeldetail_zusatz" AND IT LIKE de;
UPDATE cms_langtable SET IT="più spese di spedizione" WHERE lang LIKE "lng_artikeldetail_zzgl_versandkosten" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_artikelliste_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero EAN" WHERE lang LIKE "lng_artikelliste_eannummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Peso" WHERE lang LIKE "lng_artikelliste_gewicht" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero prod.:" WHERE lang LIKE "lng_artikelliste_hstartikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="risultati" WHERE lang LIKE "lng_artikelliste_keine_ergebnisse" AND IT LIKE de;
UPDATE cms_langtable SET IT="Matchcode" WHERE lang LIKE "lng_artikelliste_matchcode" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_artikelliste_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_artikelliste_sort_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikelliste_sort_bezeichnung" AND IT LIKE de;
UPDATE cms_langtable SET IT="più spese di spedizione" WHERE lang LIKE "lng_artikelliste_zzgl_versand" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo:" WHERE lang LIKE "lng_bestellvorschlag_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_bestellvorschlag_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="Città:" WHERE lang LIKE "lng_city_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ditta:" WHERE lang LIKE "lng_company_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Paese:" WHERE lang LIKE "lng_country_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="documenti associati:" WHERE lang LIKE "lng_dokumente_zug_dokumente" AND IT LIKE de;
UPDATE cms_langtable SET IT="E-Mail:" WHERE lang LIKE "lng_email_address_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Fax:" WHERE lang LIKE "lng_fax_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nome:" WHERE lang LIKE "lng_first_name_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="I campi contrassegnati con * devono essere compilati correttamente!" WHERE lang LIKE "lng_formular_hilfetext" AND IT LIKE de;
UPDATE cms_langtable SET IT="Campo obbligatorio!" WHERE lang LIKE "lng_formular_pflichtfeld" AND IT LIKE de;
UPDATE cms_langtable SET IT="Invia" WHERE lang LIKE "lng_formular_sendbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="documenti associati:" WHERE lang LIKE "lng_formular_zug_formulare" AND IT LIKE de;
UPDATE cms_langtable SET IT="troppo breve!" WHERE lang LIKE "lng_formular_zu_kurz" AND IT LIKE de;
UPDATE cms_langtable SET IT="troppo lungo!" WHERE lang LIKE "lng_formular_zu_lang" AND IT LIKE de;
UPDATE cms_langtable SET IT="Galleria associata:" WHERE lang LIKE "lng_galerie_zug_galerien" AND IT LIKE de;
UPDATE cms_langtable SET IT="Homepage:" WHERE lang LIKE "lng_homepage_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_inclusive_tax_article_detail" AND IT LIKE de;
UPDATE cms_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_inclusive_tax_under_resultlist" AND IT LIKE de;
UPDATE cms_langtable SET IT="voci di catalogo associato" WHERE lang LIKE "lng_katalog_zug_katalog" AND IT LIKE de;
UPDATE cms_langtable SET IT="Annulla" WHERE lang LIKE "lng_konto_abortbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_konto_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="tutti i documenti" WHERE lang LIKE "lng_konto_belege_alle" AND IT LIKE de;
UPDATE cms_langtable SET IT="Creato il" WHERE lang LIKE "lng_konto_belege_angelegt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Modificato il" WHERE lang LIKE "lng_konto_belege_bearbeitet" AND IT LIKE de;
UPDATE cms_langtable SET IT="documenti completati" WHERE lang LIKE "lng_konto_belege_erledigt" AND IT LIKE de;
UPDATE cms_langtable SET IT="aprire i documenti" WHERE lang LIKE "lng_konto_belege_offen" AND IT LIKE de;
UPDATE cms_langtable SET IT="Immettere un numero di documento" WHERE lang LIKE "lng_konto_belege_suche" AND IT LIKE de;
UPDATE cms_langtable SET IT="I campi contrassegnati con * devono essere compilati correttamente!" WHERE lang LIKE "lng_konto_bemerkung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Gestire gli utenti" WHERE lang LIKE "lng_konto_benutzerbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nome utente" WHERE lang LIKE "lng_konto_benutzer_benutzername" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nuovo utente creato con successo!" WHERE lang LIKE "lng_konto_benutzer_erfolgsmeldung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password:" WHERE lang LIKE "lng_konto_benutzer_passwort" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cambiare indirizzo di posta elettronica" WHERE lang LIKE "lng_konto_emailbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Vecchio indirizzo email" WHERE lang LIKE "lng_konto_email_alt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Il vecchio indirizzo email immesso non corrisponde. Si prega di riprovare." WHERE lang LIKE "lng_konto_email_alt_falsch" AND IT LIKE de;
UPDATE cms_langtable SET IT="L’adresse mail est déjà enregistré. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_konto_email_bereits_vorhanden" AND IT LIKE de;
UPDATE cms_langtable SET IT="Conferma indirizzo E-Mail" WHERE lang LIKE "lng_konto_email_check" AND IT LIKE de;
UPDATE cms_langtable SET IT="Indirizzo di posta elettronica ha cambiato con successo" WHERE lang LIKE "lng_konto_email_erfolgsmeldung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nouvi E-Mail" WHERE lang LIKE "lng_konto_email_neu" AND IT LIKE de;
UPDATE cms_langtable SET IT="Non sono d'accordo gli indirizzi di posta elettronica appena immessi. Si prega di riprovare." WHERE lang LIKE "lng_konto_email_neu_check_falsch" AND IT LIKE de;
UPDATE cms_langtable SET IT="Modificare l'indirizzo di consegna" WHERE lang LIKE "lng_konto_lieferadressebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Inserire nuovo indirizzo di consegna:successo" WHERE lang LIKE "lng_konto_lieferadresse_erfolgsmeldung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ditta:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_firma" AND IT LIKE de;
UPDATE cms_langtable SET IT="Paese:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_land" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nome:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_name" AND IT LIKE de;
UPDATE cms_langtable SET IT="Città:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_ort" AND IT LIKE de;
UPDATE cms_langtable SET IT="NAP:" WHERE lang LIKE "lng_konto_lieferadresse_kopf_plz" AND IT LIKE de;
UPDATE cms_langtable SET IT="Miei ordini" WHERE lang LIKE "lng_konto_meinebestellungbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Miei dati" WHERE lang LIKE "lng_konto_meinedatenbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cambia password" WHERE lang LIKE "lng_konto_passwortbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password modificata con successo" WHERE lang LIKE "lng_konto_passwort_erfolgsmeldung" AND IT LIKE de;
UPDATE cms_langtable SET IT="vecchia password" WHERE lang LIKE "lng_konto_paswort_alt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Conferma password" WHERE lang LIKE "lng_konto_paswort_check" AND IT LIKE de;
UPDATE cms_langtable SET IT="nuova password" WHERE lang LIKE "lng_konto_paswort_neu" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_konto_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="La vecchia password immessa non corrisponde. Si prega di riprovare." WHERE lang LIKE "lng_konto_pw_alt_falsch" AND IT LIKE de;
UPDATE cms_langtable SET IT="Le nuove password immesse non corrispondono. Si prega di riprovare." WHERE lang LIKE "lng_konto_pw_neu_check_falsch" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cambiare indirizzo di fatturazione" WHERE lang LIKE "lng_konto_rechnungsadressebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cambiare indirizzo di fatturazione: successo" WHERE lang LIKE "lng_konto_rechnungsadresse_erfolgsmeldung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Salva" WHERE lang LIKE "lng_konto_savebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Accesso non riuscito. Riprova" WHERE lang LIKE "lng_login_fehlgeschlagen" AND IT LIKE de;
UPDATE cms_langtable SET IT="Login:" WHERE lang LIKE "lng_login_loginbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Logout:" WHERE lang LIKE "lng_login_logoutbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Login:" WHERE lang LIKE "lng_login_modal_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password dimenticata?" WHERE lang LIKE "lng_login_passwort_vergessen" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_login_platzhalter_kundennr" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password" WHERE lang LIKE "lng_login_platzhalter_passwort" AND IT LIKE de;
UPDATE cms_langtable SET IT="Registro" WHERE lang LIKE "lng_login_registerbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Offerta:" WHERE lang LIKE "lng_menu_angebot" AND IT LIKE de;
UPDATE cms_langtable SET IT="le condizioni generali" WHERE lang LIKE "lng_menu_left_agb" AND IT LIKE de;
UPDATE cms_langtable SET IT="Dichiarazione sulla tutela della privacy" WHERE lang LIKE "lng_menu_left_datenschutzerk" AND IT LIKE de;
UPDATE cms_langtable SET IT="Impressum" WHERE lang LIKE "lng_menu_left_impressum" AND IT LIKE de;
UPDATE cms_langtable SET IT="contattare" WHERE lang LIKE "lng_menu_left_kontakt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Condizioni di consegna" WHERE lang LIKE "lng_menu_left_lieferbed" AND IT LIKE de;
UPDATE cms_langtable SET IT="Newsletter" WHERE lang LIKE "lng_menu_left_newsletter" AND IT LIKE de;
UPDATE cms_langtable SET IT="Condizioni di revoca" WHERE lang LIKE "lng_menu_left_widerrufsbel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Condizioni di pagamento" WHERE lang LIKE "lng_menu_left_zahlungsbed" AND IT LIKE de;
UPDATE cms_langtable SET IT="Carrello" WHERE lang LIKE "lng_menu_warenkorb" AND IT LIKE de;
UPDATE cms_langtable SET IT="creare" WHERE lang LIKE "lng_merkzettel_anlegenbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_merkzettel_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Chiudi" WHERE lang LIKE "lng_merkzettel_modal_closebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nome della nuova lista dei desideri" WHERE lang LIKE "lng_merkzettel_platzhalter_name" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_merkzettel_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="Miei Preferiti" WHERE lang LIKE "lng_merkzettel_vorhanden" AND IT LIKE de;
UPDATE cms_langtable SET IT="Notizie associate voci" WHERE lang LIKE "lng_news_zug_news" AND IT LIKE de;
UPDATE cms_langtable SET IT="Dipartimento" WHERE lang LIKE "lng_nutzer_abteilung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Download:" WHERE lang LIKE "lng_nutzer_download" AND IT LIKE de;
UPDATE cms_langtable SET IT="E-Mail:" WHERE lang LIKE "lng_nutzer_email" AND IT LIKE de;
UPDATE cms_langtable SET IT="Fax:" WHERE lang LIKE "lng_nutzer_fax" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ditta:" WHERE lang LIKE "lng_nutzer_firma" AND IT LIKE de;
UPDATE cms_langtable SET IT="Funzione:" WHERE lang LIKE "lng_nutzer_funktion" AND IT LIKE de;
UPDATE cms_langtable SET IT="Maplink:" WHERE lang LIKE "lng_nutzer_maplink" AND IT LIKE de;
UPDATE cms_langtable SET IT="Maplink Caratteristiche:" WHERE lang LIKE "lng_nutzer_maplink_description" AND IT LIKE de;
UPDATE cms_langtable SET IT="Città:" WHERE lang LIKE "lng_nutzer_ort" AND IT LIKE de;
UPDATE cms_langtable SET IT="NAP:" WHERE lang LIKE "lng_nutzer_plz" AND IT LIKE de;
UPDATE cms_langtable SET IT="Via:" WHERE lang LIKE "lng_nutzer_strasse" AND IT LIKE de;
UPDATE cms_langtable SET IT="Telefono:" WHERE lang LIKE "lng_nutzer_telefon1" AND IT LIKE de;
UPDATE cms_langtable SET IT="Mobile:" WHERE lang LIKE "lng_nutzer_telefon2" AND IT LIKE de;
UPDATE cms_langtable SET IT="Homepage:" WHERE lang LIKE "lng_nutzer_web" AND IT LIKE de;
UPDATE cms_langtable SET IT="Chiudi" WHERE lang LIKE "lng_passwort_modal_closebtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire qui il Suo numero cliente registrato da noi o il Suo indirizzo e-mail e Le invieremo subito la password per e-mail." WHERE lang LIKE "lng_passwort_modal_label" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero cliente o indirizzo e-mail:" WHERE lang LIKE "lng_passwort_modal_platzhalter" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password dimenticata?" WHERE lang LIKE "lng_passwort_modal_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Richiesta" WHERE lang LIKE "lng_paswort_modal_anfordernbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_plus_tax_article_detail" AND IT LIKE de;
UPDATE cms_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_plus_tax_under_resultlist" AND IT LIKE de;
UPDATE cms_langtable SET IT="NAP:" WHERE lang LIKE "lng_postal_code_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Luogo della casella postale:" WHERE lang LIKE "lng_postofficeboxcity_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Paese della casella postale:" WHERE lang LIKE "lng_postofficeboxcountry_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="NAP della casella postale:" WHERE lang LIKE "lng_postofficeboxpostalcode_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Casella postale:" WHERE lang LIKE "lng_postofficebox_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ho letto i termini e condizioni e accettarli!" WHERE lang LIKE "lng_register_agb_gelesen" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di verificare i Suoi dati! I campi contrassegnati con * devono essere compilati correttamente!" WHERE lang LIKE "lng_register_bemerkung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password:" WHERE lang LIKE "lng_register_passwort" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ripeti la password:" WHERE lang LIKE "lng_register_passwort_check" AND IT LIKE de;
UPDATE cms_langtable SET IT="Registro" WHERE lang LIKE "lng_register_registerbtn" AND IT LIKE de;
UPDATE cms_langtable SET IT="Via:" WHERE lang LIKE "lng_road_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_suche_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Dipartimento" WHERE lang LIKE "lng_suche_nutzer_abteilung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Download" WHERE lang LIKE "lng_suche_nutzer_download" AND IT LIKE de;
UPDATE cms_langtable SET IT="E-Mail" WHERE lang LIKE "lng_suche_nutzer_email" AND IT LIKE de;
UPDATE cms_langtable SET IT="Fax" WHERE lang LIKE "lng_suche_nutzer_fax" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ditta" WHERE lang LIKE "lng_suche_nutzer_firma" AND IT LIKE de;
UPDATE cms_langtable SET IT="Funzione" WHERE lang LIKE "lng_suche_nutzer_funktion" AND IT LIKE de;
UPDATE cms_langtable SET IT="Maplink" WHERE lang LIKE "lng_suche_nutzer_maplink" AND IT LIKE de;
UPDATE cms_langtable SET IT="Maplink Caratteristiche" WHERE lang LIKE "lng_suche_nutzer_maplink_description" AND IT LIKE de;
UPDATE cms_langtable SET IT="Città" WHERE lang LIKE "lng_suche_nutzer_ort" AND IT LIKE de;
UPDATE cms_langtable SET IT="NAP" WHERE lang LIKE "lng_suche_nutzer_plz" AND IT LIKE de;
UPDATE cms_langtable SET IT="Via" WHERE lang LIKE "lng_suche_nutzer_strasse" AND IT LIKE de;
UPDATE cms_langtable SET IT="Telefono" WHERE lang LIKE "lng_suche_nutzer_tel1" AND IT LIKE de;
UPDATE cms_langtable SET IT="Mobile" WHERE lang LIKE "lng_suche_nutzer_tel2" AND IT LIKE de;
UPDATE cms_langtable SET IT="Homepage" WHERE lang LIKE "lng_suche_nutzer_web" AND IT LIKE de;
UPDATE cms_langtable SET IT="Oggetto della ricerca:" WHERE lang LIKE "lng_suche_platzhalter" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_suche_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nome:" WHERE lang LIKE "lng_surname_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Telefono2:" WHERE lang LIKE "lng_telephone2_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Telefono3:" WHERE lang LIKE "lng_telephone3_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="Telefono1:" WHERE lang LIKE "lng_telephone_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="associate le date:" WHERE lang LIKE "lng_termine_zug_termine" AND IT LIKE de;
UPDATE cms_langtable SET IT="Appellativo:" WHERE lang LIKE "lng_title_voucher_finish" AND IT LIKE de;
UPDATE cms_langtable SET IT="I prezzi indicati s'intendono IVA esclusa." WHERE lang LIKE "lng_without_tax_article_detail" AND IT LIKE de;
UPDATE cms_langtable SET IT="I prezzi indicati s'intendono IVA esclusa." WHERE lang LIKE "lng_without_tax_under_resultlist" AND IT LIKE de;
UPDATE cms_langtable SET IT="Tante grazie per la registrazione." WHERE lang LIKE "lng_konto_registration_kundenmail_kopf" AND IT LIKE de;
UPDATE cms_langtable SET IT="indirizzi associati:" WHERE lang LIKE "lng_adressen_zug_adressen" AND IT LIKE de;
UPDATE cms_langtable SET IT="articoli associati" WHERE lang LIKE "lng_artikel_zug_artikel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo valido fino al:" WHERE lang LIKE "lng_artikeldetail_aktionspreis_gueltig_bis" AND IT LIKE de;
UPDATE cms_langtable SET IT="indirizzi associati:" WHERE lang LIKE "lng_artikel_zug_adressen" AND IT LIKE de;
UPDATE cms_langtable SET IT="articoli associati" WHERE lang LIKE "lng_adressen_zug_artikel" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire l'Impressum nell'amministrazione web!" WHERE lang LIKE "lng_tmg_impressum" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire le condizioni generali nell'amministrazione web!" WHERE lang LIKE "lng_tmg_agb" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire le condizioni di consegna nell'amministrazione web!" WHERE lang LIKE "lng_tmg_lieferbedingungen" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire le condizioni di consegna nell'amministrazione web!" WHERE lang LIKE "lng_tmg_zahlungsbedingungen" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire le condizioni di revoca nell'amministrazione web!" WHERE lang LIKE "lng_tmg_widerrufsbelehrung" AND IT LIKE de;
UPDATE cms_langtable SET IT="La preghiamo di inserire la dichiarazione sulla tutela della privacy nell'amministrazione web!" WHERE lang LIKE "lng_tmg_datenschutz" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_artikelliste_kopf_artikelnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikelliste_kopf_bezeichnung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Unità di prezzo / Unità di quantità" WHERE lang LIKE "lng_artikelliste_kopf_preis_menge" AND IT LIKE de;
UPDATE cms_langtable SET IT="Disponibilità" WHERE lang LIKE "lng_artikelliste_kopf_bestand" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo" WHERE lang LIKE "lng_artikelliste_kopf_preis" AND IT LIKE de;
UPDATE cms_langtable SET IT="non in stock" WHERE lang LIKE "lng_bestand_r" AND IT LIKE de;
UPDATE cms_langtable SET IT="parzialmente disponibile" WHERE lang LIKE "lng_bestand_y" AND IT LIKE de;
UPDATE cms_langtable SET IT="disponibile" WHERE lang LIKE "lng_bestand_g" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prenotazione di magazzino" WHERE lang LIKE "lng_menu_lagerbuchung" AND IT LIKE de;
UPDATE cms_langtable SET IT="in sospeso" WHERE lang LIKE "lng_belegstatus_offen" AND IT LIKE de;
UPDATE cms_langtable SET IT="in elaborazione" WHERE lang LIKE "lng_belegstatus_bearbeitung" AND IT LIKE de;
UPDATE cms_langtable SET IT="evaso" WHERE lang LIKE "lng_belegstatus_erledigt" AND IT LIKE de;
UPDATE cms_langtable SET IT="cancellato" WHERE lang LIKE "lng_belegstatus_geloescht" AND IT LIKE de;
UPDATE cms_langtable SET IT="Selezionare lo stato" WHERE lang LIKE "lng_belegstatus_select" AND IT LIKE de;
UPDATE cms_langtable SET IT="Salve e buongiorno," WHERE lang LIKE "lng_head_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="ecco i Suoi dati d'accesso al web shop come richiesto." WHERE lang LIKE "lng_requested_access_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_customer_number_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Indirizzo e-mail:" WHERE lang LIKE "lng_mail_address_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Password:" WHERE lang LIKE "lng_password_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cordiali saluti" WHERE lang LIKE "lng_kind_regards_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Il team di" WHERE lang LIKE "lng_team_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Dati d'accesso per il shop online" WHERE lang LIKE "lng_subject_mail_pw_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="I Suoi dati d'accesso sono stati mandati al seguente indirizzo:" WHERE lang LIKE "lng_notice_access_data_send_password_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Non risulta alcun indirizzo e-mail per Lei. La preghiamo di rivolgersi al gestore di questo sito!" WHERE lang LIKE "lng_notice_no_mailaddress_password_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Non è stato configurato alcun accesso allo shop per Lei. La preghiamo di rivolgersi al gestore di questo sito!" WHERE lang LIKE "lng_notice_no_shopaccess_password_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="I dati inseriti non sono registrati. Si prega di controllare e riprovare!" WHERE lang LIKE "lng_notice_unregistered_password_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="I dati immessi sono inconcludenti per associare con noi. Vi preghiamo di contattarci!" WHERE lang LIKE "lng_notice_ambiguous_password_request" AND IT LIKE de;
UPDATE cms_langtable SET IT="Allegato" WHERE lang LIKE "lng_artikeldetail_artikelanhang_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="continua a leggere" WHERE lang LIKE "lng_teaser_link_description" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_artikeldetail_preis_auf_anfrage" AND IT LIKE de;
UPDATE cms_langtable SET IT="Disponibilità" WHERE lang LIKE "lng_artikeldetail_verfuegbarkeit" AND IT LIKE de;
UPDATE cms_langtable SET IT="Quantità" WHERE lang LIKE "lng_artikeldetail_menge" AND IT LIKE de;
UPDATE cms_langtable SET IT="Vecchio prezzo" WHERE lang LIKE "lng_artikeldetail_preis_alt" AND IT LIKE de;
UPDATE cms_langtable SET IT="Nuovo prezzo" WHERE lang LIKE "lng_artikeldetail_preis_neu" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prezzo" WHERE lang LIKE "lng_artikeldetail_preis" AND IT LIKE de;
UPDATE cms_langtable SET IT="Proposta d'ordine" WHERE lang LIKE "lng_konto_link_bestellvorschlag" AND IT LIKE de;
UPDATE cms_langtable SET IT="Modulo inviato con successo" WHERE lang LIKE "lng_form_send" AND IT LIKE de;
UPDATE cms_langtable SET IT="Codice di sicurezza errato" WHERE lang LIKE "lng_form_captchacheck" AND IT LIKE de;
UPDATE cms_langtable SET IT="effettuato l'accesso" WHERE lang LIKE "lng_nl_subscribe" AND IT LIKE de;
UPDATE cms_langtable SET IT="L’adresse mail est déjà enregistré." WHERE lang LIKE "lng_nl_already_subscribed" AND IT LIKE de;
UPDATE cms_langtable SET IT="Risultati della ricerca" WHERE lang LIKE "lng_search_title" AND IT LIKE de;
UPDATE cms_langtable SET IT="L'accessorio è obbligatorio:" WHERE lang LIKE "lng_artikeldetail_pflichtzubehoerartikel_titel" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ordine non finalizzato." WHERE lang LIKE "lng_konto_keine_belege" AND IT LIKE de;
UPDATE cms_langtable SET IT="Uscito con successo dalla newsletter" WHERE lang LIKE "lng_nl_unsubscribe_success" AND IT LIKE de;
UPDATE cms_langtable SET IT="Utente è già registrato" WHERE lang LIKE "lng_nl_unsubscribe_already" AND IT LIKE de;
UPDATE cms_langtable SET IT="Conferma email newsletter." WHERE lang LIKE "lng_nl_subscribe_subject" AND IT LIKE de;
UPDATE cms_langtable SET IT="Cliccate sul seguente link." WHERE lang LIKE "lng_nl_subscribe_text" AND IT LIKE de;
UPDATE cms_langtable SET IT="È stata inviata una email di conferma." WHERE lang LIKE "lng_nl_subscribe_send" AND IT LIKE de;
UPDATE cms_langtable SET IT="Scegliere il tipo di documento!" WHERE lang LIKE "lng_belegtyp_select" AND IT LIKE de;
UPDATE cms_langtable SET IT="Offerta" WHERE lang LIKE "lng_belegtyp_angebot" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ordine" WHERE lang LIKE "lng_belegtyp_bestellung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Prenotazione di magazzino" WHERE lang LIKE "lng_belegtyp_lagerbuchung" AND IT LIKE de;
UPDATE cms_langtable SET IT="Ordina per" WHERE lang LIKE "lng_belegsortierung_select" AND IT LIKE de;
UPDATE cms_langtable SET IT="Numero dell'ordine:" WHERE lang LIKE "lng_belegsortierung_belegnummer" AND IT LIKE de;
UPDATE cms_langtable SET IT="Creato il" WHERE lang LIKE "lng_belegsortierung_angelegtam" AND IT LIKE de;
UPDATE cms_langtable SET IT="Dettagli articolo" WHERE lang LIKE "lng_artikeldetail_details_header" AND IT LIKE de;
UPDATE cms_langtable SET IT="Downloads" WHERE lang LIKE "lng_artikeldetail_downloads_header" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikeldetail_titel_langtext" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikeldetail_titel_dimensionstext" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikeldetail_titel_bestelltext" AND IT LIKE de;
UPDATE cms_langtable SET IT="Descrizione" WHERE lang LIKE "lng_artikeldetail_titel_infotext" AND IT LIKE de;
UPDATE cms_langtable SET IT="gennaio" WHERE lang LIKE "lng_monat_januar" AND IT LIKE de;
UPDATE cms_langtable SET IT="febbraio" WHERE lang LIKE "lng_monat_februar" AND IT LIKE de;
UPDATE cms_langtable SET IT="marzo" WHERE lang LIKE "lng_monat_maerz" AND IT LIKE de;
UPDATE cms_langtable SET IT="aprile" WHERE lang LIKE "lng_monat_april" AND IT LIKE de;
UPDATE cms_langtable SET IT="maggio" WHERE lang LIKE "lng_monat_mai" AND IT LIKE de;
UPDATE cms_langtable SET IT="giugno" WHERE lang LIKE "lng_monat_juni" AND IT LIKE de;
UPDATE cms_langtable SET IT="luglio" WHERE lang LIKE "lng_monat_juli" AND IT LIKE de;
UPDATE cms_langtable SET IT="agosto" WHERE lang LIKE "lng_monat_august" AND IT LIKE de;
UPDATE cms_langtable SET IT="settembre" WHERE lang LIKE "lng_monat_september" AND IT LIKE de;
UPDATE cms_langtable SET IT="ottobre" WHERE lang LIKE "lng_monat_oktober" AND IT LIKE de;
UPDATE cms_langtable SET IT="novembre" WHERE lang LIKE "lng_monat_november" AND IT LIKE de;
UPDATE cms_langtable SET IT="dicembre" WHERE lang LIKE "lng_monat_dezember" AND IT LIKE de;
UPDATE cms_langtable SET IT="Buongiorno" WHERE lang LIKE "lng_welcome_morgen" AND IT LIKE de;
UPDATE cms_langtable SET IT="Buona giornata" WHERE lang LIKE "lng_welcome_tag" AND IT LIKE de;
UPDATE cms_langtable SET IT="Buona sera" WHERE lang LIKE "lng_welcome_abend" AND IT LIKE de;
UPDATE cms_langtable SET IT="La sessione è scaduta! Iscriviti\nPer favore di nuovo." WHERE lang LIKE "lng_session_gone" AND IT LIKE de;

CREATE TABLE IF NOT EXISTS `cms_langtable_description` (
  `lang` varchar(255) NOT NULL,
  `de` text,
  `E` text,
  PRIMARY KEY (`lang`)
) ENGINE=MyISAM;

INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_addition2_voucher_finish', 'Bezeichnung für "Zusatz2"- Feld bei Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_addition3_voucher_finish', 'Bezeichnung für "Zusatz3"-Feld bei Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_addition_voucher_finish', 'Bezeichnung für "Zusatz"-Feld bei Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_alternativartikel_titel', 'Titel für Liste der Alternativartikel in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_anfragebtn', 'Bezeichnung für den Anfrage-Button in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_artikelnummer', 'Bezeichnung für Artikelnummer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_eannummer', 'Bezeichnung für EAN-Nummer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_gewicht', 'Bezeichnung für Gewicht in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_hstartikelnummer', 'Bezeichnung für Herstellerartikelnummer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_matchcode', 'Bezeichnung für Matchcode in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_mengeneinheit', 'Bezeichnung für Mengeneinheit in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_menge', 'Titel für Menge in Mengenstaffeltabelle in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_preis', 'Titel für Preis in Mengenstaffeltabelle in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_merkzettelbtn', 'Bezeichnung für Merkzettel-Button in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_preiseinheit', 'Bezeichnung für Preiseinheit in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_rabattstaffel_kopf_menge', 'Titel für Menge in Rabattstaffeltabelle in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_mengenstaffel_kopf_rabatt', 'Titel für Rabatt in Mengenstaffeltabelle in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_rabattstaffel_kopf_rabatt', 'Titel für Rabatt in Rabattstaffeltabelle in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_selectfeld_text', 'Standardauswahl für Selectfelder in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_stuecklistenartikel_titel', 'Titel für Stücklistenartikelliste in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_warenkorbbtn', 'Bezeichnung für Warenkorb-Button in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_zubehoerartikel_titel', 'Titel für Zubehörartikelliste in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_zurueckbtn', 'Bezeichnung für Zurück-Button in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_zusatz', 'Bezeichnung für Zusatz in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_zzgl_versandkosten', 'Bezeichnung für Versandkostenlink hinter Preisbemerkung in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_artikelnummer', 'Bezeichnung für Artikelnummer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_eannummer', 'Bezeichnung für EAN-Nummer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_gewicht', 'Bezeichnung für Gewicht in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_hstartikelnummer', 'Bezeichnung für Herstellerartikelnummer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_keine_ergebnisse', 'Bezeichnung für kein Ergebnis in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_matchcode', 'Bezeichnung für Matchcode in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_sort_artikelnummer', 'Bezeichnung für Artikelnummer in Selectfeld für Sortierung in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_sort_bezeichnung', 'Bezeichnung für Bezeichnung in Selectfeld für Sortierung in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_zzgl_versand', 'Bezeichnung für Versandkostenlink hinter Preisbemerkung in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_bestellvorschlag_artikelnummer', 'Bezeichnung für Artikelnummer in Bestellvorschlag');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_bestellvorschlag_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage in Bestellvorschlag');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_city_voucher_finish', 'Bezeichnung für Ort in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_company_voucher_finish', 'Bezeichnung für Firma in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_country_voucher_finish', 'Bezeichnung für Land in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_dokumente_zug_dokumente', 'Titel für Liste von zugeordneten Dokumenten ');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_email_address_voucher_finish', 'Bezeichnung für E-Mail Adresse in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_fax_voucher_finish', 'Bezeichnung für Fax in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_first_name_voucher_finish', 'Bezeichnung für Vorname in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_hilfetext', 'Bemerkung für Formulare');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_pflichtfeld', 'Bemerkung für Formulare falls Pflichtfeld nicht ausgefüllt wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_sendbtn', 'Bezeichnung für Senden-Button in Formularen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_zug_formulare', 'Titel für Liste von zugeordneten Formularen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_zu_kurz', 'Bemerkung für Formulare falls Eingabe zu kurz');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_formular_zu_lang', 'Bemerkung für Formulare falls Eingabe zu lang');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_galerie_zug_galerien', 'Titel für Liste von zugeordneten Galerien');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_homepage_voucher_finish', 'Bezeichnung für Homepage in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_inclusive_tax_article_detail', 'Preisbemerkung für Preise inklusive Mehrwertsteuer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_inclusive_tax_under_resultlist', 'Preisbemerkung für Preise inklusive Mehrwertsteuer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_katalog_zug_katalog', 'Titel für Liste von zugeordneten Katalogeinträgen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_abortbtn', 'Bezeichnung für Abbrechen-Button in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_artikelnummer', 'Bezeichnung für Artikelnummer in Belegliste in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_alle', 'Titel für Spalte "alle Belege" in Belegansicht in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_angelegt', 'Bezeichnung für Datum, an dem Beleg angelegt wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_bearbeitet', 'Bezeichnung für Datum, an dem Beleg bearbeitet wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_erledigt', 'Titel für Spalte "erledigte Belege" in Belegansicht in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_offen', 'Titel für Spalte "offene Belege" in Belegansicht in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_belege_suche', 'Platzhalter für Suche in Belegansicht in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_bemerkung', 'Bemerkung für Pflichtfelder in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_benutzerbtn', 'Titel für Benutzerverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_benutzer_benutzername', 'Bezeichnung für Benutzername in Benutzerverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_benutzer_erfolgsmeldung', 'Erfolgsmeldung bei neu angelegtem Benutzer');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_benutzer_passwort', 'Bezeichnung für Passwort in Benutzerverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_emailbtn', 'Titel für E-Mailverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_alt', 'Bezeichnung für alte E-Mail Adresse in E-Mailverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_alt_falsch', 'Meldung, wenn eingegebene alte E-Mail Adresse falsch war');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_bereits_vorhanden', 'Meldung, wenn eingegebene neue E-Mail Adresse bereits vorhanden ist');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_check', 'Bezeichnung für Wiederholung der E-Mail Adresse');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_erfolgsmeldung', 'Meldung, wenn E-Mail Adresse erfolgreich geändert wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_neu', 'Bezeichnung für neue E-Mail Adresse');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_email_neu_check_falsch', 'Meldung, wenn neue E-Mail Adresse und Wiederholung nicht übereinstimmen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadressebtn', 'Titel für Lieferadressenverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_erfolgsmeldung', 'Meldung, wenn Lieferadresse erfolgreich erstellt / angepasst wurde.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_kopf_firma', 'Titel für Firma in Lieferadressentabelle in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_kopf_land', 'Titel für Land in Lieferadressentabelle in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_kopf_name', 'Titel für Name in Lieferadressentabelle in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_kopf_ort', 'Titel für Ort in Lieferadressentabelle in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_lieferadresse_kopf_plz', 'Titel für PLZ in Lieferadressentabelle in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_meinebestellungbtn', 'Titel für Belegansicht in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_meinedatenbtn', 'Titel für Kundendatenverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_passwortbtn', 'Titel für Passwortverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_passwort_erfolgsmeldung', 'Meldung, wenn Passwort erfolgreich geändert wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_paswort_alt', 'Bezeichnung für altes Passwort in Passwortverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_paswort_check', 'Bezeichnung für Passwortwiederholung in Passwortverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_paswort_neu', 'Bezeichnung für neues Passowrt in Passwortverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage in Beleganzeige in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_pw_alt_falsch', 'Meldung, wenn eingegebenes altes Passwort falsch war');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_pw_neu_check_falsch', 'Meldung, wenn neues und wiederholtes Passwort nicht übereinstimmen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_rechnungsadressebtn', 'Titel für Rechnungsadressenverwaltung in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_rechnungsadresse_erfolgsmeldung', 'Meldung, wenn Rechnungsadresse erfolgreich geändert wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_savebtn', 'Bezeichnung für Speichern-Button in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_fehlgeschlagen', 'Meldung, wenn Login fehlgeschlagen ist');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_loginbtn', 'Bezeichnung für Login-Button');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_logoutbtn', 'Bezeichnung für Logout-Button');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_modal_titel', 'Titel für Loginmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_passwort_vergessen', 'Bezeichnung für "Passwort vergessen"-Link');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_platzhalter_kundennr', 'Platzhalter für Eingabe der Kundennummer / E-Mail bei Login');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_platzhalter_passwort', 'Platzhalter für Passwort bei Login');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_login_registerbtn', 'Titel für Registrieren-Button bei Login');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_angebot', 'Titel für Kopf von Angebotsvoransicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_agb', 'Bezeichnung für AGB-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_datenschutzerk', 'Bezeichnung für Datenschutz-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_impressum', 'Bezeichnung für Impressum-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_kontakt', 'Bezeichnung für Kontakt-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_lieferbed', 'Bezeichnung für Lieferbedingung-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_newsletter', 'Bezeichnung für Newsletter-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_widerrufsbel', 'Bezeichnung für Widerrufsbelehrung-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_left_zahlungsbed', 'Bezeichnung für Zahlungsbedingung-Link im Fußbereich');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_warenkorb', 'Titel für Kopf von Warenkorbvoransicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_anlegenbtn', 'Titel für Anlegen-Button im Merkzettelmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_artikelnummer', 'Bezeichnung für Artikelnummer im Merkzettel');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_modal_closebtn', 'Titel für Schließen-Button im Merkzettelmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_platzhalter_name', 'Platzhalter für Name des neuen Merkzettels');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage im Merkzettel');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_merkzettel_vorhanden', 'Titel für Liste der vorhandenen Merkzettel');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_news_zug_news', 'Titel für Liste von zugeordneten News');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_abteilung', 'Bezeichnung für Abteilung in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_download', 'Bezeichnung für Download in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_email', 'Bezeichnung für E-Mail Adresse in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_fax', 'Bezeichnung für Fax in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_firma', 'Bezeichnung für Firma in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_funktion', 'Bezeichnung für Funktion in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_maplink', 'Bezeichnung für Maplink in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_maplink_description', 'Bezeichnung für Maplink-Beschreibung in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_ort', 'Bezeichnung für Ort in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_plz', 'Bezeichnung für PLZ in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_strasse', 'Bezeichnung für Straße in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_telefon1', 'Bezeichnung für Telefon1 in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_telefon2', 'Bezeichnung für Telefon2 in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nutzer_web', 'Bezeichnung für Homepage in Nutzerliste');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_passwort_modal_closebtn', 'Titel für Schließen-Button in Passwortmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_passwort_modal_label', 'Bemerkung für Passwortmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_passwort_modal_platzhalter', 'Platzhalter für Eingabefeld in Passwortmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_passwort_modal_titel', 'Titel für Passwortmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_paswort_modal_anfordernbtn', 'Titel für Anfordern-Button in Passwortmodal');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_plus_tax_article_detail', 'Preisbemerkung für Preise zzgl. Mehrwertsteuer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_plus_tax_under_resultlist', 'Preisbemerkung für Preise zzgl. Mehrwertsteuer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_postal_code_voucher_finish', 'Bezeichnung für PLZ in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_postofficeboxcity_voucher_finish', 'Bezeichnung für Postfach Ort in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_postofficeboxcountry_voucher_finish', 'Bezeichnung für Postfach Land in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_postofficeboxpostalcode_voucher_finish', 'Bezeichnung für Postfach PLZ in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_postofficebox_voucher_finish', 'Bezeichnung für Postfach in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_register_agb_gelesen', 'Link für Bestätigung der AGBs');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_register_bemerkung', 'Bemerkung für Registrierungsformular');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_register_passwort', 'Bezeichnung für Passwort in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_register_passwort_check', 'Bezeichnung für Passwortwiederholung in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_register_registerbtn', 'Bezeichnung für Registrieren-Button in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_road_voucher_finish', 'Bezeichnung für Straße in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_artikelnummer', 'Bezeichnung für Artikelnummer in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_abteilung', 'Bezeichnung für Nutzer-Abteilung in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_download', 'Bezeichnung für Nutzer-Download in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_email', 'Bezeichnung für Nutzer-E-Mail in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_fax', 'Bezeichnung für Nutzer-Fax in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_firma', 'Bezeichnung für Nutzer-Firma in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_funktion', 'Bezeichnung für Nutzer-Funktion in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_maplink', 'Bezeichnung für Nutzer-Maplink in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_maplink_description', 'Bezeichnung für Nutzer-Maplink Beschreibung in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_ort', 'Bezeichnung für Nutzer-Ort in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_plz', 'Bezeichnung für Nutzer-PLZ in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_strasse', 'Bezeichnung für Nutzer-Straße in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_tel1', 'Bezeichnung für Nutzer-Telefon1 in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_tel2', 'Bezeichnung für Nutzer-Telefon2 in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_nutzer_web', 'Bezeichnung für Nutzer-Homepage in Suchergebnis');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_platzhalter', 'Platzhalter für Sucheingabefeld');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_suche_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage in Suchergebnissen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_surname_voucher_finish', 'Bezeichnung für Vorname in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_telephone2_voucher_finish', 'Bezeichnung für Telefon2 in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_telephone3_voucher_finish', 'Bezeichnung für Telefon3 in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_telephone_voucher_finish', 'Bezeichnung für Telefon in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_termine_zug_termine', 'Titel für Liste von zugeordneten Terminen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_title_voucher_finish', 'Bezeichnung für Anrede in Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_without_tax_article_detail', 'Preisbemerkung für Preise ohne Mehrwertsteuer in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_without_tax_under_resultlist', 'Preisbemerkung für Preise ohne Mehrwertsteuer in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_registration_kundenmail_kopf', 'Kopf für E-Mail an Neukunden nach Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_registration_kundenmail_ende', 'Fuß für E-Mail an Neukunden nach Registrierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikel_zug_artikel', 'Bezeichnung für zugeordnete Artilel');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_adressen_zug_adressen', 'Bezeichnung für zugeordnete Adressen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_aktionspreis_gueltig_bis', 'Bezeichnung für "gültig bis" bei Aktionspreisen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikel_zug_adressen', 'Titel für Liste von zugeordneten Adresssen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_adressen_zug_artikel', 'Titel für Liste von zugeordneten Artikeln');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_kopf_artikelnummer', 'Titel für Spalte "Artikelnummer" in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_kopf_bezeichnung', 'Titel für Spalte "Bezeichnung" in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_kopf_preis_menge', 'Titel für Spalte "PE / ME" in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_kopf_bestand', 'Titel für Spalte "Bestand" in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikelliste_kopf_preis', 'Titel für Spalte "Preis" in Listenansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_impressum', 'Impressum');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_agb', 'AGB');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_lieferbedingungen', 'Lieferbedingungen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_zahlungsbedingungen', 'Zahlungsbedingung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_widerrufsbelehrung', 'Widerrufsbelehrung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_tmg_datenschutz', 'Datenschutzerklärung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_bestand_r', 'nicht auf Lager');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_bestand_y', 'begrenzt verfügbar');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_bestand_g', 'verfügbar');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_menu_lagerbuchung', 'Lagerbuchung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegstatus_offen', 'Bezeichnung für Belegstatus \'offen\'');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegstatus_bearbeitung', 'Bezeichnung für Belegstatus \'in Bearbeitung\'');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegstatus_erledigt', 'Bezeichnung für Belegstatus \'erledigt\'');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegstatus_geloescht', 'Bezeichnung für Belegstatus \'gelöscht\'');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegstatus_select', 'Bezeichnung für Belegstatus Selectfeld');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_head_mail_pw_request', 'Kopf für E-Mail bei Passwortanfrage');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_requested_access_mail_pw_request', 'Text \'hier Ihre angeforderten Zugangsdaten für den Webshop\' vor Domainnennung im Mail Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_customer_number_mail_pw_request', 'Bezeichnung \'Kundennummer:\' in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_mail_address_mail_pw_request', 'Bezeichnung \'E-Mail-Adresse:\' in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_password_mail_pw_request', 'Bezeichnung \'Passwort:\' in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_kind_regards_mail_pw_request', 'Abschiedsgruß in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_team_mail_pw_request', 'Abschiedsgruß Firmenbezeichnung in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_subject_mail_pw_request', 'Betreffzeile in Mail für Passwort anfordern');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_notice_access_data_send_password_request', 'Meldung bei Passwortanfrage, wenn Passwort erfolgreich zugesendet wurde');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_notice_no_mailaddress_password_request', 'Meldung bei Passwortanfrage, wenn keine E-Mail Adresse hinterlegt ist');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_notice_no_shopaccess_password_request', 'Meldung bei Passwortanfrage, wenn kein Shopzugang konfiguriert ist');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_notice_unregistered_password_request', 'Meldung bei Passwortanfrage, wenn eingegebene Daten nicht registriert sind');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_notice_ambiguous_password_request', 'Meldung bei Passwortanfrage, wenn eingegebene Daten nicht eindeutig zuordbar sind');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_artikelanhang_titel', 'Titel für Artikelanhänge');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_teaser_link_description', 'Bezeichnung für Button weiter lesen');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_preis_auf_anfrage', 'Bezeichnung für Preis auf Anfrage in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_verfuegbarkeit', 'Bezeichnung für Verfügbarkeit in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_menge', 'Bezeichnung für Menge in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_preis_alt', 'Bezeichnung für alten Preis in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_preis_neu', 'Bezeichnung für neuen Preis in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_preis', 'Bezeichnung für Preis in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_link_bestellvorschlag', 'Bezeichnung für Bestellvorschlag Link in Kontoansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_form_send', 'Erfolgsmeldung bei dem Formularversand');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_form_captchacheck', 'Hinweis bei falschen Captcha');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_subscribe', 'Newsletteranmeldung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_already_subscribed', 'E-Mail bereites angemeldet.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_search_title', 'Titel für Suche');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_pflichtzubehoerartikel_titel', 'Titel für "Pflichtzubehörartikelliste" in Detailansicht');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_keine_belege', 'Meldung in Bestellübersicht, wenn noch keine Bestellung vorhanden ist.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_unsubscribe_success', 'Newsletter Text für erfolgreiche Abmeldung.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_unsubscribe_already', 'Newsletter Text: Nutzer ist bereits abgemeldet.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_subscribe_subject', 'Newsletter E-Mail Betreff für Anmeldung.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_subscribe_text', 'Newsletter E-Mail Text für Anmeldung.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_nl_subscribe_send', 'Newsletter Text für Anmeldung.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegtyp_select', 'Text für Auswahlfeld "Belegtyp" in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegtyp_angebot', 'Bezeichnung für "Angebot" in Belegtypauswahl');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegtyp_bestellung', 'Bezeichnung für "Bestellung" in Belegtypauswahl');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegtyp_lagerbuchung', 'Bezeichnung für "Lagerbuchung" in Belegtypauswahl');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegsortierung_select', 'Text für Auswahlfeld "Sortierung" in Mein Konto');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegsortierung_belegnummer', 'Bezeichnung für "Belegnummer" in Belegsortierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_belegsortierung_angelegtam', 'Bezeichnung für "Angelegt Am" in Belegsortierung');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_details_header', 'Überschrift für Artikeldetails');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_downloads_header', 'Überschrift für Artikelanhänge');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_titel_langtext', 'Bezeichnung für Artikel Langtext');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_titel_dimensionstext', 'Bezeichnung für Artikel Dimensionstext');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_titel_bestelltext', 'Bezeichnung für Artikel Bestelltext');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_artikeldetail_titel_infotext', 'Bezeichnung für Artikel Infotext');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_registration_success', 'Meldung in Alertbox, wenn Registrierung erfolgreich.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_konto_benutzer_erfolgsmeldung2', 'Meldung in Mein Konto, wenn Benutzer erfolgreich bearbeitet wurde.');
INSERT IGNORE INTO `cms_langtable_description` (`lang`, `de`) VALUES ('lng_session_gone', 'Meldung bei abgelaufener Sitzung.');



ALTER IGNORE TABLE `3xios_output_langtable` ADD COLUMN `IT` text;
ALTER IGNORE TABLE `3xios_output_langtable` ADD COLUMN `F` text;
UPDATE `3xios_output_langtable` SET IT=de WHERE IT IS NULL;
UPDATE `3xios_output_langtable` SET F=de WHERE F IS NULL;

UPDATE 3xios_output_langtable SET IT="Cambiamento" WHERE lang LIKE "lng_btn_change_voucherarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiamento" WHERE lang LIKE "lng_btn_change_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiamento" WHERE lang LIKE "lng_alt_change_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiare salvato" WHERE lang LIKE "lng_reg_is_changed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Facendo clic su Cambia" WHERE lang LIKE "lng_wk_check_before_submitting2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="a partire da" WHERE lang LIKE "lng_from2_shipment_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="concluso" WHERE lang LIKE "lng_voucher_finally_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="completare" WHERE lang LIKE "lng_voucher_finish_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Amministrazione" WHERE lang LIKE "lng_admin" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Adotta indirizzo" WHERE lang LIKE "lng_address_take_over_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modifica indirizzo" WHERE lang LIKE "lng_address_work_on_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cancella indirizzo" WHERE lang LIKE "lng_address_delete_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="le condizioni generali" WHERE lang LIKE "lng_i_have_agb2_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="le condizioni generali" WHERE lang LIKE "lng_menu_left_agb" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="le condizioni generali" WHERE lang LIKE "lng_all_vouchers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="tutte le richieste" WHERE lang LIKE "lng_all_offers_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tutti gli ordini" WHERE lang LIKE "lng_all_orders_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tutti gli ordini" WHERE lang LIKE "lng_all_orders_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tutte le prenotazioni di magazzino" WHERE lang LIKE "lng_all_stock_item_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Salva come indirizzo di consegna" WHERE lang LIKE "lng_store_as_ship_to_address_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero dell'ordine precedente" WHERE lang LIKE "lng_old_voucher_number_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Vecchio indirizzo email" WHERE lang LIKE "lng_mk_old_email_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ancien mot de passe" WHERE lang LIKE "lng_mk_old_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Offerte" WHERE lang LIKE "lng_offer_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Offerte" WHERE lang LIKE "lng_offer" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Offerte" WHERE lang LIKE "lng_offer_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inchiesta n." WHERE lang LIKE "lng_offer_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richieste" WHERE lang LIKE "lng_offers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Offerta:" WHERE lang LIKE "lng_mk_offer" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Creato il" WHERE lang LIKE "lng_to_set_up_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Login" WHERE lang LIKE "lng_button_wk_login_logrange_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Login" WHERE lang LIKE "lng_announce_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Appellativo:" WHERE lang LIKE "lng_title_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Appellativo:" WHERE lang LIKE "lng_title_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Persona di riferimento" WHERE lang LIKE "lng_contact_person_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Applica" WHERE lang LIKE "lng_use_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero di posizioni" WHERE lang LIKE "lng_count_positions_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Adotta" WHERE lang LIKE "lng_alt_take_over_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_column_art_com_ean_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_article_subset" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_article_number_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_message_article_missing1_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_message_article_successfully_imports1_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_column_article_number_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo non è disponibile" WHERE lang LIKE "lng_article_is_missing" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Movimento dell'articolo" WHERE lang LIKE "lng_article_movement_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Movimento di articoli per" WHERE lang LIKE "lng_article_transactions_for_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="No dell'art." WHERE lang LIKE "lng_article_number_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="No dell'art." WHERE lang LIKE "lng_mailgen_bez11" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="No dell'art." WHERE lang LIKE "lng_article_number_list_in_description" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_bez_ardetail_bez1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero dell'articolo" WHERE lang LIKE "lng_article_number_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modifica dati articolo" WHERE lang LIKE "lng_article_values_changing_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_mk_order" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Analisi" WHERE lang LIKE "lng_alt_analysis_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Analisi" WHERE lang LIKE "lng_analysis_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Addebito in ccb" WHERE lang LIKE "lng_pulldown_zb_bankeinzug" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modificato il" WHERE lang LIKE "lng_worked_on_to_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Termina" WHERE lang LIKE "lng_btn_exit_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="parzialmente disponibile" WHERE lang LIKE "lng_alternativbestandstexty" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si è verificato un errore durante il pagamento. La preghiamo di ritentare o di scegliere un altro modo di pagamento!" WHERE lang LIKE "lng_js_payment_error_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Documenti" WHERE lang LIKE "lng_mk_your_vouchers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero dell'ordine:" WHERE lang LIKE "lng_voucher_number_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero dell'ordine:" WHERE lang LIKE "lng_mailgen_bez2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Riduzione sull'ordine" WHERE lang LIKE "lng_voucher_discount" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Riduzione sull'ordine" WHERE lang LIKE "lng_voucher_discount_voucher_totals" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Osservazioni:" WHERE lang LIKE "lng_comments_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Osservazioni:" WHERE lang LIKE "lng_mailgen_bez22" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Osservazioni:" WHERE lang LIKE "lng_remarks_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambia utente:" WHERE lang LIKE "lng_mk_change_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Utente di creare / modificare" WHERE lang LIKE "lng_mk_create_change_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Utente cancellato" WHERE lang LIKE "lng_reg_deleted_user" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Gestire gli utenti" WHERE lang LIKE "lng_mk_manage_users" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nome utente è già registrato. Registrazione non è possibile" WHERE lang LIKE "lng_reg_description3" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nome utente:" WHERE lang LIKE "lng_reg_username" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Gestione degli utenti" WHERE lang LIKE "lng_reg_usermanagement" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_description_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Caratteristiche:" WHERE lang LIKE "lng_description_colon_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Conferma" WHERE lang LIKE "lng_menu_customer_verification" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Giacenza" WHERE lang LIKE "lng_bez_ardetail_bez13" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Giacenza" WHERE lang LIKE "lng_stock_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Giacenza" WHERE lang LIKE "lng_column_inventory_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero ordine:" WHERE lang LIKE "lng_order_number_printarea_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero ordine:" WHERE lang LIKE "lng_order_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order_printarea_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine" WHERE lang LIKE "lng_order_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine concluso" WHERE lang LIKE "lng_text_wk_end" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Continuare l'ordine" WHERE lang LIKE "lng_button_wk_further_voucher_range_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Continuare l'ordine" WHERE lang LIKE "lng_wk_sitetitle_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine:" WHERE lang LIKE "lng_orders" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordine:" WHERE lang LIKE "lng_orders_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini" WHERE lang LIKE "lng_mk_your_orders" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Movimenti" WHERE lang LIKE "lng_column_movements_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pagare" WHERE lang LIKE "lng_btn_to_pay_up_payment" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inizia pagamento" WHERE lang LIKE "lng_payment_to_start_payment" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_column_designation_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_designation_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_mailgen_bez12" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_designation_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_notation_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_column_article_description_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione" WHERE lang LIKE "lng_notation_colon_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="BIC/SWIFT:" WHERE lang LIKE "lng_bic_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="a" WHERE lang LIKE "lng_to_shipment_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="a:" WHERE lang LIKE "lng_to_date_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini non ancora presenti" WHERE lang LIKE "lng_no_vouchers_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente precedente:" WHERE lang LIKE "lng_mailgen_bez23" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente precedente:" WHERE lang LIKE "lng_past_customer_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente precedente:" WHERE lang LIKE "lng_past_customer_number_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La preghiamo di verificare i Suoi dati! I campi contrassegnati con * devono essere compilati correttamente!" WHERE lang LIKE "lng_js_check_inputs_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si prega di controllare prima di inviare l'ordine ancora una volta le informazioni." WHERE lang LIKE "lng_wk_check_before_submitting1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La preghiamo di verificare il valore minimo dell'ordine." WHERE lang LIKE "lng_js_minimum_order_value1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La preghiamo di inserire qui il Suo numero cliente registrato da noi o il Suo indirizzo e-mail e Le invieremo subito la password per e-mail." WHERE lang LIKE "lng_input_cn_or_mail_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Per favore Inserisci i tuoi dati personali" WHERE lang LIKE "lng_reg_insert_your_personal_data" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La preghiamo di" WHERE lang LIKE "lng_contact_establishment1_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si prega di selezionare" WHERE lang LIKE "lng_please_select" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si prega di selezionare" WHERE lang LIKE "lng_regstart_please_select" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="CAB:" WHERE lang LIKE "lng_bank_code_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Importo lordo" WHERE lang LIKE "lng_gross_amount_voucher_totals" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="prenotare" WHERE lang LIKE "lng_into_the_stock_item_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotare" WHERE lang LIKE "lng_booking_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La vecchia password immessa non corrisponde. Si prega di riprovare." WHERE lang LIKE "lng_mk_old_password_false" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La data finale non è valida!" WHERE lang LIKE "lng_final_date_invalidly_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il campo" WHERE lang LIKE "lng_reg_description1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La data di consegna ha un formato errato o non è valida! La preghiamo di usare il formato seguente: GG.MM.AAAA." WHERE lang LIKE "lng_js_format_delivery_date_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password modificata con successo" WHERE lang LIKE "lng_mk_password_successfully_changed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La data iniziale non è valida!" WHERE lang LIKE "lng_starting_date_invalidly_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il team di" WHERE lang LIKE "lng_team_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Documento ricevuto…" WHERE lang LIKE "lng_message_file_receive_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Upload del documento non riuscito!" WHERE lang LIKE "lng_message_file_upload_failed_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Dichiarazione sulla tutela della privacy" WHERE lang LIKE "lng_menu_left_datenschutzerk" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Data:" WHERE lang LIKE "lng_date_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L'articolo" WHERE lang LIKE "lng_message_article_not_added1_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La data di consegna inserita è già trascorsa!" WHERE lang LIKE "lng_js_past_delivery_date_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il voucher non è valido" WHERE lang LIKE "lng_js_voucher_not_valid" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il codice coupon non è valido o non viene raggiunto il valore minimo d'ordine." WHERE lang LIKE "lng_wk_text_voucher1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il valore di carrello acquisti supera il budget disponibile! Ordine non è possibile. Il budget disponibile:" WHERE lang LIKE "lng_js_budget_exceeded_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il valore della merce senza spese di spedizione ammonta solo a" WHERE lang LIKE "lng_js_minimum_order_value2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Mostra dettagli" WHERE lang LIKE "lng_details_open_shopping_cart_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Dettagli da documento" WHERE lang LIKE "lng_order_details_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il vecchio indirizzo email immesso non corrisponde. Si prega di riprovare." WHERE lang LIKE "lng_mk_old_emailadress_false" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I prezzi indicati s'intendono IVA esclusa." WHERE lang LIKE "lng_without_tax_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I prezzi indicati s'intendono IVA esclusa." WHERE lang LIKE "lng_without_tax_under_resultlist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il documento deve avere l'estensione '.csv' o '.txt'." WHERE lang LIKE "lng_message_file_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I dati inseriti non possono essere individuati in modo univoco. La preghiamo di contattarci!" WHERE lang LIKE "lng_notice_ambiguous_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I dati inseriti non sono registrati da noi. La preghiamo di controllarli e di riprovare!" WHERE lang LIKE "lng_notice_unregistered_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Non sono d'accordo gli indirizzi di posta elettronica appena immessi. Si prega di riprovare." WHERE lang LIKE "lng_mk_emailadress_do_not_match" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Le nuove password immesse non corrispondono. Si prega di riprovare." WHERE lang LIKE "lng_mk_password_do_not_match" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo di posta elettronica ha cambiato con successo" WHERE lang LIKE "lng_mk_emailaddress_successfully_changed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La ripetizione della password non corrisponde." WHERE lang LIKE "lng_reg_false_repeat_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_plus_tax_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_plus_tax_under_resultlist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiare indirizzo di fatturazione: successo" WHERE lang LIKE "lng_their_change_customer_data" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I dati d'accesso non sono validi!" WHERE lang LIKE "lng_entrance_data_invalid_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Questa voce dei costi esiste già!" WHERE lang LIKE "lng_cost_centre_available_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_inclusive_tax_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="i prezzi s'intendono IVA esclusa." WHERE lang LIKE "lng_inclusive_tax_under_resultlist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Questo articolo non può essere aggiunto attraverso il campo di aggiunta rapida" WHERE lang LIKE "lng_articles_not_add" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Stampare" WHERE lang LIKE "lng_print_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Stampa" WHERE lang LIKE "lng_print_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero EAN" WHERE lang LIKE "lng_ean_number_in_resultlist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il contratto si realizza soltanto con la conferma scritta dell'incarico da parte della ditta" WHERE lang LIKE "lng_contract1_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il contratto si realizza soltanto con la conferma scritta dell'incarico da parte della ditta" WHERE lang LIKE "lng_text_wk_end_text_2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Una voce di menu" WHERE lang LIKE "lng_wk_check_before_submitting5" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="E-Mail" WHERE lang LIKE "lng_email_cp_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo e-mail:" WHERE lang LIKE "lng_email_address_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo e-mail:" WHERE lang LIKE "lng_email_address_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="E-Mail:" WHERE lang LIKE "lng_regstart_login_user" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiare indirizzo di posta elettronica" WHERE lang LIKE "lng_mk_change_email_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="L’adresse mail est déjà enregistré.Registrazione non è possibile" WHERE lang LIKE "lng_reg_description4" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ripeti indirizzo email" WHERE lang LIKE "lng_mk_repeat_email_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo e-mail:" WHERE lang LIKE "lng_mail_address_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="A favore di:" WHERE lang LIKE "lng_remittee_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="rimosso" WHERE lang LIKE "lng_position_removed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo unitario" WHERE lang LIKE "lng_column_unit_price_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo unitario" WHERE lang LIKE "lng_unit_price_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo unitario" WHERE lang LIKE "lng_mailgen_bez16" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo unitario" WHERE lang LIKE "lng_unit_price_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="è stato importato con successo" WHERE lang LIKE "lng_message_article_successfully_imports2_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="evaso" WHERE lang LIKE "lng_settled_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Conclusi" WHERE lang LIKE "lng_settled_vouchers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richieste completate" WHERE lang LIKE "lng_finished_offers_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini evasi" WHERE lang LIKE "lng_finished_orders_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini evasi" WHERE lang LIKE "lng_finished_orders_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazioni di magazzino evase" WHERE lang LIKE "lng_finished_stock_items_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Errore nell'invio dell'e-mail." WHERE lang LIKE "lng_notice_problem_mail_order_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Non è stato configurato alcun accesso allo shop per Lei. La preghiamo di rivolgersi al gestore di questo sito!" WHERE lang LIKE "lng_notice_no_shopaccess_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Non risulta alcun indirizzo e-mail per Lei. La preghiamo di rivolgersi al gestore di questo sito!" WHERE lang LIKE "lng_notice_no_mailaddress_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si sono trovati diversi numeri EAN uguali!" WHERE lang LIKE "lng_many_same_ean_numbers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si sono trovati diversi numeri di prod. uguali!" WHERE lang LIKE "lng_many_same_manufacturer_numbers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Per clienti" WHERE lang LIKE "lng_wk_rubric2_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Per clienti nuovi" WHERE lang LIKE "lng_wk_rubric1_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Se disponibile, si prega di inserire il codice coupon: " WHERE lang LIKE "lng_wk_text_voucher2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Fax:" WHERE lang LIKE "lng_fax_cp_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Fax:" WHERE lang LIKE "lng_fax_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Errore - l'articolo è parte di un articolo di configurazione" WHERE lang LIKE "lng_configuration_article" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero di errori:" WHERE lang LIKE "lng_message_error_quantum_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Chiudi finestra" WHERE lang LIKE "lng_window_close_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Chiudi finestra" WHERE lang LIKE "lng_window_close_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ditta:" WHERE lang LIKE "lng_company_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ditta:" WHERE lang LIKE "lng_company_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Abbiamo ricevuto il seguente ordine:" WHERE lang LIKE "lng_mailgen_bez5" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Abbiamo ricevuto la seguente prenotazione:" WHERE lang LIKE "lng_mailgen_bez9" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I seguenti messaggi…" WHERE lang LIKE "lng_message_following_messages_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="accetta come standard i dati cliente modificati" WHERE lang LIKE "lng_chk_standard_customer_data_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="data di nascita non valida" WHERE lang LIKE "lng_reg_birthdate_invalid" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Data di nascita (gg.mm.aaaa):" WHERE lang LIKE "lng_date_of_birth_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Data di nascita:" WHERE lang LIKE "lng_mailgen_bez24" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Data di nascita:" WHERE lang LIKE "lng_birthday_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Data di nascita (gg.mm.aaaa):" WHERE lang LIKE "lng_reg_date_of_birth" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="cancellato" WHERE lang LIKE "lng_deleted_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="e le accetto." WHERE lang LIKE "lng_i_have_agb3_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="mostra indirizzi di consegna salvati" WHERE lang LIKE "lng_stored_ship_to_addresses_show_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="giropay" WHERE lang LIKE "lng_pulldown_zb_computop_giropay" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Totale" WHERE lang LIKE "lng_column_total_price_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Totale" WHERE lang LIKE "lng_total_price_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Totale" WHERE lang LIKE "lng_mailgen_bez18" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Totale" WHERE lang LIKE "lng_total_price_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Riscattare voucher" WHERE lang LIKE "lng_wk_button_voucher1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Salve e buongiorno," WHERE lang LIKE "lng_head_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="ecco i Suoi dati d'accesso al web shop come richiesto." WHERE lang LIKE "lng_requested_access_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Qui, è possibile richiamare la gestione degli utenti. " WHERE lang LIKE "lng_reg_personal_usermanagement" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Qui è possibile modificare i dati dell'utente. " WHERE lang LIKE "lng_reg_change_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Qui è possibile modificare i dati dell'utente." WHERE lang LIKE "lng_alt_change_your_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Qui è possibile modificare i dati del registro di sistema." WHERE lang LIKE "lng_alt_change_your_regdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Qui, è possibile configurare ulteriori utenti. " WHERE lang LIKE "lng_reg_configure_additional_users" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Con la presente ordino i seguenti articoli. " WHERE lang LIKE "lng_mailgen_bez4" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Con la presente, a prenotare il seguente articolo. " WHERE lang LIKE "lng_mailgen_bez8" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Homepage:" WHERE lang LIKE "lng_homepage_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero prod" WHERE lang LIKE "lng_bez_ardetail_bez3" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="IBAN:" WHERE lang LIKE "lng_iban_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ho già un account. " WHERE lang LIKE "lng_regstart_account_available" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ho letto" WHERE lang LIKE "lng_i_have_agb1_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Vorrei ordinare per la prima volta" WHERE lang LIKE "lng_wk_desc_first_to_order_between_site" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Io sono un nuovo cliente e desidera creare un account personale a mio vantaggio per" WHERE lang LIKE "lng_regstart_account_not_exist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La richiesta è vuota al momento. " WHERE lang LIKE "lng_their_offer_empty" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Al momento il Suo carrello è vuoto." WHERE lang LIKE "lng_their_order_empty" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo segno:" WHERE lang LIKE "lng_their_sign_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo simbolo:" WHERE lang LIKE "lng_mailgen_bez20" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo segno:" WHERE lang LIKE "lng_their_indication_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La richiesta corrente." WHERE lang LIKE "lng_their_current_offer" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo ordine attuale:" WHERE lang LIKE "lng_their_current_order" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo ordine attuale:" WHERE lang LIKE "lng_their_current_order_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La Sua prenotazione di magazzino attuale:" WHERE lang LIKE "lng_their_current_stock_item" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La tua richiesta." WHERE lang LIKE "lng_their_offer" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tante grazie per la Sua richiesta!" WHERE lang LIKE "lng_thanks_offer_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La richiesta corrente." WHERE lang LIKE "lng_their_offers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Proprie credenziali." WHERE lang LIKE "lng_your_credentials" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo ordine" WHERE lang LIKE "lng_their_order" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo ordine" WHERE lang LIKE "lng_their_order_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il tuo ordine 3X.Web Shop." WHERE lang LIKE "lng_mailgen_bez30" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Al momento il Suo ordine è vuoto." WHERE lang LIKE "lng_their_order_empty_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo ordine non è accettato. Lei non è registrato. Il nostro shop on-line è disponibile soltanto ai clienti commerciali. La preghiamo di annunciarsi con i Suoi dati d'accesso!  Se non ha i dati d'accesso, la preghiamo di contattarci indicando il numero cliente indicato qui di seguito usando il nostro" WHERE lang LIKE "lng_order_no_login_consumer1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi ordini" WHERE lang LIKE "lng_their_orders" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi ordini" WHERE lang LIKE "lng_their_orders_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Loro dati" WHERE lang LIKE "lng_mk_your_data" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi dati cliente:" WHERE lang LIKE "lng_their_customer_data_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi dati cliente:" WHERE lang LIKE "lng_mailgen_bez27" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi dati cliente:" WHERE lang LIKE "lng_their_customer_data_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente:" WHERE lang LIKE "lng_their_customer_number" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente:" WHERE lang LIKE "lng_their_customer_number_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente:" WHERE lang LIKE "lng_reg_customer_number" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente:" WHERE lang LIKE "lng_their_customer_number_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La Sua prenotazione di magazzino" WHERE lang LIKE "lng_their_stock_item" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Al momento la Sua prenotazione di magazzino è vuota." WHERE lang LIKE "lng_their_stock_item_empty" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Le Sue prenotazioni di magazzino" WHERE lang LIKE "lng_their_stock_items" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I dati utente" WHERE lang LIKE "lng_reg_your_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente temporaneo:" WHERE lang LIKE "lng_their_provisional_customer_number" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo numero cliente temporaneo:" WHERE lang LIKE "lng_temporary_customer_number" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il pagamento a noi" WHERE lang LIKE "lng_titel_payment_postfinance" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il Suo modo di pagamento:" WHERE lang LIKE "lng_your_payment_method_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="I Suoi dati d'accesso sono stati mandati al seguente indirizzo:" WHERE lang LIKE "lng_notice_access_data_send_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="indirizzo e-mail non valido" WHERE lang LIKE "lng_reg_email_invalid_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Import" WHERE lang LIKE "lng_import_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Import" WHERE lang LIKE "lng_import_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Impressum" WHERE lang LIKE "lng_menu_left_impressum" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Disponibile in 24h" WHERE lang LIKE "lng_alternativbestandstextg" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="in elaborazione" WHERE lang LIKE "lng_in_processing_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="nel carrello" WHERE lang LIKE "lng_into_goods_basket_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nel totale non sono contenuti articoli soggetti a richiesta di prezzo" WHERE lang LIKE "lng_nopricerequestitems_documentfoot" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="nella richiesta" WHERE lang LIKE "lng_into_the_offer_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="nell'ordine" WHERE lang LIKE "lng_into_the_order_voucher_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lista d'inventario" WHERE lang LIKE "lng_inventory_list_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lista d'inventario per" WHERE lang LIKE "lng_stocktaking_list_for_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Stock nominale" WHERE lang LIKE "lng_column_actual_result_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="non è presente" WHERE lang LIKE "lng_message_article_missing2_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="non può essere aggiunto con la funzione 'importare'" WHERE lang LIKE "lng_message_article_not_added2_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Catalogo" WHERE lang LIKE "lng_menu_title_katalog" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Acquista" WHERE lang LIKE "lng_order_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente o indirizzo e-mail:" WHERE lang LIKE "lng_menu_right_nolog_kdnr" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_customer_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nessun articolo nel file CSV" WHERE lang LIKE "lng_message_no_articles_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il numero non è univoco - l'articolo è presente in più unità" WHERE lang LIKE "lng_no_clear_number" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="nessun indirizzo di consegna salvato!" WHERE lang LIKE "lng_no_ship_to_address_stored_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Contatto" WHERE lang LIKE "lng_menu_left_kontakt" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="contattare" WHERE lang LIKE "lng_contact_establishment2_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="formulario di contatto." WHERE lang LIKE "lng_order_no_login_consumer2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero di conto:" WHERE lang LIKE "lng_account_number_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Copiare nella richiesta" WHERE lang LIKE "lng_copy_into_offer_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Copia nell'ordine" WHERE lang LIKE "lng_copy_into_order_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Copia nell'ordine" WHERE lang LIKE "lng_copy_into_order_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Copia nella prenotazione di magazzino" WHERE lang LIKE "lng_copy_into_stock_item_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_bez_ardetail_bez11" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_cost_centre_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_change_cost_centres_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_add_new_cost_centres_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_cost_centre_to_open_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_delete_cost_centres_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cerca voce costi" WHERE lang LIKE "lng_cost_centre_search" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_cost_centre_colon_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_cost_centres_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dei costi" WHERE lang LIKE "lng_menu_left_kostenstellen" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Analisi voce dei costi per" WHERE lang LIKE "lng_cost_centre_evaluation_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ricerca voce dei costi" WHERE lang LIKE "lng_cost_centre_search_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Amministrazione voce dei costi per" WHERE lang LIKE "lng_cost_centre_administration_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Istituto di credito:" WHERE lang LIKE "lng_credit_institution_bank_account_cash_up_front" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Carta di credito" WHERE lang LIKE "lng_pulldown_zb_computop_kreditkarte" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Carta di credito" WHERE lang LIKE "lng_pulldown_zb_postfinance_kreditkarte" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Carta di credito" WHERE lang LIKE "lng_pulldown_zb_heidelpay_kreditkarte" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Dati del cliente" WHERE lang LIKE "lng_menu_customer_data" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Login cliente" WHERE lang LIKE "lng_menu_customer_sign_in" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_customer_number_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente o indirizzo e-mail:" WHERE lang LIKE "lng_cn_or_mail_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_mailgen_bez3" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_customer_number_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero cliente:" WHERE lang LIKE "lng_customer_number_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cancella" WHERE lang LIKE "lng_btn_delete_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cancella" WHERE lang LIKE "lng_alt_delete_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Magazzino:" WHERE lang LIKE "lng_stock_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazione di magazzino" WHERE lang LIKE "lng_stock_item" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazione di magazzino" WHERE lang LIKE "lng_stock_item_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazione di magazzino" WHERE lang LIKE "lng_stock_item_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazioni di magazzino" WHERE lang LIKE "lng_stock_items" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Numero prenotazione di  magazzino:" WHERE lang LIKE "lng_stock_item_number_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Paese:" WHERE lang LIKE "lng_country_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Paese:" WHERE lang LIKE "lng_country_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Gestire gli indirizzi di spedizione" WHERE lang LIKE "lng_mk_manage_delivery_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo di consegna:" WHERE lang LIKE "lng_mk_delivery_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Scegliere indirizzo di consegna:" WHERE lang LIKE "lng_ship_to_address_select_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modifica indirizzo di consegna:" WHERE lang LIKE "lng_ship_to_address_work_on_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo di consegna:" WHERE lang LIKE "lng_ship_to_addresses_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo di consegna:" WHERE lang LIKE "lng_mailgen_bez25" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Indirizzo di consegna:" WHERE lang LIKE "lng_ship_to_addresses_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Condizioni di consegna" WHERE lang LIKE "lng_menu_left_lieferbed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="condizioni di consegna:" WHERE lang LIKE "lng_delivery_condition_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Condizioni di consegna:" WHERE lang LIKE "lng_terms_of_delivery_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Bolla di consegna" WHERE lang LIKE "lng_mk_delivery_note" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Login:" WHERE lang LIKE "lng_login_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="evaso manualmente" WHERE lang LIKE "lng_manually_settled_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di quantità" WHERE lang LIKE "lng_column_quantity_unit_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di quantità" WHERE lang LIKE "lng_quantity_unit_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di quantità" WHERE lang LIKE "lng_mailgen_bez14" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di quantità" WHERE lang LIKE "lng_quantity_unit_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il mio conto" WHERE lang LIKE "lng_menu_title_mein_konto" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità" WHERE lang LIKE "lng_column_quantity_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità:" WHERE lang LIKE "lng_column_quantity_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità" WHERE lang LIKE "lng_quantity_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità" WHERE lang LIKE "lng_mailgen_bez13" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità" WHERE lang LIKE "lng_quantity_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità:" WHERE lang LIKE "lng_quantity_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Quantità di input non valido" WHERE lang LIKE "lng_quantity_invalid" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cordiali saluti" WHERE lang LIKE "lng_mailgen_bez26" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cordiali saluti" WHERE lang LIKE "lng_kind_regards_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Contrassegno" WHERE lang LIKE "lng_pulldown_zb_nachnahme" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cognome:" WHERE lang LIKE "lng_surname_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nome:" WHERE lang LIKE "lng_name_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nome:" WHERE lang LIKE "lng_name_logrange" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Importo netto" WHERE lang LIKE "lng_net_amount_voucher_totals" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Somma netta" WHERE lang LIKE "lng_net_sum_voucher_totals" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nuovo" WHERE lang LIKE "lng_new_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nouvi E-Mail" WHERE lang LIKE "lng_mk_new_email_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inserire nuovo indirizzo di consegna:" WHERE lang LIKE "lng_new_ship_to_address_put_on_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inserire nuovo indirizzo di consegna:" WHERE lang LIKE "lng_new_ship_to_address_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="creazione di un nuovo utente" WHERE lang LIKE "lng_mk_create_new_user" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="nuova password" WHERE lang LIKE "lng_mk_new_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Newsletter" WHERE lang LIKE "lng_menu_left_newsletter" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="non disponibile" WHERE lang LIKE "lng_alternativbestandstextr" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modifica dei dati utente" WHERE lang LIKE "lng_change_your_userdata" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="in sospeso" WHERE lang LIKE "lng_open_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="In sospeso" WHERE lang LIKE "lng_open_vouchers" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini in sospeso" WHERE lang LIKE "lng_open_orders_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ordini in sospeso" WHERE lang LIKE "lng_open_orders_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prenotazioni di magazzino in sospeso" WHERE lang LIKE "lng_open_stock_items_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="aprire le richieste" WHERE lang LIKE "lng_city_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richiedi password" WHERE lang LIKE "lng_btn_password_request_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richiedi password" WHERE lang LIKE "lng_password_request_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Conferma password" WHERE lang LIKE "lng_reg_confirm_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password dimenticata?" WHERE lang LIKE "lng_password_forget_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ripeti la password:" WHERE lang LIKE "lng_mk_repeat_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password:" WHERE lang LIKE "lng_reg_password" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password:" WHERE lang LIKE "lng_menu_right_pw" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password:" WHERE lang LIKE "lng_regstart_login_pw" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password:" WHERE lang LIKE "lng_password_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Password:" WHERE lang LIKE "lng_password_loginarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="PayPal" WHERE lang LIKE "lng_pulldown_zb_computop_paypal" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="PayPal" WHERE lang LIKE "lng_pulldown_zb_paypal" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="PayPal" WHERE lang LIKE "lng_pulldown_zb_heidelpay_paypal" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="PayPal" WHERE lang LIKE "lng_pulldown_zb_paypal_api" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di prezzo" WHERE lang LIKE "lng_column_price_unit_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di prezzo" WHERE lang LIKE "lng_price_unit_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di prezzo" WHERE lang LIKE "lng_mailgen_bez15" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Unità di prezzo" WHERE lang LIKE "lng_price_unit_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="NAP luogo:" WHERE lang LIKE "lng_postal_code_city_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="NAP e luogo:" WHERE lang LIKE "lng_postal_code_city_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="NAP:" WHERE lang LIKE "lng_postal_code_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pos" WHERE lang LIKE "lng_column_position_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pos" WHERE lang LIKE "lng_position_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pos" WHERE lang LIKE "lng_mailgen_bez10" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pos." WHERE lang LIKE "lng_position_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="La voce da" WHERE lang LIKE "lng_position_from" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Posizione nella richiesta" WHERE lang LIKE "lng_position_into_offer_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inserisci nell'ordine" WHERE lang LIKE "lng_position_into_order_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inserisci nell'ordine" WHERE lang LIKE "lng_position_into_order_voucher_overview_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Inserisci nella prenotazione di magazzino" WHERE lang LIKE "lng_position_into_stock_item_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cancella posizione" WHERE lang LIKE "lng_position_deletion_list_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Paese della casella postale:" WHERE lang LIKE "lng_postofficeboxcountry_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Luogo della casella postale:" WHERE lang LIKE "lng_postofficeboxcity_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="NAP della casella postale:" WHERE lang LIKE "lng_postofficeboxpostalcode_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Casella postale:" WHERE lang LIKE "lng_postofficebox_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo" WHERE lang LIKE "lng_bez_ardetail_bez9" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Prezzo su richiesta" WHERE lang LIKE "lng_price_on_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Gruppi di prodotti" WHERE lang LIKE "lng_menu_left_produktgruppen" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Si richiede ricevuta di ritorno" WHERE lang LIKE "lng_mailgen_bez6" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Non si richiede ricevuta di ritorno" WHERE lang LIKE "lng_mailgen_bez7" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Fattura" WHERE lang LIKE "lng_pulldown_zb_rechnung" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Fattura" WHERE lang LIKE "lng_mk_account" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Cambiare indirizzo di fatturazione" WHERE lang LIKE "lng_mk_change_billing_address" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Importo della fattura" WHERE lang LIKE "lng_cash_up_front_in_order_complete2" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Registro" WHERE lang LIKE "lng_reg_register" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Registrazione" WHERE lang LIKE "lng_mk_title_registring" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Struttura tabella: numero dell'articolo; quantità;" WHERE lang LIKE "lng_record_structure_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Chiudi" WHERE lang LIKE "lng_btn_close_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Chiudi" WHERE lang LIKE "lng_close_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Stampa pagina" WHERE lang LIKE "lng_btn_print_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pagina generata in" WHERE lang LIKE "lng_side_generates" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="secondi" WHERE lang LIKE "lng_seconds" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Servizio" WHERE lang LIKE "lng_service_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei ha scelto il deposito bancario. La preghiamo di compilare i campi marcati in rosso inserendo i dati bancari completi!" WHERE lang LIKE "lng_js_debit_transfer_fill_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Offerte dell'azienda" WHERE lang LIKE "lng_offers_not_binding1_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Hai cambiato il paese di consegna. Le condizioni di spedizione possibili sono state adattate al paese di consegna." WHERE lang LIKE "lng_js_shipment_method_incorrect_country_wk" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ha dimenticato la Sua password?" WHERE lang LIKE "lng_password_forget_password_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei non ha indicato il Paese nell'indirizzo di consegna!" WHERE lang LIKE "lng_js_no_country_delivery_address_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei non ha scelto il modo di spedizione!" WHERE lang LIKE "lng_js_no_shipment_method_wk" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei non ha indicato il modo di pagamento!" WHERE lang LIKE "lng_js_no_payment_method_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei non ha ancora creato una voce dei costi..." WHERE lang LIKE "lng_no_cost_centres_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei ha scelto il pagamento anticipato." WHERE lang LIKE "lng_cash_up_front_in_order_complete1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richiedi password" WHERE lang LIKE "lng_js_agb_authenticate_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Richiedi password" WHERE lang LIKE "lng_js_no_valid_mail_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Lei non è ancora abilitato all'accesso alle opzioni di servizio!" WHERE lang LIKE "lng_not_activated_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Trasferire immediatamente" WHERE lang LIKE "lng_pulldown_zb_heidelpay_giropay" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ammontare passivo" WHERE lang LIKE "lng_calculated_assets_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Voce dell'ammontare passivo per" WHERE lang LIKE "lng_planned_stocks_for_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Altro:" WHERE lang LIKE "lng_other_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Salva" WHERE lang LIKE "lng_btn_save_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Statistica" WHERE lang LIKE "lng_menu_left_statistik" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Stato" WHERE lang LIKE "lng_status_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Via:" WHERE lang LIKE "lng_road_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Via:" WHERE lang LIKE "lng_road_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Ricerca" WHERE lang LIKE "lng_btn_search_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Somma netta" WHERE lang LIKE "lng_sum_net_voucher_totals" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Fattura parziale" WHERE lang LIKE "lng_mk_partial_invoice" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="parzialmente" WHERE lang LIKE "lng_partly_voucher_overview" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tel.:" WHERE lang LIKE "lng_telephone_cp_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Telefono:" WHERE lang LIKE "lng_telephone_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Telefono:" WHERE lang LIKE "lng_telephone_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Telefono 2:" WHERE lang LIKE "lng_telephone2_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Telefono 3:" WHERE lang LIKE "lng_telephone3_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Il nostro segno:" WHERE lang LIKE "lng_mailgen_bez19" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Varianti" WHERE lang LIKE "lng_column_variants_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Spedizione:" WHERE lang LIKE "lng_shipment_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Informazioni sulla spedizione" WHERE lang LIKE "lng_shipment_info_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Spese di spedizione secondo il valore dell'ordine:" WHERE lang LIKE "lng_shipping_costs_based_order_shipment_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Spese di spedizione:" WHERE lang LIKE "lng_shipping_costs_shipment_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Versione:" WHERE lang LIKE "lng_version" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Amministrazione" WHERE lang LIKE "lng_administration_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="rifiuta" WHERE lang LIKE "lng_button_reject_voucher_range" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tante grazie per il Suo ordine!" WHERE lang LIKE "lng_thanks_order_printarea_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tante grazie per il Suo ordine!" WHERE lang LIKE "lng_mailgen_bez28" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tante grazie per la Sua prenotazione di magazzino!" WHERE lang LIKE "lng_thanks_stock_item_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tante grazie per la registrazione nel nostro shop on-line." WHERE lang LIKE "lng_mailgenregneu_bez1" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="del" WHERE lang LIKE "lng_voucher_of" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="da:" WHERE lang LIKE "lng_from1_shipment_information" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="da 3X-IOS" WHERE lang LIKE "lng_mailgen_bez29" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="da:" WHERE lang LIKE "lng_of_date_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pagamento anticipato" WHERE lang LIKE "lng_pulldown_zb_vorkasse" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Nome:" WHERE lang LIKE "lng_first_name_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="scegli" WHERE lang LIKE "lng_pulldown_default" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Carrello" WHERE lang LIKE "lng_menu_title_wk" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Carrello" WHERE lang LIKE "lng_goods_basket_in_resultlist" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Web:" WHERE lang LIKE "lng_web_cp_printarea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="avanti" WHERE lang LIKE "lng_button_further_voucher_range" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="avanti" WHERE lang LIKE "lng_continue_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="avanti" WHERE lang LIKE "lng_continue_voucher_finish_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="continua lo shopping" WHERE lang LIKE "lng_go_on_shopping" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Se si desidera utilizzare il blocco note devi accedere o registrarti" WHERE lang LIKE "lng_mk_slogan_registring" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Valore" WHERE lang LIKE "lng_value_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Condizioni di revoca" WHERE lang LIKE "lng_menu_left_widerrufsbel" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="è stato spedito!" WHERE lang LIKE "lng_sent_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="è stato aggiunto" WHERE lang LIKE "lng_article_added_subset" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="è stato svuotato!" WHERE lang LIKE "lng_removed_voucher" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Pagamento con" WHERE lang LIKE "lng_payment_with_payment" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tipi di pagamento" WHERE lang LIKE "lng_description_pulldown_zb" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Condizioni di pagamento" WHERE lang LIKE "lng_menu_left_zahlungsbed" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Modo di pagamento:" WHERE lang LIKE "lng_mailgen_bez21" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Documento csv o txt da importare:" WHERE lang LIKE "lng_file_article_import" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Dati d'accesso per il shop online" WHERE lang LIKE "lng_subject_mail_pw_request" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="il gestore IOS!" WHERE lang LIKE "lng_contact_establishment3_servicearea" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="indietro" WHERE lang LIKE "lng_back_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="indietro" WHERE lang LIKE "lng_back_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="indietro" WHERE lang LIKE "lng_back_article_detail" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna al carrello" WHERE lang LIKE "lng_btn_back_to_shopping_cart_payment" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna a richiesta" WHERE lang LIKE "lng_btn_back_offer" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna all'ordine" WHERE lang LIKE "lng_btn_back_order" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna all'ordine" WHERE lang LIKE "lng_btn_back_order_sap" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Tornare alla gestione degli Account" WHERE lang LIKE "lng_mk_return_to_account_management" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna alla prenotazione di magazzino" WHERE lang LIKE "lng_btn_back_stock_item" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Torna alla lista" WHERE lang LIKE "lng_reg_back_to_list" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Descrizione aggiuntiva" WHERE lang LIKE "lng_addition_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Aggiunta" WHERE lang LIKE "lng_company_additive_ship_to_addresses" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Aggiunta 2:" WHERE lang LIKE "lng_addition2_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="Aggiunta 3:" WHERE lang LIKE "lng_addition3_voucher_finish" AND IT LIKE de;
UPDATE 3xios_output_langtable SET IT="più spese di spedizione" WHERE lang LIKE "lng_delivery_cond_behind_taxinfo" AND IT LIKE de;

UPDATE 3xios_output_langtable SET F="Changement" WHERE lang LIKE "lng_btn_change_voucherarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changement" WHERE lang LIKE "lng_btn_change_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changement" WHERE lang LIKE "lng_alt_change_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changement enregistré" WHERE lang LIKE "lng_reg_is_changed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="En cliquant sur modifier" WHERE lang LIKE "lng_wk_check_before_submitting2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="à partir de" WHERE lang LIKE "lng_from2_shipment_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="terminé" WHERE lang LIKE "lng_voucher_finally_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="toutes les" WHERE lang LIKE "lng_voucher_finish_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Administration" WHERE lang LIKE "lng_admin" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adopter l'adresse" WHERE lang LIKE "lng_address_take_over_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Modifier l'adresse" WHERE lang LIKE "lng_address_work_on_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Effacer l'adresse" WHERE lang LIKE "lng_address_delete_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="les conditions générales" WHERE lang LIKE "lng_i_have_agb2_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="les conditions générales" WHERE lang LIKE "lng_menu_left_agb" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="les conditions générales" WHERE lang LIKE "lng_all_vouchers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="toutes les demandes" WHERE lang LIKE "lng_all_offers_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Tous les ordres" WHERE lang LIKE "lng_all_orders_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Tous les ordres" WHERE lang LIKE "lng_all_orders_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Toutes les réservations de stock" WHERE lang LIKE "lng_all_stock_item_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mémoriser comme adresse de livraison" WHERE lang LIKE "lng_store_as_ship_to_address_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'ordre précédent" WHERE lang LIKE "lng_old_voucher_number_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ancienne adresse de courriel" WHERE lang LIKE "lng_mk_old_email_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vecchia password" WHERE lang LIKE "lng_mk_old_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Offres" WHERE lang LIKE "lng_offer_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Offres" WHERE lang LIKE "lng_offer" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Offres" WHERE lang LIKE "lng_offer_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Enquête no" WHERE lang LIKE "lng_offer_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Demandes" WHERE lang LIKE "lng_offers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Offre:" WHERE lang LIKE "lng_mk_offer" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Crée le" WHERE lang LIKE "lng_to_set_up_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Login" WHERE lang LIKE "lng_button_wk_login_logrange_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Login" WHERE lang LIKE "lng_announce_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="M / Mme" WHERE lang LIKE "lng_title_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="M / Mme" WHERE lang LIKE "lng_title_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Contact:" WHERE lang LIKE "lng_contact_person_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Appliquer" WHERE lang LIKE "lng_use_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nombre de positions" WHERE lang LIKE "lng_count_positions_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adopter" WHERE lang LIKE "lng_alt_take_over_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_column_art_com_ean_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_article_subset" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_article_number_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_message_article_missing1_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_message_article_successfully_imports1_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_column_article_number_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article n'est pas disponible" WHERE lang LIKE "lng_article_is_missing" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mouvement de l'article" WHERE lang LIKE "lng_article_movement_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mouvement d'articles pour" WHERE lang LIKE "lng_article_transactions_for_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="No. de l'art." WHERE lang LIKE "lng_article_number_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="No. de l'art." WHERE lang LIKE "lng_mailgen_bez11" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="No. de l'art." WHERE lang LIKE "lng_article_number_list_in_description" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_bez_ardetail_bez1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'article" WHERE lang LIKE "lng_article_number_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Modifier données article" WHERE lang LIKE "lng_article_values_changing_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordonnance" WHERE lang LIKE "lng_mk_order" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Analyse" WHERE lang LIKE "lng_alt_analysis_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Analyse" WHERE lang LIKE "lng_analysis_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prélèvement automatique" WHERE lang LIKE "lng_pulldown_zb_bankeinzug" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Modifié le" WHERE lang LIKE "lng_worked_on_to_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Terminer" WHERE lang LIKE "lng_btn_exit_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="partiellement livrable" WHERE lang LIKE "lng_alternativbestandstexty" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Il y a eu un problème avec le paiement. Veuillez essayer encore une fois ou choisissez un autre mode de paiement." WHERE lang LIKE "lng_js_payment_error_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Documents" WHERE lang LIKE "lng_mk_your_vouchers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'ordre:" WHERE lang LIKE "lng_voucher_number_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'ordre:" WHERE lang LIKE "lng_mailgen_bez2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Rabais sur l'ordre" WHERE lang LIKE "lng_voucher_discount" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Rabais sur l'ordre" WHERE lang LIKE "lng_voucher_discount_voucher_totals" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Observations:" WHERE lang LIKE "lng_comments_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Observations:" WHERE lang LIKE "lng_mailgen_bez22" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Observations:" WHERE lang LIKE "lng_remarks_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changer d’utilisateur:" WHERE lang LIKE "lng_mk_change_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Créer utilisateur / modifier" WHERE lang LIKE "lng_mk_create_change_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Utilisateur supprimé" WHERE lang LIKE "lng_reg_deleted_user" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Gérer les utilisateurs" WHERE lang LIKE "lng_mk_manage_users" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nom d’utilisateur est déjà inscrit. Inscription n’est pas possible !" WHERE lang LIKE "lng_reg_description3" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nom d’utilisateur:" WHERE lang LIKE "lng_reg_username" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Gestion des utilisateurs" WHERE lang LIKE "lng_reg_usermanagement" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_description_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Caractéristiques" WHERE lang LIKE "lng_description_colon_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Confirmation" WHERE lang LIKE "lng_menu_customer_verification" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fonds" WHERE lang LIKE "lng_bez_ardetail_bez13" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fonds" WHERE lang LIKE "lng_stock_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fonds" WHERE lang LIKE "lng_column_inventory_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'ordre" WHERE lang LIKE "lng_order_number_printarea_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de l'ordre" WHERE lang LIKE "lng_order_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order_printarea_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre" WHERE lang LIKE "lng_order_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre terminé" WHERE lang LIKE "lng_text_wk_end" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Continuer l'ordre" WHERE lang LIKE "lng_button_wk_further_voucher_range_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Continuer l'ordre" WHERE lang LIKE "lng_wk_sitetitle_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre:" WHERE lang LIKE "lng_orders" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordre:" WHERE lang LIKE "lng_orders_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordres" WHERE lang LIKE "lng_mk_your_orders" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mouvements" WHERE lang LIKE "lng_column_movements_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Payer" WHERE lang LIKE "lng_btn_to_pay_up_payment" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Commencer paiement" WHERE lang LIKE "lng_payment_to_start_payment" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_column_designation_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_designation_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_mailgen_bez12" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_designation_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_notation_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_column_article_description_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description" WHERE lang LIKE "lng_notation_colon_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="BIC/SWIFT:" WHERE lang LIKE "lng_bic_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="à" WHERE lang LIKE "lng_to_shipment_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="à:" WHERE lang LIKE "lng_to_date_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pas d'ordres présents" WHERE lang LIKE "lng_no_vouchers_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client précédent" WHERE lang LIKE "lng_mailgen_bez23" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client précédent" WHERE lang LIKE "lng_past_customer_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client précédent" WHERE lang LIKE "lng_past_customer_number_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez vérifier vos donnés! Les champs marqués avec * doivent être remplis correctement!" WHERE lang LIKE "lng_js_check_inputs_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez vérifier avant de soumettre la commande une fois de plus vos informations." WHERE lang LIKE "lng_wk_check_before_submitting1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez vérifier la valeur minimale de l'ordre." WHERE lang LIKE "lng_js_minimum_order_value1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez indiquer ici le numéro client enregistré chez nous ou votre adresse e-mail; nous vous enverrons par courriel votre mot de passe." WHERE lang LIKE "lng_input_cn_or_mail_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez entrer vos données personnelles" WHERE lang LIKE "lng_reg_insert_your_personal_data" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez" WHERE lang LIKE "lng_contact_establishment1_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez sélectionner" WHERE lang LIKE "lng_please_select" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Veuillez sélectionner" WHERE lang LIKE "lng_regstart_please_select" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="CB" WHERE lang LIKE "lng_bank_code_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Montant lourd" WHERE lang LIKE "lng_gross_amount_voucher_totals" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="réserver" WHERE lang LIKE "lng_into_the_stock_item_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Réserver" WHERE lang LIKE "lng_booking_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L’ancien mot de passe entré ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_mk_old_password_false" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La date finale n'est pas valable!" WHERE lang LIKE "lng_final_date_invalidly_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le champ" WHERE lang LIKE "lng_reg_description1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La date de livraison a un format erroné ou n'est pas valable. Veuillez utiliser le format JJ.MM.AAAA" WHERE lang LIKE "lng_js_format_delivery_date_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe modifié avec succès" WHERE lang LIKE "lng_mk_password_successfully_changed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La date initiale n'est pas valable!" WHERE lang LIKE "lng_starting_date_invalidly_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'équipe de" WHERE lang LIKE "lng_team_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Document reçu…" WHERE lang LIKE "lng_message_file_receive_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le téléchargement du document n'a pas réussi!" WHERE lang LIKE "lng_message_file_upload_failed_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Déclaration de protection des données" WHERE lang LIKE "lng_menu_left_datenschutzerk" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Date:" WHERE lang LIKE "lng_date_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'article" WHERE lang LIKE "lng_message_article_not_added1_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La date de livraison se trouve dans le passé!" WHERE lang LIKE "lng_js_past_delivery_date_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le bon n’est pas valide" WHERE lang LIKE "lng_js_voucher_not_valid" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le code promo n’est pas valide ou la valeur minimum de commande n’est pas atteint." WHERE lang LIKE "lng_wk_text_voucher1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La valeur de panier shopping dépasse le budget disponible ! Ordre n’est pas possible. Votre budget disponible :" WHERE lang LIKE "lng_js_budget_exceeded_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La valeur de la marchandise sans frais d'envoi est seulement de" WHERE lang LIKE "lng_js_minimum_order_value2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Montrer détails" WHERE lang LIKE "lng_details_open_shopping_cart_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Détails du document" WHERE lang LIKE "lng_order_details_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L’ancienne adresse de courriel entrée ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_mk_old_emailadress_false" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix indiqués s'entendent TVA exclue." WHERE lang LIKE "lng_without_tax_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix indiqués s'entendent TVA exclue." WHERE lang LIKE "lng_without_tax_under_resultlist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le document doit avoir l'extension '.csv' ou '.txt'." WHERE lang LIKE "lng_message_file_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les données insérées ne sont pas univoques. Veuillez nous contacter!" WHERE lang LIKE "lng_notice_ambiguous_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les données insérées ne sont pas enregistrées chez nous. Veuillez les contrôler et réinsérer!" WHERE lang LIKE "lng_notice_unregistered_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ne partage pas les adresses E-Mail nouvellement entrés. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_mk_emailadress_do_not_match" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le nouveau mot de passe entré ne correspond pas. S’il vous plaît essayer de nouveau." WHERE lang LIKE "lng_mk_password_do_not_match" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse de messagerie a changé avec succès" WHERE lang LIKE "lng_mk_emailaddress_successfully_changed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La répétition du mot de passe ne correspond pas." WHERE lang LIKE "lng_reg_false_repeat_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_plus_tax_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_plus_tax_under_resultlist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changer l’adresse de facturation: réussie" WHERE lang LIKE "lng_their_change_customer_data" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les données d'accès ne sont pas valables!" WHERE lang LIKE "lng_entrance_data_invalid_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ce poste des coûts existe déjà!" WHERE lang LIKE "lng_cost_centre_available_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_inclusive_tax_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les prix s'entendent TVA exclue" WHERE lang LIKE "lng_inclusive_tax_under_resultlist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Cet article ne peut pas être ajouté à travers le champ d'insertion rapide" WHERE lang LIKE "lng_articles_not_add" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Imprimer" WHERE lang LIKE "lng_print_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Imprimer" WHERE lang LIKE "lng_print_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro EAN" WHERE lang LIKE "lng_ean_number_in_resultlist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le contrat ne vaut qu'avec la confirmation écrite de l'ordre de la part de l'entreprise" WHERE lang LIKE "lng_contract1_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le contrat ne vaut qu'avec la confirmation écrite de l'ordre de la part de l'entreprise" WHERE lang LIKE "lng_text_wk_end_text_2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Un élément de menu" WHERE lang LIKE "lng_wk_check_before_submitting5" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="E-Mail:" WHERE lang LIKE "lng_email_cp_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse e-mail" WHERE lang LIKE "lng_email_address_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse e-mail:" WHERE lang LIKE "lng_email_address_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="E-Mail:" WHERE lang LIKE "lng_regstart_login_user" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changer l’adresse E-Mail" WHERE lang LIKE "lng_mk_change_email_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'indirizzo email inserito è già registrato. Enregistrement impossible" WHERE lang LIKE "lng_reg_description4" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Répétez l’adresse email" WHERE lang LIKE "lng_mk_repeat_email_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse e-mail" WHERE lang LIKE "lng_mail_address_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="En faveur de:" WHERE lang LIKE "lng_remittee_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="éliminé" WHERE lang LIKE "lng_position_removed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix unitaire" WHERE lang LIKE "lng_column_unit_price_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix unitaire" WHERE lang LIKE "lng_unit_price_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix unitaire" WHERE lang LIKE "lng_mailgen_bez16" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix unitaire" WHERE lang LIKE "lng_unit_price_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="a été importé avec succès" WHERE lang LIKE "lng_message_article_successfully_imports2_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="accompli" WHERE lang LIKE "lng_settled_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Accomplis" WHERE lang LIKE "lng_settled_vouchers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Demandes terminées" WHERE lang LIKE "lng_finished_offers_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordres accomplis" WHERE lang LIKE "lng_finished_orders_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordres accomplis" WHERE lang LIKE "lng_finished_orders_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F=" Réservations de stock accomplies" WHERE lang LIKE "lng_finished_stock_items_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Il y a eu un problème avec l'envoi de l'e-mail." WHERE lang LIKE "lng_notice_problem_mail_order_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Aucun accès au shop n'a été configuré pour vous. Veuillez vous adresser au gérant de cette page web!" WHERE lang LIKE "lng_notice_no_shopaccess_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Il n'y a aucune adresse e-mail pour vous. Veuillez vous adresser au gérant de cette page web!" WHERE lang LIKE "lng_notice_no_mailaddress_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Il y a plusieurs numéros EAN identiques!" WHERE lang LIKE "lng_many_same_ean_numbers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Il y a plusieurs numéros de prod. identiques!" WHERE lang LIKE "lng_many_same_manufacturer_numbers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pour clients" WHERE lang LIKE "lng_wk_rubric2_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pour clients nouveaux" WHERE lang LIKE "lng_wk_rubric1_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le cas échéant, veuillez entrer le code coupon : " WHERE lang LIKE "lng_wk_text_voucher2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fax:" WHERE lang LIKE "lng_fax_cp_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fax:" WHERE lang LIKE "lng_fax_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Erreur - l'article est partie d'un article de configuration" WHERE lang LIKE "lng_configuration_article" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nombre d'erreurs:" WHERE lang LIKE "lng_message_error_quantum_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fermer fenêtre" WHERE lang LIKE "lng_window_close_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fermer fenêtre" WHERE lang LIKE "lng_window_close_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Entreprise" WHERE lang LIKE "lng_company_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Entreprise:" WHERE lang LIKE "lng_company_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nous avons reçu l'ordre suivant:" WHERE lang LIKE "lng_mailgen_bez5" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nous avons reçu la réservation suivante:" WHERE lang LIKE "lng_mailgen_bez9" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Les messages suivants…" WHERE lang LIKE "lng_message_following_messages_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="accepter comme standard les données client modifiées" WHERE lang LIKE "lng_chk_standard_customer_data_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La date de naissance n'est pas correcte" WHERE lang LIKE "lng_reg_birthdate_invalid" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Date de naissance (jj.mm.aaaa):" WHERE lang LIKE "lng_date_of_birth_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Date de naissance:" WHERE lang LIKE "lng_mailgen_bez24" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Date de naissance:" WHERE lang LIKE "lng_birthday_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Date de naissance (jj.mm.aaaa):" WHERE lang LIKE "lng_reg_date_of_birth" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="effacé" WHERE lang LIKE "lng_deleted_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="et je les accepte." WHERE lang LIKE "lng_i_have_agb3_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="montre adresses de livraison mémorisées" WHERE lang LIKE "lng_stored_ship_to_addresses_show_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="giropay" WHERE lang LIKE "lng_pulldown_zb_computop_giropay" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Total" WHERE lang LIKE "lng_column_total_price_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Total" WHERE lang LIKE "lng_total_price_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Total" WHERE lang LIKE "lng_mailgen_bez18" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Total" WHERE lang LIKE "lng_total_price_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Utiliser chèque-cadeau" WHERE lang LIKE "lng_wk_button_voucher1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Bonjour et bienvenue" WHERE lang LIKE "lng_head_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="voici les données d'accès requises pour le shop online" WHERE lang LIKE "lng_requested_access_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ici, vous pouvez appeler la gestion des utilisateurs. " WHERE lang LIKE "lng_reg_personal_usermanagement" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ici, vous pouvez modifier les données de l’utilisateur. " WHERE lang LIKE "lng_reg_change_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ici, vous pouvez modifier les données de l’utilisateur." WHERE lang LIKE "lng_alt_change_your_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ici, vous pouvez modifier les données dans le registre." WHERE lang LIKE "lng_alt_change_your_regdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ici, vous pouvez configurer des utilisateurs supplémentaires. " WHERE lang LIKE "lng_reg_configure_additional_users" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="J’ordonne les articles suivants. " WHERE lang LIKE "lng_mailgen_bez4" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Par la présente, je réserve l’article suivant. " WHERE lang LIKE "lng_mailgen_bez8" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Homepage:" WHERE lang LIKE "lng_homepage_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro prod." WHERE lang LIKE "lng_bez_ardetail_bez3" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="IBAN:" WHERE lang LIKE "lng_iban_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="J’ai déjà un compte. " WHERE lang LIKE "lng_regstart_account_available" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="J'ai lu" WHERE lang LIKE "lng_i_have_agb1_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Je voudrais passer un premier ordre" WHERE lang LIKE "lng_wk_desc_first_to_order_between_site" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Je suis un nouveau client et souhaitez créer un compte personnel à mon avantage pour" WHERE lang LIKE "lng_regstart_account_not_exist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre demande est vide pour le moment. " WHERE lang LIKE "lng_their_offer_empty" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Actuellement votre panier est vide." WHERE lang LIKE "lng_their_order_empty" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre signe:" WHERE lang LIKE "lng_their_sign_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre signe:" WHERE lang LIKE "lng_mailgen_bez20" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre signe:" WHERE lang LIKE "lng_their_indication_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre demande en cours." WHERE lang LIKE "lng_their_current_offer" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre ordre actuel" WHERE lang LIKE "lng_their_current_order" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre ordre actuel" WHERE lang LIKE "lng_their_current_order_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre réservation de stock actuelle:" WHERE lang LIKE "lng_their_current_stock_item" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre demande." WHERE lang LIKE "lng_their_offer" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Merci de votre requête!" WHERE lang LIKE "lng_thanks_offer_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre demande en cours." WHERE lang LIKE "lng_their_offers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Leurs lettres de créance." WHERE lang LIKE "lng_your_credentials" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre ordre" WHERE lang LIKE "lng_their_order" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre ordre" WHERE lang LIKE "lng_their_order_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre commande sur 3X.Webshop" WHERE lang LIKE "lng_mailgen_bez30" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Actuellement votre ordre est vide." WHERE lang LIKE "lng_their_order_empty_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre ordre n'a pas été accepté. Vous n'êtes pas enregistré. Notre shop-online n'est disponible qu'aux clients commerciaux. Veuillez vous annoncer avec vos données d'accès! Si vous n'avez pas encore de données d'accès, veuillez nous contacter en indiquant le numéro client à travers notre" WHERE lang LIKE "lng_order_no_login_consumer1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos ordres" WHERE lang LIKE "lng_their_orders" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos ordres" WHERE lang LIKE "lng_their_orders_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Leurs données" WHERE lang LIKE "lng_mk_your_data" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos données client:" WHERE lang LIKE "lng_their_customer_data_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos données client:" WHERE lang LIKE "lng_mailgen_bez27" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos données client:" WHERE lang LIKE "lng_their_customer_data_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client:" WHERE lang LIKE "lng_their_customer_number" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client:" WHERE lang LIKE "lng_their_customer_number_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client:" WHERE lang LIKE "lng_reg_customer_number" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client:" WHERE lang LIKE "lng_their_customer_number_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre réservation de stock" WHERE lang LIKE "lng_their_stock_item" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Actuellement votre  réservation de stock est vide." WHERE lang LIKE "lng_their_stock_item_empty" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos réservations de stock" WHERE lang LIKE "lng_their_stock_items" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos données d’utilisateur" WHERE lang LIKE "lng_reg_your_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client temporaire:" WHERE lang LIKE "lng_their_provisional_customer_number" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre numéro client temporaire:" WHERE lang LIKE "lng_temporary_customer_number" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre paiement nous" WHERE lang LIKE "lng_titel_payment_postfinance" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Votre mode de paiement" WHERE lang LIKE "lng_your_payment_method_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vos données d'accès ont été envoyées à l'adresse suivante:" WHERE lang LIKE "lng_notice_access_data_send_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="L'adresse n'est pas correcte" WHERE lang LIKE "lng_reg_email_invalid_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Import" WHERE lang LIKE "lng_import_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Import" WHERE lang LIKE "lng_import_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Impressum" WHERE lang LIKE "lng_menu_left_impressum" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Disponible en 24 h" WHERE lang LIKE "lng_alternativbestandstextg" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="en élaboration" WHERE lang LIKE "lng_in_processing_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="dans le panier" WHERE lang LIKE "lng_into_goods_basket_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le total ne contient pas les articles sujets à demande du prix" WHERE lang LIKE "lng_nopricerequestitems_documentfoot" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="dans la requête" WHERE lang LIKE "lng_into_the_offer_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="dans l’ordre" WHERE lang LIKE "lng_into_the_order_voucher_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Liste d'inventaire" WHERE lang LIKE "lng_inventory_list_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Liste d'inventaire pour" WHERE lang LIKE "lng_stocktaking_list_for_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Stock nominal" WHERE lang LIKE "lng_column_actual_result_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="n'est pas présent" WHERE lang LIKE "lng_message_article_missing2_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="ne peut pas être ajouté avec la fonction 'importer'" WHERE lang LIKE "lng_message_article_not_added2_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Catalogue" WHERE lang LIKE "lng_menu_title_katalog" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Acheter" WHERE lang LIKE "lng_order_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client ou adresse e-mail:" WHERE lang LIKE "lng_menu_right_nolog_kdnr" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client:" WHERE lang LIKE "lng_customer_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pas d'articles dans  le fichier CSV" WHERE lang LIKE "lng_message_no_articles_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Le numéro n'est pas univoque - l'article est présent en plusieurs unités" WHERE lang LIKE "lng_no_clear_number" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="pas d'adresse dans la mémoire!" WHERE lang LIKE "lng_no_ship_to_address_stored_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Contact" WHERE lang LIKE "lng_menu_left_kontakt" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="contacter" WHERE lang LIKE "lng_contact_establishment2_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="formulaire de contact" WHERE lang LIKE "lng_order_no_login_consumer2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro du compte:" WHERE lang LIKE "lng_account_number_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Copie de la demande" WHERE lang LIKE "lng_copy_into_offer_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Copie dans l'ordre" WHERE lang LIKE "lng_copy_into_order_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Copie dans l'ordre" WHERE lang LIKE "lng_copy_into_order_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Copie dans réservation de stock" WHERE lang LIKE "lng_copy_into_stock_item_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_bez_ardetail_bez11" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_cost_centre_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_change_cost_centres_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_add_new_cost_centres_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_cost_centre_to_open_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_delete_cost_centres_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Cherche poste des coûts" WHERE lang LIKE "lng_cost_centre_search" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_cost_centre_colon_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_cost_centres_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste des coûts" WHERE lang LIKE "lng_menu_left_kostenstellen" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Analyse des postes des coûts pour" WHERE lang LIKE "lng_cost_centre_evaluation_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Recherche  poste des coûts" WHERE lang LIKE "lng_cost_centre_search_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Administration poste des coûts pour" WHERE lang LIKE "lng_cost_centre_administration_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Institut de crédit" WHERE lang LIKE "lng_credit_institution_bank_account_cash_up_front" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Carte de crédit" WHERE lang LIKE "lng_pulldown_zb_computop_kreditkarte" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Carte de crédit" WHERE lang LIKE "lng_pulldown_zb_postfinance_kreditkarte" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Carte de crédit" WHERE lang LIKE "lng_pulldown_zb_heidelpay_kreditkarte" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Données sur les clients" WHERE lang LIKE "lng_menu_customer_data" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Connexion client" WHERE lang LIKE "lng_menu_customer_sign_in" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client:" WHERE lang LIKE "lng_customer_number_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client ou adresse e-mail:" WHERE lang LIKE "lng_cn_or_mail_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client:" WHERE lang LIKE "lng_mailgen_bez3" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client:" WHERE lang LIKE "lng_customer_number_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro client:" WHERE lang LIKE "lng_customer_number_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Effacer" WHERE lang LIKE "lng_btn_delete_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Effacer" WHERE lang LIKE "lng_alt_delete_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Stock" WHERE lang LIKE "lng_stock_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Réservation de stock" WHERE lang LIKE "lng_stock_item" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Réservation de stock" WHERE lang LIKE "lng_stock_item_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Réservation de stock" WHERE lang LIKE "lng_stock_item_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Réservations de stock" WHERE lang LIKE "lng_stock_items" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro réservation de stock" WHERE lang LIKE "lng_stock_item_number_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pays:" WHERE lang LIKE "lng_country_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pays." WHERE lang LIKE "lng_country_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Gérer les adresses de livraison" WHERE lang LIKE "lng_mk_manage_delivery_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse de livraison:" WHERE lang LIKE "lng_mk_delivery_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Choisir adresse de livraison" WHERE lang LIKE "lng_ship_to_address_select_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Modifier adresse de livraison:" WHERE lang LIKE "lng_ship_to_address_work_on_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse de livraison:" WHERE lang LIKE "lng_ship_to_addresses_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse de livraison:" WHERE lang LIKE "lng_mailgen_bez25" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Adresse de livraison:" WHERE lang LIKE "lng_ship_to_addresses_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Conditions de livraison:" WHERE lang LIKE "lng_menu_left_lieferbed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="conditions de livraison:" WHERE lang LIKE "lng_delivery_condition_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Conditions de livraison:" WHERE lang LIKE "lng_terms_of_delivery_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Bordereau de livraison" WHERE lang LIKE "lng_mk_delivery_note" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Login:" WHERE lang LIKE "lng_login_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="accompli manuellement" WHERE lang LIKE "lng_manually_settled_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de quantité" WHERE lang LIKE "lng_column_quantity_unit_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de quantité" WHERE lang LIKE "lng_quantity_unit_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de quantité" WHERE lang LIKE "lng_mailgen_bez14" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de quantité" WHERE lang LIKE "lng_quantity_unit_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mon compte" WHERE lang LIKE "lng_menu_title_mein_konto" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_column_quantity_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_column_quantity_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_quantity_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_mailgen_bez13" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_quantity_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantité" WHERE lang LIKE "lng_quantity_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Quantités d’entrée non valide" WHERE lang LIKE "lng_quantity_invalid" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Meilleures salutations" WHERE lang LIKE "lng_mailgen_bez26" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Meilleures salutations" WHERE lang LIKE "lng_kind_regards_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="A la livraison" WHERE lang LIKE "lng_pulldown_zb_nachnahme" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nom de famille" WHERE lang LIKE "lng_surname_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nom:" WHERE lang LIKE "lng_name_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nom:" WHERE lang LIKE "lng_name_logrange" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Montant net" WHERE lang LIKE "lng_net_amount_voucher_totals" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Somme nette" WHERE lang LIKE "lng_net_sum_voucher_totals" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nouveau" WHERE lang LIKE "lng_new_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Nouvel E-Mail" WHERE lang LIKE "lng_mk_new_email_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Insérer nouvelle adresse de livraison:" WHERE lang LIKE "lng_new_ship_to_address_put_on_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Insérer nouvelle adresse de livraison:" WHERE lang LIKE "lng_new_ship_to_address_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="création d’un nouvel utilisateur" WHERE lang LIKE "lng_mk_create_new_user" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="nouveau mot de passe" WHERE lang LIKE "lng_mk_new_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Newsletter" WHERE lang LIKE "lng_menu_left_newsletter" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="non livrable" WHERE lang LIKE "lng_alternativbestandstextr" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changer les données de l’utilisateur" WHERE lang LIKE "lng_change_your_userdata" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="en attente" WHERE lang LIKE "lng_open_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="En attente" WHERE lang LIKE "lng_open_vouchers" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordres en attente" WHERE lang LIKE "lng_open_orders_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Ordres en attente" WHERE lang LIKE "lng_open_orders_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F=" Réservations de stock en attente" WHERE lang LIKE "lng_open_stock_items_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="ouvrir des requêtes" WHERE lang LIKE "lng_city_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Requête mot de passe" WHERE lang LIKE "lng_btn_password_request_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Requête mot de passe" WHERE lang LIKE "lng_password_request_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Confirmer mot de passe" WHERE lang LIKE "lng_reg_confirm_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe oublié?" WHERE lang LIKE "lng_password_forget_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Répétez mot de passe:" WHERE lang LIKE "lng_mk_repeat_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_reg_password" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_menu_right_pw" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_regstart_login_pw" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_password_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mot de passe:" WHERE lang LIKE "lng_password_loginarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="PayPal" WHERE lang LIKE "lng_pulldown_zb_computop_paypal" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="PayPal" WHERE lang LIKE "lng_pulldown_zb_paypal" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="PayPal" WHERE lang LIKE "lng_pulldown_zb_heidelpay_paypal" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="PayPal" WHERE lang LIKE "lng_pulldown_zb_paypal_api" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de prix" WHERE lang LIKE "lng_column_price_unit_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de prix" WHERE lang LIKE "lng_price_unit_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de prix" WHERE lang LIKE "lng_mailgen_bez15" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Unité de prix" WHERE lang LIKE "lng_price_unit_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="NP Lieu:" WHERE lang LIKE "lng_postal_code_city_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="NP Lieu:" WHERE lang LIKE "lng_postal_code_city_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="NP" WHERE lang LIKE "lng_postal_code_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pos" WHERE lang LIKE "lng_column_position_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pos." WHERE lang LIKE "lng_position_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pos" WHERE lang LIKE "lng_mailgen_bez10" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pos." WHERE lang LIKE "lng_position_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="La position de" WHERE lang LIKE "lng_position_from" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Position dans la demande" WHERE lang LIKE "lng_position_into_offer_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Insérer dans ordre" WHERE lang LIKE "lng_position_into_order_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Insérer dans l'ordre" WHERE lang LIKE "lng_position_into_order_voucher_overview_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Insérer dans réservation de stock" WHERE lang LIKE "lng_position_into_stock_item_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Effacer position" WHERE lang LIKE "lng_position_deletion_list_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Pays de la case postale:" WHERE lang LIKE "lng_postofficeboxcountry_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Lieu de la case postale:" WHERE lang LIKE "lng_postofficeboxcity_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="NP de la case postale:" WHERE lang LIKE "lng_postofficeboxpostalcode_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Case postale:" WHERE lang LIKE "lng_postofficebox_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix" WHERE lang LIKE "lng_bez_ardetail_bez9" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prix sur demande" WHERE lang LIKE "lng_price_on_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Groupes de produits" WHERE lang LIKE "lng_menu_left_produktgruppen" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Accusé de réception requis" WHERE lang LIKE "lng_mailgen_bez6" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Accusé de réception non requis" WHERE lang LIKE "lng_mailgen_bez7" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Facture" WHERE lang LIKE "lng_pulldown_zb_rechnung" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Facture" WHERE lang LIKE "lng_mk_account" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Changer l’adresse de facturation" WHERE lang LIKE "lng_mk_change_billing_address" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Montant de la facture" WHERE lang LIKE "lng_cash_up_front_in_order_complete2" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="S’inscrire" WHERE lang LIKE "lng_reg_register" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Enregistrement" WHERE lang LIKE "lng_mk_title_registring" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Structure tableau: numéro de l'article; quantité;" WHERE lang LIKE "lng_record_structure_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fermer" WHERE lang LIKE "lng_btn_close_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Fermer" WHERE lang LIKE "lng_close_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Imprimer la page" WHERE lang LIKE "lng_btn_print_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Page générée en" WHERE lang LIKE "lng_side_generates" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="secondes" WHERE lang LIKE "lng_seconds" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Service" WHERE lang LIKE "lng_service_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous avez choisi le dépôt bancaire. Veuillez insérer votre RIB dans les champs marqués en rouge." WHERE lang LIKE "lng_js_debit_transfer_fill_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Offres de la société" WHERE lang LIKE "lng_offers_not_binding1_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous avez changé le pays de livraison. Les conditions de transport possibles ont été adaptées pour le pays de livraison." WHERE lang LIKE "lng_js_shipment_method_incorrect_country_wk" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Avez-vous oublié votre mot de passe?" WHERE lang LIKE "lng_password_forget_password_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Dans l'adresse de livraison vous n'avez pas marqué le Pays." WHERE lang LIKE "lng_js_no_country_delivery_address_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous n'avez pas choisi le mode d'envoi." WHERE lang LIKE "lng_js_no_shipment_method_wk" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous n'avez pas choisi le mode de paiement!" WHERE lang LIKE "lng_js_no_payment_method_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous n'avez pas encore créé aucun poste des coûts …" WHERE lang LIKE "lng_no_cost_centres_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous avez choisi le paiement anticipé." WHERE lang LIKE "lng_cash_up_front_in_order_complete1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Requête mot de passe" WHERE lang LIKE "lng_js_agb_authenticate_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Requête mot de passe" WHERE lang LIKE "lng_js_no_valid_mail_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Vous n'êtes pas encore habilité à l'accès aux options de service!" WHERE lang LIKE "lng_not_activated_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Transférer immédiatement" WHERE lang LIKE "lng_pulldown_zb_heidelpay_giropay" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Montant passif" WHERE lang LIKE "lng_calculated_assets_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Poste du montant passif pour" WHERE lang LIKE "lng_planned_stocks_for_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Autres:" WHERE lang LIKE "lng_other_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Sauver" WHERE lang LIKE "lng_btn_save_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Statistique" WHERE lang LIKE "lng_menu_left_statistik" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Etat" WHERE lang LIKE "lng_status_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Rue" WHERE lang LIKE "lng_road_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Rue:" WHERE lang LIKE "lng_road_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Recherche" WHERE lang LIKE "lng_btn_search_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Somme nette" WHERE lang LIKE "lng_sum_net_voucher_totals" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Facture partielle" WHERE lang LIKE "lng_mk_partial_invoice" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="partiellement" WHERE lang LIKE "lng_partly_voucher_overview" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Tel:" WHERE lang LIKE "lng_telephone_cp_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Numéro de téléphone" WHERE lang LIKE "lng_telephone_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Téléphone:" WHERE lang LIKE "lng_telephone_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Téléphone 2:" WHERE lang LIKE "lng_telephone2_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Téléphone 3:" WHERE lang LIKE "lng_telephone3_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Notre signe:" WHERE lang LIKE "lng_mailgen_bez19" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Variantes" WHERE lang LIKE "lng_column_variants_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Expédition:" WHERE lang LIKE "lng_shipment_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Informations sur l'expédition" WHERE lang LIKE "lng_shipment_info_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Frais d'envoi selon montant de l'ordre:" WHERE lang LIKE "lng_shipping_costs_based_order_shipment_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Frais d'envoi" WHERE lang LIKE "lng_shipping_costs_shipment_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Version:" WHERE lang LIKE "lng_version" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Administration" WHERE lang LIKE "lng_administration_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="refuser" WHERE lang LIKE "lng_button_reject_voucher_range" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Merci de votre ordre!" WHERE lang LIKE "lng_thanks_order_printarea_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Merci de votre ordre!" WHERE lang LIKE "lng_mailgen_bez28" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Merci de votre réservation de stock!" WHERE lang LIKE "lng_thanks_stock_item_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Merci de votre enregistrement dans notre shop on-line" WHERE lang LIKE "lng_mailgenregneu_bez1" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="du" WHERE lang LIKE "lng_voucher_of" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="de:" WHERE lang LIKE "lng_from1_shipment_information" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="de 3X-IOS" WHERE lang LIKE "lng_mailgen_bez29" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="de:" WHERE lang LIKE "lng_of_date_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Payement anticipé" WHERE lang LIKE "lng_pulldown_zb_vorkasse" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Prénom" WHERE lang LIKE "lng_first_name_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="choisir" WHERE lang LIKE "lng_pulldown_default" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Panier" WHERE lang LIKE "lng_menu_title_wk" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Panier" WHERE lang LIKE "lng_goods_basket_in_resultlist" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Web:" WHERE lang LIKE "lng_web_cp_printarea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="continuer" WHERE lang LIKE "lng_button_further_voucher_range" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="continuer" WHERE lang LIKE "lng_continue_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="continuer" WHERE lang LIKE "lng_continue_voucher_finish_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="continuer vos achats" WHERE lang LIKE "lng_go_on_shopping" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Si vous souhaitez utiliser le bloc-notes vous devez vous identifier ou vous enregistrer" WHERE lang LIKE "lng_mk_slogan_registring" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Valeur" WHERE lang LIKE "lng_value_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Conditions de révocation" WHERE lang LIKE "lng_menu_left_widerrufsbel" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="a été envoyé!" WHERE lang LIKE "lng_sent_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="a été ajouté" WHERE lang LIKE "lng_article_added_subset" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="a été vidé!" WHERE lang LIKE "lng_removed_voucher" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Paiement avec" WHERE lang LIKE "lng_payment_with_payment" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Modes de paiement" WHERE lang LIKE "lng_description_pulldown_zb" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Conditions de paiement" WHERE lang LIKE "lng_menu_left_zahlungsbed" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Mode de payement:" WHERE lang LIKE "lng_mailgen_bez21" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Document csv ou txt à importer:" WHERE lang LIKE "lng_file_article_import" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Données d'accès pour le shop online" WHERE lang LIKE "lng_subject_mail_pw_request" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="l'administrateur IOS!" WHERE lang LIKE "lng_contact_establishment3_servicearea" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="retour" WHERE lang LIKE "lng_back_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="retour" WHERE lang LIKE "lng_back_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="retour" WHERE lang LIKE "lng_back_article_detail" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour au panier" WHERE lang LIKE "lng_btn_back_to_shopping_cart_payment" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à la demande" WHERE lang LIKE "lng_btn_back_offer" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à l'ordre" WHERE lang LIKE "lng_btn_back_order" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à l'ordre" WHERE lang LIKE "lng_btn_back_order_sap" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à la gestion du compte" WHERE lang LIKE "lng_mk_return_to_account_management" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à la réservation de stock" WHERE lang LIKE "lng_btn_back_stock_item" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Retour à la liste" WHERE lang LIKE "lng_reg_back_to_list" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description supplémentaire" WHERE lang LIKE "lng_addition_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description supplémentaire" WHERE lang LIKE "lng_company_additive_ship_to_addresses" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description supplémentaire2" WHERE lang LIKE "lng_addition2_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="Description supplémentaire3" WHERE lang LIKE "lng_addition3_voucher_finish" AND F LIKE de;
UPDATE 3xios_output_langtable SET F="plus frais d'envoi" WHERE lang LIKE "lng_delivery_cond_behind_taxinfo" AND F LIKE de;

### Cache Tabelle um einmal generiertes JSON nicht immer wieder neu zu erstellen ###
CREATE TABLE IF NOT EXISTS `3xios_cache` (
        `id` MEDIUMINT(255) NOT NULL AUTO_INCREMENT,
        `typ` VARCHAR(255) NOT NULL,
        `json` LONGTEXT NOT NULL,
        `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `3xios_optionen` (
  `aktionsvariable` varchar(255) NOT NULL DEFAULT '',
  `aktions_wert` enum('True','False') DEFAULT NULL,
  `Beschreibung` longtext,
  `OrdZaehler` int(11) NOT NULL DEFAULT '0',
  `Bereich` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aktionsvariable`)
) ENGINE=MyISAM;

INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ohnebruttoanzeigen', 'False', 'Bei Nettokunden die Bruttopreise ausblenden', 80, 'Preisanzeige');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('agb_bestaetigung', 'False', 'AGB für registrierte Kunden nicht bestätigen ', 67, 'Belegfuß');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('vor_login', 'False', 'Login-Seite vorschalten', 83, 'Start');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ag_sortierung', 'False', 'Artikelgruppen nach Pos und Artikelgruppennummer sortieren (sonst nach Bezeichnung)', 27, 'Artikelgruppenmenü');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_artnr', 'True', 'Spalte "Artikelnummer" in Listenansicht anzeigen', 32, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_bez', 'True', 'Spalte "Bezeichnung" in Listenansicht anzeigen', 33, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_preis', 'True', 'Spalte "Preis" in Listenansicht anzeigen', 34, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_pe_me', 'True', 'Spalte "PE / ME"  in Listenansicht anzeigen', 35, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_bestand', 'True', 'Spalte "Bestand" in Listenansicht anzeigen', 36, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_visible_wk', 'True', 'Spalte "Warenkorbaktion"  in Listenansicht anzeigen', 37, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_pos', 'False', 'Spalte "Position" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 48, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_artnr', 'True', 'Spalte "Artikelnummer" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 49, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_bez', 'True', 'Spalte "Bezeichnung" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 50, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_menge', 'True', 'Spalte "Menge" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 51, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_me', 'True', 'Spalte "ME" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 52, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_pe', 'True', 'Spalte "PE" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 53, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_einzelpr', 'True', 'Spalte "Einzelpreis" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 54, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_rab', 'False', 'Spalte "Rab in %" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 55, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_gesamtpr', 'True', 'Spalte "Gesamtpreis" in Beleg-Listenansicht anzeigen (inkl. Druckfenster und Mail)', 56, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_visible_bestand', 'False', 'Spalte "Bestand" in Beleg-Listenansicht anzeigen (nicht in Druckfenster und Mail)', 57, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_mit_bild', 'True', 'In der Beleg-Listenansicht Bilder statt Artikelnummern anzeigen (wenn Bilder vorhanden)', 58, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('nettokunde_nur_netto', 'False', 'Bestimmt, ob ein eingeloggter Nettokunde nur Nettopreise sehen soll (Wenn Einstellung - Bei Nettokunden die Bruttopreise ausblenden - aktiviert ist, ist diese Einstellung ohne Wirkung, weil sowieso keine Bruttopreise für Nettokunden angezeigt werden!)', 81, 'Preisanzeige');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('vt_suche_alle_artikel', 'True', 'Volltextsuche über alle Artikel', 84, 'Suche');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk2_belegliste_unten', 'False', 'Bestimmt ob die Belegliste inkl. Belegfuß im Warenkorb Teil 2 (vor dem Absenden) unterhalb der Kundendaten eingeblendet werden soll', 1002, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_ohne_login_nicht_senden', 'False', 'Bestimmt, ob ein Warenkorb nicht gesendet werden soll, wenn ein Kunde sich nicht angemeldet hat (wenn das Programm nur für gewerbliche Kunden zugelassen sein soll, aber trotzdem die Inhalte ohne Login sichtbar sein sollen)', 1003, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_anzeigen_bez', 'True', 'Bezeichnung in Listenansicht anzeigen', 38, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_artnr', 'True', 'Artikelnummer in Detailansicht anzeigen', 1, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_bez', 'True', 'Bezeichnung in Detailanischt anzeigen', 5, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_langtx', 'True', 'Langtext in Detailansicht anzeigen', 7, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_dimtx', 'True', 'Dimensionstext in Detailansicht anzeigen', 8, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_infotx', 'True', 'Infotext in Detailansicht anzeigen', 9, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_besttx', 'True', 'Bestelltext in Detailansicht anzeigen', 10, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_stock', 'True', 'Bestand in Detailansicht anzeigen', 11, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artdetail_anzeigen_preisber', 'True', 'Preisberechnung in Detailansicht anzeigen', 14, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelspezifische_mengeneinheiten_umrechnen', 'True', 'Bestimmt, ob artikelspezifische Mengeneinheiten in der Ansicht berücksichtigt werden sollen (die Möglichkeit der Preissortierung wird dabei deaktiviert)', 22, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelspezifische_mengeneinheiten_kleinste_einheit_ausblenden', 'False', 'Bestimmt, ob bei artikelspezifische Mengeneinheiten die kleinste Mengeneinheit ausgeblendet werden soll', 102, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('xml_download', 'False', 'Bestimmt, ob der XML-Datei-Download von Belegen für Kunden zugelassen wird', 1004, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('bestandsanzeige_als_zahl', 'False', 'Bestand als Zahl anzeigen (ansonsten wird der Bestand mit Ampelsymbolen dargestellt)', 69, 'Bestand');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('alternativ_artikelgruppen', 'True', 'Artikel auch in alternativen Artikelgruppen anzeigen (Voraussetzung: zusätzliche Einträge in der Tabelle ARTALTER mit folgender Belegung: Feld Artikelnummer - Artikelnummer, Feld Id: Kennung "GA" (für Gruppe alternativ) und  Feld AlternativArtikel: die alternative Artikelgruppen-Nummer', 28, 'Artikelgruppenmenü');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('detail_blaettern', 'True', 'Ermöglicht das Blättern in der Artikeldetailansicht des Hauptfensters (die Möglichkeit der Preissortierung wird dabei deaktiviert)', 15, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_klick_wk_landen', 'True', 'Nach dem Versenden eines Artikels in den Warenkorb, die jeweilige Warenkorbseite öffnen', 16, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('rechnungsadresse_aendern', 'False', 'Vorhandene Kundendaten (Rechnungsadresse) beim Belegversand überschrieben', 68, 'Belegfuß');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('emailanzeige_login', 'True', 'Nach Login die E-Mail Adresse statt der Kundennummer anzeigen', 70, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('mit_registrierung', 'True', 'Kunden können Ihre Kundendaten über Menüpunkt Mein Konto ändern oder neu anlegen ', 77, 'Mein Konto');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_ohne_schnellerfassung', 'True', 'Im Warenkorb den Formularfeldblock Artikel suchen, Import und Artikelschnellerfassung ausblenden', 85, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('nur_oberste_artikelgruppenebene', 'False', 'Nur die oberste Artikelgruppenebene im Artikelgruppenmenü anzeigen', 29, 'Artikelgruppenmenü');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('anzeige_text_wk_end', 'True', 'Bestimmt ob Text am Ende der Bestellung angezeigt wird oder nicht --- auch Nachfolgeseiten', 1005, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('email_als_kdnr', 'True', 'Bestimmt, ob E-Mail-Adresse alternativ als Kundennummer zur Anmeldung genutzt werden kannn', 1000, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('mit_ugl_datei', 'False', 'Bei Belegerstellung eine UGL-Datei erstellen und diese als Mailanhang an den Shopbetreiber senden', 86, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('mit_stuecklistenartikel', 'True', 'Bei Stücklistenartikel die Einzelartikel mit anzeigen', 17, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('bild_dateizuordnung_anzeigen', 'True', 'Bestimmt ob Bilder aus der Dateizuordnung als Artikelbilder angezeigt werden sollen - Bilder müssen im Ordner artimages vorhanden sein', 23, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_gewicht_in_bez', 'False', 'In der Beleg-Listenansicht das Gewicht in der Spalte "Bezeichnung" anzeigen (inkl. Druck und Mail)', 59, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('checkbox_bankeinzug', 'True', 'Bei Auswahl der Zahlungsbedingung "Bankeinzug" zusätzlich eine Checkbox für die Kennzeichnung "Bitte meine bekannte Bankverbindung verwenden" einblenden', 87, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelnrsort_nach_agsort', 'False', 'Bei der Artikelsortierung über Artikelnummer zuerst nach Artikelgruppennummer sortieren (danach nach Artikelnummer - funktioniert nicht mit alternativen Artikelgruppen)', 43, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelnrsort_nach_freiezahl3', 'False', 'Bei der Artikelsortierung über Artikelnummer zuerst nach Feld "FreieZahl3" der Artikeltabelle sortieren (Sortierung nach FreieZahl3, dann Artikelnummer), gilt auch bei der Sortierung mit Artikelgruppennummer (Sortierung nach Artikelgruppennummer, dann FreieZahl3, dann Artikelnummer, funktioniert nicht mit alternativen Artikelgruppen)', 44, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('backlook_angebot_beleguebername', 'False', 'Bestimmt ob bei gespeicherten Angeboten aus dem Backlook der komplette Beleg in den Warenkorb übernommen werden soll, Einzelpositionen werden dann nur informativ angezeigt - bei Kunden mit aktivierten Kundenrecht "Session Belege" und bei Aktion "kein Preis bei Nullpreisen anzeigen" generell keine komplette Belegübernahme möglich', 78, 'Mein Konto');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikel_explizite_kundengruppen_zuordnung', 'False', 'Bestimmt, ob Kundengruppen Artikel zugeordnet werden können, für Kunden die diesen Kundengruppen angehören sind diese Artikel sichtbar (soweit nicht anderwärtig beschränkt), Artikel ohne eigene Kundengruppenzuordnung sind nicht sichtbar, Aktivierung kann nicht gleichzeitig mit Kundenrecht "Individueller Katalog" betrieben werden<br>\r\nVoraussetzung - zusätzliche Einträge in der Tabelle ARTALTER mit folgender Belegung:<br>\r\nFeld Artikelnummer: Artikelnummer<br>\r\nFeld Id: Kennung "GZ" (für Gruppe zugeordnet)<br>\r\nFeld AlternativArtikel: Kundengruppennummer', 71, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikel_kundengruppen_zuordnung', 'True', 'Bestimmt, ob Kundengruppen Artikel zugeordnet werden können, für Kunden die diesen Kundengruppen angehören sind diese Artikel sichtbar, für alle anderen Kunden sind Artikel mit Kundengruppenzuordnung nicht sichtbar, Artikel ohne Kundengruppenzuordnung sind für alle Kunden sichtbar (soweit nicht anderwärtig beschränkt), Aktivierung ist bei gleichzeitiger Aktivierung der vorherigen Einstellung unwirksam<br>\r\nVoraussetzung - zusätzliche Einträge in der Tabelle ARTALTER mit folgender Belegung:<br>\r\nFeld Artikelnummer: Artikelnummer<br>\r\nFeld Id: Kennung "GZ" (für Gruppe zugeordnet)<br>\r\nFeld AlternativArtikel: Kundengruppennummer', 72, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('kein_nullpreis', 'False', 'Bestimmt, ob bei Nullpreisen kein Preis eingeblendet wird (dafür Wortgruppe "Preis auf Anfrage"), wenn Nullpreis vorhanden können Artikel nur in das Angebot übernommen werden, in den Angebotbelegen ist dann ebenfalls kein Preis sichtbar, nicht geeignet für OCI-Schnittstelle (es werden generell Angebotsbelege dafür genutzt)', 73, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('zuschlagartikel_ausblenden', 'True', 'Zuschlagartikel in Listenansicht ausblenden', 45, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_bez_in_bez', 'True', 'In der Beleg-Listenansicht die Artikelbezeichnung in der Spalte "Bezeichnung" anzeigen (inkl. Druck und Mail)', 60, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_zusatz_in_bez', 'False', 'In der Beleg-Listenansicht den Artikelzusatz in der Spalte "Bezeichnung" anzeigen (inkl. Druck und Mail)', 61, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_langtext_in_bez', 'True', 'In der Beleg-Listenansicht den Artikellangtext in der Spalte "Bezeichnung" anzeigen (inkl. Mail)', 62, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('alternative_versandartikel', 'False', 'Alternative Versandartikel für Versandkostenstaffeln einsetzen', 88, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('versandkostenstaffel_mit_belegrabatt', 'False', 'Bei Versandkostenberechnung den Belegrabatt berücksichtigen', 89, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelspezifische_ampelsteuerung', 'False', 'Bestimmt ob die Bestandsampelsteuerung artikelspezifisch über Einträge im Infotext erfolgen kann, zusätzlich können vom Standard abweichende Werte für den Alternativtext des Ampelsymbolbildes und der Bildpfad für das Ampelsymbolbild geändert werden.<br>Der relative Bildpfad ist vom Ordner 3xios aus aufzubauen<br>Für die Einträge im Infotext müssen drei Rauten vorangestellt werden, mehrere Einträge in einer Zeile müssen mit Semikolon getrennt werden.<br>Folgende Variablennamen verwenden:<br>Steuerungsgrenzen: ampelred, ampelyellow, ampelgreen<br>Alternativtext: alttextred, alttextyellow, alttextgreen<br>Bildpfad: bildpfadred, bildpfadyellow, bildpfadgreen<br>Beispiel:<br>###ampelred=1;alttextred=Lieferung auf Anfrage; bildpfadred=images/plus.gif;<br>###ampelyellow=5<br>###ampelgreen = 20;<br>###alttextyellow=Bitte konsultieren Sie uns vor der Bestellung!', 90, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ardetail_preis_ohne_aktion', 'True', 'Bestimmt, ob bei Aktionspreisen der Preis ohne Aktionspreis durchgestrichen in der Artikeldetailansicht dargestellt werden soll', 24, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ardetail_aktionspreisgueltigkeit', 'True', 'Enddatum der Gültigkeit von Aktionspreisen anzeigen', 19, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_ohne_gebdat', 'True', 'Das Feld "Geburtsdatum" im Warenkorb und in der Neukundenregistrierung bei nicht eingeloggten Kunden ausblenden', 91, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_anzeigen_langtext', 'False', 'Langtext als Anrißtext in Listenansicht anzeigen', 46, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('bestellvorschlagliste', 'True', 'Bestimmt ob im Shop automatische Bestellvorschlaglisten genutzt werden können, diese können per Link aufgerufen werden, über die Benutzerrechte kann festgelegt werden, ob der Bestellvorschlag gleich nach dem Login sichtbar werden soll', 74, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('extra_zubehoer_immer', 'True', 'Extrabehandlung Zubehör mit Einfügemodus "Immer" - diese Zubehörartikel werden nicht in der normalen Zubehör-Listanansicht dargestellt - Menge und Preis werden automatisch dem Beleg hinzugefügt bzw. in diesem geändert - Darstellung in einen Extrablock "notwendige Zubehörartikel"', 20, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('extra_zubehoer_immer_artdetail_ausblenden', 'True', 'Bestimmt ob bei - Extrabehandlung Zubehör mit Einfügemodus "Immer" - der Block in der Artikeldetailansicht mit den Pflichtzubehörartikel ausgeblendet werden soll', 21, 'Artikeldetail');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('extra_zubehoer_immer_beleg_ausblenden', 'False', 'Bestimmt ob in der Beleglistenansicht bei - Extrabehandlung Zubehör mit Einfügemodus "Immer" - die Preise der Pflichtzubehörartikel in den Gesamtpreis der Artikelposition einfließen sollen und daraus dann der Einzelpreis der Position errechnet wird, Pflichtzubehörartikel werden dann in der Beleg-Listenansicht ausgeblendet', 63, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikelspezifische_mengeneinheiten_beleganzeige', 'True', 'Die größtmögliche artikelspezifische Mengeneinheit in der Beleg-Listenansicht verwenden', 64, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('erweiterte_umbrueche_beleganzeige', 'False', 'In der Beleg-Listenansicht Umbrüche zwischen Bezeichnung, Zusatz und Langtext setzen (beim Langtext werden Selectline-Umbrüche mit berücksichtigt (nicht in Druck und E-Mail))', 65, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('einzelpreisrab_beleganzeige', 'False', 'Bestimmt ob der Einzelpreis rabattiert in der Beleglistenansicht angezeigt werden soll - Einzelpreis errechnet sich aus Gesamtpreis und Menge, es können dabei Rundungsdifferenzen auftreten - bei dieser Ansicht sollte die Spalte Rab in % ausgeblendet werden', 66, 'Beleg Positionsliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('kostenstellenauswahl_ausblenden', 'False', 'Bestimmt ob der Button zur Kostenstellenauswahl ausgeblendet werden soll. Damit kann das Textfeld für den Kostenstelleneintrag für allgemeine Bemerkungen für die Auftragsposition genutz werden, Voraussetzung: Kundenrecht Kostenstellen muss gesetzt sein und der Bereich Service sollte nicht gleichzeitig aktiviert sein.', 92, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('passwort_nicht_aendern', 'False', 'Bestimmt ob registrierte Kunden Ihr Passwort nicht ändern dürfen (wenn Menüpunkt Mein Konto aktiviert ist) - es gilt bei dieser Einstellung dann immer das SL-Passwort - vorher selbst vergebene Passwörter werden vom SL-Passwort beim Login überschrieben', 79, 'Mein Konto');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('leere_ag_nicht_zeigen', 'True', 'Leere Artikelgruppen im Standardmenü nicht anzeigen (leere Artikelgruppen könnten durch zusätzliche Filtereinstellungen auftreten - normalerweise werden aber leere Artikelgruppen durch den Transaktionsserver nicht übertragen - bei vielen Artikelgruppen kann die Aktivierung dieser Option den Seitenaufbau extrem verlangsamen)', 30, 'Artikelgruppenmenü');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('kein_nullpreis_auch_wk', 'False', 'Bestimmt, ob bei Nullpreisen kein Preis eingeblendet wird (dafür Wortgruppe "Preis auf Anfrage"), wenn Nullpreis vorhanden können Artikel auch in den Warenkorb übernommen werden (gilt nicht, wenn Option Nullpreise nur Angebot zugeschalten ist)', 25, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('varianten_liste_nicht_anzeigen', 'True', 'Varianten in Listenansicht ausblenden (bei der Suche wird trotzdem in den Varianten gesucht und bei Suchtreffer in den Varianten wird der Variantenartikel aufgelistet)', 47, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ag_navigation_hauptfenster_mit_bild', 'True', 'Bestimmt, ob die Artikelgruppennavigation zusätzlich im Hauptfenster mit Artikelgruppenbild angezeigt wird, die Artikellistenansicht wird dabei nur in der untersten Artikelgruppenebene eingeblendet<br>Namenskonvention Artikelgruppenbilder: [Artikelgruppennummer].jpg<br>Speicherort Artikelgruppenbilder auf dem Webserver: /3xios/agimages/', 75, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('abw_lieferadresse_leer', 'False', 'Bestimmt ob die abweichende Lieferadresse im Warenkorb Teil 2 nicht mit den hinterlegten Kundendaten vorausgefüllt wird', 93, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('versandlink_hinter_steuerinfo', 'True', 'Bestimmt ob ein Lieferbedingungslink (zu den Versandkosten) hinter der Steuerinfo angefügt werden soll', 26, 'Artikeldetail u. Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('zahlungsbedingungstexte_einblenden', 'False', 'Bestimmt, ob die jeweiligen Zahlungsbedingungstexte (Auswahl, Zusatz) bei Auswahl unter dem PullDown-Menü eingeblendet werden sollen', 1006, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('merkzettel_im_shop', 'True', 'Bestimmt ob Merkzettel verwendet werden können', 76, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('lieferbedingungstexte_einblenden', 'False', 'Bestimmt, ob die jeweiligen Lieferbedingungstexte (Bezeichnung, Zusatz) bei Auswahl unter dem PullDown-Menü eingeblendet werden sollen', 1007, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('leerbild', 'True', 'Bestimmt, ob bei fehlendem Artikelbild ein Leerbild angezeigt wird oder die Artikelnummer.', 1001, 'Global');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('belegliste_artnr_in_bez', 'True', 'Bestimmt, ob in der Beleg-Listenansicht die Artikelnummer in der Spalte Bezeichnung angezeigt werden soll (gilt nicht für Druck- und Mailansicht - nur zu empfehlen, wenn Artikelbilder in der Beleg-Listenansicht angezeigt werden)', 1008, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_bannerbereich_mit_wert', 'True', 'Bestimmt, ob bei den Warenkorbinformationen im Bannerbereich zusätzlich der Warenkorbwert (ohne Versandkosten) angezeigt wird', 1009, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_menue_bezeichnung_ausblenden', 'False', 'Bestimmt, ob im Schrittmenü des Warenkorbs die Bezeichnung ausgeblendet werden soll (falls nur Hintergrundbilder über die Style-Klassen genutzt werden sollen - Elemente erhalten dann einen Title mit der Bezeichnung)', 1010, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('artikel_nur_fremdsprache', 'False', NULL, 1011, 'Warenkorb');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('hide_artnr_in_list', 'False', 'Artikelnummer in Listenansicht ausblenden', 94, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('fremdwaehrung_zulassen', 'False', 'Bestimmt, ob Fremdwährung als hinterlegte Kundenwährung für die Preisermittlung herangezogen werden soll. Dabei werden nur konfigurierte Preise in der Fremdwährung herangezogen, wenn kein Preis vorhanden, dann wird Preis 0 ausgegeben (ggf. dafür Nullpreise ausblenden).\r\nBei Aktivierung dieser Option müssen ggf. auch Lieferbedingungen für die Fremdwährungen konfiguriert werden. (in Vorbereitung)', 95, 'Preisanzeige');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('send_mail_konto', 'False', 'Bei Änderungen in Kundendaten, E-Mail an Shopbetreiber senden.', 96, 'Mein Konto');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('ag_menu_cache', 'False', 'Artikelgruppenstruktur in eine Cachetabelle schreiben, um bei vielen Artikelgruppen den Seitenaufbau zu beschleunigen.', 97, 'Artikelgruppenmenü');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('reg_double_opt_in', 'False', 'Bei erfolgreicher Registrierung eine Bestätigungsmail an den Kunden senden. Erst nach Klick auf Aktivierungslink ist Registrierung abgeschlossen.', 98, 'Registrierung');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('liste_mit_varianten', 'False', 'Variantenauswahl in Listenansicht einbinden', 99, 'Artikelliste');
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('wk_modal_neuer_artikel', 'False', 'Nach legen eines Artikels in den Warenkorb, Modalfenster mit Artikelinformationen öffnen', 101, 'Global');


UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_impressum" WHERE tmg_id = 1;
UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_agb" WHERE tmg_id = 2;
UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_lieferbedingungen" WHERE tmg_id = 3;
UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_zahlungsbedingungen" WHERE tmg_id = 4;
UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_widerrufsbelehrung" WHERE tmg_id = 5;
UPDATE 3xios_tmg_angaben SET sprachvariable_text = "lng_tmg_datenschutz", tmg_angabe = "Datenschutzerklaerung" WHERE tmg_id = 6;

UPDATE 3xios_settings SET bezeichner = "Kantenlänge Thumbnail", infotext = "Skaliert neu erstellte Thumbnails auf die eingetragenen Kantenlängen, proportional wenn ein Feld eine Zahl enthält, unproportional wenn beide Felder eine Zahl enthalten." WHERE id = 1;
UPDATE 3xios_settings SET bezeichner = "Kantenlänge Bildausschnitt", infotext = "Bestimmung des Bildausschnitts zur Ansicht der Thumbnails bei Auflistung Zubehör-, Alternativ- und Stücklistenartikel - Bilder werden im angegebenen Bereich zentriert dargestellt, wenn Bildkanten länger sind als der Bildausschnitt, dann wird auch nur ein Teil des Bildes zentriert angezeigt." WHERE id = 2;
UPDATE 3xios_settings SET infotext = "Alternativmailadresse für Mails aus der Kontoverwaltung (ersetzt Mailadresse Ansprechpartner vom Shopbetreiber). Änderungen bei Mail zum Shopbetreiber: Empfängermailadresse und Empfängername bei Neuregistrierung, Änderung Registrierdaten und Kundenbenutzerverwaltung - Mail zum Kunden: Absendername bei Neuregistrierung" WHERE id = 3;
UPDATE 3xios_settings SET infotext = "Anzahl der maximal anzuzeigenden Artikel in der Listenansicht - eine hohe Anzahl kann die Geschwindigkeit des Webseitenaufbaus beeinträchtigen" WHERE id = 4;
UPDATE 3xios_settings SET infotext = "Feldbezeichnung aus der Belegtabelle für die Übergabe von Pseudocardnummern in die Warenwirtschaft - nur sinnvoll bei eingerichteten Payment-Zahlungsbedingungen" WHERE id = 5;
UPDATE 3xios_settings SET infotext = "Überprüfung aller Artikel im Beleg nach Liefernummer im hier definierten Artikelfeld (muss in Artikeltabelle vorhanden sein), wenn in einem Artikeldatensatz Liefernummer vorhanden: Versandkostenpreis vom geringsten Umsatzwert ermitteln (eine eventuell vorhandene Preisstaffel wird nicht berücksichtigt). Die einem Artikel zugeordneten Lieferbedingung mit dem höchsten Versandpreis im Beleg wird ermittelt und in den Beleg geschrieben, eine eventuell vorhandene Preisstaffel nach Auftragswert wird berücksichtigt. Wenn keine definierten Lieferbedingungen vorhanden sind, dann können die nicht ausgeblendeten Lieferbedingungen genutzt werden. Wenn im Beleg eine einem Artikel zugeordnete Lieferbedingung drin ist, erscheint diese als einzige im PullDown-Feld. Konfiguration der Lieferbedingungen in der Webadministration - die Nummer der Lieferbedingung muss den erwarteten Nummern im definierten Feld der Artikeltabelle entsprechen." WHERE id = 6;
UPDATE 3xios_settings SET infotext = "Schaltet Artikelanzeige/-suche für Artikelgruppenebenen aus - Artikelgruppen werden dabei im Haupfenster angezeigt, der einzutragende Wert entspricht der Artikelgruppenebene, ab der dann die Artikel angezeigt werden." WHERE id = 7;
UPDATE 3xios_settings SET bezeichner = "Spalten für AG im Hauptfenster", infotext = "Einstellmöglichkeit der Spaltenanzahl wenn Artikelgruppen im Hauptfenster dargestellt werden, wenn nichts eingetragen ist, dann ist die Anzahl der Spalten auf 3 eingestellt" WHERE id = 8;
UPDATE 3xios_settings SET bezeichner = "Größe Galeriefenster", infotext = "Seitenlänge des Galeriefenster, wenn kein Wert eingetragen ist ermittelt sich die Seitenlänge aus der Bildgröße des ersten Galeriebildes" WHERE id = 9;
UPDATE 3xios_settings SET infotext = "Anzahl der Listenelemente der Bild-Stammdaten in der Webadministration (über Stammdaten/Artikel)" WHERE id = 10;
UPDATE 3xios_settings SET infotext = "Bei Bestellvorschlag: Anzahl der zurückliegenden Tage der Bestellungen, die für die Ermittlung des Bestellvorschlags berücksichtigt werden sollen - z.Zt. nicht aktiv" WHERE id = 14;
UPDATE 3xios_settings SET infotext = "Möglichkeit beim Vergleich nach teuerster Versandbedingung (bei Artikel mit hinterlegter Versandbedingung) auch die Standardlieferbedingung in den Vergleich mit einzubeziehen, diese Konfiguration wird nicht in der automatischen Versandkostenübersicht berücksichtigt" WHERE id = 15;
UPDATE 3xios_settings SET infotext = "Möglichkeit, den ini-Eintrag aus der SelectLine zum kompletten Ignorieren bzw. Neufestsetzen aller Rabatte bei Erreichen der ersten Mengenstaffel für die Shop-Preisfindung nachzuempfinden - einzutragen ist der Rabattwert (üblicherweise 0) - Standard ist kein Eintrag (kein entsprechender ini-Eintrag in SelectLine vorhanden), dabei werden nur die Rabatte aus einer möglichen Rabattstaffel ignoriert (wenn Option in TS aktiviert ist)" WHERE id = 16;
UPDATE 3xios_settings SET infotext = "Mindestbestellwert für Nettokunden kann definiert werden - bei Unterschreitung des Warenwertes erfolgt eine JavaScript-Meldung im Warenkorb Teil 1 - Funktionalität ist nur bei Bestellung möglich" WHERE id = 17;
UPDATE 3xios_settings SET infotext = "Mindestbestellwert für Bruttokunden kann definiert werden - bei Unterschreitung des Warenwertes erfolgt eine JavaScript-Meldung im Warenkorb Teil 1 - Funktionalität ist nur bei Bestellung möglich" WHERE id = 18;
UPDATE 3xios_settings SET infotext = "Möglichkeit für das Artikelbewertungssystem Ebont die Kundennummer abzuspeichern - wenn Eintrag vorhanden, dann ist dies aktiv geschalten" WHERE id = 19;
UPDATE 3xios_settings SET bezeichner = "Kantenlänge Thumbnailgalerie", infotext = "Bestimmt die Kantenlänge der Bilder in der Thumbnailgalerie unter dem Artikelbild der Detailansicht (wenn Thumbnailgalerie in den Aktionen aktiviert ist). Bilder werden proportional angepasst, wenn ein Feld eine Zahl enthält, unproportional wenn beide Felder eine Zahl enthalten." WHERE id = 20;
UPDATE 3xios_settings SET infotext = "Bei Bestellvorschlag: die zu berücksichtigenden Belegtypen auf Grundlage der eigenen Belege, kein Eintag: alle Belegtypen, SL-Kürzel des Belegtyps: nur dieser Belegtyp, mehrere Belegtypen mit Komma trennen - z.Zt. nicht aktiv" WHERE id = 23;
UPDATE 3xios_settings SET infotext = "Bei Bestellvorschlag: die zu berücksichtigenden Belegtypen auf Grundlage der Belege der Kundengruppe, kein Eintag: alle Belegtypen, SL-Kürzel des Belegtyps: nur dieser Belegtyp, mehrere Belegtypen mit Komma trennen - z.Zt. nicht aktiv" WHERE id = 24;
UPDATE 3xios_settings SET bezeichner = "Anzahl Zubehörartikel", infotext = "Anzahl der anzuzeigenden Zubehörartikel bei Erstaufruf in der Artikeldetailansicht, wenn leer, dann ist 3 voreingestellt" WHERE id = 25;
UPDATE 3xios_settings SET bezeichner = "Artikelanz. Zubehörgruppierung", infotext = "Anzahl der Zubehörartikel, ab dieser eine Artikelgruppierung, nach der den Artikeln hinterlegten Artikelgruppen, angezeigt wird, wenn nichts eingetragen ist, dann werden Artikel nicht gruppiert - funktioniert nicht mit alternativen Artikelgruppen" WHERE id = 27;
UPDATE 3xios_settings SET infotext = "Überprüfung aller Artikel nach Angaben zur Energiekennzeichnung in den hier zu definierenden Artikelfeldern (müssen in Artikeltabelle vorhanden sein). Wenn Links hinterlegt sind, werden diese in der Artikellistenansicht und Artikeldetailansicht eingebunden. Artikelfeldreihenfolge: 1. Bildlink zum Pfeilbild der Energieeffizienzklasse, 2. Link zum Etikett, 3. Link zum Produktdatenblatt - Artikelfelder können auch Extrafelder der Artikeltabelle sein, Trennung der Artikelfelder durch Semikolon - Beispiel: FreierText1;FreierText2;_DATENBLATTLINK - Beispiel Linkeinräge in den Artikelfeldern: 1.  images/energiekennzeichnung/waschmaschinen/a_plus_plus_plus.jpg, 2. http://www.herstellerlink.com/etiketten/wm1.jpg, 3. http://www.herstellerlink.com/datenblaetter/wm1.pdf" WHERE id = 28;

ALTER TABLE cms_newsletter_adressen MODIFY name1 VARCHAR(255) null;
ALTER TABLE cms_newsletter_adressen MODIFY name2 VARCHAR(255) null;

### Shopkunde als CMS Nutzer ###
INSERT IGNORE INTO `cms_ben` (`ben_nr`,`name2`,`aktiv`,`bcat_nr`,`usern`,`busern`,`sichtbar`,`getnews`) VALUES (1000,'Shopkunde','0',1,'shopkunde', 2,'0','0');

### Fremdwaehrung ###
INSERT IGNORE INTO `3xios_layout_aktionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`) VALUES ('fremdwaehrung_zulassen', 'False', 'Bestimmt, ob Fremdwährung als hinterlegte Kundenwährung für die Preisermittlung herangezogen werden soll. Dabei werden nur konfigurierte Preise in der Fremdwährung herangezogen, wenn kein Preis vorhanden, dann wird Preis 0 ausgegeben (ggf. dafür Nullpreise ausblenden).\r\nBei Aktivierung dieser Option müssen ggf. auch Lieferbedingungen für die Fremdwährungen konfiguriert werden. (in Vorbereitung)', 167);
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('fremdwaehrung_zulassen','False','Bestimmt, ob Fremdwährung als hinterlegte Kundenwährung für die Preisermittlung herangezogen werden soll. Dabei werden nur konfigurierte Preise in der Fremdwährung herangezogen, wenn kein Preis vorhanden, dann wird Preis 0 ausgegeben (ggf. dafür Nullpreise ausblenden).\r\nBei Aktivierung dieser Option müssen ggf. auch Lieferbedingungen für die Fremdwährungen konfiguriert werden. (in Vorbereitung)',95,'Preisanzeige');
ALTER TABLE `3xiosgruppenweb` ADD COLUMN `Waehrungscode` CHAR(3) NULL DEFAULT NULL AFTER `Land`;

### Tabelle fuer verbrauchtes Budgetguthaben ###
CREATE TABLE IF NOT EXISTS `3xios_budgetverbrauch` (
  `pkspalte` int(10) NOT NULL AUTO_INCREMENT,
  `Budgetnummer` int(10) DEFAULT NULL,
  `Kundennummer` varchar(13) DEFAULT NULL,
  `Belegnummer` varchar(10) DEFAULT NULL,
  `Wert` float DEFAULT NULL,
  `Datum` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkspalte`)
) ENGINE=MyISAM;

### Sprachvariable Budgetueberschreitung ###
INSERT IGNORE INTO 3xios_output_langtable (lang, de, OrdZaehler) VALUES ('lng_js_budget_exceeded_voucher_finish', 'Der Warenkorbwert liegt %FCber dem verf%FCgbaren Budget%21 \\nBestellung nicht m%F6glich. \\nIhr verf%FCgbares Budget:', '740');
INSERT IGNORE INTO 3xios_output_langtable_description (lang, de, OrdZaehler) VALUES ('lng_js_budget_exceeded_voucher_finish', 'JavaScript-Meldung "Der Warenkorbwert liegt über dem verfügbaren Budget! Bestellung nicht möglich. Ihr verfügbares Budget:" bei Beleg abschließen', '740');
UPDATE 3xios_output_langtable SET E= 'The basket value is above the available budget!%21 \\nOrder not possible. \\nYour available budget:' WHERE lang='lng_js_budget_exceeded_voucher_finish' AND E IS NULL;
UPDATE 3xios_output_langtable_description SET E= 'JavaScript-Meldung "Der Warenkorbwert liegt über dem verfügbaren Budget! Bestellung nicht möglich. Ihr verfügbares Budget:" bei Beleg abschließen' WHERE lang='lng_js_budget_exceeded_voucher_finish';

### Sprachvariable Warenkorb ###
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_regstart_gastbestellung_titel', 'Gastbestellung','Customer order', 'Commande client', 'Ordine del cliente', '746');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_regstart_neukunde_titel', 'Neukunde','New customer', 'Nouveau client', 'Nuovo cliente', '747');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresse_gleich_rechnungsadresse', 'Lieferadresse gleich Rechnungsadresse', 'Shipping address equal to invoice address', "Adresse de livraison à l'adresse de facturation", 'Indirizzo di consegna al mio indirizzo di fatturazione', '748');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresstabelle_titel_firma', 'Firma / Name', 'Company / Name', 'Société / Nom', 'Azienda / Nome', '749');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresstabelle_titel_land', 'Land', 'Country', 'Pays', 'Paese', '750');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresstabelle_titel_plz', 'PLZ', 'Postcode', 'code postal', 'codice postale', '751');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresstabelle_titel_ort', 'Ort', 'City', 'lieu', 'posto', '752');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadresstabelle_titel_strasse', 'Straße', 'Street', 'rue', 'strada', '753');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadressen_verwalten', 'Verwalten', 'Manage', 'gérer', 'gestire', '754');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_kundendaten_lieferadressen_uebernehmen', 'Übernehmen', 'Apply', 'appliquer', 'applicare', '755');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_abschluss_anfrage', '<p>Sie haben bei der Firma [Firma] eine Anfrage ausgelöst.</p><p>Ein Vertrag kommt mit der schriftlichen Auftragsbestaetigung der Firma [Firma] (beispielsweise per E-Mail / Fax) zustande, spätestens jedoch durch Abnahme der Lieferung / Leistung durch den Kunden.</p><br><h3>Vielen Dank für Ihre Anfrage!</h3>', '<p>You have made a request at the Company [Firma].</p><p>A contract comes with the written order confirmation of the company [Firma] (for example via e-mail / fax), but at the latest by acceptance of the delivery / service by the customer.</p><br><h3>Thank you for your request!</h3>', '', '', '756');
INSERT IGNORE INTO 3xios_output_langtable (lang, de, E, F, IT, OrdZaehler) VALUES ('lng_wk_abschluss_bestellung', '<p>Sie haben bei der Firma [Firma] eine Bestellung ausgelöst.</p><p>Ein Vertrag kommt mit der schriftlichen Auftragsbestaetigung der Firma [Firma] (beispielsweise per E-Mail / Fax) zustande, spätestens jedoch durch Abnahme der Lieferung / Leistung durch den Kunden.</p><br><h3>Vielen Dank für Ihre Bestellung!</h3>', '<p>You have made a order at the Company [Firma].</p><p>A contract comes with the written order confirmation of the company [Firma] (for example via e-mail / fax), but at the latest by acceptance of the delivery / service by the customer.</p><br><h3>Thank you for your order!</h3>', '', '', '757');


CREATE TABLE IF NOT EXISTS `3xios_kundenweb_forget` (
        `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
        `Nummer` VARCHAR(13) NOT NULL,
        `token` VARCHAR(10) NOT NULL,
        `create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `cms_smtp` (
        `ID` MEDIUMINT(255) NOT NULL AUTO_INCREMENT,
        `host` VARCHAR(255) NULL DEFAULT NULL,
        `port` VARCHAR(255) NULL DEFAULT NULL,
        `helo` VARCHAR(255) NULL DEFAULT NULL,
        `email` VARCHAR(255) NULL DEFAULT NULL,
        `user` VARCHAR(255) NULL DEFAULT NULL,
        `password` VARCHAR(255) NULL DEFAULT NULL,
        `debug` ENUM('true','false') NULL DEFAULT 'false',
        `replyto` VARCHAR(255) NULL DEFAULT NULL,
        PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

ALTER TABLE `cms_smtp` CHANGE COLUMN `ID` `ID` MEDIUMINT(255) NOT NULL AUTO_INCREMENT FIRST;
ALTER TABLE `cms_smtp` ADD COLUMN `name` VARCHAR(255) NOT NULL AFTER `ID`;
ALTER TABLE `cms_smtp` ADD COLUMN `standard` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `debug`;
ALTER TABLE `cms_smtp` ADD COLUMN `crypt` VARCHAR(255) NOT NULL;
DELETE FROM cms_smtp WHERE host IS NULL OR TRIM(host) LIKE "";


ALTER TABLE `cms_dokument` ADD COLUMN `imglink` VARCHAR(255) AFTER `doclink`;
DELETE FROM cms_smtp WHERE host IS NULL OR TRIM(host) LIKE "";

### Tabelle fuer Spaltenauswahl erstellen und Artikelnummer und Bezeichnung standardmaeßig auf aktiv setzen ###
CREATE TABLE IF NOT EXISTS `3xios_artikelspalten` (
        `Feldname` VARCHAR(255) NOT NULL,
        `Liste` ENUM('True','False') NOT NULL DEFAULT 'False',
        `Detail` ENUM('True','False') NOT NULL DEFAULT 'False',
        PRIMARY KEY (`Feldname`)
) ENGINE=MyISAM;

INSERT IGNORE INTO 3xios_artikelspalten (Feldname, Liste, Detail) VALUES ('Artikelnummer','True','True');
INSERT IGNORE INTO 3xios_artikelspalten (Feldname, Liste, Detail) VALUES ('Bezeichnung','True','True');

### Die aufgrund der Spaltenauswahl ueberfluessigen Optionen entfernen ###
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_ean';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_hst';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_matchc';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_zusatz';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_me';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_pe';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'matchcodeanz';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'liste_anzeigen_zusatz';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'liste_anzeigen_ean';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'liste_anzeigen_hst';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'liste_anzeigen_gewicht';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'artdetail_anzeigen_gewicht';
DELETE FROM 3xios_optionen WHERE aktionsvariable = 'registrierungsmail_mit_pw';

### Sprachveriable für Restbudget im Bestellmail ###
INSERT IGNORE INTO `3xios_output_langtable_description` (`lang`, `OrdZaehler`, `de`, `E`) VALUES ('lng_mailgen_bez31', '741', 'Mailversand: Bezeichnung "Restbudget:"', 'Mailversand: Bezeichnung "Restbudget:"');
INSERT IGNORE INTO `3xios_output_langtable` (`lang`, `OrdZaehler`, `de`, `E`, `IT`, `F`) VALUES ('lng_mailgen_bez31', '741', 'Restbudget:', 'Rest of budget:', 'Budget riposo', 'Reste du budget:');

### Benutzertabelle für Geo-Koordinaten erweitern ###
ALTER TABLE `cms_ben` ADD COLUMN `lat` VARCHAR(255) AFTER `ios_kdgr`;
ALTER TABLE `cms_ben` ADD COLUMN `lng` VARCHAR(255) AFTER `lat`;

### Tablle cms_adminrechte erweitern ###
ALTER TABLE `cms_adminrechte` ADD COLUMN `noCMS` ENUM('0','1') NULL DEFAULT '0';

### Gastbestellung
INSERT IGNORE INTO `3xios_optionen` (`aktionsvariable`, `aktions_wert`, `Beschreibung`, `OrdZaehler`, `Bereich`) VALUES ('gastbestellung_zulassen', 'False', 'Bestimmt, ob Gastbestellungen zugelassen werden sollen. Dabei wird dem Beleg die Shopkundennummer als Kundennummer hinterlegt und die Adressdaten des Kunden überschreiben die Beleg-Adressdaten.', 100, 'Global');

### Sprachvariable Gastbestellung
INSERT IGNORE INTO `3xios_output_langtable_description` (`lang`, `OrdZaehler`, `de`, `E`) VALUES ('lng_regstart_guestorder', '742', 'Bezeichnung "Als Gast einkaufen, ohne Registrierung." bei Start Registrierung', 'Bezeichnung "Als Gast einkaufen, ohne Registrierung." bei Start Registrierung');
INSERT IGNORE INTO `3xios_output_langtable` (`lang`, `OrdZaehler`, `de`, `E`, `IT`, `F`) VALUES ('lng_regstart_guestorder', '742', 'Als Gast einkaufen, ohne Registrierung.', 'Order as a Guest, without registration.', 'Ordine come ospite, senza registrazione.', 'Commandez en tant qu\'invit�, sans inscription.');

### SaferPay
INSERT INTO `3xios_zahlungsbedingungen` (`Id`, `Bezeichnung`) VALUES (14, 'SaferPay Alle');
INSERT INTO `3xios_zahlungsbedingungen` (`Id`, `Bezeichnung`) VALUES (15, 'SaferPay Kreditkarte');
INSERT INTO `3xios_zahlungsbedingungen` (`Id`, `Bezeichnung`) VALUES (16, 'SaferPay PayPal');

INSERT IGNORE INTO `3xios_output_langtable_description` (`lang`, `OrdZaehler`, `de`, `E`) VALUES ('lng_pulldown_zb_saferpay_alle', '743', 'Inhalt "Saferpay" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)', 'Inhalt "Saferpay" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)');
INSERT IGNORE INTO `3xios_output_langtable` (`lang`, `OrdZaehler`, `de`, `E`, `IT`, `F`) VALUES ('lng_pulldown_zb_saferpay_alle', '743', 'Saferpay', 'Saferpay', 'Saferpay', 'Saferpay');

INSERT IGNORE INTO `3xios_output_langtable_description` (`lang`, `OrdZaehler`, `de`, `E`) VALUES ('lng_pulldown_zb_saferpay_kreditkarte', '744', 'Inhalt "Kreditkarte" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)', 'Inhalt "Kreditkarte" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)');
INSERT IGNORE INTO `3xios_output_langtable` (`lang`, `OrdZaehler`, `de`, `E`, `IT`, `F`) VALUES ('lng_pulldown_zb_saferpay_kreditkarte', '744', 'Kreditkarte', 'Credit Card', 'Carta di credito', 'Carte de crédit');

INSERT IGNORE INTO `3xios_output_langtable_description` (`lang`, `OrdZaehler`, `de`, `E`) VALUES ('lng_pulldown_zb_saferpay_paypal', '745', 'Inhalt "PayPal" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)', 'Inhalt "PayPal" im PullDown-Menü Zahlungsbedingungen (Payment über Saferpay)');
INSERT IGNORE INTO `3xios_output_langtable` (`lang`, `OrdZaehler`, `de`, `E`, `IT`, `F`) VALUES ('lng_pulldown_zb_saferpay_paypal', '745', 'PayPal', 'PayPal', 'PayPal', 'PayPal');

CREATE TABLE IF NOT EXISTS `3xios_sp_settings` (
  `id` mediumint(8) unsigned NOT NULL,
  `USER` varchar(255) DEFAULT NULL,
  `PWD` varchar(255) DEFAULT NULL,
  `KUNDENNUMMER` varchar(50) DEFAULT NULL,
  `TERMINALID` varchar(50) DEFAULT NULL,
  `Systemart` enum('Test','Live') DEFAULT 'Test',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM ;

INSERT IGNORE INTO `3xios_sp_settings` (`id`, `USER`, `PWD`, `KUNDENNUMMER`, `TERMINALID`, `Systemart`) VALUES
        (1, '', '', '', '', 'Test');

CREATE TABLE IF NOT EXISTS `3xios_sp_sussandfail` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `TransID` varchar(60) DEFAULT NULL,
  `PayID` varchar(255) DEFAULT NULL,
  `orderID` varchar(50) DEFAULT NULL,
  `Waehrung` varchar(3) DEFAULT NULL,
  `Zahlungsweise` varchar(255) DEFAULT NULL,
  `parameters` text,
  `curlinfo` text,
  `curlerror` text,
  `curlResponseArray` text,
  `curlresponsstatus` varchar(255) DEFAULT NULL,
  `responsepagepost` text,
  `decline_parameters` text,
  `decline_ResponseArray` text,
  `accept_parameters` text,
  `accept_ResponseArray` text,
  `Status` varchar(15) DEFAULT NULL,
  `Status2` varchar(15) DEFAULT NULL,
  `Status_b2` varchar(15) DEFAULT NULL,
  `Status_b2_pruef` varchar(15) DEFAULT NULL,
  `Kartennummer` varchar(50) DEFAULT NULL,
  `NCError` varchar(2) DEFAULT NULL,
  `Kartenmarke` varchar(50) DEFAULT NULL,
  `gueltig` varchar(5) DEFAULT NULL,
  `Zahldatum` varchar(255) DEFAULT NULL,
  `Shasigin` varchar(40) DEFAULT NULL,
  `Betrag` double DEFAULT NULL,
  `Kundennummer` varchar(13) DEFAULT NULL,
  `IP` varchar(13) DEFAULT NULL,
  `Anrede` varchar(255) DEFAULT NULL,
  `Vorname` varchar(255) DEFAULT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `Firma` varchar(255) DEFAULT NULL,
  `Strasse` varchar(255) DEFAULT NULL,
  `PLZ` varchar(255) DEFAULT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `Telefon` varchar(255) DEFAULT NULL,
  `EMail` varchar(255) DEFAULT NULL,
  `LAnrede` varchar(255) DEFAULT NULL,
  `LVorname` varchar(255) DEFAULT NULL,
  `LNachname` varchar(255) DEFAULT NULL,
  `LFirma` varchar(255) DEFAULT NULL,
  `LStrasse` varchar(255) DEFAULT NULL,
  `LPLZ` varchar(255) DEFAULT NULL,
  `LOrt` varchar(255) DEFAULT NULL,
  `LLand` varchar(255) DEFAULT NULL,
  `KundenBelegposTab` varchar(255) DEFAULT NULL,
  `Belegdatum` datetime DEFAULT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS `3xios_sp_transid` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `startnr` bigint(20) unsigned DEFAULT NULL,
  `kuerzel_al` varchar(4) DEFAULT NULL,
  `kuerzel_kk` varchar(4) DEFAULT NULL,
  `kuerzel_pp` varchar(4) DEFAULT NULL,
  `zaehler` bigint(20) unsigned DEFAULT NULL,
  `nummer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM ;

INSERT IGNORE INTO `3xios_sp_transid` (`id`, `startnr`, `kuerzel_al`, `kuerzel_kk`, `kuerzel_pp`, `zaehler`, `nummer`) VALUES
        (1, 10000, '', '', '', 0, NULL);
