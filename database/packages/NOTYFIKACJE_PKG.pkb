create or replace package body NOTYFIKACJE_PKG as

  function f_get_volunteers_row(
    pi_id in VOLUNTEERS.ID%TYPE
  ) return VOLUNTEERS%ROWTYPE
  is
    v_return VOLUNTEERS%ROWTYPE;
  begin
    for x in (select * 
                from VOLUNTEERS 
               where id = pi_id
    )
    loop
      v_return := x;
    end loop;

    return v_return;

  end f_get_volunteers_row;     

  function f_get_time_slot_name(
    pi_id in TIME_SLOTS.ID%TYPE
  ) return TIME_SLOTS.NAME%TYPE
  is
    v_return TIME_SLOTS.NAME%TYPE;
  begin
    for x in (select NAME 
                from TIME_SLOTS 
               where id = pi_id
    )
    loop
      v_return := x.NAME;
    end loop;

    return v_return;

  end f_get_time_slot_name; 

  function f_get_language_list(
    pi_languages in varchar2
  ) return varchar2
  is
    v_return varchar2(4000);
  begin

    select listagg(NAME, ', ') WITHIN GROUP (ORDER BY NAME)
      into v_return
      from LANGUAGES
     where CODE in (select COLUMN_VALUE 
                      from APEX_STRING.SPLIT(pi_languages,':'));

    return v_return;

  end f_get_language_list; 

  function f_get_support_type(
    pi_support_type in varchar2
  ) return varchar2
  is
    v_return varchar2(4000);
  begin

    select listagg(NAME, ', ') WITHIN GROUP (ORDER BY NAME)
      into v_return
      from VOLUNTEER_TYPES
     where CODE in (select COLUMN_VALUE 
                      from APEX_STRING.SPLIT(pi_support_type,':'));

    return v_return;

  end f_get_support_type; 

  procedure p_potwierdzenie_rejestracji(
     pi_id in VOLUNTEERS.ID%TYPE
    )
  as
    v_volunteers_row VOLUNTEERS%ROWTYPE;
    v_cancel_link varchar(32000); 
    v_time_slot varchar(200);
    v_languages varchar2(32000);
    v_support_type varchar2(32000);
  begin

    v_volunteers_row := f_get_volunteers_row(pi_id);

    v_cancel_link := APEX_UTIL.HOST_URL || APEX_UTIL.PREPARE_URL(
      p_url => 'f?p=' || v('APP_ID') || ':9:::::P9_ID:'||pi_id,
      p_checksum_type => 'PUBLIC_BOOKMARK',
      p_plain_url => true
    );
    
    v_time_slot := f_get_time_slot_name(v_volunteers_row.TIME_SLOT);
    v_languages := f_get_language_list(v_volunteers_row.LANGUAGES);
    v_support_type := f_get_support_type(v_volunteers_row.TYPE);

    apex_mail.send (
        p_to                 => v_volunteers_row.EMAIL,
        p_template_static_id => 'POTWIERDZENIE_REJESTRACJI',
        p_placeholders       => '{' ||
        '    "THE_DATE":'     || apex_json.stringify( TO_CHAR(v_volunteers_row.THE_DATE, 'fmDay, fmDD fmMonth, YYYY' )) ||
        '   ,"NAME":'         || apex_json.stringify( v_volunteers_row.NAME ) ||
        '   ,"SURNAME":'      || apex_json.stringify( v_volunteers_row.SURNAME ) ||
        '   ,"TIME_SLOT":'    || apex_json.stringify( v_time_slot ) ||
        '   ,"PHONE_NUMBER":' || apex_json.stringify( v_volunteers_row.PHONE_NUMBER ) ||
        '   ,"LANGUAGES":'    || apex_json.stringify( v_languages) ||
        '   ,"SUPPORT_TYPE":' || apex_json.stringify( v_support_type ) ||
        '   ,"COMMENTS":'     || apex_json.stringify( v_volunteers_row.COMMENTS ) ||
        '   ,"CANCEL_LINK":'  || apex_json.stringify( v_cancel_link ) ||
        '}',
        p_application_id => v('APP_ID'));
  
  end p_potwierdzenie_rejestracji;
     
  end NOTYFIKACJE_PKG;
/