create table code (pk numeric(18,0) not null, code_meaning varchar(255) not null, code_value varchar(16) not null, code_designator varchar(16) not null, code_version varchar(16) not null, primary key (pk));
create table content_item (pk numeric(18,0) not null, rel_type varchar(255) not null, text_value varchar(255), code_fk numeric(18,0), name_fk numeric(18,0) not null, instance_fk numeric(18,0), primary key (pk));
create table dicomattrs (pk numeric(18,0) not null, attrs blob not null, primary key (pk));
create table diff_task (pk numeric(18,0) not null, check_different smallint not null, check_missing smallint not null, compare_fields varchar(255), created_time timestamp not null, different integer not null, local_aet varchar(255) not null, matches integer not null, missing integer not null, primary_aet varchar(255) not null, query_str varchar(255) not null, secondary_aet varchar(255) not null, updated_time timestamp not null, queue_msg_fk numeric(18,0) not null, primary key (pk));
create table diff_task_attrs (diff_task_fk numeric(18,0) not null, dicomattrs_fk numeric(18,0) not null);
create table export_task (pk numeric(18,0) not null, created_time timestamp not null, device_name varchar(255) not null, exporter_id varchar(255) not null, modalities varchar(255), num_instances integer, scheduled_time timestamp not null, series_iuid varchar(64) not null, sop_iuid varchar(64) not null, study_iuid varchar(64) not null, updated_time timestamp not null, version numeric(18,0), queue_msg_fk numeric(18,0), primary key (pk));
create table global_subscription (pk numeric(18,0) not null, deletion_lock smallint not null, subscriber_aet varchar(255) not null, matchkeys_fk numeric(18,0), primary key (pk));
create table hl7psu_task (pk numeric(18,0) not null, aet varchar(255) not null, created_time timestamp not null, device_name varchar(255) not null, scheduled_time timestamp, study_iuid varchar(255), mpps_fk numeric(18,0), primary key (pk));
create table ian_task (pk numeric(18,0) not null, calling_aet varchar(255) not null, device_name varchar(255) not null, ian_dests varchar(255) not null, scheduled_time timestamp, study_iuid varchar(255), mpps_fk numeric(18,0), primary key (pk));
create table id_sequence (name varchar(255) not null, next_value integer not null, version numeric(18,0), primary key (name));
create table instance (pk numeric(18,0) not null, availability integer not null, sr_complete varchar(255) not null, content_date varchar(255) not null, content_time varchar(255) not null, created_time timestamp not null, ext_retrieve_aet varchar(255), inst_custom1 varchar(255) not null, inst_custom2 varchar(255) not null, inst_custom3 varchar(255) not null, inst_no integer, num_frames integer, retrieve_aets varchar(255), sop_cuid varchar(255) not null, sop_iuid varchar(255) not null, updated_time timestamp not null, sr_verified varchar(255) not null, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, srcode_fk numeric(18,0), series_fk numeric(18,0) not null, primary key (pk));
create table issuer (pk numeric(18,0) not null, entity_id varchar(255), entity_uid varchar(64), entity_uid_type varchar(16), primary key (pk));
create table location (pk numeric(18,0) not null, created_time timestamp not null, digest varchar(255), multi_ref integer, object_type integer not null, object_size numeric(18,0) not null, status integer not null, storage_id varchar(255) not null, storage_path varchar(255) not null, tsuid varchar(255), instance_fk numeric(18,0), uidmap_fk numeric(18,0), primary key (pk));
create table metadata (pk numeric(18,0) not null, created_time timestamp not null, digest varchar(255), object_size numeric(18,0) not null, status integer not null, storage_id varchar(255) not null, storage_path varchar(255) not null, primary key (pk));
create table mpps (pk numeric(18,0) not null, accession_no varchar(255) not null, created_time timestamp not null, pps_start_date varchar(255) not null, pps_start_time varchar(255) not null, sop_iuid varchar(255) not null, pps_status integer not null, study_iuid varchar(255) not null, updated_time timestamp not null, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, discreason_code_fk numeric(18,0), accno_issuer_fk numeric(18,0), patient_fk numeric(18,0) not null, primary key (pk));
create table mwl_item (pk numeric(18,0) not null, accession_no varchar(255) not null, created_time timestamp not null, modality varchar(255) not null, req_proc_id varchar(255) not null, sps_id varchar(16) not null, sps_start_date varchar(255) not null, sps_start_time varchar(255) not null, sps_status integer not null, study_iuid varchar(64) not null, updated_time timestamp not null, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, accno_issuer_fk numeric(18,0), patient_fk numeric(18,0) not null, perf_phys_name_fk numeric(18,0), primary key (pk));
create table patient (pk numeric(18,0) not null, created_time timestamp not null, failed_verifications integer not null, num_studies integer not null, pat_birthdate varchar(255) not null, pat_custom1 varchar(255) not null, pat_custom2 varchar(255) not null, pat_custom3 varchar(255) not null, pat_sex varchar(255) not null, updated_time timestamp not null, verification_status integer not null, verification_time timestamp, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, merge_fk numeric(18,0), patient_id_fk numeric(18,0), pat_name_fk numeric(18,0), resp_person_fk numeric(18,0), primary key (pk));
create table patient_id (pk numeric(18,0) not null, pat_id varchar(255) not null, pat_id_type_code varchar(255), version numeric(18,0), issuer_fk numeric(18,0), primary key (pk));
create table person_name (pk numeric(18,0) not null, family_name varchar(255), given_name varchar(255), i_family_name varchar(255), i_given_name varchar(255), i_middle_name varchar(255), i_name_prefix varchar(255), i_name_suffix varchar(255), middle_name varchar(255), name_prefix varchar(255), name_suffix varchar(255), p_family_name varchar(255), p_given_name varchar(255), p_middle_name varchar(255), p_name_prefix varchar(255), p_name_suffix varchar(255), primary key (pk));
create table queue_msg (pk numeric(18,0) not null, batch_id varchar(255), created_time timestamp not null, device_name varchar(255) not null, error_msg varchar(255), msg_body blob not null, msg_id varchar(255) not null, msg_props varchar(4000) not null, num_failures integer not null, outcome_msg varchar(255), priority integer not null, proc_end_time timestamp, proc_start_time timestamp, queue_name varchar(255) not null, scheduled_time timestamp not null, msg_status integer not null, updated_time timestamp not null, version numeric(18,0), primary key (pk));
create table rejected_instance (pk numeric(18,0) not null, created_time timestamp not null, series_iuid varchar(255) not null, sop_cuid varchar(255) not null, sop_iuid varchar(255) not null, study_iuid varchar(255) not null, reject_code_fk numeric(18,0), primary key (pk));
create table rel_study_pcode (study_fk numeric(18,0) not null, pcode_fk numeric(18,0) not null);
create table rel_ups_perf_code (ups_fk numeric(18,0) not null, perf_code_fk numeric(18,0) not null);
create table retrieve_task (pk numeric(18,0) not null, batch_id varchar(255), completed integer not null, created_time timestamp not null, destination_aet varchar(255) not null, device_name varchar(255) not null, error_comment varchar(255), failed integer not null, local_aet varchar(255) not null, queue_name varchar(255) not null, remaining integer not null, remote_aet varchar(255) not null, series_iuid varchar(255), sop_iuid varchar(255), status_code integer not null, study_iuid varchar(255) not null, updated_time timestamp not null, warning integer not null, queue_msg_fk numeric(18,0), primary key (pk));
create table series (pk numeric(18,0) not null, body_part varchar(255) not null, completeness integer not null, compress_failures integer not null, compress_params varchar(255), compress_time timestamp, compress_tsuid varchar(255), created_time timestamp not null, expiration_date varchar(255), expiration_exporter_id varchar(255), expiration_state integer not null, ext_retrieve_aet varchar(255), failed_retrieves integer not null, stgver_failures integer not null, inst_purge_state integer not null, inst_purge_time timestamp, institution varchar(255) not null, department varchar(255) not null, laterality varchar(255) not null, metadata_update_time timestamp, metadata_update_failures integer not null, modality varchar(255) not null, pps_cuid varchar(255) not null, pps_iuid varchar(255) not null, pps_start_date varchar(255) not null, pps_start_time varchar(255) not null, rejection_state integer not null, series_custom1 varchar(255) not null, series_custom2 varchar(255) not null, series_custom3 varchar(255) not null, series_desc varchar(255) not null, series_iuid varchar(255) not null, series_no integer, series_size numeric(18,0) not null, sop_cuid varchar(255) not null, src_aet varchar(255), station_name varchar(255) not null, stgver_time timestamp, tsuid varchar(255) not null, updated_time timestamp not null, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, inst_code_fk numeric(18,0), metadata_fk numeric(18,0), perf_phys_name_fk numeric(18,0), study_fk numeric(18,0) not null, primary key (pk));
create table series_query_attrs (pk numeric(18,0) not null, availability integer, num_instances integer, retrieve_aets varchar(255), cuids_in_series varchar(255), view_id varchar(255), series_fk numeric(18,0) not null, primary key (pk));
create table series_req (pk numeric(18,0) not null, accession_no varchar(255) not null, req_proc_id varchar(255) not null, req_service varchar(255) not null, sps_id varchar(255) not null, study_iuid varchar(255) not null, accno_issuer_fk numeric(18,0), req_phys_name_fk numeric(18,0), series_fk numeric(18,0), primary key (pk));
create table soundex_code (pk numeric(18,0) not null, sx_code_value varchar(255) not null, sx_pn_comp_part integer not null, sx_pn_comp integer not null, person_name_fk numeric(18,0) not null, primary key (pk));
create table sps_station_aet (mwl_item_fk numeric(18,0) not null, station_aet varchar(255));
create table stgcmt_result (pk numeric(18,0) not null, batch_id varchar(255), created_time timestamp not null, device_name varchar(255) not null, exporter_id varchar(255), msg_id varchar(255), num_failures integer, num_instances integer, series_iuid varchar(255), sop_iuid varchar(255), stgcmt_status integer not null, study_iuid varchar(255) not null, transaction_uid varchar(255) not null, updated_time timestamp not null, primary key (pk));
create table stgver_task (pk numeric(18,0) not null, completed integer not null, created_time timestamp not null, failed integer not null, local_aet varchar(255) not null, series_iuid varchar(64), sop_iuid varchar(64), storage_ids varchar(255), stgcmt_policy integer, study_iuid varchar(64) not null, update_location_status smallint, updated_time timestamp not null, queue_msg_fk numeric(18,0) not null, primary key (pk));
create table study (pk numeric(18,0) not null, access_control_id varchar(255) not null, access_time timestamp not null, accession_no varchar(255) not null, completeness integer not null, created_time timestamp not null, expiration_date varchar(255), expiration_exporter_id varchar(255), expiration_state integer not null, ext_retrieve_aet varchar(255) not null, failed_retrieves integer not null, modified_time timestamp not null, rejection_state integer not null, study_size numeric(18,0) not null, storage_ids varchar(255), study_custom1 varchar(255) not null, study_custom2 varchar(255) not null, study_custom3 varchar(255) not null, study_date varchar(255) not null, study_desc varchar(255) not null, study_id varchar(255) not null, study_iuid varchar(255) not null, study_time varchar(255) not null, updated_time timestamp not null, version numeric(18,0), dicomattrs_fk numeric(18,0) not null, accno_issuer_fk numeric(18,0), patient_fk numeric(18,0) not null, ref_phys_name_fk numeric(18,0), primary key (pk));
create table study_query_attrs (pk numeric(18,0) not null, availability integer, mods_in_study varchar(255), num_instances integer, num_series integer, retrieve_aets varchar(255), cuids_in_study varchar(255), view_id varchar(255), study_fk numeric(18,0) not null, primary key (pk));
create table subscription (pk numeric(18,0) not null, deletion_lock smallint not null, subscriber_aet varchar(255) not null, ups_fk numeric(18,0) not null, primary key (pk));
create table uidmap (pk numeric(18,0) not null, uidmap blob not null, primary key (pk));
create table ups (pk numeric(18,0) not null, admission_id varchar(255) not null, created_time timestamp not null, expected_end_date_time varchar(255) not null, input_readiness_state integer not null, performer_aet varchar(255), ups_state integer not null, replaced_iuid varchar(255) not null, expiration_date_time varchar(255) not null, start_date_time varchar(255) not null, transaction_iuid varchar(255), updated_time timestamp not null, ups_iuid varchar(255) not null, ups_label varchar(255) not null, ups_priority integer not null, version numeric(18,0), worklist_label varchar(255) not null, dicomattrs_fk numeric(18,0) not null, admission_issuer_fk numeric(18,0), patient_fk numeric(18,0) not null, station_class_fk numeric(18,0), station_location_fk numeric(18,0), station_name_fk numeric(18,0), ups_code_fk numeric(18,0), primary key (pk));
create table ups_req (pk numeric(18,0) not null, accession_no varchar(255) not null, req_proc_id varchar(255) not null, req_service varchar(255) not null, study_iuid varchar(255) not null, accno_issuer_fk numeric(18,0), req_phys_name_fk numeric(18,0), ups_fk numeric(18,0), primary key (pk));
create table verify_observer (pk numeric(18,0) not null, verify_datetime varchar(255) not null, observer_name_fk numeric(18,0), instance_fk numeric(18,0), primary key (pk));
alter table code add constraint UK_sb4oc9lkns36wswku831c33w6  unique (code_value, code_designator, code_version);
create index UK_i715nk4mi378f9bxflvfroa5a on content_item (rel_type);
create index UK_6iism30y000w85v649ju968sv on content_item (text_value);
alter table diff_task add constraint UK_dlrthwe594xvfeta3kyuih3ip  unique (queue_msg_fk);
create index UK_ji31t9tjovks2hi8c220kvh2o on diff_task (local_aet);
create index UK_kigvmtftfxwb5ekb5a1d48okh on diff_task (primary_aet);
create index UK_4esq3qn81u1ww82vsheeiy424 on diff_task (secondary_aet);
create index UK_swm85lyyxy8sr2oot4dcrjck4 on diff_task (created_time);
create index UK_dyakfsqdbpk1bgme5i9xw20jj on diff_task (updated_time);
create index UK_1b3rghtxfl0byme5urnxmd4xl on diff_task (check_missing);
create index UK_ex8bacv78us242731mpyrigpd on diff_task (check_different);
create index UK_d92i2fx5i138fbehp4qfk on diff_task (compare_fields);
alter table diff_task_attrs add constraint UK_72rsx022j2wu9noi6jldvq95r  unique (dicomattrs_fk);
create index UK_c5cof80jx0oopvovf3p4jv4l8 on export_task (device_name);
create index UK_7iil4v32vf234i75edsxkdr8f on export_task (created_time);
create index UK_p5jjs08sdp9oecvr93r2g0kyq on export_task (updated_time);
create index UK_j1t0mj3vlmf5xwt4fs5xida1r on export_task (scheduled_time);
create index UK_q7gmfr3aog1hateydhfeiu7si on export_task (exporter_id);
create index UK_hb9rftf7opmg56nkg7dkvsdc8 on export_task (study_iuid, series_iuid, sop_iuid);
alter table global_subscription add constraint UK_4n26cxir6d3tksb2cd1kd86ch  unique (subscriber_aet);
alter table hl7psu_task add constraint UK_p5fraoqdbaywmlyumaeo16t56  unique (study_iuid);
create index UK_t0y05h07d9dagn9a4a9s4a5a4 on hl7psu_task (device_name);
alter table ian_task add constraint UK_dq88edcjjxh7h92f89y5ueast  unique (study_iuid);
create index UK_5shiir23exao1xpy2n5gvasrh on ian_task (device_name);
alter table instance add constraint UK_jxfu47kwjk3kkkyrwewjw8a4n  unique (dicomattrs_fk);
alter table instance add constraint UK_247lgirehl8i2vuanyfjnuyjb  unique (series_fk, sop_iuid);
create index UK_eg0khesxr81gdimwhjiyrylw7 on instance (sop_iuid);
create index UK_dglm8ndp9y9i0uo6fgaa5rhbb on instance (sop_cuid);
create index UK_ouh6caecancvsa05lknojy30j on instance (inst_no);
create index UK_5ikkfk17vijvsvtyied2xa225 on instance (content_date);
create index UK_pck1ovyd4t96mjkbbw6f8jiam on instance (content_time);
create index UK_qh8jqpe8ulsb5t7iv24scho00 on instance (sr_verified);
create index UK_gisd09x31lphi4437hwgh7ihg on instance (sr_complete);
create index UK_fncb1s641rrnoek7j47k0j06n on instance (inst_custom1);
create index UK_rr1ro1oxv6s4riib9hjkcuvuo on instance (inst_custom2);
create index UK_q5i0hxt1iyahxjiroux2h8imm on instance (inst_custom3);
alter table issuer add constraint UK_gknfxd1vh283cmbg8ymia9ms8  unique (entity_id);
alter table issuer add constraint UK_t1p7jajas0mu12sx8jvtp2y0f  unique (entity_uid, entity_uid_type);
create index UK_r3oh859i9osv3aluoc8dcx9wk on location (storage_id, status);
create index UK_i1lnahmehau3r3j9pdyxg3p3y on location (multi_ref);
create index UK_f7c9hmq8pfypohkgkp5vkbhxp on metadata (storage_id, status);
alter table mpps add constraint UK_o49fec996jvdo31o7ysmsn9s2  unique (dicomattrs_fk);
alter table mpps add constraint UK_cyqglxijg7kebbj6oj821yx4d  unique (sop_iuid);
alter table mwl_item add constraint UK_6qj8tkh6ib9w2pjqwvqe23ko  unique (dicomattrs_fk);
alter table mwl_item add constraint UK_lerlqlaghhcs0oaj5irux4qig  unique (study_iuid, sps_id);
create index UK_d0v5hjn1crha2nqbws4wj0yoj on mwl_item (updated_time);
create index UK_2odo3oah39o400thy9bf0rgv0 on mwl_item (sps_id);
create index UK_kedi0qimmvs83af3jxk471uxn on mwl_item (req_proc_id);
create index UK_fpfq8q514gsime2dl8oo773d4 on mwl_item (study_iuid);
create index UK_pw8h1b4sac2sr9estyqr82pcf on mwl_item (accession_no);
create index UK_q28149iaxebyt3de2h5sm2bgl on mwl_item (modality);
create index UK_9oh3yd4prp9sfys4n0p2kd69y on mwl_item (sps_start_date);
create index UK_m20xnkg1iqetifvuegehbhekm on mwl_item (sps_start_time);
create index UK_3oigo76r1a7et491bkci96km8 on mwl_item (sps_status);
alter table patient add constraint UK_5lgndn3gn7iug3kuewiy9q124  unique (dicomattrs_fk);
alter table patient add constraint UK_39gahcxyursxfxe2ucextr65s  unique (patient_id_fk);
create index UK_e7rsyrt9n2mccyv1fcd2s6ikv on patient (verification_status);
create index UK_bay8wkvwegw3pmyeypv2v93k1 on patient (verification_time);
create index UK_296rccryifu6d8byisl2f4dvq on patient (num_studies);
create index UK_1ho1jyofty54ip8aqpuhi4mu1 on patient (pat_birthdate);
create index UK_545wp9un24fhgcy2lcfu1o04y on patient (pat_sex);
create index UK_9f2m2lkijm7wi0hpjsime069n on patient (pat_custom1);
create index UK_dwp6no1c4624yii6sbo59fedg on patient (pat_custom2);
create index UK_3ioui3yamjf01yny98bliqfgs on patient (pat_custom3);
alter table patient_id add constraint UK_31gvi9falc03xs94m8l3pgoid  unique (pat_id, issuer_fk);
create index UK_mgrwrswyrk02s1kn86cvpix3m on person_name (family_name);
create index UK_byvbmsx5w9jop12gdqldogbwm on person_name (given_name);
create index UK_hop27c6p2aiabl0ei6rj7oohi on person_name (middle_name);
create index UK_l3prcvmx90pdclj84s6uvbblm on person_name (i_family_name);
create index UK_tgh0ek52g7cpioire3qwdweoi on person_name (i_given_name);
create index UK_lwnfdvx2cknj9ravec592642d on person_name (i_middle_name);
create index UK_2189yvio0mae92hjhgbfwqgvc on person_name (p_family_name);
create index UK_6cn50unrp2u9xf6authiollrr on person_name (p_given_name);
create index UK_kungbb1r2qtt9aq0vsb1l68y6 on person_name (p_middle_name);
alter table queue_msg add constraint UK_k520j369nwx6rpbkvlp4kn623  unique (msg_id);
create index UK_kvtxqtdow67hcr2wv8irtdwqy on queue_msg (device_name);
create index UK_b5mbe6jenklf1r5wp5csrvf67 on queue_msg (queue_name);
create index UK_o8pu8axwpcm4chqxy75y09gpo on queue_msg (msg_status);
create index UK_jfyulc3fo7cmn29sbha0l72m3 on queue_msg (created_time);
create index UK_gsdfgth9kxjat98cmabtj8x1h on queue_msg (updated_time);
create index UK_ln9rs61la03lhvgiv8c2wehnr on queue_msg (batch_id);
alter table rejected_instance add constraint UK_6liqevdmi0spifxf2vrh18wkp  unique (study_iuid, series_iuid, sop_iuid);
create index UK_owm55at56tdjitsncsrhr93xj on rejected_instance (created_time);
create index UK_djkqk3dls3xkru1n0c3p5rm3 on retrieve_task (device_name);
create index UK_r866eptnxfw7plhxwtm3vks0e on retrieve_task (queue_name);
create index UK_a26s4yqy4rnpw7nniuyt7tkpo on retrieve_task (local_aet);
create index UK_3avjusmul00fc3yi1notyh16j on retrieve_task (remote_aet);
create index UK_jgaej0gm9appih04n09qto8yh on retrieve_task (destination_aet);
create index UK_sf2g7oi8cfx89olwch9095hx7 on retrieve_task (created_time);
create index UK_e2lo4ep4t4k07njc09anf6xkm on retrieve_task (updated_time);
create index UK_gafcma0d5wwdjlq8jueqknlq0 on retrieve_task (study_iuid);
create index UK_ahkqwir2di2jm44jlhi22iw3e on retrieve_task (batch_id);
alter table series add constraint UK_bdj2kuutidekc2en6dckev7l6  unique (dicomattrs_fk);
alter table series add constraint UK_83y2fx8cou17h3xggxspgikna  unique (study_fk, series_iuid);
create index UK_9fi64g5jjycg9dp24jjk5txg1 on series (series_iuid);
create index UK_jlgy9ifvqak4g2bxkchismw8x on series (rejection_state);
create index UK_75oc6w5ootkuwyvmrhe3tbown on series (series_no);
create index UK_b126hub0dc1o9dqp6awoispx2 on series (modality);
create index UK_mrn00m45lkq1xbehmbw5d9jbl on series (sop_cuid);
create index UK_tahx0q1ejidnsam40ans7oecx on series (tsuid);
create index UK_pq1yi70ftxhh391lhcq3e08nf on series (station_name);
create index UK_rvlxc150uexwmr1l9ojp8fgd on series (pps_start_date);
create index UK_amr00xwlatxewgj1sjp5mnf76 on series (pps_start_time);
create index UK_gwp46ofa26am9ohhccq1ohdj on series (body_part);
create index UK_tbdrfrmkmifsqhpf43065jrbs on series (laterality);
create index UK_achxn1rtfm3fbkkswlsyr75t0 on series (series_desc);
create index UK_82qea56c0kdhod3b1wu8wbrny on series (institution);
create index UK_bqu32v5v76p4qi0etptnrm0pc on series (department);
create index UK_hm39592a9n7m54dgso17irlhv on series (series_custom1);
create index UK_q3wayt2ke25fdcghaohhrjiu7 on series (series_custom2);
create index UK_d8b8irasiw8eh9tsigmwkbvae on series (series_custom3);
create index UK_ih49lthl3udoca5opvgsdcerj on series (expiration_state);
create index UK_ta3pi6exqft5encv389hwjytw on series (expiration_date);
create index UK_j6aadbh7u93bpmv18s1inrl1r on series (failed_retrieves);
create index UK_4lnegvfs65fbkjn7nmg9s8usy on series (completeness);
create index UK_hwkcpd7yv0nca7o918wm4bn69 on series (metadata_update_time);
create index UK_6xqpk4cvy49wj41p2qwixro8w on series (metadata_update_failures);
create index UK_a8vyikwd972jomyb3f6brcfh5 on series (inst_purge_time);
create index UK_er4ife08f6eaki91gt3hxt5e on series (inst_purge_state);
create index UK_ftv3ijh2ud6ogoknneyqc6t9i on series (stgver_time);
create index UK_s1vceb8cu9c45j0q8tbldgol9 on series (stgver_failures);
create index UK_38mfgfnjhan2yhnwqtcrawe4 on series (compress_time);
create index UK_889438ocqfrvybu3k2eo65lpa on series (compress_failures);
alter table series_query_attrs add constraint UK_t1uhb1suiiqffhsv9eaopeevs  unique (view_id, series_fk);
create index UK_m4wanupyq3yldxgh3pbo7t68h on series_req (accession_no);
create index UK_l1fg3crmk6pjeu1x36e25h6p4 on series_req (req_service);
create index UK_p9w1wg4031w6y66w4xhx1ffay on series_req (req_proc_id);
create index UK_4uq79j30ind90jjs68gb24j6e on series_req (sps_id);
create index UK_crnpneoalwq25p795xtrhbx2 on series_req (study_iuid);
create index UK_fjwlo6vk0gxp78eh2i7j04a5t on soundex_code (sx_pn_comp);
create index UK_nlv8hnjxmb7pobdfl094ud14u on soundex_code (sx_pn_comp_part);
create index UK_3dxkqfajcytiwjjb5rgh4nu1l on soundex_code (sx_code_value);
create index UK_tm93u8kuxnasoguns5asgdx4a on sps_station_aet (station_aet);
alter table stgcmt_result add constraint UK_ey6qpep2qtiwayou7pd0vj22w  unique (transaction_uid);
create index UK_qko59fn9pb87j1eu070ilfkhm on stgcmt_result (updated_time);
create index UK_7ltjgxoijy15rrwihl8euv7vh on stgcmt_result (device_name);
create index UK_gu96kxnbf2p84d1katepo0btq on stgcmt_result (exporter_id);
create index UK_4iih0m0ueyvaim3033di45ems on stgcmt_result (msg_id);
create index UK_f718gnu5js0mdg39q6j7fklia on stgcmt_result (batch_id);
create index UK_p65blcj4h0uh2itb0bp49mc07 on stgcmt_result (study_iuid);
create index UK_nyoefler7agcmxc8t8yfngq7e on stgcmt_result (stgcmt_status);
alter table stgver_task add constraint UK_hch5fanx7ejwew2ag2ividq9r  unique (queue_msg_fk);
create index UK_fe2td8g77y54d90w7339ka0ix on stgver_task (created_time);
create index UK_bja5px1r9qts4nydp1a2i61ok on stgver_task (updated_time);
create index UK_iudr0qmrm15i2evq1733h1ace on stgver_task (study_iuid, series_iuid, sop_iuid);
alter table study add constraint UK_5w0oynbw061mwu1rr9mrb6kj4  unique (dicomattrs_fk);
alter table study add constraint UK_pt5qn20x278wb1f7p2t3lcxv  unique (study_iuid);
create index UK_q8k2sl3kjl18qg1nr19l47tl1 on study (access_time);
create index UK_6ry2squ4qcv129lxpae1oy93m on study (created_time);
create index UK_24av2ewa70e7cykl340n63aqd on study (access_control_id);
create index UK_hwu9omd369ju3nufufxd3vof2 on study (rejection_state);
create index UK_fypbtohf5skbd3bkyd792a6dt on study (storage_ids);
create index UK_a1rewlmf8uxfgshk25f6uawx2 on study (study_date);
create index UK_16t2xvj9ttyvbwh1ijeve01ii on study (study_time);
create index UK_2ofn5q0fdfc6941e5j34bplmv on study (accession_no);
create index UK_j3q7fkhhiu4bolglyve3lv385 on study (study_desc);
create index UK_ksy103xef0hokd33y8ux7afxl on study (study_custom1);
create index UK_j63d3ip6x4xslkmyks1l89aay on study (study_custom2);
create index UK_8xolm3oljt08cuheepwq3fls7 on study (study_custom3);
create index UK_fyasyw3wco6hoj2entr7l6d09 on study (expiration_state);
create index UK_mlk5pdi8une92kru8g2ppappx on study (expiration_date);
create index UK_9qvng5j8xnli8yif7p0rjngb2 on study (failed_retrieves);
create index UK_gl5rq54a0tr8nreu27c2t04rb on study (completeness);
create index UK_cl9dmi0kb97ov1cjh7rn3dhve on study (ext_retrieve_aet);
create index UK_q7vxiaj1q6ojfxdq1g9jjxgqv on study (study_size);
alter table study_query_attrs add constraint UK_prn4qt6d42stw0gfi1yce1fap  unique (view_id, study_fk);
alter table subscription add constraint UK_co8q5hn46dehb35qsrtwyys96  unique (subscriber_aet, ups_fk);
alter table ups add constraint UK_3frtpy5cstsoxk5jxw9cutr33  unique (dicomattrs_fk);
alter table ups add constraint UK_qck03rlxht9myv77sc79a480t  unique (ups_iuid);
create index UK_1umoxe7ig9n21q885mncxeq9 on ups (updated_time);
create index UK_kgwfwmxj3i0n7c404uvhsav1g on ups (ups_priority);
create index UK_d3ejkrtcim0q3cbwpq4n9skes on ups (ups_label);
create index UK_7e44lxlg0m2l2wfdo3k2tec7o on ups (worklist_label);
create index UK_kh194du6g35fi5l80vbj18nnp on ups (start_date_time);
create index UK_e57ifctiig366oq9mhab8law3 on ups (expiration_date_time);
create index UK_1hdr3ml1rwugwkmo3eks4no5p on ups (expected_end_date_time);
create index UK_brtgc3vpnoaq1xm80m568r16y on ups (input_readiness_state);
create index UK_sqoo5rr8pu2qe4gtdne3xh031 on ups (admission_id);
create index UK_crl67piqoxiccp3i6ckktphdd on ups (replaced_iuid);
create index UK_c8obxmqpdcy37r3pjga2pukac on ups (ups_state);
create index UK_rfium2ybikqm1f4xmi24mnv4u on ups_req (accession_no);
create index UK_emsk27nclko11ph2tcj5vk7hg on ups_req (req_service);
create index UK_524vr0q4c0kvyjwov74eru44x on ups_req (req_proc_id);
create index UK_hf0tly8umknn77civcsi0tdih on ups_req (study_iuid);
create index UK_5btv5autls384ulwues8lym4p on verify_observer (verify_datetime);
alter table content_item add constraint FK_gudw6viy7lrf5t5hetw7mbgh5 foreign key (code_fk) references code;
alter table content_item add constraint FK_pyrd1nhijag5ct0ee9xqq4h78 foreign key (name_fk) references code;
alter table content_item add constraint FK_9kpe6whsov3ur9rph4ih2vi5a foreign key (instance_fk) references instance;
alter table diff_task add constraint FK_dlrthwe594xvfeta3kyuih3ip foreign key (queue_msg_fk) references queue_msg;
alter table diff_task_attrs add constraint FK_72rsx022j2wu9noi6jldvq95r foreign key (dicomattrs_fk) references dicomattrs;
alter table diff_task_attrs add constraint FK_1sbjtesix8hkq310i84lfg0xi foreign key (diff_task_fk) references diff_task;
alter table export_task add constraint FK_g6atpiywpo2100kn6ovix7uet foreign key (queue_msg_fk) references queue_msg;
alter table global_subscription add constraint FK_f1l196ykcnh7s2pwo6qnmltw7 foreign key (matchkeys_fk) references dicomattrs;
alter table hl7psu_task add constraint FK_pev4urgkk7id2h1ijhv8domjx foreign key (mpps_fk) references mpps;
alter table ian_task add constraint FK_1fuh251le2hid2byw90hd1mly foreign key (mpps_fk) references mpps;
alter table instance add constraint FK_jxfu47kwjk3kkkyrwewjw8a4n foreign key (dicomattrs_fk) references dicomattrs;
alter table instance add constraint FK_7w6f9bi2w91qr2abl6ddxnrwq foreign key (srcode_fk) references code;
alter table instance add constraint FK_s4tgrew4sh4qxoupmk3gihtrk foreign key (series_fk) references series;
alter table location add constraint FK_hjtlcwsvwihs4khh961d423e7 foreign key (instance_fk) references instance;
alter table location add constraint FK_bfk5vl6eoxaf0hhwiu3rbgmkn foreign key (uidmap_fk) references uidmap;
alter table mpps add constraint FK_o49fec996jvdo31o7ysmsn9s2 foreign key (dicomattrs_fk) references dicomattrs;
alter table mpps add constraint FK_nrigpgue611m33rao03nnfe5l foreign key (discreason_code_fk) references code;
alter table mpps add constraint FK_grl2idmms10qq4lhmh909jxtj foreign key (accno_issuer_fk) references issuer;
alter table mpps add constraint FK_ofg0lvfxad6r5oigw3y6da27u foreign key (patient_fk) references patient;
alter table mwl_item add constraint FK_6qj8tkh6ib9w2pjqwvqe23ko foreign key (dicomattrs_fk) references dicomattrs;
alter table mwl_item add constraint FK_ot32lpvialton54xqh636c4it foreign key (accno_issuer_fk) references issuer;
alter table mwl_item add constraint FK_vkxtls2wr17wgxnxj7b2fe32 foreign key (patient_fk) references patient;
alter table mwl_item add constraint FK_44qwwvs50lgpog2cqmicxgt1f foreign key (perf_phys_name_fk) references person_name;
alter table patient add constraint FK_5lgndn3gn7iug3kuewiy9q124 foreign key (dicomattrs_fk) references dicomattrs;
alter table patient add constraint FK_sk77bwjgaoetvy1pbcgqf08g foreign key (merge_fk) references patient;
alter table patient add constraint FK_39gahcxyursxfxe2ucextr65s foreign key (patient_id_fk) references patient_id;
alter table patient add constraint FK_rj42ffdtimnrcwmqqlvj24gi2 foreign key (pat_name_fk) references person_name;
alter table patient add constraint FK_56r2g5ggptqgcvb3hl11adke2 foreign key (resp_person_fk) references person_name;
alter table patient_id add constraint FK_oo232lt89k1b5h8mberi9v152 foreign key (issuer_fk) references issuer;
alter table rejected_instance add constraint FK_iafiq2ugv5rd6fonwd0vd7xdx foreign key (reject_code_fk) references code;
alter table rel_study_pcode add constraint FK_fryhnb2ppb6fcop3jrrfwvnfy foreign key (pcode_fk) references code;
alter table rel_study_pcode add constraint FK_mnahh8fh77d365m6w2x4x3f4q foreign key (study_fk) references study;
alter table rel_ups_perf_code add constraint FK_6asj28yy5se9mp443b6ryefd2 foreign key (perf_code_fk) references code;
alter table rel_ups_perf_code add constraint FK_6m06tt8ku376qxkro94xpteus foreign key (ups_fk) references ups;
alter table retrieve_task add constraint FK_mxokt1gw5g1e7rc3ssotvuqix foreign key (queue_msg_fk) references queue_msg;
alter table series add constraint FK_bdj2kuutidekc2en6dckev7l6 foreign key (dicomattrs_fk) references dicomattrs;
alter table series add constraint FK_oiq81nulcmtg6p85iu31igtf5 foreign key (inst_code_fk) references code;
alter table series add constraint FK_pu4p7k1o9hleuk9rmxvw2ybj6 foreign key (metadata_fk) references metadata;
alter table series add constraint FK_5n4bxxb2xa7bvvq26ao7wihky foreign key (perf_phys_name_fk) references person_name;
alter table series add constraint FK_1og1krtgxfh207rtqjg0r7pbd foreign key (study_fk) references study;
alter table series_query_attrs add constraint FK_eiwosf6pcc97n6y282cv1n54k foreign key (series_fk) references series;
alter table series_req add constraint FK_se4n39as61wwf92ggbfc9yglo foreign key (accno_issuer_fk) references issuer;
alter table series_req add constraint FK_bcn0jtvurqutw865pwp34pejb foreign key (req_phys_name_fk) references person_name;
alter table series_req add constraint FK_bdkjk6ww0ulrb0nhf41c7liwt foreign key (series_fk) references series;
alter table soundex_code add constraint FK_dh7lahwi99hk6bttrk75x4ckc foreign key (person_name_fk) references person_name;
alter table sps_station_aet add constraint FK_js5xqyw5qa9rpttwmck14duow foreign key (mwl_item_fk) references mwl_item;
alter table stgver_task add constraint FK_hch5fanx7ejwew2ag2ividq9r foreign key (queue_msg_fk) references queue_msg;
alter table study add constraint FK_5w0oynbw061mwu1rr9mrb6kj4 foreign key (dicomattrs_fk) references dicomattrs;
alter table study add constraint FK_lp0rdx659kewq8qrqg702yfyv foreign key (accno_issuer_fk) references issuer;
alter table study add constraint FK_e3fdaqhw7u60trs5aspf4sna9 foreign key (patient_fk) references patient;
alter table study add constraint FK_49eet5qgcsb32ktsqrf1mj3x2 foreign key (ref_phys_name_fk) references person_name;
alter table study_query_attrs add constraint FK_sxccj81423w8o6w2tsb7nshy9 foreign key (study_fk) references study;
alter table subscription add constraint FK_jadcs2aho4ijh639r67qgk0g0 foreign key (ups_fk) references ups;
alter table ups add constraint FK_3frtpy5cstsoxk5jxw9cutr33 foreign key (dicomattrs_fk) references dicomattrs;
alter table ups add constraint FK_61tpdp9aoy98jwiif5wq82ia3 foreign key (admission_issuer_fk) references issuer;
alter table ups add constraint FK_8xiqdli1p8cyw1y4hwyqhimcx foreign key (patient_fk) references patient;
alter table ups add constraint FK_ak183xmw0sai4jg9lib6m14o2 foreign key (station_class_fk) references code;
alter table ups add constraint FK_ox3hpmd042ywnww3yh33crcoj foreign key (station_location_fk) references code;
alter table ups add constraint FK_gd2hu9idxg6rd71g1i8r8wyjr foreign key (station_name_fk) references code;
alter table ups add constraint FK_1retecpk22a2tysmi5o6xcpbh foreign key (ups_code_fk) references code;
alter table ups_req add constraint FK_gegm1c1ymem7tj2wcm0o7e0pu foreign key (accno_issuer_fk) references issuer;
alter table ups_req add constraint FK_kocdb2pxx2fymu1modhneb4xm foreign key (req_phys_name_fk) references person_name;
alter table ups_req add constraint FK_7vt6m05r0hertks2fcngd5wn1 foreign key (ups_fk) references ups;
alter table verify_observer add constraint FK_105wt9hglqsmtnoxgma9x18vj foreign key (observer_name_fk) references person_name;
alter table verify_observer add constraint FK_qjgrn9rfyyt6sv14utk9ijcfq foreign key (instance_fk) references instance;
create generator code_pk_seq;
create generator content_item_pk_seq;
create generator dicomattrs_pk_seq;
create generator diff_task_pk_seq;
create generator export_task_pk_seq;
create generator global_subscription_pk_seq;
create generator hl7psu_task_pk_seq;
create generator ian_task_pk_seq;
create generator instance_pk_seq;
create generator issuer_pk_seq;
create generator location_pk_seq;
create generator metadata_pk_seq;
create generator mpps_pk_seq;
create generator mwl_item_pk_seq;
create generator patient_id_pk_seq;
create generator patient_pk_seq;
create generator person_name_pk_seq;
create generator queue_msg_pk_seq;
create generator rejected_instance_pk_seq;
create generator retrieve_task_pk_seq;
create generator series_pk_seq;
create generator series_query_attrs_pk_seq;
create generator series_req_pk_seq;
create generator soundex_code_pk_seq;
create generator stgcmt_result_pk_seq;
create generator stgver_task_pk_seq;
create generator study_pk_seq;
create generator study_query_attrs_pk_seq;
create generator subscription_pk_seq;
create generator uidmap_pk_seq;
create generator ups_pk_seq;
create generator ups_request_pk_seq;
create generator verify_observer_pk_seq;
