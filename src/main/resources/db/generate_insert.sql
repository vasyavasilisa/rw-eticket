
CREATE DATABASE Railway_manag;
		USE Railway_manag;
    
		CREATE TABLE users (idUser INT AUTO_INCREMENT,
        surname VARCHAR(255) NOT NULL,
        name VARCHAR(255) NOT NULL, 
        lastname VARCHAR(255) default NULL, 
		phone VARCHAR(255) NOT NULL, 
        email VARCHAR(255) NOT NULL, 
		gender VARCHAR(255)  NOT NULL,
		login  VARCHAR(255) NOT NULL UNIQUE,
		password VARCHAR(255) NOT NULL,
	    balance DOUBLE(6,2) NOT NULL,
		role VARCHAR(255) NOT NULL default '0',
        PRIMARY KEY (idUser));      
   
		CREATE TABLE stations (
        idStation INT AUTO_INCREMENT,
				name VARCHAR(255) NOT NULL, 
                PRIMARY KEY (idStation)
                );

		CREATE TABLE trains(idTrain INT AUTO_INCREMENT,
				number VARCHAR(255) NOT NULL UNIQUE,
				nameTrain VARCHAR(255) NOT NULL,
				PRIMARY KEY (idTrain));
                
               
                
		CREATE TABLE stationsOfTrain(idStationOfTrain INT AUTO_INCREMENT,
				idTrain int(11) NOT NULL,
				idStation INT(11) NOT NULL,
				datetimeOfArrive DATETIME,
				datetimeOfDeparture DATETIME,
                distance INT(11) DEFAULT 0,
				PRIMARY KEY (idStationOfTrain),
				FOREIGN KEY (idStation) REFERENCES stations (idStation)ON DELETE CASCADE ON UPDATE CASCADE,
				FOREIGN KEY (idTrain) REFERENCES trains (idTrain) ON DELETE CASCADE ON UPDATE CASCADE);

		
		CREATE TABLE trainRouts(idRout INT AUTO_INCREMENT,        /*Маршруты*/
				idTrain int(11),
				idDepartureStation INT(11),
				idArriveStation INT(11),
				PRIMARY KEY (idRout),
				FOREIGN KEY (idDepartureStation) REFERENCES stationsOfTrain (idStationOfTrain)ON DELETE CASCADE ON UPDATE CASCADE,
				FOREIGN KEY (idArriveStation) REFERENCES stationsOfTrain (idStationOfTrain)ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idTrain) REFERENCES trains (idTrain)ON DELETE CASCADE ON UPDATE CASCADE);
				
		
		
		CREATE TABLE carriage(type  VARCHAR(255),        /*вагоны ('К','ПЛ','О','СВ')*/
				countPlace int(11),
				PRIMARY KEY (type));
		
		CREATE TABLE carriageOfTrain(idCarriageOfTrain INT AUTO_INCREMENT,
				type VARCHAR(255),
				idTrain int(11),
				number int(11),
				PRIMARY KEY (idCarriageOfTrain),
                FOREIGN KEY (idTrain) REFERENCES trains (idTrain)ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (type) REFERENCES carriage (type)ON DELETE CASCADE ON UPDATE CASCADE);
		
		CREATE TABLE places(idPlace INT AUTO_INCREMENT,
				number INT(11),
				type VARCHAR(255) ,
				status VARCHAR(255) ,
				idCarriage int(11),
				PRIMARY KEY (idPlace),
	         	FOREIGN KEY (idCarriage) REFERENCES carriageOfTrain(idCarriageOfTrain)ON DELETE CASCADE ON UPDATE CASCADE);
		
		CREATE TABLE fare(idFare INT AUTO_INCREMENT,/*стоимость проезда*/
				idRout INT(11),
				price DOUBLE(6,2),
				idTrain int(11),
				idPlace int(11),
				PRIMARY KEY (idFare),
	         	FOREIGN KEY (idRout) REFERENCES  trainRouts(idRout)ON DELETE CASCADE ON UPDATE CASCADE,
	        	FOREIGN KEY (idTrain) REFERENCES trainRouts(idTrain)ON DELETE CASCADE ON UPDATE CASCADE,
	        	FOREIGN KEY (idPlace) REFERENCES places(idPlace)ON DELETE CASCADE ON UPDATE CASCADE);
		
		CREATE TABLE passage(idPassage INT AUTO_INCREMENT,/*даты*/
		idTrain int(11),
		date DATE,
		PRIMARY KEY (idPassage),
		FOREIGN KEY (idTrain) REFERENCES fare (idTrain)ON DELETE CASCADE ON UPDATE CASCADE);
        
     
 /*///////////////////////////////////////////////////////////////////////////////////////////       */
        INSERT INTO stations  VALUES(1,'Орша');
		INSERT INTO stations  VALUES(2,'Борисов');
		INSERT INTO stations  VALUES(3,'Жодино');
		INSERT INTO stations  VALUES(4,'Минск');
		
		INSERT INTO trains (idTrain,number,nameTrain) VALUES(1,'123B','Орша-Минск');
		INSERT INTO trains (idTrain,number,nameTrain) VALUES(3,'127B','Орша-Минск');
        
		/*//////////////////////////////////////Поезд №127B //////////////////////*/
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(1,3,1,'20170312074500');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(2,3,2,'20170312083500','20170312083800',137);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(3,3,3,'20170312090700','20170312090800',160);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(4,3,4,'20170312094100',220);

        INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(3,2,4);   /*Борисов-Минск*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(3,3,4);  /*Жодино-Минск*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(3,1,4);  /*Орша-Минск*/
      
        INSERT INTO carriage  VALUES('О',81);
		INSERT INTO carriage  VALUES('ПЛ',54);
		INSERT INTO carriage  VALUES('К',36);
        INSERT INTO carriage  VALUES('СВ',18);
        
        INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('О',3,1);
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('ПЛ',3,2);
        
       /* Места*/
	    /* ///////первый вагон поезд 127В*/
		INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',1);    /*  Общий вагон    */
		INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',1);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'нижнее','свободно',1);
        INSERT INTO places  (number,type,status,idCarriage) VALUES(49,'нижнее боковое','свободно',1);
        INSERT INTO places  (number,type,status,idCarriage) VALUES(51,'нижнее боковое','свободно',1);
        INSERT INTO places  (number,type,status,idCarriage) VALUES(52,'нижнее боковое','свободно',1);
         INSERT INTO places  (number,type,status,idCarriage) VALUES(53,'нижнее боковое','свободно',1);
		/*///////////////////////////второй вагон поезд 127В ///////////*/
		INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',2);     /*  Плацкартный      */
		INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(37,'нижнее боковое','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(38,'верхнее боковое','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(39,'нижнее боковое','свободно',2);
		INSERT INTO places  (number,type,status,idCarriage) VALUES(40,'верхнее боковое','свободно',2);
		
		/*/////////////////////////////Стоимость проезда
		////////////////////////////////первый вагон поезда 127B маршрут 1*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,1);/*         Общий вагон*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,2);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,3);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,4);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,5);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,6);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,7);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.43,3,8);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.32,3,9);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.32,3,10);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.32,3,11);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,3.32,3,12);
		/*//////////////////////////////////////////////////////////////////////////
		
        ////////второй вагон поезда 127B маршрут 1*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,13);   /*Плацкартный*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,14);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,15);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,16);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,17);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,18);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,19);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,20);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,21);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,22);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,23);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(1,5.32,3,24);
    
		
		/*///////////первый вагон поезда 127B маршрут 2*/  /* Жодино-Минск*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,1);      
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,2);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,3);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,4);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,5);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,6);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,7);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,8);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,9);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,10);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,11);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,2.56,3,12);
		
      /*  //////////второй вагон поезда 127B маршрут 2*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,13);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,14);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,15);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,16);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,17);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,18);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,19);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,20);
        INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,21);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,22);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,23);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(2,4.26,3,24);
		
/*///////////первый вагон поезда 127B маршрут 3*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,1);    /*Орша-Минск*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,2);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,3);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,4);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,5);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,6);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,7);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,8);
        INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,9);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,10);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,11);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,6.52,3,12);
		
     /* //////////второй вагон поезда 127B маршрут 3*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,13); /*Плацкарт*/
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,14);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,15);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,16);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,17);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,18);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,19);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,20);
        INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,21);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,22);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,23);
		INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(3,8.11,3,24);
		
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170401');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170402');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170403');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170404');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170405');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170407');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170413');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170414');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170415');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170416');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170417');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170421');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170422');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170423');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170424');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170501');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170502');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170503');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170504');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170505');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170615');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170616');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170617');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170618');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170619');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170620');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170621');
		INSERT INTO passage  (idTrain,date) VALUES(3,'20170717');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170718');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170719');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170720');
        INSERT INTO passage  (idTrain,date) VALUES(3,'20170721');
	
        
        	/*///////////Поезд 123B*/
        INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(5,1,1,'20170320152600');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(6,1,2,'20170320164600','20170320164900',137);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(7,1,3,'20170320172500','20170320172800',160);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(8,1,4,'20170320175900',220);
		/*//////////////////////Маршруты*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(1,6,8);
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(1,7,8);
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(1,5,8);
		/*//Вагоны*/
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('ПЛ',1,1);
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',1,2);
/*///////////////////////////////Места*/
/*///////первый вагон поезд 123В*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(43,'нижнее боковое','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(44,'верхнее боковое','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(45,'нижнее боковое','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(46,'верхнее боковое','свободно',3);
INSERT INTO places  (number,type,status,idCarriage) VALUES(47,'нижнее боковое','свободно',3);
/*///////////////////////////второй вагон поезд 123В*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',4);    /*  Купе*/
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(22,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(23,'нижнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(24,'верхнее','свободно',4);
INSERT INTO places  (number,type,status,idCarriage) VALUES(25,'нижнее','свободно',4);

/*/////////////////////////////Стоимость проезда
////////////////////////////////первый вагон поезда 123B маршрут 4*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,25);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,26);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,27);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,28);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,29);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,30);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,31);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,32);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,33);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,34);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,35);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,36);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,5.32,1,37);
/*//////////////////////////////////////////////////////////////////////////*/

/*////////второй вагон поезда 123B маршрут 4*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,38);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,39);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,40);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,41);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.35,1,42);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,43);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,44);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,45);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.35,1,46);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,47);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,48);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(4,7.32,1,49);

/*///////////первый вагон поезда 123B маршрут 5*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,25);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,26);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,27);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,28);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,29);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,30);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,31);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,32);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,33);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,34);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,35);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,36);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,4.32,1,37);

/*//////////второй вагон поезда 123B маршрут 5*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,38);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,39);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,40);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,41);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,42);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,43);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,44);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,45);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,46);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,47);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,48);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(5,5.21,1,49);

/*///////////первый вагон поезда 123B маршрут 6*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,25);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,26);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,27);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,28);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,29);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,30);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,31);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,32);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,33);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,34);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,35);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,36);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,8.52,1,37);

/*//////////второй вагон поезда 123B маршрут 6*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,38);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,39);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,40);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,41);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,42);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,43);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,44);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,45);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,46);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,47);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,48);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(6,11.22,1,49);

INSERT INTO passage  (idTrain,date) VALUES(1,'20170401');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170403');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170404');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170405');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170406');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170407');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170408');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170409');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170411');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170503');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170504');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170505');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170506');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170507');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170508');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170509');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170621');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170522');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170523');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170524');
INSERT INTO passage  (idTrain,date) VALUES(1,'20160525');
INSERT INTO passage  (idTrain,date) VALUES(1,'20160526');
INSERT INTO passage  (idTrain,date) VALUES(1,'20170615');


/*//////////////////////Поезд №611Б/////////////////*/
	INSERT INTO trains (idTrain,number,nameTrain) VALUES(2,'611Б','Витебск-Барановичи');
    
     /* ////////////Станции/////////////////*/
       INSERT INTO stations  VALUES(5,'Витебск');
		INSERT INTO stations  VALUES(6,'Барановичи');
		
   /*////////////////Станции поезда 611Б///////////////////*/
        INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(9,2,5,'20170312015800');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(10,2,1,'20170312032500','20170312033100',82);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance)  VALUES(11,2,4,'20170312065600','20170312065800',220);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(12,2,6,'20170312085900',430);
    
    
    /*//////////////////////Маршруты*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(2,9,12);
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(2,10,12);
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(2,10,11);
        
        
      
                    
                    /*/////////////////Вагоны поезда 611Б////////////*/
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('О',2,1);
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('ПЛ',2,2);
        INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',2,3);
      
      
      select trains.number,carriageOfTrain.idCarriageOfTrain,carriageOfTrain.number,carriageOfTrain.type
        from carriageOfTrain
        inner join trains on trains.idTrain=carriageOfTrain.idTrain
        where trains.number='611Б';
        
        /*///////////////////////////////Места*/
/*///////первый вагон поезд 611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',5);/*///////Общий*/
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',5);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'нижнее','свободно',5);

/*///////////////////////////второй вагон поезд 611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',6);/*Плацкарт*/
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(39,'нижнее боковое','свободно',6);
INSERT INTO places  (number,type,status,idCarriage) VALUES(40,'верхнее боковое','свободно',6);
/*///////////////////////////третий вагон поезд 611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',7);/*Купе*/
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',7);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',7);/*Верхнее*/



                         
                                
