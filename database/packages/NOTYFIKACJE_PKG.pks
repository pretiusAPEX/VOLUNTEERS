create or replace package NOTYFIKACJE_PKG as

procedure p_potwierdzenie_rejestracji (
   pi_id in VOLUNTEERS.ID%TYPE
   );
   
end NOTYFIKACJE_PKG;
/