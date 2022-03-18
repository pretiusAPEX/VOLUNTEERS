CREATE OR REPLACE EDITIONABLE TRIGGER  "VOLUNTEERS_TIME_SLOTS_BIU" 
    before insert or update  
    on VOLUNTEERS_TIME_SLOTS 
    for each row 
begin 
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end VOLUNTEERS_TIME_SLOTS_biu;

/
ALTER TRIGGER  "VOLUNTEERS_TIME_SLOTS_BIU" ENABLE
/