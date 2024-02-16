# flutter_application_2
# Workout_App_For_Bodybuilders

Dokumentaatio sovelluksesta flutter_application_2
Mitä sovellus tekee:

Loimme sovelluksen, joka on tarkoitettu kuntosali harjoittelijoille. Sovellusta voisi käyttää Personal Trainer joka, myy sovelluksen omille asiakkailleen. Sovelluksesta löytyy valmentajan tiedot, valmiita treeniohjelmia, ja mahdollisuus kirjata omia harjoituksia ylös. 

Ketkä sen ovat tehneet:

 Eetu Paananen ja Veeti Kukkonen

Mitä ominaisuuksia sovelluksessa on:

Sovellus toimii lähtökohtaisesti kurssin ohjeistuksen mukaan. Repon avattua käyttäjä voi ajaa sovelluksen selaimessa tai Android emulaattorissa. 
Sovelluksessa on autentikointi ja rekisteröinti vaihtoehdot, kun sovelluksen käynnistää. Sovelluksessa on yhteys Firebase tietokantaan, jonne voi tallentaa omia treenejä. Tallennukset on luokiteltu rekisteröidyn käyttäjän mukaan. Lisäksi sovellus lataa vanhat harjoitukset firebasestä, muokkaa niitä tai voit myös poistaa harjoituksen

Paketteja on ladattu seuraavat:

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  intl: ^0.18.0
  provider: ^6.1.1
  path_provider: ^2.1.2
  path: ^1.8.3
  
  firebase_core: ^2.24.2
  firebase_auth: ^4.16.0
  firebase_ui_auth: ^1.12.1
  firebase_database: ^10.4.0
  firebase_core_web: 2.10.0


Mitä ulkoisia palveluita se käyttää:
Firebase tietokantaa
Hakee syke kuntosalin aukioloajat

Mitä puhelimen ominaisuuksia se käyttää
Toimii puhelimen käyttöliittymässä. Ei muita ominaisuuksia esim kamera

Mitä näkymiä siinä on:
•	Login  <br />
•	Register  <br />
•	Main View <br />
•	Coach View <br />
•	Ready trainings View <br />
•	Task view <br />
•	Add Task View <br />

Perustuuko se johonkin esimerkkikoodiin:
Ei perustu lähdekoodiin. Sovelluksessa käytetty toki kurssin aikana opittuja tekniikoita ja mallia on otettu siitä kurssin tehtävästä.

Onko toteutuksessa hyödynnetty tekoälyä:
On käytetty esimerkiksi ChatGPT:tä joissain kohdissa, esimerkiksi ongelmien ratkomisessa. Eetu Paananen latasi projektin loppuvaiheessa myös GitHub CoPilotin joka on tekoäly, mikä osaa ehdottaa ratkaisuja ongelmiin. Copilot ei mielestäni ollut hirveän hyödyllinen, sillä errorit joutui loppupeleissä aina ratkomaan itse. Sovellus on rakennettu itse ja siihen on käytetty erittäin runsaasti työaikaa. 
