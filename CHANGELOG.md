# 17.0.1
### Feature
* Warenkorb optimiert (optische Anpassungen)
* Rechnungsnummern werden bei Zahlungen übergeben

### Note
* Link zum FAQ entfernt (wird in Zukunft erneuert)

# 16.5.1
### Feature
* Neue Option hinzugefügt, mit welcher man bei Legen eines Artikels in den Warekorb / Anfrage, ein Modalfenster mit den Artikeldaten anzeigen kann
* Für Artikel, Kataloge, News und Termine erscheinen bei Facebook Bilder und Beschreibungen, wenn man den Link teilt.
* Neue Zahlungsoption SaferPay
* Gastbestellung

# 16.4.3
### Bug Fixes
* Kleinere Fehler behoben
* Transparente PNG und GIF im Upload für CMS möglich.

### Feature
* Variantenartikel können nun in den Listen ausgegeben werden
* Es können mehrere Dateien in einem Formular hochgeladen werden
* Im Backend können nun eigene Sprachvariablen für Templates erstellt werden

# 16.4.2
### Bug Fixes
* Kleinere Fehler behoben

# 16.4.1
### Bug Fixes
* Sicherheitsoptimierungen

# 16.4.0
### Bug Fixes
* Kleinere Fehler behoben
* Bestand wird nun als Zahl (nicht mehr als String) zurückgegeben
* AGB Link in 2-teiligem Warenkorb öffnet nicht mehr ein leeres Popup
* Codierungsfehler behoben. (bei problemen in der config.ini "utf8 = true" setzen)

### Feature
* Möglichkeit der Sortierreihenfolge bei Bestellübersicht hinzugefügt
* Felder aus Extratabelle "XARTZUSATZFELDER" werden mit in Spaltenauswahl berücksichtigt
    * Bei einer großen Anzahl von Extrafeldern, kann nun eine Extratabelle mit dem Namen "ARTZUSATZFELDER" angelegt werden. Die notwendigen Felder sind 1 ID Felder und ein Feld "Artikelnummer". 
    * Felder wie "AngelegtAm", "BearbeitetAm" usw. müssen entfernt werden.
    * Nach dem Feld "Artikelnummer" können nun alle gewünschten Extrafelder erstellt werden. Diese stehen dann später im Backend unter "Shop/Grundeinstellung/Spaltenauswahl" zur Konfiguration. 
* Im Formular können nun Datei-Uploads durchgeführt werden

### Note
* AGBs werden im Warenkorb in einem neuen Tab geöffnet.

# 16.2.3
### Bug Fixes
* Fehler bei der Suche nach Artikeln behoben
* Fehler beim Abmelden behoben

### Feature
* Bei den SMTP-Daten kann die Verschlüsselung ausgewählt werden
* Dateizuordnung auf Prüfung über Artikelnummer erweitert

### Note
* Sicherheitsoptimierungen

# 16.2.2
### Bug Fixes
* Kleinere Fehler behoben

### Feature
* Option für Double-Opt-In bei Registrierung eingefügt
* Settings (LimitTo, Darstellung, Sortierung) innerhalb der Listenansicht werden nun in Session gespeichert
* Gutscheinhandling ist jetzt im Frontend aus Handling Naturalzugabe herausgelöst. Dadurch können jetzt auch mehrere Gutscheine eingegeben werden. Die Datenstruktur ist unverändert zusammen mit Naturalzugabe.

# 16.2.1
### Bug Fixes
* Direkte Weiterleitung ist nun änderbar
* Artikel werden bei der Suche und in der Sitemap nur zurück gegeben, wenn es sich um ein Shop handelt
* Geschütze oder nicht sichtbare Elemente werden nicht mehr in Sitemap angezeigt

### Feature
* Es können nun über State-Params mehr als 10 Adressen zurück gegeben werden

# 16.2.0
### Note
* Heidelpay-Formulare Style-Datei: kundenspezifische Style-Datei möglich 
    * Datei 3xios/hcoFastLane.css kann jetzt gegen eine kdsp. Datei, wenn vorhanden, ausgetauscht werden 
    * Dateiname: 3xios/alternativ_hcoFastLane.css 
    * damit bleibt Updatefähigkeit gegeben
