-- can be applied on running archive 5.10
create table retrieve_task (pk numeric(18,0) not null, completed integer not null, created_time timestamp not null, destination_aet varchar(255) not null, device_name varchar(255) not null, error_comment varchar(255), failed integer not null, local_aet varchar(255) not null, remaining integer not null, remote_aet varchar(255) not null, series_iuid varchar(255), sop_iuid varchar(255), status_code integer not null, study_iuid varchar(255) not null, updated_time timestamp not null, warning integer not null, queue_msg_fk numeric(18,0) not null, primary key (pk));
alter table retrieve_task add constraint UK_mxokt1gw5g1e7rc3ssotvuqix  unique (queue_msg_fk);
create index UK_djkqk3dls3xkru1n0c3p5rm3 on retrieve_task (device_name);
create index UK_a26s4yqy4rnpw7nniuyt7tkpo on retrieve_task (local_aet);
create index UK_3avjusmul00fc3yi1notyh16j on retrieve_task (remote_aet);
create index UK_jgaej0gm9appih04n09qto8yh on retrieve_task (destination_aet);
create index UK_gafcma0d5wwdjlq8jueqknlq0 on retrieve_task (study_iuid);
alter table retrieve_task add constraint FK_mxokt1gw5g1e7rc3ssotvuqix foreign key (queue_msg_fk) references queue_msg;
create generator retrieve_task_pk_seq;

alter table study add study_size numeric(18,0);
alter table series add series_size numeric(18,0);
alter table queue_msg add priority integer;

-- shall be applied on stopped archive before starting 5.11
update study set study_size = -1;
update series set series_size = -1;
update queue_msg set priority = 4;

alter table study alter study_size set not null;
alter table series alter series_size set not null;
alter table queue_msg alter priority set not null;

create index UK_q7vxiaj1q6ojfxdq1g9jjxgqv on study (study_size);
