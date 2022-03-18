CREATE TABLE  "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"VOLUNTEERS_TIME_SLOTS_ID" NUMBER NOT NULL ENABLE, 
	"VOLUNTEER_TYPES_ID" NUMBER NOT NULL ENABLE, 
	"TYPE_LIMIT" NUMBER NOT NULL ENABLE, 
	"CREATED" DATE, 
	"CREATED_BY" VARCHAR2(1000), 
	"UPDATED" DATE, 
	"UPDATED_BY" VARCHAR2(1000), 
	 CONSTRAINT "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_CON" UNIQUE ("VOLUNTEERS_TIME_SLOTS_ID", "VOLUNTEER_TYPES_ID")
  USING INDEX  ENABLE
   )
/