* Im CMS ist bei Katalog, Termin und News ein Dokumenttitel pflicht, wenn ein Dokument angegeben wird.
* Der Update-Button scrollt nun mit dem Content
* Bei der Newsletteranmeldung ist es nun Pflicht, eine E-Mail-Adresse anzugeben
* Verbesserungen "Passwort vergessen" (ACHTUNG: eventuell sind Anpassungen in "template/modal/passwort/&lt;custum&gt;.html" nötig!)
* Sprachunterstützung um Französisch und Italienisch erweitert
* Info-Icon für Zahlungsbedingungen im Warenkorb kann nun mittels Styleklasse "wk_zahlungslink_button" (display:none) ausgeblendet werden
* Alle "*" in Default-Templates in <sup></sup> gepackt
* Bei Warenkorb- und Angebotsvoransicht, können nun folgende Preise angezeigt werden:
	* nur Netto (wenn Nettokunde keine Bruttopreise sehen soll)
	* Netto und Brutto
	* nur Brutto
* Neue Option zum Aktivieren / Deaktivieren der Cachetabelle bei Artikelgruppenmenü eingefügt
* Bei abgelaufenen Sitzungen wird eine Meldung ausgegeben und die Seite neu geladen.
* Budget-Verwaltung unter CMS->Shop->Budget.
* Restbudgetanzeige im Bestellmail bei Budgetkunden
* Sortierung von Adressen im Menü
	
### Features
* Wenn ein Benutzer eingeloggt ist und diesem eine Mailadresse hinterlegt ist, dann gehen die Kundenbestellmails an dessen Mailadresse. Absenderdaten beim Bestellmail zum Shopbetreiber werden mit den Daten des Benutzers gefüllt.
* Neue E-Mail-Adressen können bei dem Newsletter manuell hinzugefügt werden.
* Neben Artikelgruppen-bezeichnugn und -nummer wird nun auch der Zusatz abgefragt.
* Filter für russische Buchstaben hinzugefügt (URL)
* Menübar dockt beim Scrollen an
* Auswahlmöglichkeit der Artikeldaten aus 3xiosart-Tabelle in CMS entwickelt (Shop -> Grundeinstellungen)
* Dieser Changelog wird bei den Updates angezeigt.
* Bei Katalog, News, Termin kann im Menü entschieden werden, ob direkt zum Eintrag gesprungen werden soll, wenn nur einer vorhanden ist.

### Bug Fixes
* Im Termin-Modul in Portalen werden nur noch kommende Termine angezeigt
* Im CMS wird Links in Katalog, Termin und News der Titel geschlöscht, wenn der Link entfernt wird
* Login-Probleme im CMS behoben
* Neukunden können keine Benutzer mehr anlegen
* Bei Änderung der E-Mail Adresse in Rechnungsadresse und Benutzerverwaltung, kann keine bereits existierende E-Mail Adresse mehr eingegeben werden
* Beim Ausführen der Registrierung, wird Button "disabled", bis Rückmeldung vom Server vorhanden ist. Im Erfolgsfall wird Seite aktualisiert, im Fehlerfall erscheint Fehlermeldung und Button wird wieder "enabled".
* Fehlerhafte und verwirrende Rückmeldung bei Benutzerverwaltung angepasst
* Fehler bei der Sortierung von Adressen behoben

# 16.1.0
### Features
* An Piwik können nun Nutzerdaten übergeben werden
* Neue Shop-Option, welche es dem Shopbetreiber ermöglicht, bei jeder Kundenkontoänderung per E-Mail informiert zu werden

### Bug Fixes
* Wenn neuer Benutzer erstellt wurde, werden die Input-Felder nun geleert.

### Note
* Funktion für Merkzettel und Angebot aus Detail-Controller auch in Listen-Controller übernommen (wurde bisher sonst immer in kdsp_zusatz.js kopiert)

# 16.0.2
### Features
* Zeiträume für News, Katalog und Termin in CMS auswählbar

### Bug Fixes
* Passwort ändern in "Mein Konto" geht wieder

### Note
* PHPMailer - Sicherheitsupdate