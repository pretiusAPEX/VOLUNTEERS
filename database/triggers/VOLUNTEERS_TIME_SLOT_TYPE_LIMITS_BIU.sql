CREATE OR REPLACE EDITIONABLE TRIGGER  "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_BIU" 
    before insert or update  
    on "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS" 
    for each row 
begin 
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_BIU;

/
ALTER TRIGGER  "VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_BIU" ENABLE
/