/*/////////////////////////////Стоимость проезда /*/
/*////////////////////////////////первый вагон поезда 611Б маршрут 7///////////////*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,50);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,51);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,52);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,53);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,54);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,55);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,56);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,6.32,2,57);
/*//////////////////////////////////////////////////////////////////////////*/

/*////////второй вагон поезда 611Б маршрут 7*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,58);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,59);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,60);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,61);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,62);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,63);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,64);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,65);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,66);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,7.78,2,67);

/*///////////третий вагон поезда 611Б маршрут 7*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,68);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,69);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,70);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,71);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,72);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,73);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,74);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(7,9.12,2,75);

/*//////////первый вагон поезда 611Б маршрут 8*//*//////////////////////////////////////////////*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,50);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,51);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,52);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,53);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,54);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,55);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,56);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,5.21,2,57);

/*///////////второй вагон поезда 611Б маршрут 8*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,58);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,59);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,60);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,61);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,62);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,63);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,64);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,65);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,66);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,6.52,2,67);

/*//////////третий вагон поезда 611Б маршрут 8*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,68);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,69);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,70);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,71);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,72);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,73);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,74);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(8,8.32,2,75);

/*//////////первый вагон поезда 611Б маршрут 9*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,50);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,51);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,52);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,53);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,54);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,55);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,56);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,4.10,2,57);

