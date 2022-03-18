CREATE OR REPLACE EDITIONABLE TRIGGER  "LANGUAGES_BIU" 
    before insert or update  
    on languages 
    for each row 
begin 
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end languages_biu;

/
ALTER TRIGGER  "LANGUAGES_BIU" ENABLE;
/