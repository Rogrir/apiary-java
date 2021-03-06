CREATE TABLE DISEASE (
  ID_EVENT int NOT NULL,
  KIND varchar(100) NOT NULL,
  PRIMARY KEY (ID_EVENT)
);
CREATE TABLE MOTHER (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  ID_FAMILY int NOT NULL,
  ID_RACE int,
  FERTILIZED int NOT NULL,
  PRIMARY KEY (ID, ID_FAMILY)
);
CREATE TABLE HONEY_HARVEST (
  ID_EVENT int NOT NULL,
  PRIMARY KEY (ID_EVENT)
);
CREATE TABLE APIARY_ACCOUNT (
  ID_APIARY int NOT NULL,
  ID_ACCOUNT int NOT NULL,
  PRIMARY KEY (ID_ACCOUNT, ID_APIARY)
);
CREATE TABLE APIARY (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  LOCALIZATION varchar(255),
  INFORMATION varchar(255),
  PRIMARY KEY (ID)
);
CREATE TABLE FORAGE (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  KIND varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE RACE (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  KIND varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE FAMILY (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  ID_HIVE int,
  AMOUNT int,
  PRIMARY KEY (ID)
);
CREATE TABLE FAMILY_DISEASE (
  ID_FAMILY int NOT NULL,
  ID_EVENT int NOT NULL,
  PRIMARY KEY (ID_FAMILY, ID_EVENT)
);
CREATE TABLE FAMILY_EVENT (
  ID_FAMILY int NOT NULL,
  ID_EVENT int NOT NULL,
  PRIMARY KEY (ID_FAMILY, ID_EVENT)
);
CREATE TABLE SWARM (
  ID_EVENT int NOT NULL,
  PRIMARY KEY (ID_EVENT)
);
CREATE TABLE ACCOUNT (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  LOGIN varchar(255) NOT NULL,
  PASSWORD varchar(255) NOT NULL,
  EMAIL varchar(255) NOT NULL,
  PRIVILEGE varchar(255) NOT NULL,
  CONSTRAINT ID PRIMARY KEY (ID)
);
CREATE TABLE SWARM_FAMILY (
  ID_FAMILY int NOT NULL,
  ID_EVENT int NOT NULL,
  SWARM bool NOT NULL,
  PRIMARY KEY (ID_FAMILY, ID_EVENT)
);
CREATE TABLE "EVENT" (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  ID_APIARY int NOT NULL,
  TIME_START TIMESTAMP,
  TIME_END TIMESTAMP,
  NOTE varchar(1023),
  PRIMARY KEY (ID)
);
CREATE TABLE HIVE (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  ID_APIARY int NOT NULL,
  OVERFLOW bool NOT NULL,
  LONGITUTDE float8 NOT NULL,
  LATITUDE float8 NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE EVENT_ACCOUNT (
  ID_EVENT int NOT NULL,
  ID_ACCOUNT int NOT NULL,
  PRIMARY KEY (ID_EVENT, ID_ACCOUNT)
);
CREATE TABLE ASSIGNMENT (
  ID int GENERATED BY DEFAULT AS IDENTITY,
  ID_ACCOUNT int NOT NULL,
  ID_EVENT int,
  PRIMARY KEY (ID_EVENT, ID_ACCOUNT)
);
CREATE TABLE ASSIGNMENT_FAMILY (
  ID_FAMILY int NOT NULL,
  ID_ACCOUNT int NOT NULL,
  ID_ASSIGNMENT int NOT NULL,
  PRIMARY KEY (
    ID_FAMILY,
    ID_ACCOUNT,
    ID_ASSIGNMENT
  )
);
CREATE TABLE DANGER (
  ID_EVENT int NOT NULL,
  KIND varchar(1023) NOT NULL,
  PRIMARY KEY (ID_EVENT)
);
CREATE TABLE HARVEST (
  ID_FAMILY int NOT NULL,
  ID_EVENT int NOT NULL,
  AMOUNT int NOT NULL,
  KIND varchar(255) NOT NULL,
  PRIMARY KEY (ID_FAMILY, ID_EVENT)
);
CREATE TABLE HARVEST_FORAGE (
  ID_FAMILY int NOT NULL,
  ID_FORAGE int NOT NULL,
  ID_EVENT int NOT NULL,
  PRIMARY KEY (
    ID_FAMILY,
    ID_FORAGE,
    ID_EVENT
  )
);
ALTER TABLE APIARY_ACCOUNT
ADD CONSTRAINT FKAccou_apia926913 FOREIGN KEY (ID_APIARY) REFERENCES APIARY (ID);
ALTER TABLE APIARY_ACCOUNT
ADD CONSTRAINT FKAccou_apia442043 FOREIGN KEY (ID_ACCOUNT) REFERENCES ACCOUNT (ID);
ALTER TABLE EVENT
ADD CONSTRAINT FKEVENT402333 FOREIGN KEY (ID_APIARY) REFERENCES APIARY (ID);
ALTER TABLE FAMILY
ADD CONSTRAINT FKFAMILY555253 FOREIGN KEY (ID_HIVE) REFERENCES HIVE (ID);
ALTER TABLE HIVE
ADD CONSTRAINT FKHIVE529691 FOREIGN KEY (ID_APIARY) REFERENCES APIARY (ID);
ALTER TABLE MOTHER
ADD CONSTRAINT FKMatka37469 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE HARVEST
ADD CONSTRAINT FKHARVEST66707 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE FAMILY_EVENT
ADD CONSTRAINT FKFAMILY_Wy563155 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE FAMILY_EVENT
ADD CONSTRAINT FKFAMILY_Wy13610 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE DISEASE
ADD CONSTRAINT FKDISEASE310 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE DANGER
ADD CONSTRAINT FKDANGER510168 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE HONEY_HARVEST
ADD CONSTRAINT FKMiodobrani953810 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE SWARM
ADD CONSTRAINT FKSWARM568663 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE SWARM_FAMILY
ADD CONSTRAINT FKSWARM_FAMILY370172 FOREIGN KEY (ID_EVENT) REFERENCES SWARM (ID_EVENT);
ALTER TABLE SWARM_FAMILY
ADD CONSTRAINT FKSWARM_FAMILY916702 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE HARVEST_FORAGE
ADD CONSTRAINT FKHARVEST_FORAGE853641 FOREIGN KEY (ID_FAMILY, ID_EVENT) REFERENCES HARVEST (ID_FAMILY, ID_EVENT);
ALTER TABLE HARVEST_FORAGE
ADD CONSTRAINT FKHARVEST_FORAGE51654 FOREIGN KEY (ID_FORAGE) REFERENCES FORAGE (ID);
ALTER TABLE HARVEST
ADD CONSTRAINT FKHARVEST835878 FOREIGN KEY (ID_EVENT) REFERENCES HONEY_HARVEST (ID_EVENT);
ALTER TABLE EVENT_ACCOUNT
ADD CONSTRAINT FKEVENT916669 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE EVENT_ACCOUNT
ADD CONSTRAINT FKEVENT670414 FOREIGN KEY (ID_ACCOUNT) REFERENCES ACCOUNT (ID);
ALTER TABLE FAMILY_DISEASE
ADD CONSTRAINT FKFAMILY_Ch884039 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE FAMILY_DISEASE
ADD CONSTRAINT FKFAMILY_Ch972046 FOREIGN KEY (ID_EVENT) REFERENCES DISEASE (ID_EVENT);
ALTER TABLE ASSIGNMENT
ADD CONSTRAINT FKASSIGNMENT456142 FOREIGN KEY (ID_ACCOUNT) REFERENCES ACCOUNT (ID);
ALTER TABLE ASSIGNMENT_FAMILY
ADD CONSTRAINT FKASSIGNMENT_Ro348827 FOREIGN KEY (ID_ASSIGNMENT, ID_ACCOUNT) REFERENCES ASSIGNMENT (ID, ID_ACCOUNT);
ALTER TABLE ASSIGNMENT_FAMILY
ADD CONSTRAINT FKASSIGNMENT_Ro794541 FOREIGN KEY (ID_FAMILY) REFERENCES FAMILY (ID);
ALTER TABLE ASSIGNMENT
ADD CONSTRAINT FKASSIGNMENT472590 FOREIGN KEY (ID_EVENT) REFERENCES EVENT (ID);
ALTER TABLE MOTHER
ADD CONSTRAINT FKMatka863226 FOREIGN KEY (ID_RACE) REFERENCES RACE (ID);