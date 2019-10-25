alter table study add ( access_time timestamp, scattered_storage number(1,0) );
update study set access_time = updated_time, scattered_storage = false, access_control_id = '*';
alter table study modify ( access_time not null, scattered_storage not null, access_control_id not null );
create index UK_q8k2sl3kjl18qg1nr19l47tl1 on study (access_time);
create index UK_24av2ewa70e7cykl340n63aqd on study (access_control_id);
alter table code drop constraint UK_sb4oc9lkns36wswku831c33w6;
alter table code add constraint UK_l01jou0o1rohy7a9p933ndrxg  unique (code_value, code_designator);
alter table study add ( failed_retrieves number(10,0), failed_iuids varchar2(4000 char) );
update study set failed_retrieves = 0;
alter table study modify ( failed_retrieves not null );
