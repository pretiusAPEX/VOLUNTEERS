Prompt -----------------------
Prompt Tables
Prompt -----------------------

@@../../database/tables/LANGUAGES.sql;
@@../../database/tables/SETTINGS.sql;
@@../../database/tables/TIME_SLOTS.sql;
@@../../database/tables/VOLUNTEER_TYPES.sql;
@@../../database/tables/VOLUNTEERS_TIME_SLOT_TYPE_LIMITS.sql;
@@../../database/tables/VOLUNTEERS_TIME_SLOTS.sql;
@@../../database/tables/VOLUNTEERS.sql;


Prompt -----------------------
Prompt Constraints
Prompt -----------------------

@@../../database/constraints/VOLONTEERS_TIME_SLOT_FK.sql;
@@../../database/constraints/VOLUNTEERS_TIME_SLOT_TYPE_FK.sql;
@@../../database/constraints/VOLUNTEERS_TIME_SLOT_TYPE_LIMITS.sql;


Prompt -----------------------
Prompt Indexes
Prompt -----------------------

@@../../database/indexes/LANGUAGES_IDX1.sql;
@@../../database/indexes/SETTINGS_IDX1.sql;
@@../../database/indexes/VOLONTEERS_I1.sql;
@@../../database/indexes/VOLUNTEER_TYPES_IDX1.sql;


Prompt -----------------------
Prompt Triggers
Prompt -----------------------

@@../../database/triggers/LANGUAGES_BIU.sql;
@@../../database/triggers/TIME_SLOTS_BIU.sql;
@@../../database/triggers/VOLONTEERS_BIU.sql;
@@../../database/triggers/VOLUNTEERS_TIME_SLOT_TYPE_LIMITS_BIU.sql;
@@../../database/triggers/VOLUNTEERS_TIME_SLOTS_BIU.sql;



Prompt -----------------------
Prompt Packages
Prompt -----------------------

@@../../database/packages/NOTYFIKACJE_PKG.pks;
@@../../database/packages/NOTYFIKACJE_PKG.pkb;


Prompt -----------------------
Prompt DML
Prompt -----------------------

@@../../database/dml/settings.sql;
@@../../database/dml/time_slots.sql;
