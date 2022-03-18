CREATE OR REPLACE EDITIONABLE TRIGGER  "VOLONTEERS_BIU" 
    before insert or update  
    on "VOLUNTEERS" 
    for each row 
begin 
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end volonteers_biu;

/
ALTER TRIGGER  "VOLONTEERS_BIU" ENABLE
/
