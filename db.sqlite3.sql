BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "mainapp_reporte" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"patrulla"	varchar(10) NOT NULL,
	"sexo"	varchar(1) NOT NULL,
	"lugar"	varchar(50) NOT NULL,
	"incidente"	text NOT NULL,
	"fecha"	datetime NOT NULL,
	"foto"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "mainapp_punto" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nombre"	varchar(50) NOT NULL,
	"desc"	varchar(255) NOT NULL,
	"lat"	real NOT NULL,
	"Lng"	real NOT NULL,
	"categoria"	varchar(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO mainapp_punto VALUES (10,'Caseta de cobro plan de ayala','Caseta de cobro plan de ayala',25.446824969965,-101.303249117568,'caseta');
INSERT INTO mainapp_punto VALUES (11,'Caseta de cobro sabinas','Caseta de cobro Sabinas',27.2089783128488,-101.230039577713,'caseta');
INSERT INTO mainapp_punto VALUES (16,'Gasolinera 9537 Servicio San Jose','Gasolinera 9537 Servicio San Jose',25.3739253,-101.4782958,'gasolinera');
INSERT INTO mainapp_punto VALUES (17,'Gasolinera PEMEX','Gasolinera PEMEX',25.379427,-101.477135,'gasolinera');
INSERT INTO mainapp_punto VALUES (18,'Gasolinera PEMEX','Gasolinera PEMEX',25.2655799,-101.0910057,'gasolinera');
INSERT INTO mainapp_punto VALUES (19,'Gasolinera PEMEX','Gasolinera PEMEX',25.2564541,-101.1169051,'gasolinera');
INSERT INTO mainapp_punto VALUES (20,'Gasolinera Cargo GAS','La encantada',25.2854567,-101.08582,'gasolinera');
INSERT INTO mainapp_punto VALUES (21,'Gasolinera PEMEX','Gasolinera PEMEX',25.4948499,-101.3648807,'gasolinera');
INSERT INTO mainapp_punto VALUES (22,'Gasolinera PEMEX','Gasolinera PEMEX',25.4633905,-102.1745653,'gasolinera');
INSERT INTO mainapp_punto VALUES (23,'Gasolinera PEMEX','Gasolinera PEMEX',25.4475175,-102.1719899,'gasolinera');
INSERT INTO mainapp_punto VALUES (24,'Gasolinera PEMEX','Gasolinera PEMEX',25.6503318,-102.1462898,'gasolinera');
INSERT INTO mainapp_punto VALUES (25,'Gasolinera PEMEX','Gasolinera PEMEX',26.002611,-101.2964532,'gasolinera');
INSERT INTO mainapp_punto VALUES (26,'Gasolinera PEMEX','Gasolinera PEMEX',25.5431697,-100.9478562,'gasolinera');
INSERT INTO mainapp_punto VALUES (27,'Gasolinera PEMEX','Gasolinera PEMEX',25.5949946,-100.8794398,'gasolinera');
INSERT INTO mainapp_punto VALUES (28,'Gasolinera PEMEX','Gasolinera PEMEX',25.6133596,-100.8398205,'gasolinera');
INSERT INTO mainapp_punto VALUES (29,'Gasolinera PEMEX','Gasolinera PEMEX',25.6259484,-102.8756496,'gasolinera');
INSERT INTO mainapp_punto VALUES (30,'Gasolinera Oxxo Gas','Gasolinera Oxxo Gas',25.4086832,-100.9790539,'gasolinera');
INSERT INTO mainapp_punto VALUES (31,'Gasolinera PEMEX','Gasolinera PEMEX',25.426866,-100.9771689,'gasolinera');
INSERT INTO mainapp_punto VALUES (32,'Gasolinera PEMEX','Gasolinera PEMEX',25.4358915,-100.984563,'gasolinera');
INSERT INTO mainapp_punto VALUES (33,'Oxxo Percheron','Oxxo Percheron',25.4052107,-100.9746633,'gasolinera');
INSERT INTO mainapp_punto VALUES (34,'Gasolinera Los Pinos','Gasolinera Los Pinos',25.5360971,-100.9655631,'gasolinera');
INSERT INTO mainapp_punto VALUES (35,'Gasolinera PEMEX','Gasolinera PEMEX',25.5597789,-100.9230706,'gasolinera');
INSERT INTO mainapp_punto VALUES (36,'Gasolinera PEMEX','Gasolinera PEMEX',25.5520463,-100.9548555,'gasolinera');
INSERT INTO mainapp_punto VALUES (37,'Gasolinera Oxxo Gas','Gasolinera Oxxo Gas',25.4430272,-100.8653427,'gasolinera');
INSERT INTO mainapp_punto VALUES (38,'Gasolinera Oxxo Gas','Gasolinera Oxxo Gas',25.4435537,-100.8341532,'gasolinera');
INSERT INTO mainapp_punto VALUES (39,'Gasolinera PEMEX','Gasolinera PEMEX',25.4464448,-100.8442587,'gasolinera');
INSERT INTO mainapp_punto VALUES (40,'Gasolinera PEMEX','Gasolinera PEMEX',25.4435865,-100.8648301,'gasolinera');
INSERT INTO mainapp_punto VALUES (41,'Gasolinera Petro Seven','Gasolinera Petro Seven',25.4350541,-100.913364,'gasolinera');
INSERT INTO mainapp_punto VALUES (42,'Gasolinera','Gasolinera',25.2042183,-100.7838465,'gasolinera');
INSERT INTO mainapp_punto VALUES (43,'Gasolinera PEMEX','Gasolinera PEMEX',25.02234,-100.54562,'gasolinera');
INSERT INTO mainapp_punto VALUES (44,'Gasolinera PEMEX','Gasolinera PEMEX',25.1685723,-100.722991,'gasolinera');
INSERT INTO mainapp_punto VALUES (45,'MI GASOLINA MATAMOROS','Av Cuauhtémoc 297, Centro, 27440 Matamoros, Coah.',25.5303768,-103.2292717,'gasolinera');
INSERT INTO mainapp_punto VALUES (46,'MI GASOLINA','Carretera Torreón - Matamoros Km 251',25.5386631,-103.2279324,'gasolinera');
INSERT INTO mainapp_punto VALUES (47,'CARGO GAS SAN JUAN','Carretera Saltillo-Torreon, Km. 257, Ejido Santo Tomás, 27440 Matamoros, Coah.',25.5356201,-103.2528791,'gasolinera');
INSERT INTO mainapp_punto VALUES (48,'SERVICIO MARTILLO','Carr. Torreón - Matamoros 9020, Jardines Universidad, 27087 Torreón, Coah',25.5341662,-103.3182419,'gasolinera');
INSERT INTO mainapp_punto VALUES (49,'PETRO SEVEN','Carr. Torreón - Matamoros #9100, Villas Universidad, 27275 Torreón, Coah',25.5347299,-103.3198451,'gasolinera');
INSERT INTO mainapp_punto VALUES (50,'GASOLINERA LA AMISTAD','Carr. Torreón - Matamoros 53, La Amistad, 27054 Torreón, Coah',25.5347086,-103.3384531,'gasolinera');
INSERT INTO mainapp_punto VALUES (51,'GASOLINERA CARGO GA','Carr. Torreón - Matamoros 9200, José de las Fuentes, 27086 Torreón, Coah.',25.5344048,-103.3227164,'gasolinera');
INSERT INTO mainapp_punto VALUES (52,'GASOLINERA MARTILO','Carr. Torreón - Matamoros, Zaragoza, Ejido Zaragoza, 27277 Matamoros, Coa',25.5348543,-103.363465,'gasolinera');
INSERT INTO mainapp_punto VALUES (53,'GASOLINERA','Amp Valles del Nazas, 27083 Torreón, Coah',25.5413469,-103.3601914,'gasolinera');
INSERT INTO mainapp_punto VALUES (54,'GASOLINERA PEMEX','Periferico Raul Lopez Sanchez 2789, Ejido San Luis, 27054 Torreón, Coah',25.557867,-103.3782819,'gasolinera');
INSERT INTO mainapp_punto VALUES (55,'GASOLINERA XOCHIMILCO','Av Allende 4774, Villa California, 27000 Torreón, Coah.',25.5411599,-103.3963288,'gasolinera');
INSERT INTO mainapp_punto VALUES (56,'GASOLINA JUAREZ','Av. Juarez 4595, Villa California, 27085 Torreón, Coah',25.537772,-103.3994531,'gasolinera');
INSERT INTO mainapp_punto VALUES (57,'GASOLINERA PEMEX','Av. Juarez 4242, Villa California, 27089 Torreón, Coah.',25.5375474,-103.4029346,'gasolinera');
INSERT INTO mainapp_punto VALUES (58,'MI GASOLINA','Calz Saltillo 400 Int. 235, Residencial Campestre la Rosita, 27250 Torreón, Coah.',25.5316272,-103.4061308,'gasolinera');
INSERT INTO mainapp_punto VALUES (59,'CARGO GAS JOYITA','Av. Juarez 2901, Cuarto de Cobián Centro, 27000 Torreón, Coah',25.5384414,-103.4171983,'gasolinera');
INSERT INTO mainapp_punto VALUES (60,'GASOLINERA','Av Allende y, Primero de Cobián Centro, 27000 Torreón, Coah',25.541121,-103.4268145,'gasolinera');
INSERT INTO mainapp_punto VALUES (61,'GASOLINERA TORREON','Av. Allende, Eugenio Aguirre Benavides y, Primero de Cobián Centro, 27000 Torreón, Coah.',25.5411678,-103.4395542,'gasolinera');
INSERT INTO mainapp_punto VALUES (62,'MI GASOLINERA ALAMEDA','Blvrd Revolución 431, Primero de Cobián Centro, 27000 Torreón, Coah.',25.5359115,-103.4483782,'gasolinera');
INSERT INTO mainapp_punto VALUES (63,'GASOLINERA PEMEX','Blvrd Independencia, Primero de Cobián Centro, 27000 Torreón, Coah',25.5453673,-103.4528192,'gasolinera');
INSERT INTO mainapp_punto VALUES (64,'Gasolinera PEMEX','Blvd. Rogelio Montemayor 601, Niños Héroes, 27480 Viesca, Coah',25.3504698,-102.8052643,'gasolinera');
INSERT INTO mainapp_punto VALUES (65,'GASOLINERA','27296, Blvd. Gral. Pedro Verona Rodríguez Triana 4002, Villas la Merced, Torreón, Coah.',25.5065854,-103.4008113,'gasolinera');
INSERT INTO mainapp_punto VALUES (66,'GASOLINERA','Blvrd Revolución 1525, Antigua Aceitera, 27210 Torreón, Coah.',25.5346298,-103.4639788,'gasolinera');
INSERT INTO mainapp_punto VALUES (67,'GASOLINERA FRESNO','Carretera Estatal Finesterre Km 0 + 50, Fresnos del Nte., 27908 Francisco I. Madero',25.7485339,-103.2986973,'gasolinera');
INSERT INTO mainapp_punto VALUES (68,'GASOLINERA','Luis Donaldo Colosio S/N, Jaboncillo, Nuevo Linares, 27907 Francisco I. Madero, Coah.',25.7630767,-103.2815763,'gasolinera');
INSERT INTO mainapp_punto VALUES (69,'GASOLINERA','Entronque Carretera Torreón-San Pedro 25, Nueva Linares, del Sur, 27900 Francisco I. Madero, Coah.',25.7611401,-103.2444533,'gasolinera');
INSERT INTO mainapp_punto VALUES (70,'GASOLINA','San Pedro, Coah',25.755385,-103.0291294,'gasolinera');
INSERT INTO mainapp_punto VALUES (71,'GASOLINERA','San Pedro, Coah',25.7573949,-103.020203,'gasolinera');
INSERT INTO mainapp_punto VALUES (72,'GASOLINERA','El Ancora, Ejido el Ancora, 27810 San Pedro, Coah',25.7596877,-102.9975474,'gasolinera');
INSERT INTO mainapp_punto VALUES (73,'GASOLINERA PEMEX','Galeana 105, Centro, 27800 San Pedro, Coah.',25.7551596,-102.9884807,'gasolinera');
INSERT INTO mainapp_punto VALUES (74,'MI GASOLINA SAN PEDRO','Miguel Hidalgo, Centro, 27800 San Pedro, Coah',25.7586638,-102.9822449,'gasolinera');
INSERT INTO mainapp_punto VALUES (75,'GASOLINERA Lázaro Cárdenas 26','Lázaro Cárdenas 26, Lázaro Cárdenas, 27830 San Pedro, Coah',25.7641099,-102.9782495,'gasolinera');
INSERT INTO mainapp_punto VALUES (76,'GASOLINERA PEMEX','Av. Benito Juárez, Barrio de Saltillo, 27850 San Pedro, Coah.',25.7583367,-102.9763957,'gasolinera');
INSERT INTO mainapp_punto VALUES (77,'GASOLINERA PEMEX','Fundadores de San Pedro S/N, Zona Industrial, 27800 San Pedro, Coah',25.7524046,-102.9722993,'gasolinera');
INSERT INTO mainapp_punto VALUES (78,'GASOLINERA','Libramiento 9, Sin Nombre de Colonia, Burócratas Municipales, 27810 San Pedro, Coah.',25.7605428,-102.9994243,'gasolinera');
INSERT INTO mainapp_punto VALUES (79,'GASCO Gasolinera Estación de Servicio del Norte','PIEDRAS NEGRAS - NUEVO LAREDO 135, SAN JOAQUÍN, PARQUE INDUSTRIAL AEROPUERTO, PIEDRAS NEGRAS, COAHUILA',28.6453307,-100.5560307,'gasolinera');
INSERT INTO mainapp_punto VALUES (80,'GASCO Gasolinera Estación de Servicio del Norte','CARRETERA FEDERAL No. 57, VENUSTIANO CARRANZA, PARQUE INDUSTRIAL AEROPUERTO, 26090 PIEDRAS NEGRAS COAHUILA',28.6437126,-100.5579609,'gasolinera');
INSERT INTO mainapp_punto VALUES (81,'GASOLINERA PEMEX','BLVD. REPÚBLICA 107 SECCION 1, EJIDO PIEDRAS NEGRAS, 26015 PIEDRAS NEGRAS, COAHUILA',28.7158477,-100.5617781,'gasolinera');
INSERT INTO mainapp_punto VALUES (82,'GASOLINERA PEMEX. ESTACIÓN ANÁHUAC','AV. EMILIANO CARRANZA 40, ZONA CENTRO 26000 PIEDRAS NEGRAS COAHUILA',28.7020139,-100.5208938,'gasolinera');
INSERT INTO mainapp_punto VALUES (83,'GASCO. SERVICIO FRONTERIZO','HEROICO COLEGIO MILITAR 854, ROMA 26010 PIEDRAS NEGRAS COAHUILA',28.7049502,-100.5263202,'gasolinera');
INSERT INTO mainapp_punto VALUES (84,'GASOLINERA PEMEX','ZONA CENTRO, VILLA UNIÓN COAHUILA',28.2243778,-100.7257482,'gasolinera');
INSERT INTO mainapp_punto VALUES (85,'SERVICIO GONZALEZ DE ACUÑA, SA De CV.','CARRETERA ACUÑA-ZARAGOZA KM 100 MAS 600 S/N CALLE GUERRERO, 26620 CD. ACUÑA, COAHUILA',29.298057,-100.916236,'gasolinera');
INSERT INTO mainapp_punto VALUES (86,'GASOLINERA GASCO','CARRETERA PRESA LA AMISTAD S/N, ATILILANO BARRERA, 26230 CD. ACUÑA',29.3335568,-100.9623109,'gasolinera');
INSERT INTO mainapp_punto VALUES (87,'SERVIGAS RIO GRANDE (Allende)','Benito Juárez Nte. 862, Las Brisas, Allende, Coah',28.3589081,-100.8568087,'gasolinera');
INSERT INTO mainapp_punto VALUES (88,'Gasolinera Pemex (Allende)','México 57, Coahuila de Zaragoza',28.3192147,-100.8947158,'gasolinera');
INSERT INTO mainapp_punto VALUES (89,'GASCO Gasolinera Super Gas Morelos','Morelos',28.3837671,-100.8519072,'gasolinera');
INSERT INTO mainapp_punto VALUES (90,'SERVICIO DIPAROSA S.A. DE C.V.','Guerrero 300 Ote, Zona Centro, 26500 Morelos, Coah.',28.407346,-100.8853376,'gasolinera');
INSERT INTO mainapp_punto VALUES (91,'Gasolinera Servicio Tres Caminos S.A. de C.V','Vicente Guerrero 501, Verde, Zona Centro, 26500 Morelos, Coah',28.4087427,-100.8835351,'gasolinera');
INSERT INTO mainapp_punto VALUES (92,'MEGA SERVICIO RODY S.A. DE C.V.','Venustiano Carranza 201 Pte, Zona Centro, 26530 Allende, Coah',28.3360517,-100.8508951,'gasolinera');
INSERT INTO mainapp_punto VALUES (93,'Gasolinera','Nuevo Laredo - Piedras Negras, Guerrero, Coah',28.3349854,-100.3886456,'gasolinera');
INSERT INTO mainapp_punto VALUES (94,'Servigas Rio Grande','Guerrero, Coah',28.3397259,-100.3897614,'gasolinera');
INSERT INTO mainapp_punto VALUES (95,'Gas La Joya (Nava)','Carretera Federal 57, Agua de Afuera, Coah.',28.4492785,-100.7479466,'gasolinera');
INSERT INTO mainapp_punto VALUES (96,'Gasolinera El Encino','Nava, Coah.',28.4467291,-100.7520775,'gasolinera');
INSERT INTO mainapp_punto VALUES (97,'SERVICIO KACERÍN S.A. DE C.V.','Venustiano Carranza 650, Zona Centro, 26170 Nava, Coah',28.4228547,-100.7619278,'gasolinera');
INSERT INTO mainapp_punto VALUES (98,'SERVICIO OSGUAR','Venustiano Carranza #790, CENTRO, 26170 Nava, Coah',28.4218822,-100.7737024,'gasolinera');
INSERT INTO mainapp_punto VALUES (99,'GASOLINERA EL CHINO','5 de Mayo 600, Juárez, Coah',27.6120812,-100.7254769,'gasolinera');
INSERT INTO mainapp_punto VALUES (100,'GASOLINERA VILLAREAL','La Placita, 26340 Santa Rosa de Múzquiz, Coah.',27.8870557,-101.5212645,'gasolinera');
INSERT INTO mainapp_punto VALUES (101,'GASOLINERA EL PASO DEL COYOTE','Carretera Rosita Muzquiz Km 4.9 #1000C, ES 8830, 26887 San Juan de Sabinas, Coah.',27.947383,-101.2466658,'gasolinera');
INSERT INTO mainapp_punto VALUES (102,'OXXO GAS','Cuauhtémoc # 911 Poniente Col, Reinera, Sabinas, Coah.',27.8618693,-101.1181828,'gasolinera');
INSERT INTO mainapp_punto VALUES (103,'GASOLINERA','iguel Hidalgo 55, Zona Centro, 26350 Palau, Coah.',27.8898691,-101.4230793,'gasolinera');
INSERT INTO mainapp_punto VALUES (104,'GASOLINERA PEMEX','CALLE JOSE MARIA PINO SUAREZ ESQUINA CON ABASOLO, PUEBLO NUEVO, SAN BUENAVENTURA',27.0738011,-101.5398547,'gasolinera');
INSERT INTO mainapp_punto VALUES (105,'GASOLINERA','SABINAS- MONCLOVA, LAS ADJUNTAS,COAHUOLA',27.2359829,-101.2271838,'gasolinera');
INSERT INTO mainapp_punto VALUES (106,'VIPERS GAS','CARRETERA, ABASOLO KM 2, PUEBLO NUEVO, SAN BUENAVENTURA, COAHUILA',27.0702988,-101.5462638,'gasolinera');
INSERT INTO mainapp_punto VALUES (107,'GASOLINERA PEMEX','CARR. 30, No. 2000, SAN ANTONIO, 25810, FRONTERA, COAHUILA',26.998404,-101.4924187,'gasolinera');
INSERT INTO mainapp_punto VALUES (108,'GASOLINERA GULF','Carretera 30 Km. 13 204, México 30, 8 de Enero, 25800 Ocho de Enero, Coah',27.0037199,-101.4964504,'gasolinera');
INSERT INTO mainapp_punto VALUES (109,'GASOLINERA AMC LIBRAMIENTO','Lib. Lic. Carlos Salinas de Gortari 1300, Regidores, 25618 Frontera, Coah.',26.9691796,-101.4484113,'gasolinera');
INSERT INTO mainapp_punto VALUES (110,'GASOLINERA EL VENADO','Km 78, México 57 10, Industrial, 25733 Monclova, Coah.',26.9874154,-101.3697981,'gasolinera');
INSERT INTO mainapp_punto VALUES (111,'GASOLINERA PEMEX','Blvrd San Jose 1200, Fraccionamiento Hipódromo, 25746 Monclova, Coah.',26.9167554,-101.4030281,'gasolinera');
INSERT INTO mainapp_punto VALUES (112,'ESTACION MONKY','Carretera Federal 57 (MONTERREY-MONCLOVA 57 2502, Coah.',26.7570328,-101.4097105,'gasolinera');
INSERT INTO mainapp_punto VALUES (113,'GASOLINERA PEMEX','Francisco I. Madero 105, Cuatro Ciénegas de Carranza, Zona Centro, 27640 Cuatrociénegas, Coah.',26.9840411,-102.0651713,'gasolinera');
INSERT INTO mainapp_punto VALUES (114,'GASOLINERA PEMEX','México 30 1505, Centro, 27640 Coah.',26.9911209,-102.0400749,'gasolinera');
INSERT INTO mainapp_punto vALUES (115,'PETRO SEVEN','Eulalio Gutiérrez LB, Villas de Guadalupe, Castaños, Coah.',26.7830505,-101.4164713,'gasolinera');
INSERT INTO mainapp_punto VALUES (116,'GASOLINERA PEMEX','Coahuila de Zaragoza, México',27.0325507,-101.5782454,'gasolinera');
INSERT INTO mainapp_punto VALUES (117,'GASOLINERA','Carretera 30 Km. 18 de Febrero, 25500 Nadadores, Coah.',27.0445454,-101.5298124,'gasolinera');
INSERT INTO mainapp_punto VALUES (118,'PEMEX OPERADORA DE COMBUSTIBLES GONZALEZ SA D E CV','MÉXICO 2 620, JIMENEZ COAHUILA',29.0553721,-100.6791539,'gasolinera');
INSERT INTO mainapp_punto VALUES (119,'GASOLINERA PEMEX','HIDALGO 702 CENTRO, ZONA CENTRO, 26450 ZARAGOZA COAHUILA',28.4859571,-100.9179231,'gasolinera');
INSERT INTO mainapp_punto VALUES (120,'GASOLINERA DYNAMI','86, MIGUEL HIDALGO, ZONA CENTRO, 26450 ZARAGOZA COAHUILA',28.4982202,-100.9212838,'gasolinera');
INSERT INTO mainapp_punto VALUES (121,'CASETA DE COBRO LA CUCHILLA','México 40, El Sol, Coah',25.6278603,-102.8792205,'caseta');
INSERT INTO mainapp_punto VALUES (122,'CASETA DE COBRO PLAN DE AYALA','CASETA DE COBRO PLAN DE AYALA',25.4441331,-101.3039404,'caseta');
INSERT INTO mainapp_punto VALUES (123,'CASETA DE PEAJE , PLAZA DE COBRO TORREON','Saltillo, Coah',25.4484097,-101.0668628,'caseta');
INSERT INTO mainapp_punto VALUES (124,'CASETA DE CUOTA','Coahuila de Zaragoza',25.4566521,-101.0643128,'caseta');
INSERT INTO mainapp_punto VALUES (125,'CASETA DE COBRO HUACHICHIL','Capilla de Artesillas, Coah.',25.2457177,-100.8014869,'caseta');
INSERT INTO mainapp_punto VALUES (126,'CASETA DE COBRO CARBONERA OJO CALIENTE','6, Av. Ruiz Cortines 3140, Monterrey, Coah.',25.5110955,-100.8682971,'caseta');
INSERT INTO mainapp_punto VALUES (127,'PLAZA DE COBRO OJO CALIENTE','6, Av. Ruiz Cortines 3140, Monterrey, Coah.',25.6124086,-100.9133895,'caseta');
INSERT INTO mainapp_punto VALUES (128,'CASETA DE COBRO AUTOPISTA PREMIER','CASETA DE COBRO AUTOPISTA PREMIER',28.303802,-100.909956,'caseta');
INSERT INTO mainapp_punto VALUES (129,'Fiscalia General de Coahuila (SURESTE)','Delegación Sureste',25.456624,-101.017559,'fiscalia');
INSERT INTO mainapp_punto VALUES (130,'DSPM SALTILLO','DSPM SALTILLO',25.415586,-100.976748,'fiscalia');
INSERT INTO mainapp_punto VALUES (131,'Policía Ambiental de Saltillo','Policía Ambiental de Saltill',25.402968,-100.9989892,'fiscalia');
INSERT INTO mainapp_punto VALUES (132,'Policia Preventiva Municipal Delegacion Sur','Policia Preventiva Municipal Delegacion Sur',25.397865,-101.009534,'fiscalia');
INSERT INTO mainapp_punto VALUES (133,'DSMP Ramos Arizpe','DSMP Ramos Arizpe',25.5454556,-100.9398696,'fiscalia');
INSERT INTO mainapp_punto VALUES (134,'Delegación de Policía y Transito','Delegación de Policía y Transito',25.4363336,-101.007603,'fiscalia');
INSERT INTO mainapp_punto VALUES (135,'DSMP Arteaga','DSMP Arteaga',25.4454472,-100.8581971,'fiscalia');
INSERT INTO mainapp_punto VALUES (136,'Procuraduría General de Justicia del Estado Delega','Procuraduría General de Justicia del Estado Delegación Laguna II',25.4448151,-102.1736918,'fiscalia');
INSERT INTO mainapp_punto VALUES (137,'Policía Gobierno del Estado de Coahuila','Policía Gobierno del Estado de Coahuila',25.4838578,-102.1728528,'fiscalia');
INSERT INTO mainapp_punto VALUES (138,'DSPM General Ceped','DSPM General Ceped',26.990364,-102.0539163,'fiscalia');
INSERT INTO mainapp_punto VALUES (139,'Fiscalia General de Coahuila','Delegación Laguna I',25.5668489,-103.385336,'fiscalia');
INSERT INTO mainapp_punto VALUES (140,'Fundadores de San Pedro','Fundadores de San Pedro',25.7490084,-102.9707801,'fiscalia');
INSERT INTO mainapp_punto VALUES (141,'POLICIA DEL ESTADO MATAMORO','Coahuila, Fraccionamiento Valle Hermoso, 27440 Matamoros, Coah',25.5330582,-103.249525,'fiscalia');
INSERT INTO mainapp_punto VALUES (142,'SEGURIDAD PUBLICA DE MATAMOROS','José Santos Valdéz SN, Los Lirios, 27440 Matamoros, Coah.',25.5272028,-103.2335022,'fiscalia');
INSERT INTO mainapp_punto VALUES (143,'FISCALIA GENERAL DEL COAHUILA DE TORREON','Delicias SN, Primero de Cobián Centro, 27000 Torreón, Coah.',25.5344165,-103.4475587,'fiscalia');
INSERT INTO mainapp_punto VALUES (144,'DSPM VIESCA','iguel Hidalgo 38, Centro, 27480 Viesca, Coah.',25.3431286,-102.8049814,'fiscalia');
INSERT INTO mainapp_punto VALUES (145,'POLICIA ESTATAL FRANCISCO I MADERO','16 de Septiembre 10, Madero, 27900 Francisco I. Madero, Coah',25.7699949,-103.272284,'fiscalia');
INSERT INTO mainapp_punto VALUES (146,'FISCALIA MONCLOVA','Zaragoza Sur 533, Centro, Zona Centro, 25700 Monclova, Coah.',26.8931766,-101.4215801,'fiscalia');
INSERT INTO mainapp_punto VALUES (147,'DIRECCION DE SEGURIDAD PUBLICA CANDELA','Gral. Cepeda, Candela, Coah.',26.8401522,-100.6579982,'fiscalia');
INSERT INTO mainapp_punto VALUES (148,'POLICIA MUNICIPAL FRONTERA','Ferrocarril 203, Pemex, 25630 Frontera, Coah.<br>+52 866 634 7890',26.9404145,-101.4407808,'fiscalia');
INSERT INTO mainapp_punto VALUES (149,'DIRECCION DE SEGURIDAD PUBLICA MUNICIPAL  SACRAMEN','Miguel Hidalgo, Centro, 27750 Sacramento, Coah.',27.0047736,-101.7251816,'fiscalia');
INSERT INTO mainapp_punto VALUES (150,'FISCALÍA REGIÓN NORTE 2','AV. CAPITAN JORGE LUIS FLORES ENRIQUEZ #1090-B, MUNICIPIO LIBRE, 26235 CD. ACUÑA, COAHUILA',29.3298401,-100.9762984,'fiscalia');
INSERT INTO mainapp_punto VALUES (151,'DSPM NAVA','Zaragoza 119, Zona Centro, 26170 Nava, Coah.',28.4219707,-100.7674268,'fiscalia');
INSERT INTO mainapp_punto VALUES (152,'FISCALIA ALLENDE','Zona Centro, 26230 Allende, Coah.',28.3538554,-100.8579101,'fiscalia');
INSERT INTO mainapp_punto VALUES (153,'FISCALIA PIEDRAS NEGRAS.','FISCALÍA GENERAL DE PIEDRAS NEGRAS',28.6961236,-100.5637769,'fiscalia');
INSERT INTO mainapp_punto VALUES (154,'DSPM ALLENDE','Calle Ramos Arizpe SN-C IMPRESOS ALLENDE, Zona Centro, 26230 Allende, Coah',28.3472835,-100.8548423,'fiscalia');
INSERT INTO mainapp_punto VALUES (155,'DELEGACIÓN POLICÍA Y TRÁNSITO. PIEDRAS NEGRAS','16 DE SEPTIEMBRE, LAS FUENTES, 26010 PIEDRAS NEGRAS COAHUILA',28.7034635,-100.5385328,'fiscalia');
INSERT INTO mainapp_punto VALUES (156,'DSPM MORELOS','C. Rayon, Zona Centro, 26500 Morelos, Coah.',28.4104099,-100.8865441,'fiscalia');
INSERT INTO mainapp_punto VALUES (157,'DSPM GUERRERO','Calle Lic. Raúl Lopez Sanchez, Guerrero, Coah.',28.3084762,-100.3787427,'fiscalia');
INSERT INTO mainapp_punto VALUES (158,'SEGURIDAD PUBLICA MUNICIPAL DE ACUÑA, COAHUILA.','CALLE 7 882, 1 DE MAYO 26280. CIUDAD. ACUÑA',29.3141242,-100.9524266,'fiscalia');
INSERT INTO mainapp_punto VALUES (159,'MINISTERIO PUBLICO ZARAGOZA COAHUILA','G36M+38 ZARAGOZA COAHUILA',28.5105692,-100.9163724,'fiscalia');
INSERT INTO mainapp_punto VALUES (160,'DELEGACIÓN NORTE I PIEDRAS NEGRAS','BLVD. REPUBLICA 202, CUMBRES AMP. 26080 PIEDRAS NEGRAS',28.6824575,-100.5680541,'fiscalia');
INSERT INTO mainapp_punto VALUES (161,'SEGURIDAD PUBLICA PIEDRAS NEGRAS','LAS AMERICAS, CENTRAL 26070 PIEDRAS NEGRAS COAHUILA',28.686021,-100.552403,'fiscalia');
INSERT INTO mainapp_punto VALUES (162,'DELEGACION DE LA REGION NORTE II ACUÑA COAHUILA','JORGE LUIS FLORES ENRIQUEZ 855 COLONIA AEROPUERTO, ZONA CENTRO',29.3183598,-100.932456,'fiscalia');
INSERT INTO mainapp_punto VALUES (163,'FIscalia General de Coahuila','DELEGACIÓN CARBONÍFERA',27.8486991,-101.106625,'fiscalia');
INSERT INTO mainapp_punto VALUES (164,'COMANDANCIA DE POLICIA DE SABINAS','Residencial Lomas, Sabinas, Coah.',27.8861567,-101.1457274,'fiscalia');
INSERT INTO mainapp_punto VALUES (165,'DSPM JUAREZ','Benito Juárez 388, Juárez, Coah.',27.6066268,-100.7274238,'fiscalia');
INSERT INTO mainapp_punto VALUES (166,'POLICIA MUNICIPAL DE SAN JUAN DE SABINAS','San Juan de Sabinas, Coah.',27.9295615,-101.3039956,'fiscalia');
INSERT INTO mainapp_punto VALUES (167,'SEPAROS POLICIA MUNICIPAL NUEVA ROSITA','Querétaro, Libramiento Sur, 26890 Nueva Rosita, Coah.',27.9273506,-101.2163494,'fiscalia');
INSERT INTO mainapp_punto VALUES (168,'M.U. JUAREZ','POBLADO DON MARTIN - PRESA V.CARRANZA CARRETERA #23',27.522782,-100.6164785,'filtro');
INSERT INTO mainapp_punto VALUES (169,'M.U. Ejido Primero de Mayo','Calle Emiliano Zapata cruce con Miguel Hidalgo del ejido primero de mayo',27.2359642,-101.2262174,'filtro');
INSERT INTO mainapp_punto VALUES (170,'M.U. Escobedo','Carretera estatal #34 en los accesos de la cabecera',27.2263233,-101.4176319,'filtro');
INSERT INTO mainapp_punto VALUES (171,'M.U  Ejido Obayos','Carretera estatal #32 en la entrada del ejido Obayos',27.4414783,-101.3553912,'filtro');
INSERT INTO mainapp_punto VALUES (172,'M.U.  Ejido Primero de Mayo - M','Carretera Federal #57 Tramo Ejido Primero de mayo-monclova a la altura del KM 43',27.2357065,-101.226725,'filtro');
INSERT INTO mainapp_punto VALUES (173,'M.U ABASOLO','Salidas Barroterán- San buenaventura Carretera Estatal 34',27.1740915,-101.4316343,'filtro');
INSERT INTO mainapp_punto VALUES (174,'M.U ABASOLO','Salida de congregación los Rodríguez- Hermanas de la carretera Estatal 34 a la altura del libramiento.',27.2001666,-101.3580934,'filtro');
INSERT INTO mainapp_punto VALUES (175,'M.U - SAN JUAN DE SABINAS','CARRETERA ESTATAL #20 KM 5  A LA ALTURA DEL EJIDO PASO DEL COYOTE.',28.7781174,-102.6973683,'filtro');
INSERT INTO mainapp_punto VALUES (176,'M.U. Progreso','Entrada de Municipio Carretera #35',27.4288372,-100.9977122,'filtro');
INSERT INTO mainapp_punto VALUES (177,'PEC TORREON  1','PERIFERICO RAUL LOPEZ SANCHEZ, PUERTA AMARILLA',25.5753564,-103.4496761,'filtro');
INSERT INTO mainapp_punto VALUES (178,'PEC TORREON 2','FILTRO TORREON SANTA ANITACRUCE CON',25.5975524,-103.4291986,'filtro');
INSERT INTO mainapp_punto VALUES (179,'PEC MONCLOVA 1','ESTACION HERMANA SOBRE CARRETERA 57',27.234374,-101.2263121,'filtro');
INSERT INTO mainapp_punto VALUES (180,'PCC GRAL. CEPEDA','CARRETERA ESTATAL 105 A LA ALTURA DE FIESTA PATOS',25.3674423,-101.4806269,'filtro');
INSERT INTO mainapp_punto VALUES (181,'PCC ARTEAGA','PUESTO DE CONTROL A LA ALTURA DEL EJIDO CHAPULTEPEC SOBRE LA CARRETERA LIBRE 57',25.2414092,-100.8424741,'filtro');
INSERT INTO mainapp_punto VALUES (182,'M.U CANDELA 1','Carretera Estatal No. 48+500 tramo carretero Ocampo/Cuatro cienegas',27.1211718,-102.2052118,'filtro');
INSERT INTO mainapp_punto VALUES (183,'PCC SAN PEDRO 1','CALLE VIESCA Y AVENIDA JUAREZ ZONA CENTRO',25.757638,-102.98103,'filtro');
INSERT INTO mainapp_punto VALUES (184,'M.U  LAGUNA DEL REY 3','Carretera Estatal No 91 Laguna del Rey - tramo Sierra Mojada',27.2916156,-103.6752338,'filtro');
INSERT INTO mainapp_punto VALUES (185,'M.U LAGUNA DEL REY 2','Carretera Estatal # 91 tramo carretero Finisterre/Torreón',25.9972752,-103.1760706,'filtro');
INSERT INTO mainapp_punto VALUES (186,'PCC TORREON 1','PUENTE CARLOS HERRERA FALCON Y CALZADA RIO NAZAS',25.553968,-103.4584072,'filtro');
INSERT INTO mainapp_punto VALUES (187,'PCC PARRAS 2','CARRETERA ESTATAL PARRAS A LA ALTURA DE LA GLORIETA',25.4840457,-102.1724097,'filtro');
INSERT INTO mainapp_punto VALUES (188,'M.U. FRANCISCO I. MADERO  4','CARRETERA MADERO-FINISTERRE A LA ALTURA DEL EJIDO VIRGINIAS',25.8141462,-103.2763985,'filtro');
INSERT INTO mainapp_punto VALUES (189,'PCC SAN PEDRO 1','AV. DEGOLLADO Y CALLE JUAN ANTONIO DE LA FUENTE, ZONA CENTRO',25.754396,-102.982135,'filtro');
INSERT INTO mainapp_punto VALUES (190,'PAR PIEDRAS NEGRAS','CARRETERA FEDERAL #2 PIEDRAS NEGRAS/NUEVO LAREDO KM. 159',28.6064835,-100.5417588,'filtro');
INSERT INTO mainapp_punto VALUES (191,'PCC PIEDRAS NEGRAS. 2','PUENTE INTERNACIONAL #1 EN PIEDRAS NEGRAS.',28.7055311,-100.5121964,'filtro');
INSERT INTO mainapp_punto VALUES (192,'PCC PIEDRAS NEGRAS 1','PUENTE INTERNACIONAL #2 EN PIEDRAS NEGRAS',28.6973574,-100.5119567,'filtro');
INSERT INTO mainapp_punto VALUES (193,'PIEDRAS NEGRAS PAR','CARRETERA FEDERAL 2 KM 3 PIEDRAS NEGRAS-ACUÑA  A LA ALTURA DEL EJIDO PIEDRAS NEGRAS',28.7236818,-100.5688891,'filtro');
INSERT INTO mainapp_punto VALUES (194,'M.U  FRANCISCO I. MADERO','CARRETERA MADERO-FLORIDA A LA ALTURA DE TERMO ELECTRICA.',25.7694306,-103.3260963,'filtro');
INSERT INTO mainapp_punto VALUES (195,'PAR  SEMANA SANTA, RAMOS ARIZPE','Carretera federal 40 km 22 En el tramo Saltillo-Monterrey',25.5975545,-100.8763302,'filtro');
INSERT INTO mainapp_punto VALUES (196,'M.U. San Pedro','Carretera San Pedro-Torreon a la altura de Soriana',25.7575251,-103.0040805,'filtro');
INSERT INTO mainapp_punto VALUES (197,'PCC Saltillo','CARRETERA FEDERAL 54 A LA ALTURA DEL ENTRONQUE A TANQUE ESCONDID',24.76013,-101.1549561,'filtro');
INSERT INTO mainapp_punto VALUES (198,'PCC Ramos Arizpe','ARRETERA 57 KM 102 A LA ALTURA DE EX HACIENDA GUADALUPE',26.149012,-101.3527804,'filtro');
INSERT INTO mainapp_punto VALUES (199,'PEC, SEMANA SANTA NAVA','PUESTO DE CONTROL A LA ALTURA DE LOS ARCOS',28.4354663,-100.7632612,'filtro');
INSERT INTO mainapp_punto VALUES (200,'PAR - RAMOS ARIZPE 1','UNTO KIMBERLY CARRETERA 40 KM 21+500 TRAMO MTY RAMOS ARIZPE',25.594728,-100.8815337,'filtro');
INSERT INTO mainapp_punto VALUES (201,'M.U RAMOS ARIZPE 1','PUNTO KIMBERLY CARRETERA 40 KM 21+500 TRAMO MTY RAMOS ARIZPE',25.5941217,-100.8818406,'filtro');
INSERT INTO mainapp_punto VALUES (202,'PCC RAMOS ARIZPE 2','Carr Federal 57 Km 101 por Ex hacienda Guadalupe',26.1460202,-101.3544253,'filtro');
INSERT INTO "django_session" VALUES ('p824hy1mytz73i1a9iq0b01onlp1hl5z','NmNjZTM4ZTZkMTBkYjBlOWU0MGFkMzc4NzRhNWRlMDIzOWM3ZTAxNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNmUzYmNhOThkYWU5ZjFiYzY2ZDRmN2MyMWY0MDBkN2U2ZjVlMmU1In0=','2021-06-30 21:59:00.369060');
INSERT INTO "django_session" VALUES ('is1dqy0unywusf6usbjfjvzqdseldgs5','NmNjZTM4ZTZkMTBkYjBlOWU0MGFkMzc4NzRhNWRlMDIzOWM3ZTAxNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNmUzYmNhOThkYWU5ZjFiYzY2ZDRmN2MyMWY0MDBkN2U2ZjVlMmU1In0=','2021-07-02 20:35:30.795189');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$180000$9llzyVaFDVm2$m3eh5HBn/o77mXqfhRQ7eK3EAQlNDUqYAOrJcmxT+tY=','2021-06-18 20:35:30.706319',1,'lalo09','','lalo@mail.com',1,1,'2021-06-15 18:59:21.338886','');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_reporte','Can add Reporte');
INSERT INTO "auth_permission" VALUES (26,7,'change_reporte','Can change Reporte');
INSERT INTO "auth_permission" VALUES (27,7,'delete_reporte','Can delete Reporte');
INSERT INTO "auth_permission" VALUES (28,7,'view_reporte','Can view Reporte');
INSERT INTO "auth_permission" VALUES (29,8,'add_punto','Can add Punto');
INSERT INTO "auth_permission" VALUES (30,8,'change_punto','Can change Punto');
INSERT INTO "auth_permission" VALUES (31,8,'delete_punto','Can delete Punto');
INSERT INTO "auth_permission" VALUES (32,8,'view_punto','Can view Punto');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'mainapp','reporte');
INSERT INTO "django_content_type" VALUES (8,'mainapp','punto');
INSERT INTO "django_admin_log" VALUES (1,'2021-06-15 21:05:02.368012','12','','',7,1,3);
INSERT INTO "django_admin_log" VALUES (2,'2021-06-15 21:05:02.457520','11','2852','',7,1,3);
INSERT INTO "django_admin_log" VALUES (3,'2021-06-15 21:05:02.546148','10','','',7,1,3);
INSERT INTO "django_admin_log" VALUES (4,'2021-06-15 21:05:02.635010','9','','',7,1,3);
INSERT INTO "django_admin_log" VALUES (5,'2021-06-15 21:05:02.724021','8','','',7,1,3);
INSERT INTO "django_admin_log" VALUES (6,'2021-06-15 21:05:02.812957','7','o9l','',7,1,3);
INSERT INTO "django_admin_log" VALUES (7,'2021-06-15 21:05:02.890646','6','o9l','',7,1,3);
INSERT INTO "django_admin_log" VALUES (8,'2021-06-15 21:05:02.968359','5','wqe','',7,1,3);
INSERT INTO "django_admin_log" VALUES (9,'2021-06-15 21:05:03.023744','4','8','',7,1,3);
INSERT INTO "django_admin_log" VALUES (10,'2021-06-15 21:05:03.112662','3','8','',7,1,3);
INSERT INTO "django_admin_log" VALUES (11,'2021-06-15 21:05:03.178865','2','ewrer','',7,1,3);
INSERT INTO "django_admin_log" VALUES (12,'2021-06-15 21:05:03.245842','1','ew','',7,1,3);
INSERT INTO "django_admin_log" VALUES (13,'2021-06-15 21:05:24.739590','13','','',7,1,3);
INSERT INTO "django_admin_log" VALUES (14,'2021-06-15 21:50:01.990437','15','perro-2021-06-15 21:31:36.968955+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (15,'2021-06-15 21:50:02.066415','14','32e-2021-06-15 21:31:20.781039+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (16,'2021-06-15 22:24:03.972423','16','un reporte-2021-06-15 21:53:50.918719+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (17,'2021-06-15 22:50:08.753383','1','-2021-06-15 22:50:08.751253+00:00','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (18,'2021-06-15 22:53:01.256840','1','-2021-06-15 22:50:08.751253+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (19,'2021-06-15 22:53:09.170384','2','-2021-06-15 22:53:09.169494+00:00','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (20,'2021-06-15 22:53:27.597888','2','-2021-06-15 22:53:09.169494+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (21,'2021-06-15 22:53:36.362491','3','-2021-06-15 22:53:36.361314+00:00','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2021-06-15 23:19:23.978828','6','perrote-2021-06-15 23:19:00.028655+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (23,'2021-06-15 23:19:24.038398','5','88888-2021-06-15 23:09:56.836132+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (24,'2021-06-15 23:19:24.127269','4','9999-2021-06-15 23:07:06.898849+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (25,'2021-06-15 23:19:24.182706','3','-2021-06-15 22:53:36.361314+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (26,'2021-06-15 23:28:34.278009','10','111111-2021-06-15 23:28:05.264888+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (27,'2021-06-15 23:28:34.336372','9','Entrada a saltillo-2021-06-15 23:27:29.845754+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (28,'2021-06-15 23:28:34.402746','8','Torreon-2021-06-15 23:26:06.682579+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (29,'2021-06-15 23:28:34.491513','7','Saltillo-2021-06-15 23:20:53.861947+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (30,'2021-06-16 22:02:35.324680','1','Gasolinera Gasolinera','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (31,'2021-06-16 22:11:47.562254','2','Gasolinera Gasolinera','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (32,'2021-06-16 22:35:50.370670','3','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (33,'2021-06-16 22:37:35.919475','4','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (34,'2021-06-16 22:39:14.118202','5','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (35,'2021-06-16 22:42:11.518083','6','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (36,'2021-06-16 22:44:19.729344','7','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (37,'2021-06-16 22:46:21.283465','8','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (38,'2021-06-16 22:46:28.394033','8','Fiscalia Fiscalia','[{"changed": {"fields": ["Categoria"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (39,'2021-06-16 22:47:15.481722','9','Fiscalia Fiscalia','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (40,'2021-06-16 22:50:32.435654','10','Caseta de cobro plan de ayala Caseta de cobro plan de ayala','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (41,'2021-06-16 22:51:52.712724','11','Caseta de cobro sabinas Caseta de cobro Sabinas','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (42,'2021-06-16 22:52:18.670921','10','Caseta de cobro plan de ayala Caseta de cobro plan de ayala','[]',8,1,2);
INSERT INTO "django_admin_log" VALUES (43,'2021-06-16 22:52:32.489130','10','Caseta de cobro plan de ayala Caseta de cobro plan de ayala','[{"changed": {"fields": ["Longitud"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (44,'2021-06-16 22:54:03.210934','12','Filtro de seguridad 1 Filtro de seguridad 1','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (45,'2021-06-16 22:54:09.977904','12','Filtro de seguridad 1 Filtro de seguridad 1','[{"changed": {"fields": ["Categoria"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (46,'2021-06-16 22:54:46.638852','13','Filtro de seguridad 2 Filtro de seguridad 2','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (47,'2021-06-16 22:55:14.832767','14','Filtro de seguridad 3 Filtro de seguridad 3','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (48,'2021-06-16 22:55:40.980378','15','Filtro de seguridad 4 Filtro de seguridad 4','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (49,'2021-06-18 20:35:46.670009','2','sdfds-2021-06-18 20:35:07.671445+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (50,'2021-06-18 20:35:46.750101','1','8k89k-2021-06-16 23:03:33.791640+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (51,'2021-06-18 20:42:22.524665','3','perro-2021-06-18 20:36:15.895493+00:00','',7,1,3);
INSERT INTO "django_admin_log" VALUES (52,'2021-06-21 21:46:51.485613','12','Filtro de seguridad 1 Filtro de seguridad 1','',8,1,3);
INSERT INTO "django_admin_log" VALUES (53,'2021-06-22 18:38:14.948806','2','Gasolinera Gasolinera','',8,1,3);
INSERT INTO "django_admin_log" VALUES (54,'2021-06-22 18:38:15.434939','1','Gasolinera Gasolinera','',8,1,3);
INSERT INTO "django_admin_log" VALUES (55,'2021-06-22 18:40:40.267395','16','Gasolinera 9537 Servicio San Jose Gasolinera 9537 Servicio San Jose','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (56,'2021-06-22 18:40:58.688887','16','Gasolinera 9537 Servicio San Jose Gasolinera 9537 Servicio San Jose','[]',8,1,2);
INSERT INTO "django_admin_log" VALUES (57,'2021-06-22 18:41:35.549748','16','Gasolinera 9537 Servicio San Jose Gasolinera 9537 Servicio San Jose','[{"changed": {"fields": ["Latitud", "Longitud"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (58,'2021-06-22 18:42:43.332623','16','Gasolinera 9537 Servicio San Jose Gasolinera 9537 Servicio San Jose','[]',8,1,2);
INSERT INTO "django_admin_log" VALUES (59,'2021-06-22 18:42:55.318998','16','Gasolinera 9537 Servicio San Jose Gasolinera 9537 Servicio San Jose','[{"changed": {"fields": ["Longitud"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (60,'2021-06-22 18:43:49.946614','17','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (61,'2021-06-22 18:44:00.119689','17','Gasolinera PEMEX Gasolinera PEMEX','[]',8,1,2);
INSERT INTO "django_admin_log" VALUES (62,'2021-06-22 19:11:51.693934','18','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (63,'2021-06-22 19:12:13.617806','19','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (64,'2021-06-22 19:12:37.984339','20','Gasolinera Cargo GAS La encantada','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (65,'2021-06-22 19:13:04.036621','21','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (66,'2021-06-22 19:14:40.340118','22','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (67,'2021-06-22 19:15:04.032178','23','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (68,'2021-06-22 19:15:27.392999','24','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (69,'2021-06-22 19:15:49.698190','25','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (70,'2021-06-22 19:16:39.842462','26','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (71,'2021-06-22 19:16:59.358967','27','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (72,'2021-06-22 19:17:16.201598','28','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (73,'2021-06-22 19:17:33.435573','29','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (74,'2021-06-22 19:17:56.826359','30','Gasolinera Oxxo Gas Gasolinera Oxxo Gas','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (75,'2021-06-22 19:18:13.625582','31','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (76,'2021-06-22 19:18:31.204028','32','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (77,'2021-06-22 19:18:47.947499','33','Oxxo Percheron Oxxo Percheron','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (78,'2021-06-22 19:19:15.135168','34','Gasolinera Los Pinos Gasolinera Los Pinos','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (79,'2021-06-22 19:19:26.016402','35','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (80,'2021-06-22 19:19:41.444533','36','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (81,'2021-06-22 19:19:57.599555','37','Gasolinera Oxxo Gas Gasolinera Oxxo Gas','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (82,'2021-06-22 19:20:12.362344','38','Gasolinera Oxxo Gas Gasolinera Oxxo Gas','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (83,'2021-06-22 19:20:29.553237','39','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (84,'2021-06-22 19:20:46.182330','40','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (85,'2021-06-22 19:21:14.911157','41','Gasolinera Petro Seven Gasolinera Petro Seven','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (86,'2021-06-22 19:21:40.403904','42','Gasolinera Gasolinera','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (87,'2021-06-22 19:22:06.127355','43','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (88,'2021-06-22 19:22:22.807889','44','Gasolinera PEMEX Gasolinera PEMEX','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (89,'2021-06-22 19:27:07.282084','45','MI GASOLINA MATAMOROS Av Cuauhtémoc 297, Centro, 27440 Matamoros, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (90,'2021-06-22 19:32:46.638608','46','MI GASOLINA Carretera Torreón - Matamoros Km 251','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (91,'2021-06-22 19:33:18.281461','47','CARGO GAS SAN JUAN Carretera Saltillo-Torreon, Km. 257, Ejido Santo Tomás, 27440 Matamoros, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (92,'2021-06-22 19:33:44.559393','48','SERVICIO MARTILLO Carr. Torreón - Matamoros 9020, Jardines Universidad, 27087 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (93,'2021-06-22 19:34:07.625204','49','PETRO SEVEN Carr. Torreón - Matamoros #9100, Villas Universidad, 27275 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (94,'2021-06-22 19:35:17.461384','50','GASOLINERA LA AMISTAD Carr. Torreón - Matamoros 53, La Amistad, 27054 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (95,'2021-06-22 19:35:40.683187','51','GASOLINERA CARGO GA Carr. Torreón - Matamoros 9200, José de las Fuentes, 27086 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (96,'2021-06-22 19:36:25.857480','52','GASOLINERA MARTILO Carr. Torreón - Matamoros, Zaragoza, Ejido Zaragoza, 27277 Matamoros, Coa','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (97,'2021-06-22 19:36:46.800571','53','GASOLINERA Amp Valles del Nazas, 27083 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (98,'2021-06-22 19:37:06.416869','54','GASOLINERA PEMEX Periferico Raul Lopez Sanchez 2789, Ejido San Luis, 27054 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (99,'2021-06-22 19:37:25.978242','55','GASOLINERA XOCHIMILCO Av Allende 4774, Villa California, 27000 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (100,'2021-06-22 19:37:47.697784','56','GASOLINA JUAREZ Av. Juarez 4595, Villa California, 27085 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (101,'2021-06-22 19:38:11.562486','57','GASOLINERA PEMEX Av. Juarez 4242, Villa California, 27089 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (102,'2021-06-22 19:38:32.055108','58','MI GASOLINA Calz Saltillo 400 Int. 235, Residencial Campestre la Rosita, 27250 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (103,'2021-06-22 19:38:54.557710','59','CARGO GAS JOYITA Av. Juarez 2901, Cuarto de Cobián Centro, 27000 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (104,'2021-06-22 19:39:17.712021','60','GASOLINERA Av Allende y, Primero de Cobián Centro, 27000 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (105,'2021-06-22 19:41:22.192858','61','GASOLINERA TORREON Av. Allende, Eugenio Aguirre Benavides y, Primero de Cobián Centro, 27000 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (106,'2021-06-22 19:41:39.699343','62','MI GASOLINERA ALAMEDA Blvrd Revolución 431, Primero de Cobián Centro, 27000 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (107,'2021-06-22 19:41:56.556259','63','GASOLINERA PEMEX Blvrd Independencia, Primero de Cobián Centro, 27000 Torreón, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (108,'2021-06-22 19:43:30.721084','64','Gasolinera PEMEX Blvd. Rogelio Montemayor 601, Niños Héroes, 27480 Viesca, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (109,'2021-06-22 19:43:49.175111','65','GASOLINERA 27296, Blvd. Gral. Pedro Verona Rodríguez Triana 4002, Villas la Merced, Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (110,'2021-06-22 19:45:16.929822','66','GASOLINERA Blvrd Revolución 1525, Antigua Aceitera, 27210 Torreón, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (111,'2021-06-22 19:45:32.909987','67','GASOLINERA FRESNO Carretera Estatal Finesterre Km 0 + 50, Fresnos del Nte., 27908 Francisco I. Madero','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (112,'2021-06-22 19:45:54.246288','68','GASOLINERA Luis Donaldo Colosio S/N, Jaboncillo, Nuevo Linares, 27907 Francisco I. Madero, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (113,'2021-06-22 19:46:16.209989','69','GASOLINERA Entronque Carretera Torreón-San Pedro 25, Nueva Linares, del Sur, 27900 Francisco I. Madero, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (114,'2021-06-22 19:46:37.429642','70','GASOLINA San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (115,'2021-06-22 19:46:57.887943','71','GASOLINERA San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (116,'2021-06-22 19:47:12.803793','72','GASOLINERA El Ancora, Ejido el Ancora, 27810 San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (117,'2021-06-22 19:47:29.800391','73','GASOLINERA PEMEX Galeana 105, Centro, 27800 San Pedro, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (118,'2021-06-22 19:47:45.235286','74','MI GASOLINA SAN PEDRO Miguel Hidalgo, Centro, 27800 San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (119,'2021-06-22 19:48:05.870094','75','GASOLINERA Lázaro Cárdenas 26 Lázaro Cárdenas 26, Lázaro Cárdenas, 27830 San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (120,'2021-06-22 19:48:28.355097','76','GASOLINERA PEMEX Av. Benito Juárez, Barrio de Saltillo, 27850 San Pedro, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (121,'2021-06-22 19:48:49.175643','77','GASOLINERA PEMEX Fundadores de San Pedro S/N, Zona Industrial, 27800 San Pedro, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (122,'2021-06-22 19:49:07.156955','78','GASOLINERA Libramiento 9, Sin Nombre de Colonia, Burócratas Municipales, 27810 San Pedro, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (123,'2021-06-22 19:51:50.823669','79','GASCO Gasolinera Estación de Servicio del Norte PIEDRAS NEGRAS - NUEVO LAREDO 135, SAN JOAQUÍN, PARQUE INDUSTRIAL AEROPUERTO, PIEDRAS NEGRAS, COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (124,'2021-06-22 19:52:10.028181','80','GASCO Gasolinera Estación de Servicio del Norte CARRETERA FEDERAL No. 57, VENUSTIANO CARRANZA, PARQUE INDUSTRIAL AEROPUERTO, 26090 PIEDRAS NEGRAS COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (125,'2021-06-22 19:52:32.699983','81','GASOLINERA PEMEX BLVD. REPÚBLICA 107 SECCION 1, EJIDO PIEDRAS NEGRAS, 26015 PIEDRAS NEGRAS, COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (126,'2021-06-22 19:52:53.335156','82','GASOLINERA PEMEX. ESTACIÓN ANÁHUAC AV. EMILIANO CARRANZA 40, ZONA CENTRO 26000 PIEDRAS NEGRAS COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (127,'2021-06-22 19:53:10.873819','83','GASCO. SERVICIO FRONTERIZO HEROICO COLEGIO MILITAR 854, ROMA 26010 PIEDRAS NEGRAS COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (128,'2021-06-22 19:53:31.831276','84','GASOLINERA PEMEX ZONA CENTRO, VILLA UNIÓN COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (129,'2021-06-22 19:53:52.375090','85','SERVICIO GONZALEZ DE ACUÑA, SA De CV. CARRETERA ACUÑA-ZARAGOZA KM 100 MAS 600 S/N CALLE GUERRERO, 26620 CD. ACUÑA, COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (130,'2021-06-22 19:54:13.169736','86','GASOLINERA GASCO CARRETERA PRESA LA AMISTAD S/N, ATILILANO BARRERA, 26230 CD. ACUÑA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (131,'2021-06-22 19:54:30.445130','87','SERVIGAS RIO GRANDE (Allende) Benito Juárez Nte. 862, Las Brisas, Allende, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (132,'2021-06-22 19:54:46.789112','88','Gasolinera Pemex (Allende) México 57, Coahuila de Zaragoza','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (133,'2021-06-22 19:55:09.889809','89','GASCO Gasolinera Super Gas Morelos Morelos','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (134,'2021-06-22 19:55:30.154603','90','SERVICIO DIPAROSA S.A. DE C.V. Guerrero 300 Ote, Zona Centro, 26500 Morelos, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (135,'2021-06-22 19:56:00.147094','91','Gasolinera Servicio Tres Caminos S.A. de C.V Vicente Guerrero 501, Verde, Zona Centro, 26500 Morelos, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (136,'2021-06-22 19:56:18.943220','92','MEGA SERVICIO RODY S.A. DE C.V. Venustiano Carranza 201 Pte, Zona Centro, 26530 Allende, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (137,'2021-06-22 19:56:41.330425','93','Gasolinera Nuevo Laredo - Piedras Negras, Guerrero, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (138,'2021-06-22 19:56:59.246864','94','Servigas Rio Grande Guerrero, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (139,'2021-06-22 19:57:15.555434','95','Gas La Joya (Nava) Carretera Federal 57, Agua de Afuera, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (140,'2021-06-22 19:57:34.872599','96','Gasolinera El Encino Nava, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (141,'2021-06-22 19:57:52.123064','97','SERVICIO KACERÍN S.A. DE C.V. Venustiano Carranza 650, Zona Centro, 26170 Nava, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (142,'2021-06-22 19:58:18.850478','98','SERVICIO OSGUAR Venustiano Carranza #790, CENTRO, 26170 Nava, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (143,'2021-06-22 19:59:12.358933','99','GASOLINERA EL CHINO 5 de Mayo 600, Juárez, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (144,'2021-06-22 19:59:30.037863','100','GASOLINERA VILLAREAL La Placita, 26340 Santa Rosa de Múzquiz, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (145,'2021-06-22 19:59:47.858110','101','GASOLINERA EL PASO DEL COYOTE Carretera Rosita Muzquiz Km 4.9 #1000C, ES 8830, 26887 San Juan de Sabinas, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (146,'2021-06-22 20:00:05.230657','102','OXXO GAS Cuauhtémoc # 911 Poniente Col, Reinera, Sabinas, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (147,'2021-06-22 20:00:29.485107','103','GASOLINERA iguel Hidalgo 55, Zona Centro, 26350 Palau, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (148,'2021-06-22 20:02:53.200524','104','GASOLINERA PEMEX CALLE JOSE MARIA PINO SUAREZ ESQUINA CON ABASOLO, PUEBLO NUEVO, SAN BUENAVENTURA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (149,'2021-06-22 20:03:09.238265','105','GASOLINERA SABINAS- MONCLOVA, LAS ADJUNTAS,COAHUOLA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (150,'2021-06-22 20:03:33.791610','106','VIPERS GAS CARRETERA, ABASOLO KM 2, PUEBLO NUEVO, SAN BUENAVENTURA, COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (151,'2021-06-22 20:03:46.789683','107','GASOLINERA PEMEX CARR. 30, No. 2000, SAN ANTONIO, 25810, FRONTERA, COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (152,'2021-06-22 20:04:04.287912','108','GASOLINERA GULF Carretera 30 Km. 13 204, México 30, 8 de Enero, 25800 Ocho de Enero, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (153,'2021-06-22 20:04:24.153773','109','GASOLINERA AMC LIBRAMIENTO Lib. Lic. Carlos Salinas de Gortari 1300, Regidores, 25618 Frontera, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (154,'2021-06-22 20:04:39.827622','110','GASOLINERA EL VENADO Km 78, México 57 10, Industrial, 25733 Monclova, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (155,'2021-06-22 20:04:58.466049','111','GASOLINERA PEMEX Blvrd San Jose 1200, Fraccionamiento Hipódromo, 25746 Monclova, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (156,'2021-06-22 20:05:32.812724','112','ESTACION MONKY Carretera Federal 57 (MONTERREY-MONCLOVA 57 2502, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (157,'2021-06-22 20:05:51.696719','113','GASOLINERA PEMEX Francisco I. Madero 105, Cuatro Ciénegas de Carranza, Zona Centro, 27640 Cuatrociénegas, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (158,'2021-06-22 20:06:09.119943','114','GASOLINERA PEMEX México 30 1505, Centro, 27640 Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (159,'2021-06-22 20:06:25.032398','115','PETRO SEVEN Eulalio Gutiérrez LB, Villas de Guadalupe, Castaños, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (160,'2021-06-22 20:06:42.567084','116','GASOLINERA PEMEX Coahuila de Zaragoza, México','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (161,'2021-06-22 20:06:59.736178','117','GASOLINERA Carretera 30 Km. 18 de Febrero, 25500 Nadadores, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (162,'2021-06-22 20:07:20.903971','118','PEMEX OPERADORA DE COMBUSTIBLES GONZALEZ SA D E CV MÉXICO 2 620, JIMENEZ COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (163,'2021-06-22 20:07:47.717839','119','GASOLINERA PEMEX HIDALGO 702 CENTRO, ZONA CENTRO, 26450 ZARAGOZA COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (164,'2021-06-22 20:08:04.351915','120','GASOLINERA DYNAMI 86, MIGUEL HIDALGO, ZONA CENTRO, 26450 ZARAGOZA COAHUILA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (165,'2021-06-22 20:20:44.276782','121','CASETA DE COBRO LA CUCHILLA México 40, El Sol, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (166,'2021-06-22 20:21:07.128744','122','CASETA DE COBRO PLAN DE AYALA CASETA DE COBRO PLAN DE AYALA','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (167,'2021-06-22 20:21:27.850800','123','CASETA DE PEAJE , PLAZA DE COBRO TORREON Saltillo, Coah','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (168,'2021-06-22 20:21:45.286912','124','CASETA DE CUOTA Coahuila de Zaragoza','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (169,'2021-06-22 20:22:09.325987','125','CASETA DE COBRO HUACHICHIL Capilla de Artesillas, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (170,'2021-06-22 20:22:38.921125','126','CASETA DE COBRO CARBONERA OJO CALIENTE 6, Av. Ruiz Cortines 3140, Monterrey, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (171,'2021-06-22 20:23:00.790207','127','PLAZA DE COBRO OJO CALIENTE 6, Av. Ruiz Cortines 3140, Monterrey, Coah.','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (172,'2021-06-22 20:23:15.830325','128','CASETA DE COBRO AUTOPISTA PREMIER CASETA DE COBRO AUTOPISTA PREMIER','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (173,'2021-06-22 20:42:31.872412','129','Fiscalia General de Coahuila (SURESTE) | -101.017559 , 25.456624','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (174,'2021-06-22 20:42:53.943658','130','DSPM SALTILLO | -100.976748 , 25.415586','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (175,'2021-06-22 20:43:15.082495','131','Policía Ambiental de Saltillo | -100.9989892 , 25.402968','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (176,'2021-06-22 20:43:33.294208','132','Policia Preventiva Municipal Delegacion Sur | -101.009534 , 25.397865','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (177,'2021-06-22 20:43:53.695445','133','DSMP Ramos Arizpe | -100.9398696 , 25.5454556','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (178,'2021-06-22 20:44:12.371342','134','Delegación de Policía y Transito | -101.007603 , 25.4363336','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (179,'2021-06-22 20:44:29.476292','135','DSMP Arteaga | -100.8581971 , 25.4454472','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (180,'2021-06-22 20:44:45.001642','136','Procuraduría General de Justicia del Estado Delega | -102.1736918 , 25.4448151','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (181,'2021-06-22 20:45:01.022258','137','Policía Gobierno del Estado de Coahuila | -102.1728528 , 25.4838578','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (182,'2021-06-22 20:45:22.457928','138','DSPM General Ceped | -102.0539163 , 26.990364','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (183,'2021-06-22 20:45:54.294777','139','Fiscalia General de Coahuila | -103.385336 , 25.5668489','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (184,'2021-06-22 20:46:11.403101','140','Fundadores de San Pedro | -102.9707801 , 25.7490084','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (185,'2021-06-22 20:46:27.257868','141','POLICIA DEL ESTADO MATAMORO | -103.249525 , 25.5330582','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (186,'2021-06-22 20:46:47.286597','142','SEGURIDAD PUBLICA DE MATAMOROS | -103.2335022 , 25.5272028','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (187,'2021-06-22 20:47:05.045653','143','FISCALIA GENERAL DEL COAHUILA DE TORREON | -103.4475587 , 25.5344165','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (188,'2021-06-22 20:47:26.033125','144','DSPM VIESCA | -102.8049814 , 25.3431286','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (189,'2021-06-22 20:47:41.296887','145','POLICIA ESTATAL FRANCISCO I MADERO | -103.272284 , 25.7699949','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (190,'2021-06-22 20:48:43.281578','146','FISCALIA MONCLOVA | -101.4215801 , 26.8931766','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (191,'2021-06-22 20:49:01.517717','147','DIRECCION DE SEGURIDAD PUBLICA CANDELA | -100.6579982 , 26.8401522','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (192,'2021-06-22 20:49:22.622482','148','POLICIA MUNICIPAL FRONTERA | -101.4407808 , 26.9404145','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (193,'2021-06-22 20:49:48.062043','149','DIRECCION DE SEGURIDAD PUBLICA MUNICIPAL  SACRAMEN | -101.7251816 , 27.0047736','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (194,'2021-06-22 20:50:21.339615','150','FISCALÍA REGIÓN NORTE 2 | -100.9762984 , 29.3298401','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (195,'2021-06-22 20:50:39.431352','151','DSPM NAVA | -100.7674268 , 28.4219707','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (196,'2021-06-22 20:53:47.937836','152','FISCALIA ALLENDE | -100.8579101 , 28.3538554','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (197,'2021-06-22 20:56:04.728661','153','FISCALIA PIEDRAS NEGRAS. | -100.5637769 , 28.6961236','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (198,'2021-06-22 20:59:36.218095','154','DSPM ALLENDE | -100.8548423 , 28.3472835','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (199,'2021-06-22 21:01:11.618133','155','DELEGACIÓN POLICÍA Y TRÁNSITO. PIEDRAS NEGRAS | -100.5385328 , 28.7034635','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (200,'2021-06-22 21:01:33.016682','156','DSPM MORELOS | -100.8865441 , 28.4104099','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (201,'2021-06-22 21:01:50.702989','157','DSPM GUERRERO | -100.3787427 , 28.3084762','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (202,'2021-06-22 21:02:11.515160','158','SEGURIDAD PUBLICA MUNICIPAL DE ACUÑA, COAHUILA. | -100.9524266 , 29.3141242','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (203,'2021-06-22 21:02:29.825392','159','MINISTERIO PUBLICO ZARAGOZA COAHUILA | -100.9163724 , 28.5105692','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (204,'2021-06-22 21:02:49.417271','160','DELEGACIÓN NORTE I PIEDRAS NEGRAS | -100.5680541 , 28.6824575','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (205,'2021-06-22 21:03:10.930120','161','SEGURIDAD PUBLICA PIEDRAS NEGRAS | -100.552403 , 28.686021','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (206,'2021-06-22 21:03:30.821587','162','DELEGACION DE LA REGION NORTE II ACUÑA COAHUILA | -100.932456 , 29.3183598','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (207,'2021-06-22 21:05:40.715677','163','FIscalia General de Coahuila | -101.106625 , 27.8486991','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (208,'2021-06-22 21:06:00.654251','164','COMANDANCIA DE POLICIA DE SABINAS | -101.1457274 , 27.8861567','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (209,'2021-06-22 21:06:18.564313','165','DSPM JUAREZ | -100.7274238 , 27.6066268','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (210,'2021-06-22 21:06:36.142394','166','POLICIA MUNICIPAL DE SAN JUAN DE SABINAS | -101.3039956 , 27.9295615','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (211,'2021-06-22 21:06:51.395547','167','SEPAROS POLICIA MUNICIPAL NUEVA ROSITA | -101.2163494 , 27.9273506','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (212,'2021-06-22 21:17:04.478481','15','Filtro de seguridad 4 | -103.25350025981466 , 25.54764294064363','',8,1,3);
INSERT INTO "django_admin_log" VALUES (213,'2021-06-22 21:17:04.931054','14','Filtro de seguridad 3 | -100.89103762648045 , 29.235645736799604','',8,1,3);
INSERT INTO "django_admin_log" VALUES (214,'2021-06-22 21:17:04.997815','13','Filtro de seguridad 2 | -101.40196264856118 , 26.746633185620002','',8,1,3);
INSERT INTO "django_admin_log" VALUES (215,'2021-06-22 21:17:05.074829','9','Fiscalia | -101.02199876741997 , 25.45611882603912','',8,1,3);
INSERT INTO "django_admin_log" VALUES (216,'2021-06-22 21:17:05.130538','8','Fiscalia | -102.96963390845087 , 25.74726180050201','',8,1,3);
INSERT INTO "django_admin_log" VALUES (217,'2021-06-22 21:17:05.197075','7','Fiscalia | -103.44755226413818 , 25.534397312335354','',8,1,3);
INSERT INTO "django_admin_log" VALUES (218,'2021-06-22 21:17:05.263927','6','Fiscalia | -101.42159570166012 , 26.893256615231667','',8,1,3);
INSERT INTO "django_admin_log" VALUES (219,'2021-06-22 21:17:05.353204','5','Fiscalia | -101.1066481738631 , 27.8487089492508','',8,1,3);
INSERT INTO "django_admin_log" VALUES (220,'2021-06-22 21:17:05.442075','4','Fiscalia | -100.97646584308076 , 29.33000075572176','',8,1,3);
INSERT INTO "django_admin_log" VALUES (221,'2021-06-22 21:17:05.540222','3','Fiscalia | -100.56269335564312 , 28.698235508161282','',8,1,3);
INSERT INTO "django_admin_log" VALUES (222,'2021-06-22 21:24:33.585924','168','M.U. SEMANA SANTA, JUARE | -100.6164785 , 27.522782 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (223,'2021-06-22 21:24:57.690725','169','M.U. Filtro Semana Santa Ejido Primero de Mayo | -101.2262174 , 27.2359642 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (224,'2021-06-22 21:26:33.731021','169','M.U. Ejido Primero de Mayo | -101.2262174 , 27.2359642 | filtro','[{"changed": {"fields": ["Nombre"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (225,'2021-06-22 21:26:42.766903','168','M.U. JUAREZ | -100.6164785 , 27.522782 | filtro','[{"changed": {"fields": ["Nombre"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (226,'2021-06-22 21:27:24.266474','170','M.U. Escobedo | -101.4176319 , 27.2263233 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (227,'2021-06-22 21:27:50.138542','171','M.U  Ejido Obayos | -101.3553912 , 27.4414783 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (228,'2021-06-22 21:28:20.593570','172','M.U.  Ejido Primero de Mayo - M | -101.226725 , 27.2357065 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (229,'2021-06-22 21:28:58.233172','173','M.U ABASOLO | -101.4316343 , 27.1740915 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (230,'2021-06-22 21:30:22.544963','174','M.U ABASOLO | -101.3580934 , 27.2001666 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (231,'2021-06-22 21:30:46.461597','175','M.U - SAN JUAN DE SABINAS | -102.6973683 , 28.7781174 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (232,'2021-06-22 21:31:25.840745','176','M.U. Progreso | -100.9977122 , 27.4288372 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (233,'2021-06-22 21:31:50.365436','177','PEC TORREON  1 | -103.4496761 , 25.5753564 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (234,'2021-06-22 21:32:12.963578','178','PEC TORREON 2 | -103.4291986 , 25.5975524 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (235,'2021-06-22 21:32:45.819780','179','PEC MONCLOVA 1 | -101.2263121 , 27.234374 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (236,'2021-06-22 21:33:09.517799','180','PCC GRAL. CEPEDA | -101.4806269 , 25.3674423 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (237,'2021-06-22 21:33:48.336994','181','PCC ARTEAGA | -100.8424741 , 25.2414092 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (238,'2021-06-22 21:34:41.322425','182','M.U CANDELA 1 | -102.2052118 , 27.1211718 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (239,'2021-06-22 21:35:11.628746','183','PCC SAN PEDRO 1 | -102.98103 , 25.757638 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (240,'2021-06-22 21:35:37.411084','184','M.U  LAGUNA DEL REY 3 | -103.6752338 , 27.2916156 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (241,'2021-06-22 21:36:01.903996','185','M.U LAGUNA DEL REY 2 | -103.1760706 , 25.9972752 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (242,'2021-06-22 21:36:31.763630','186','PCC TORREON 1 | -103.4584072 , 25.553968 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (243,'2021-06-22 21:36:51.382551','187','PCC PARRAS 2 | -102.1724097 , 25.4840457 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (244,'2021-06-22 21:37:17.367680','188','M.U. FRANCISCO I. MADERO  4 | -103.2763985 , 25.8141462 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (245,'2021-06-22 21:38:59.474458','189','PCC SAN PEDRO 1 | -102.982135 , 25.754396 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (246,'2021-06-22 21:39:21.846841','190','PAR PIEDRAS NEGRAS | -100.5417588 , 28.6064835 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (247,'2021-06-22 21:39:47.190469','191','PCC PIEDRAS NEGRAS. 2 | -100.5121964 , 28.7055311 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (248,'2021-06-22 21:40:08.599570','192','PCC PIEDRAS NEGRAS 1 | -100.5119567 , 28.6973574 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (249,'2021-06-22 21:40:39.600744','193','PIEDRAS NEGRAS PAR | -100.5688891 , 28.7236818 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (250,'2021-06-22 21:41:00.380865','194','M.U  FRANCISCO I. MADERO | -103.3260963 , 25.7694306 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (251,'2021-06-22 21:41:26.377306','195','PAR  SEMANA SANTA, RAMOS ARIZPE | -100.8763302 , 25.5975545 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (252,'2021-06-22 21:41:57.155461','196','M.U. San Pedro | -103.0040805 , 25.7575251 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (253,'2021-06-22 21:42:22.831670','197','PCC Saltillo | -101.1549561 , 24.76013 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (254,'2021-06-22 21:42:50.298429','198','PCC Ramos Arizpe | -101.3527804 , 26.149012 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (255,'2021-06-22 21:43:05.458459','199','PEC, SEMANA SANTA NAVA | -100.7632612 , 28.4354663 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (256,'2021-06-22 21:43:35.435453','200','PAR - RAMOS ARIZPE 1 | -100.8815337 , 25.594728 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (257,'2021-06-22 21:43:57.564114','201','M.U RAMOS ARIZPE 1 | -100.8818406 , 25.5941217 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (258,'2021-06-22 21:44:19.613930','202','PCC RAMOS ARIZPE 2 | -101.3544253 , 26.1460202 | filtro','[{"added": {}}]',8,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-06-15 18:55:58.309742');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2021-06-15 18:55:58.399157');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2021-06-15 18:55:58.521637');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2021-06-15 18:55:58.618446');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-06-15 18:55:58.710669');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2021-06-15 18:55:58.812179');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2021-06-15 18:55:58.876654');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2021-06-15 18:55:58.948238');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2021-06-15 18:55:59.049591');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2021-06-15 18:55:59.141762');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2021-06-15 18:55:59.202897');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-06-15 18:55:59.277562');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2021-06-15 18:55:59.375128');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-06-15 18:55:59.444874');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2021-06-15 18:55:59.510773');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2021-06-15 18:55:59.576353');
INSERT INTO "django_migrations" VALUES (17,'mainapp','0001_initial','2021-06-15 18:55:59.650440');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2021-06-15 18:55:59.714553');
INSERT INTO "django_migrations" VALUES (19,'mainapp','0002_auto_20210615_2248','2021-06-15 22:49:26.395430');
INSERT INTO "django_migrations" VALUES (20,'mainapp','0003_auto_20210616_2157','2021-06-16 21:57:45.445494');
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