/*///////////второй вагон поезда 611Б маршрут 9*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,58);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,59);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,60);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,61);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,62);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,63);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,64);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,65);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,66);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,5.13,2,67);

/*//////////третий вагон поезда 611Б маршрут 9*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,68);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,69);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,70);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,71);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,72);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,73);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,74);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(9,7.00,2,75);

INSERT INTO passage  (idTrain,date) VALUES(2,'20170402');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170403');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170404');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170405');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170406');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170407');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170408');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170409');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170410');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170411');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170412');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170413');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170414');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170415');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170501');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170502');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170503');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170504');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170505');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170506');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170507');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170508');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170511');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170512');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170515');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170601');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170603');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170605');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170607');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170609');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170611');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170613');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170615');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170711');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170712');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170713');
INSERT INTO passage  (idTrain,date) VALUES(2,'20170714');


    
    /*//////////////////////Поезд №021E/////////////////*/
	INSERT INTO trains (idTrain,number,nameTrain) VALUES(4,'021E','Москва-Париж');
    
     /* ////////////Станции/////////////////*/
       INSERT INTO stations  VALUES(7,'Москва');
		INSERT INTO stations  VALUES(8,'Париж');
        
        /*////////////////////Станции поезда №021Е//////////////*/
        INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(13,4,7,'20170512062200');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(14,4,8,'20170513115800',2800);
		
    
      /*//////////////////////Маршруты  поезда №021Е*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(4,13,14);
		
		  /*/////////////////Вагоны поезда №021Е////////////*/
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',4,1);
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',4,2);
        INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('ПЛ',4,3);
      
      
     /*///////////////////////////////Места*/
