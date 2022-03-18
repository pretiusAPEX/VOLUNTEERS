CREATE OR REPLACE EDITIONABLE TRIGGER  "TIME_SLOTS_BIU" 
    before insert or update  
    on time_slots 
    for each row 
begin 
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end time_slots_biu;

/
ALTER TRIGGER  "TIME_SLOTS_BIU" ENABLE
/
