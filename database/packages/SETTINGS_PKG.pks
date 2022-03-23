create or replace package SETTINGS_PKG as

  function f_get_settings_row(
    pi_CODE in SETTINGS.CODE%TYPE
  ) return SETTINGS%ROWTYPE;
   
end SETTINGS_PKG;
/