/*///////первый вагон поезд  №021Е*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',8);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',8);
/*///////////////////////////второй вагон поезд 611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',9);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',9);
/*///////////////////////////третий вагон поезд 611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',10);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',10);
    
    /*/////////////////////////////Стоимость проезда
////////////////////////////////первый вагон поезда 021E маршрут 10*//*купе*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,76);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,77);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,78);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,79);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,80);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,81);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,82);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,83);
/*//////////////////////////////////////////////////////////////////////////*/

/*////////второй вагон поезда 021E маршрут 10*///////*купе*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,84);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,85);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,86);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,87);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,88);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,89);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,90);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,602.21,4,91);

/*///////////третий вагон поезда 021E маршрут 10*//*плацкарт*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,92);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,93);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,94);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,95);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,96);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,97);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,98);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(10,507.11,4,99);



INSERT INTO passage  (idTrain,date) VALUES(4,'20170521');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170523');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170525');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170527');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170601');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170603');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170605');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170607');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170608');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170609');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170611');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170613');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170615');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170617');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170619');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170621');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170623');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170702');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170704');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170706');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170708');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170710');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170712');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170714');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170716');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170718');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170720');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170722');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170724');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170801');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170803');
INSERT INTO passage  (idTrain,date) VALUES(4,'20170805');




  
   
   /*//////////////////////Поезд №023E/////////////////*/
	INSERT INTO trains (idTrain,number,nameTrain) VALUES(5,'023E','Париж-Москва');
    
     /* ////////////Станции/////////////////*/
  
        
        /*////////////////////Станции поезда №021Е//////////////*/
        INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(15,5,8,'20171212022600');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(16,5,7,'20171213205400',2800);
		
    
      /*//////////////////////Маршруты  поезда №023Е*/
		INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(5,15,16);
		
		  /*/////////////////Вагоны поезда №023Е////////////*/
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',5,1);
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',5,2);
        INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('Пл',5,3);
      
      
     /*///////////////////////////////Места*/
