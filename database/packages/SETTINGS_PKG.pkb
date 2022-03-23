create or replace package body SETTINGS_PKG as

  function f_get_settings_row(
    pi_CODE in SETTINGS.CODE%TYPE
  ) return SETTINGS%ROWTYPE
  is
    v_return SETTINGS%ROWTYPE;
  begin
  
    for x in (select * from SETTINGS where CODE = pi_CODE)
    loop
      v_return := x;
    end loop;

    return v_return;

  end f_get_settings_row;
   
end SETTINGS_PKG;
/