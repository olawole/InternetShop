CREATE TABLE CATEGORY
(
    ID_CATEGORY NUMBER(6,0) PRIMARY KEY NOT NULL,
    PARENT_CATEGORY_ID NUMBER(6,0),
    CATEGORY_NAME VARCHAR2(40) NOT NULL,
    DELETED INTEGER DEFAULT 0  NOT NULL,
    FOREIGN KEY ( PARENT_CATEGORY_ID ) REFERENCES CATEGORY ( ID_CATEGORY )
);
CREATE TABLE CHARACTERISTIC_TYPE
(
    ID_CHARACTERISTIC_TYPE NUMBER(6,0) PRIMARY KEY NOT NULL,
    ID_CATEGORY NUMBER(6,0) NOT NULL,
    CHARACTERISTIC_TYPE_NAME VARCHAR2(40) NOT NULL,
    FOREIGN KEY ( ID_CATEGORY ) REFERENCES CATEGORY ( ID_CATEGORY )
);
CREATE TABLE ITEM
(
    ID_ITEM NUMBER(6,0) PRIMARY KEY NOT NULL,
    ID_CATEGORY NUMBER(6,0) NOT NULL,
    ITEM_NAME VARCHAR2(100) NOT NULL,
    MANUFACTURER VARCHAR2(100),
    DESCRIPTION CLOB,
    QUANTITY INTEGER NOT NULL,
    PRICE NUMBER(8,2) NOT NULL,
    LENGTH INTEGER,
    WIDTH INTEGER,
    HEIGHT INTEGER,
    WEIGHT INTEGER,
    COLOR VARCHAR2(15),
    FOREIGN KEY ( ID_CATEGORY ) REFERENCES CATEGORY ( ID_CATEGORY )
);
CREATE TABLE CHARACTERISTIC
(
  ID_CHARACTERISTIC NUMBER(6,0) PRIMARY KEY NOT NULL,
  ID_CHARACTERISTIC_TYPE NUMBER(6,0) NOT NULL,
  ID_ITEM NUMBER(6,0) NOT NULL,
  VALUE NUMBER(12,5),
  MEASURE VARCHAR2(100),
  DESCRIPTION VARCHAR2(40),
  FOREIGN KEY ( ID_CHARACTERISTIC_TYPE ) REFERENCES CHARACTERISTIC_TYPE ( ID_CHARACTERISTIC_TYPE ),
  FOREIGN KEY ( ID_ITEM ) REFERENCES ITEM ( ID_ITEM )
);
CREATE TABLE ORDER1
(
  ID_ORDER NUMBER(6,0) PRIMARY KEY NOT NULL,
  USER_NAME VARCHAR2(40),
  USER_PHONE VARCHAR2(15),
  USER_EMAIL VARCHAR2(100),
  ORDER_COMMENT VARCHAR2(1000),
  DELIVERY_TYPE VARCHAR2(30) NOT NULL,
  PAYMENT_TYPE VARCHAR2(30) NOT NULL,
  ORDER_STATUS VARCHAR2(30) NOT NULL
);
CREATE TABLE ITEM_ORDER
(
    ID_ITEM NUMBER(6,0) NOT NULL,
    ID_ORDER NUMBER(6,0) NOT NULL,
    QUANTITY INTEGER NOT NULL,
    PRICE NUMBER(8,2) DEFAULT 15  NOT NULL,
    PRIMARY KEY ( ID_ITEM, ID_ORDER ),
    FOREIGN KEY ( ID_ITEM ) REFERENCES ITEM ( ID_ITEM ),
    FOREIGN KEY ( ID_ORDER ) REFERENCES ORDER1 ( ID_ORDER )
);
CREATE TABLE PHOTO
(
    ID_PHOTO NUMBER(6,0) PRIMARY KEY NOT NULL,
    ID_ITEM NUMBER(6,0) NOT NULL,
    IMAGE BLOB NOT NULL,
    FOREIGN KEY ( ID_ITEM ) REFERENCES ITEM ( ID_ITEM )
);
CREATE TABLE VIDEO
(
  ID_VIDEO NUMBER(6,0) PRIMARY KEY NOT NULL,
  ID_ITEM NUMBER(6,0) NOT NULL,
  URL VARCHAR2(1000),
  FOREIGN KEY ( ID_ITEM ) REFERENCES ITEM ( ID_ITEM )
);
CREATE TABLE "COMMENT"
(
  ID_COMMENT NUMBER(6,0) PRIMARY KEY NOT NULL,
  ID_ITEM NUMBER(6,0) NOT NULL,
  DATE_PUBLISHED DATE NOT NULL,
  COMMENT_TEXT VARCHAR2(1000) NOT NULL,
  USER_NAME VARCHAR2(40) NOT NULL,
  FOREIGN KEY ( ID_ITEM ) REFERENCES ITEM ( ID_ITEM )
);
CREATE TABLE SHOP_ROLE
(
    ID_ROLE INTEGER PRIMARY KEY NOT NULL,
    ROLE_NAME VARCHAR2(40) NOT NULL
);
CREATE TABLE SHOP_USER
(
    ID_USER INTEGER PRIMARY KEY NOT NULL,
    LOGIN VARCHAR2(40) NOT NULL,
    PASSWORD VARCHAR2(40) NOT NULL,
    ID_ROLE INTEGER NOT NULL,
    HOME_PAGE VARCHAR2(200) NOT NULL,
    FOREIGN KEY ( ID_ROLE ) REFERENCES SHOP_ROLE ( ID_ROLE )
);
CREATE SEQUENCE S_CATEGORY START WITH 2 INCREMENT BY 1;
CREATE SEQUENCE S_CHARACTERISTIC START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_CHARACTERISTIC_TYPE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_COMMENT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_ITEM START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_ORDER START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_PHOTO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE S_VIDEO START WITH 1 INCREMENT BY 1;

INSERT INTO CATEGORY(ID_CATEGORY, PARENT_CATEGORY_ID, CATEGORY_NAME, DELETED)
    VALUES(1,null,'Default category',0);