/*///////первый вагон поезд  №023Е*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',11);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','занято',11);
/*///////////////////////////второй вагон поезд 023E*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',12);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',12);
/*///////////////////////////третий вагон поезд 023E*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(2,'верхнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(3,'нижнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(4,'верхнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(5,'нижнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(6,'верхнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(7,'нижнее','свободно',13);
INSERT INTO places  (number,type,status,idCarriage) VALUES(8,'верхнее','свободно',13);
    
    /*/////////////////////////////Стоимость проезда
////////////////////////////////первый вагон поезда 023E маршрут 12*//*купе*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,100);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,101);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,102);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,103);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,104);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,105);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,106);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,107);
/*//////////////////////////////////////////////////////////////////////////*/

/*////////второй вагон поезда 023E маршрут 11*///////*купе*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,108);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,109);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,110);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,111);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,112);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,113);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,114);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,602.21,5,115);

/*///////////третий вагон поезда 023E маршрут 11*//*плацкарт*/
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,116);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,117);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,118);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,119);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,120);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,121);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,122);
INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(11,507.11,5,123);



INSERT INTO passage  (idTrain,date) VALUES(5,'20170517');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170519');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170521');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170523');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170525');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170527');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170529');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170602');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170604');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170606');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170606');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170608');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170610');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170612');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170614');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170616');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170618');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170620');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170622');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170624');
INSERT INTO passage  (idTrain,date) VALUES(5,'20170626');


 /*Поезд 613Б//////////////////////*/
    INSERT INTO trains (idTrain,number,nameTrain) VALUES(6,'613Б','Москва-Брест');
    
     /* ////////////Станции/////////////////*/
       INSERT INTO stations  VALUES(9,'Ивацевичи');
		INSERT INTO stations  VALUES(10,'Брест');
      
        
        /*////////////////////Станции поезда №613Б//////////////*/
        INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfDeparture) VALUES(17,6,7,'20170512033900');
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(18,6,1,'20170512090500','20170512091100',538);
         INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(19,6,4,'20170512120500','20170512120800',700);
		INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,datetimeOfDeparture,distance) VALUES(20,6,9,'20170512154400','20170512154800',938);
         INSERT INTO stationsOfTrain (idStationOfTrain,idTrain,idStation,datetimeOfArrive,distance) VALUES(21,6,10,'20170512173000',1058);
	
   
    
    INSERT INTO trainRouts (idTrain,idDepartureStation,idArriveStation) VALUES(6,18,19);
		
		  /*/////////////////Вагоны поезда №023Е////////////*/
		INSERT INTO carriageOfTrain (type,idTrain,number) VALUES('К',6,1);
      
      
     /*///////////////////////////////Места*/
/*///////первый вагон поезд  №611Б*/
INSERT INTO places (number,type,status,idCarriage) VALUES(1,'нижнее','свободно',14);

INSERT INTO fare  (idRout,price,idTrain,idPlace) VALUES(12,6.44,6,124);

INSERT INTO passage  (idTrain,date) VALUES(6,'20170615');


                    
                       CREATE TABLE tickets(idTicket INT AUTO_INCREMENT,
				idUser INT(11),
                ticketNumber VARCHAR(255) NOT NULL,/*14 цифр*/
                rout VARCHAR(255) NOT NULL, /*маршрут следования */
				dateDeparture DATE NOT NULL,
                timeDeparture TIME NOT NULL,
                timeArrive TIME NOT NULL,
				trainNumber VARCHAR(255) NOT NULL,/*3 цифры+1 буква*/
				carriageNumber INT(11) NOT NULL,
				placeNumber INT(11) NOT NULL,
				price DOUBLE(6,2) NOT NULL, -- со сбором
                status VARCHAR(255) NOT NULL,/*забронирован, оплачен, возвращён*/
                datetimeCreation DATETIME NOT NULL,
                datetimeCancel DATETIME NOT NULL,
                passangerSurname VARCHAR(255) NOT NULL,
                passangerName VARCHAR(255) NOT NULL,
				passportNumber VARCHAR(255) NOT NULL,
                idFare INT(11),
				PRIMARY KEY (idTicket),
				FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE ON UPDATE CASCADE);
         
             
             
             
             CREATE TABLE feaadback(idFeedback INT AUTO_INCREMENT,
             idUser INT(11),
             text VARCHAR(255) NOT NULL,
             PRIMARY KEY (idFeedback),
             FOREIGN KEY (idUser) REFERENCES users (idUser) ON DELETE CASCADE ON UPDATE CASCADE)
             ;
             
    