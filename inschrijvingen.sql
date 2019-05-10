USE `lo8e_sql2`;
INSERT INTO klassen (klas_code, slb_code, cohort, opleiding_code)
VALUES ("lo9e-amo1","akr02","2019","amo"),
	   ("lo9e-amo2","bkr02","2019","amo"),
	   ("lo9e-amo3","brc01","2019","amo");

INSERT INTO studenten (ov_nummer, achternaam, tussenvoegsel, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, inschrijvings_datum)
VALUES ("90000","Barikzai",NULL,"Samir","15-10-2001","1111 AB","Leiden","105.2","2.11","16-10-2001"),
	   ("90001","Ruiter","de","Kristian","25-11-2001","1112 BC","Leiden","104.8","2.10","26-11-2001"),
       ("90002","Marrawi",NULL,"Hasan","15-05-1999","1113 CD","Leiden","103.5","0.56","16-05-1999"),
       ("90003","Schouten",NULL,"Timo","19-03-2002","2224 GJ","Katwijk","72.4","1.87","20-03-2002");
       
INSERT INTO klassen_studenten (ov_nummer, klas_code)
VALUES ("90000","lo9e-amo1"),
	   ("90001","lo9e-amo1"),
       ("90002","lo9e-amo2"),
       ("90003","lo9e-amo3");
       
UPDATE studenten
SET geboortedatum = "2001-10-16"
WHERE ov_nummer = "90000";

UPDATE studenten
SET actief = "0"
WHERE inschrijvings_datum < 2017-1-1;

SELECT studenten.ov_nummer, CONCAT(studenten.voornaam, studenten.tussenvoegsel, studenten.achternaam) AS volledige_naam, klassen.klas_code, klassen.cohort, CONCAT(docenten.voorletters, docenten.tussenvoegsel, docenten.achternaam) AS docent_naam
FROM studenten
LEFT JOIN klassen_studenten ON studenten.ov_nummer = klassen_studenten.ov_nummer
LEFT JOIN klassen ON klassen_studenten.klas_code = klassen.klas_code
LEFT JOIN docenten ON klassen.slb_code = docenten.docent_code
ORDER BY klassen.klas_code ASC
 
	
	

