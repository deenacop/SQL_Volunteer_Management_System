prompt PL/SQL Developer import file
prompt Created on יום חמישי 18 מאי 2023 by user
set feedback off
set define off
prompt Creating PERSON...
create table PERSON
(
  id           NUMBER(4) not null,
  f_name       VARCHAR2(15) not null,
  l_name       VARCHAR2(15),
  address      VARCHAR2(15),
  phone_number NUMBER(4)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PERSON_FNAME_INDEX on PERSON (F_NAME)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSON
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HELPED...
create table HELPED
(
  urgency VARCHAR2(15),
  id      NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index HELPED_URGENCY_INDEX on HELPED (URGENCY)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HELPED
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HELPED
  add foreign key (ID)
  references PERSON (ID);

prompt Creating CLIENT...
create table CLIENT
(
  clientid   NUMBER(3) not null,
  clientname VARCHAR2(15) not null,
  numguests  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (CLIENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add foreign key (CLIENTID)
  references HELPED (ID);

prompt Creating EVENTTYPE...
create table EVENTTYPE
(
  typeid   NUMBER(3) not null,
  typename VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENTTYPE
  add primary key (TYPEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HALL...
create table HALL
(
  hallid    NUMBER(3) not null,
  maxguests INTEGER not null,
  halltype  VARCHAR2(15) not null,
  area      VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HALL
  add primary key (HALLID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HALL
  add constraint CHECK_NUM_OF_GUEST
  check (maxGuests < 1500);

prompt Creating SHIFT_MANAGER...
create table SHIFT_MANAGER
(
  num_volunteers NUMBER(4) default 0,
  id             NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFT_MANAGER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFT_MANAGER
  add foreign key (ID)
  references PERSON (ID);

prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  s_m_id NUMBER(4),
  id     NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index VOL_SMID_INDEX on VOLUNTEER (S_M_ID)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEER
  add foreign key (ID)
  references PERSON (ID);
alter table VOLUNTEER
  add foreign key (S_M_ID)
  references SHIFT_MANAGER (ID);

prompt Creating ORCHESTRA...
create table ORCHESTRA
(
  orchestraid    NUMBER(3) not null,
  orchestraname  VARCHAR2(15) not null,
  orchestraprice INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORCHESTRA
  add primary key (ORCHESTRAID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORCHESTRA
  add foreign key (ORCHESTRAID)
  references VOLUNTEER (ID);

prompt Creating PHOTOGRAPH...
create table PHOTOGRAPH
(
  photographid    NUMBER(3) not null,
  photographname  VARCHAR2(15) not null,
  photographprice INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PHOTOGRAPH
  add primary key (PHOTOGRAPHID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PHOTOGRAPH
  add foreign key (PHOTOGRAPHID)
  references VOLUNTEER (ID);

prompt Creating EVENT...
create table EVENT
(
  eventid      NUMBER(3) not null,
  budget       INTEGER not null,
  eventdate    DATE not null,
  hallid       NUMBER(3) not null,
  typeid       NUMBER(3) not null,
  clientid     NUMBER(3) not null,
  photographid NUMBER(3) not null,
  orchestraid  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add primary key (EVENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add foreign key (HALLID)
  references HALL (HALLID);
alter table EVENT
  add foreign key (TYPEID)
  references EVENTTYPE (TYPEID);
alter table EVENT
  add foreign key (CLIENTID)
  references CLIENT (CLIENTID);
alter table EVENT
  add foreign key (PHOTOGRAPHID)
  references PHOTOGRAPH (PHOTOGRAPHID);
alter table EVENT
  add foreign key (ORCHESTRAID)
  references ORCHESTRA (ORCHESTRAID);

prompt Creating MANAGER...
create table MANAGER
(
  monthly_profit NUMBER(4),
  id             NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MANAGER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MANAGER
  add foreign key (ID)
  references PERSON (ID);

prompt Creating SHIFTS...
create table SHIFTS
(
  salary      NUMBER(4),
  start_time  VARCHAR2(5),
  finish_time VARCHAR2(5),
  shift_type  VARCHAR2(15),
  s_id        NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFTS
  add primary key (S_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating VOLUNTEERING...
create table VOLUNTEERING
(
  v_date DATE,
  v_id   NUMBER(4) not null,
  h_id   NUMBER(4) not null,
  vo_id  NUMBER(4) not null,
  s_id   NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERING
  add primary key (V_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEERING
  add foreign key (VO_ID)
  references VOLUNTEER (ID);
alter table VOLUNTEERING
  add foreign key (H_ID)
  references HELPED (ID);
alter table VOLUNTEERING
  add foreign key (S_ID)
  references SHIFTS (S_ID);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for HELPED...
alter table HELPED disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for EVENTTYPE...
alter table EVENTTYPE disable all triggers;
prompt Disabling triggers for HALL...
alter table HALL disable all triggers;
prompt Disabling triggers for SHIFT_MANAGER...
alter table SHIFT_MANAGER disable all triggers;
prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for ORCHESTRA...
alter table ORCHESTRA disable all triggers;
prompt Disabling triggers for PHOTOGRAPH...
alter table PHOTOGRAPH disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for MANAGER...
alter table MANAGER disable all triggers;
prompt Disabling triggers for SHIFTS...
alter table SHIFTS disable all triggers;
prompt Disabling triggers for VOLUNTEERING...
alter table VOLUNTEERING disable all triggers;
prompt Disabling foreign key constraints for HELPED...
alter table HELPED disable constraint SYS_C007128;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint SYS_C007391;
prompt Disabling foreign key constraints for SHIFT_MANAGER...
alter table SHIFT_MANAGER disable constraint SYS_C007134;
prompt Disabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER disable constraint SYS_C007140;
alter table VOLUNTEER disable constraint SYS_C007141;
prompt Disabling foreign key constraints for ORCHESTRA...
alter table ORCHESTRA disable constraint SYS_C007401;
prompt Disabling foreign key constraints for PHOTOGRAPH...
alter table PHOTOGRAPH disable constraint SYS_C007396;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C007411;
alter table EVENT disable constraint SYS_C007412;
alter table EVENT disable constraint SYS_C007413;
alter table EVENT disable constraint SYS_C007414;
alter table EVENT disable constraint SYS_C007415;
prompt Disabling foreign key constraints for MANAGER...
alter table MANAGER disable constraint SYS_C007131;
prompt Disabling foreign key constraints for VOLUNTEERING...
alter table VOLUNTEERING disable constraint SYS_C007147;
alter table VOLUNTEERING disable constraint SYS_C007148;
alter table VOLUNTEERING disable constraint SYS_C007149;
prompt Deleting VOLUNTEERING...
delete from VOLUNTEERING;
prompt Deleting SHIFTS...
delete from SHIFTS;
prompt Deleting MANAGER...
delete from MANAGER;
prompt Deleting EVENT...
delete from EVENT;
prompt Deleting PHOTOGRAPH...
delete from PHOTOGRAPH;
prompt Deleting ORCHESTRA...
delete from ORCHESTRA;
prompt Deleting VOLUNTEER...
delete from VOLUNTEER;
prompt Deleting SHIFT_MANAGER...
delete from SHIFT_MANAGER;
prompt Deleting HALL...
delete from HALL;
prompt Deleting EVENTTYPE...
delete from EVENTTYPE;
prompt Deleting CLIENT...
delete from CLIENT;
prompt Deleting HELPED...
delete from HELPED;
prompt Deleting PERSON...
delete from PERSON;
prompt Loading PERSON...
insert into PERSON (id, f_name, l_name, address, phone_number)
values (56, 'First', 'Shannon', '30 Burstyn Blvd', 2902);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (57, 'Clive', 'Dunst', '49 Long Island ', 1504);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (58, 'Carlene', 'Tillis', '532 Carla Stree', 2788);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (59, 'Carolyn', 'Latifah', '64 University S', 4088);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (60, 'Alicia', 'Lineback', '8 Colon Road', 8230);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (61, 'Domingo', 'Balaban', '98 Humberto', 4596);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (62, 'Juliet', 'Reilly', '13 Vanessa', 2173);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (63, 'Patrick', 'Crowell', '98 Todd Drive', 5924);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (64, 'Colin', 'Balk', '396 Statham Roa', 3401);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (65, 'Anjelica', 'Day', '63 Lemmon Stree', 4475);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (66, 'Allison', 'Hatchet', '63 Sigourney Ro', 2921);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (67, 'Red', 'Hingle', '68 Neil Road', 1501);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (68, 'Albert', 'Hart', '23 Rascal Road', 9983);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (69, 'Eddie', 'Zane', '54 Cassel Stree', 4430);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (70, 'Geoffrey', 'Travolta', '82 Hope Road', 1182);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (71, 'Karen', 'Chestnut', '91st Street', 5016);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (72, 'Davy', 'Warburton', '40 Curtis-Hall ', 2034);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (73, 'Lance', 'Stiller', '80 Highton Blvd', 4308);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (74, 'Fairuza', 'McLean', '78 Burrows Road', 8980);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (75, 'Bobby', 'Tyler', '16 Connick Stre', 8266);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (76, 'Vincent', 'Atlas', '618 Torino Stre', 3206);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (77, 'Jesus', 'Hector', '49 Brothers Str', 7929);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (78, 'Roy', 'Schock', '18 Dunst Blvd', 4875);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (79, 'Shannon', 'Zane', '20 Cage Ave', 1978);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (80, 'David', 'Rizzo', '29 Trenton Stre', 7218);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (81, 'Keith', 'Delta', '3 Mifune Blvd', 1775);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (82, 'Debi', 'Pigott-Smith', '687 Madonna Ave', 2078);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (83, 'Belinda', 'Colin Young', '3 Negbaur Stree', 4804);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (84, 'Jonny Lee', 'Evanswood', '57 Durham Road', 7798);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (85, 'Elvis', 'Hershey', '71 Salt Street', 8771);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (86, 'Eugene', 'Lineback', '83 Stormare Str', 6862);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (87, 'Kenny', 'Eldard', '40 Karyo Ave', 8233);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (88, 'Rose', 'Beckinsale', '110 Mars Street', 2782);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (89, 'Tony', 'Kennedy', '7 Aurora Drive', 7394);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (90, 'Uma', 'Osbourne', '31 Fukuoka Stre', 9024);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (91, 'Leo', 'Giannini', '82 Scarlett Roa', 6623);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (92, 'Hugh', 'Adkins', '19 Zagreb Blvd', 1734);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (93, 'Rene', 'Irons', '9 Lane Street', 8438);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (94, 'Alex', 'Moore', '78 Hutch Road', 3440);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (95, 'Nelly', 'Clooney', '86 McPherson Ro', 9991);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (96, 'Jared', 'Ribisi', '28 Lineback Dri', 2436);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (97, 'Nicolas', 'Vincent', '29 Tobolowsky R', 1471);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (98, 'Christine', 'Remar', '241 Mt. Laurel ', 3452);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (99, 'Tamala', 'Donelly', '56 Grand-mere R', 4042);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (100, 'Robin', 'McDowell', '99 Streep Road', 6947);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (101, 'Lila', 'MacDowell', '32 Chambersburg', 3787);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (102, 'Richard', 'Cole', '91st Street', 7976);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (103, 'Kyra', 'McIntyre', '68 Chambers', 7813);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (104, 'Fred', 'Rollins', '19 McFadden', 6658);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (105, 'Rhett', 'Buckingham', '92 Sedgwick Roa', 9694);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (106, 'Tara', 'Spacey', '88 Cusack Stree', 7777);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (107, 'Nils', 'Child', '65 Valencia Str', 3848);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (108, 'Forest', 'Stuart', '19 Santana', 7841);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (109, 'Candice', 'Shalhoub', '92 Joely Road', 7386);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (110, 'Vienna', 'Eder', '43 Beals Street', 2810);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (111, 'Ryan', 'Brock', '48 Benbrook Ave', 6537);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (112, 'Terence', 'Gibbons', '94 Checker Road', 4287);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (113, 'Julie', 'Withers', '400 McIntosh St', 6167);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (114, 'Cloris', 'Marx', '79 Michael Road', 8007);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (115, 'Anjelica', 'Romijn-Stamos', '8 Liotta', 7984);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (116, 'Sander', 'Renfro', '50 Jerusalem', 1588);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (117, 'Joan', 'Rollins', '73 Roger Street', 1641);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (118, 'Eric', 'Aiken', '778 Smith Blvd', 6591);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (119, 'Katrin', 'Posener', '92 Reed Street', 1000);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (120, 'Rita', 'Willis', '60 Oak Park', 3920);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (121, 'Collin', 'Carlisle', '921 Dorn Road', 1397);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (122, 'Maceo', 'Krumholtz', '24 Hartmannsdor', 5469);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (123, 'Michael', 'Gatlin', '46 Farrow Stree', 2864);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (124, 'Maria', 'Farina', '24 Cherry Stree', 3871);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (125, 'Rodney', 'McPherson', '663 Downie Road', 2081);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (126, 'Chad', 'Duschel', '51 West Lafayet', 2825);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (127, 'Charlize', 'Ali', '57 Winterthur S', 1535);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (128, 'Embeth', 'Bell', '51st Street', 6305);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (129, 'Lupe', 'Callow', '59 Weaving Road', 6772);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (130, 'Charles', 'Carlyle', '66 Mary Beth Bl', 5059);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (131, 'Collin', 'Candy', '21 Bebe Street', 9896);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (132, 'Vertical', 'Jovovich', '29 Biehn Street', 2269);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (133, 'Liquid', 'Berenger', '49 Utada', 2441);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (134, 'Oliver', 'McNeice', '27 Williamson', 9471);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (135, 'Teena', 'Cara', '367 Curtis', 3085);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (136, 'Carlos', 'Bacharach', '38 Gyllenhaal S', 7463);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (137, 'Natacha', 'Pierce', '93 Jean-Claude ', 7025);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (138, 'Sinead', 'Mortensen', '93rd Street', 1303);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (139, 'Swoosie', 'Berkley', '46 Lodi Road', 4277);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (140, 'Rich', 'Arden', '1 Joe Ave', 2710);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (141, 'Owen', 'Callow', '39 Mitchell Roa', 1850);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (142, 'Patricia', 'Rhymes', '49 France Stree', 9631);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (143, 'Trey', 'Watley', '99 Kuraby Stree', 6664);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (144, 'Morgan', 'Romijn-Stamos', '29 Bracco', 3566);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (145, 'Andy', 'Ferry', '185 Badalucco A', 1502);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (146, 'Celia', 'Sarsgaard', '77 Morton Stree', 5106);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (147, 'Davy', 'Weisz', '301 Jeffreys St', 6792);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (148, 'Emerson', 'Coltrane', '11 Marie Street', 8242);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (149, 'Gran', 'Hagerty', '53 Reed Street', 6543);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (150, 'CeCe', 'Neeson', '71st Street', 6021);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (151, 'Lena', 'Walken', '66 Yorn Street', 7341);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (152, 'Bridgette', 'Pierce', '1 Kinney', 8195);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (153, 'Mary Beth', 'Janssen', '90 Debbie Ave', 5466);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (154, 'Renee', 'Gleeson', '53 Rhona Street', 9602);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (155, 'Jon', 'Nash', '56 Vince Road', 9700);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (156, 'Olga', 'Quatro', '258 Gates Stree', 8242);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (157, 'Cliff', 'Carlton', '12 Rimini Road', 3891);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (158, 'Wally', 'Stallone', '96 Atkinson Roa', 4451);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (159, 'Ian', 'Mulroney', '59 Towson Road', 7359);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (160, 'Yolanda', 'Emmerich', '24 Cruz Road', 1921);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (161, 'Harold', 'Palmieri', '46 Eastwood Roa', 9035);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (162, 'Morgan', 'Caan', '12 New York Roa', 1991);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (163, 'Jonatha', 'MacIsaac', '7 Thame Road', 6954);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (164, 'Alan', 'Hall', '11st Street', 5938);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (165, 'Mary-Louise', 'Gibson', '77 Curitiba Str', 7154);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (166, 'Liev', 'Flanery', '98 Gill Ave', 6177);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (167, 'Chet', 'Francis', '778 Edward Stre', 9453);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (168, 'Vertical', 'Huston', '692 Cornell Roa', 2016);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (169, 'Peter', 'Berry', '59 Gavin Road', 8013);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (170, 'Julie', 'Dorn', '87 Broadbent Ro', 7710);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (171, 'Debra', 'Martin', '86 Sally Road', 1334);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (172, 'Miko', 'Rush', '16 O''Neal Stree', 3136);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (173, 'Carole', 'Singh', '35 Johnny Drive', 6750);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (174, 'Debi', 'Knight', '83rd Street', 9214);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (175, 'Paul', 'Gambon', '77 Blanchett Ro', 8887);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (176, 'Chi', 'Mellencamp', '42nd Street', 9849);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (177, 'Edgar', 'Hawke', '21st Street', 1797);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (178, 'Shannyn', 'Brandt', '7 Osaka Street', 3636);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (179, 'Sandra', 'Farina', '43 Hart Blvd', 7972);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (1111, 'dina', 'glecer', 'har_nof', 1);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (2222, 'yirat', 'biton', 'uziel', 2);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (3333, 'shira', 'pinski', 'har_nof', 3);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (4444, 'penina', 'rabi', 'uziel', 5);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (5555, 'shirel', 'perez', 'bait_vagan', 6);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (6666, 'talya', 'copperman', 'har_nof', 7);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (7777, 'mordecai', '''glecer''', 'uziel', 8);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (8888, 'moshe', 'biton', 'rmot', 9);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (10, 'Kyra', 'Moorer', '26 Blair Street', 1483);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (11, 'Dick', 'Howard', '52 Kwun Tong Av', 3403);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (12, 'Jose', 'Hedaya', '63 Studi Blvd', 1360);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (13, 'Pierce', 'Scott', '71st Street', 8394);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (14, 'Rachid', 'Goldblum', '388 Richardson ', 1829);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (15, 'Mitchell', 'Lauper', '46 Rowlands Roa', 6425);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (16, 'Linda', 'Keitel', '26 Byrd Road', 7932);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (17, 'Joaquim', 'Breslin', '23 Child Drive', 2036);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (18, 'Tom', 'Ness', '991 Kinski Stre', 8478);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (19, 'Marc', 'O''Hara', '95 Gran Street', 9672);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (20, 'Franco', 'Rispoli', '21st Street', 6626);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (21, 'Aidan', 'Brown', '65 Alannah Road', 2808);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (22, 'Emmylou', 'Harrelson', '69 Johnette Dri', 9828);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (23, 'Curt', 'Sevigny', '14 Daniels Road', 1176);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (24, 'Joseph', 'Cusack', '36 Rawls Drive', 2886);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (25, 'Scott', 'Visnjic', '85 Kudrow Ave', 2760);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (26, 'Oro', 'Woodward', '51 Elizabeth Ro', 4103);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (27, 'Robbie', 'Mantegna', '41st Street', 1219);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (28, 'Howard', 'Klein', '34 Angie Drive', 7115);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (29, 'Ty', 'Mirren', '62 Eastwood Roa', 5464);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (30, 'Ernie', 'Wayans', '53rd Street', 7996);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (31, 'Denise', 'Griffith', '94 Harper Stree', 5692);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (32, 'Ashton', 'Flanery', '2 Oldman Blvd', 9988);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (33, 'Kenneth', 'Hanley', '24 Meppel Drive', 1305);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (34, 'Collective', 'Bandy', '42nd Street', 4661);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (35, 'Eddie', 'Sevenfold', '18 Todd Ave', 2200);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (36, 'Jonny Lee', 'Boorem', '45 David Drive', 3266);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (37, 'Antonio', 'Hector', '42nd Street', 1374);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (38, 'Mindy', 'Detmer', '10 Tanon Drive', 9088);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (39, 'Daniel', 'Mandrell', '40 Laurie Road', 1190);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (40, 'Diane', 'Short', '34 Keeslar Road', 8057);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (41, 'Dabney', 'Cassel', '67 McDowall Str', 6387);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (42, 'Thelma', 'Shepherd', '24 Blackmore St', 3602);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (43, 'Malcolm', 'Moraz', '412 San Antonio', 1194);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (44, 'Richard', 'Copeland', '594 Or-yehuda S', 1378);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (45, 'Rade', 'Rooker', '46 Rundgren Dri', 1404);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (46, 'Madeleine', 'Winwood', '860 Stuermer Av', 9417);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (47, 'Carol', 'Dalley', '30 Atlas Drive', 5939);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (48, 'Joaquin', 'Liu', '521 Joe Road', 4655);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (49, 'Anne', 'Hatchet', '7 Fehr Ave', 5377);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (50, 'Marie', 'Li', '87 Turturro Roa', 5716);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (51, 'Lily', 'Bryson', '83 Miriam Ave', 3736);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (52, 'Robert', 'Tomei', '33 McDormand St', 4565);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (53, 'Betty', 'Richardson', '13 Posener', 4310);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (54, 'Desmond', 'Potter', '25 Holts Summit', 4598);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (55, 'Geena', 'Belushi', '92 La Plata Dri', 9632);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (180, 'Kimberly', 'McBride', '42nd Street', 3469);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (181, 'Kathy', 'Atlas', '851 Candice Str', 6227);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (182, 'Edgar', 'Turner', '93 von Sydow', 7939);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (183, 'Penelope', 'Diffie', '91 Jack Drive', 6741);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (184, 'Caroline', 'Idol', '88 Michael', 7444);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (185, 'Mandy', 'Taylor', '82 Sal Blvd', 4805);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (186, 'Heather', 'Spiner', '48 Karlsruhe Av', 4442);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (187, 'Radney', 'Lang', '35 Alex Blvd', 3428);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (188, 'Rory', 'McClinton', '828 Tomei Stree', 8339);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (189, 'Elizabeth', 'Sledge', '79 Orbit Drive', 4949);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (190, 'Angelina', 'Blackwell', '78 Soda Street', 4060);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (191, 'Gena', 'Gyllenhaal', '83 Holliday Roa', 5751);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (192, 'Joan', 'Wine', '28 Ammons Stree', 1192);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (193, 'Ivan', 'Rhames', '50 Leo Road', 1412);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (194, 'Regina', 'Griffin', '100 Anne', 6463);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (195, 'Cyndi', 'Baez', '10 Szazhalombat', 1049);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (196, 'Treat', 'Fox', '328 Tori Drive', 3282);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (197, 'Ossie', 'DiBiasio', '31 Redhill Stre', 2204);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (198, 'Treat', 'Vega', '923 Purefoy', 8279);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (199, 'Charlize', 'Boone', '77 Southampton', 5518);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (200, 'Gabriel', 'Ojeda', '65 Houma', 9692);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (201, 'Ed', 'Dreyfuss', '8 Matsuyama Blv', 3048);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (202, 'Mena', 'Gandolfini', '14 Henry Street', 4754);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (203, 'Ivan', 'Lyonne', '11 Ali Street', 7485);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (204, 'Queen', 'Baez', '42nd Street', 1306);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (205, 'King', 'Checker', '51st Street', 8562);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (206, 'Millie', 'Gallagher', '62nd Street', 2726);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (207, 'Curtis', 'Mohr', '46 von Sydow St', 7054);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (208, 'Raymond', 'Chambers', '67 Fonda Road', 6241);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (209, 'Johnny', 'Lowe', '94 Apple Drive', 9139);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (210, 'Milla', 'Haslam', '80 Lewis Road', 7450);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (211, 'Eddie', 'Hingle', '18 Holts Summit', 5830);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (212, 'Juliet', 'Sweeney', '80 Zevon Ave', 7156);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (213, 'Rascal', 'Breslin', '15 Sheffield St', 2244);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (214, 'Celia', 'McGinley', '51st Street', 9667);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (215, 'Ossie', 'Colman', '45 Charles Blvd', 8806);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (216, 'Steven', 'Shand', '47 Swank Street', 2277);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (217, 'Leelee', 'Hawkins', '79 Kristin', 1999);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (218, 'Juliet', 'Mirren', '53rd Street', 5190);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (219, 'Nicole', 'Patillo', '102 Joely Drive', 4161);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (221, 'Woody', 'McDormand', '24 Saucedo', 1004);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (222, 'Shelby', 'Burton', '94 Harris Blvd', 9051);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (223, 'Anjelica', 'Callow', '84 Rheinfelden ', 8401);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (224, 'Liv', 'Guzman', '15 Brody Road', 7644);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (225, 'Grant', 'Rowlands', '676 Espoo Road', 5618);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (226, 'Jean-Claude', 'Burke', '64 Vinton Stree', 3859);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (227, 'Nina', 'Nakai', '74 Fraser', 5037);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (228, 'Frances', 'Presley', '100 Rufus Road', 7068);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (229, 'Albert', 'Moffat', '96 Pollack', 5310);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (232, 'Mary Beth', 'Ammons', '35 Keitel Stree', 3269);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (233, 'Richard', 'Cagle', '91 Kitty Street', 9485);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (235, 'Darren', 'Shepard', '36 St Kilda Roa', 8349);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (236, 'Dave', 'Fierstein', '15 Ball Street', 5581);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (237, 'Jonny', 'Whitford', '531 Santa Fe St', 1701);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (238, 'Barbara', 'Stiller', '27 Rick Road', 2326);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (241, 'Goldie', 'Robards', '73 Jonatha Road', 1674);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (242, 'Angelina', 'Tobolowsky', '83 Kid Ave', 6851);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (244, 'Ernie', 'Thomas', '41 Ruth Blvd', 6907);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (246, 'Brad', 'Stiers', '4 Ellis Street', 4235);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (248, 'Tracy', 'Stormare', '27 O''Neal Stree', 6988);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (249, 'Russell', 'Gunton', '38 Curt Street', 8492);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (250, 'Garry', 'Pfeiffer', '11st Street', 6443);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (251, 'Gavin', 'Macht', '48 Runcorn Road', 7384);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (253, 'Kitty', 'Hobson', '942 Zappacosta ', 5060);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (254, 'Yolanda', 'Rodgers', '85 Reisterstown', 3092);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (255, 'Catherine', 'Rollins', '18 Weiland Road', 4338);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (256, 'Gilbert', 'Cocker', '86 Curitiba Dri', 8151);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (257, 'Rob', 'Skarsgard', '690 Heather Str', 4404);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (258, 'Aida', 'Bancroft', '61 Loveless Str', 7085);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (259, 'Jean-Luc', 'Lennix', '53 Furtado Driv', 6036);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (260, 'Vincent', 'Fender', '34 Nicolas Stre', 4599);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (261, 'Michelle', 'Cooper', '558 Dafoe Blvd', 1791);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (262, 'Mint', 'Holliday', '100 Dalton Stre', 6324);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (263, 'Lupe', 'Griffiths', '51st Street', 2942);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (267, 'Kiefer', 'Phillips', '691 Miles Drive', 1731);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (268, 'Joey', 'Barnett', '70 Piven', 9201);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (269, 'Russell', 'Nunn', '47 Kerava Road', 3596);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (270, 'Hugo', 'Griffith', '75 Dwight Road', 5175);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (271, 'Regina', 'Berkoff', '35 Lopez Street', 3936);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (272, 'Mae', 'Pollak', '41st Street', 4061);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (273, 'Dabney', 'Woodard', '980 Tinsley Ave', 8790);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (274, 'Linda', 'Moss', '73 Pete Ave', 7589);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (275, 'Hookah', 'Fisher', '292 Edinburgh S', 9471);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (276, 'Connie', 'Levin', '61 Himmelman Av', 6570);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (277, 'Tilda', 'Nunn', '33 Morton Road', 8562);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (278, 'Debi', 'Stuermer', '71 Gallant Driv', 9101);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (280, 'Ernest', 'Capshaw', '196 Meniketti D', 1519);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (281, 'Dan', 'Stallone', '52nd Street', 9379);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (282, 'Rickie', 'Duschel', '11 O''Connor Roa', 3071);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (283, 'Domingo', 'Sedaka', '30 Rea Street', 4270);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (284, 'Rawlins', 'Oszajca', '56 Romijn-Stamo', 5278);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (287, 'Holly', 'DiFranco', '79 Pierce Drive', 1240);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (288, 'Alana', 'Collins', '19 Channing Dri', 5558);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (289, 'Coley', 'Popper', '20 Daniel Road', 9388);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (292, 'Lou', 'Gooding', '22 Oakenfold Ro', 1045);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (293, 'Derrick', 'Robards', '77 Batavia Road', 1095);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (294, 'Austin', 'Crimson', '69 Culkin Drive', 9969);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (295, 'Lynn', 'Jackson', '22nd Street', 6645);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (296, 'Wayne', 'Schwimmer', '89 Landau Stree', 8802);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (297, 'Cuba', 'Carrack', '67 Bismarck Dri', 4173);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (300, 'deena', 'glecer', '35 Lopez Street', 3472);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (301, 'talya', 'biton', '69 Culkin Drive', 4985);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (302, 'yirat', 'mizrachi', '19 Channing Dri', 1982);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (303, 'shira', 'pinski', 'har_nof', 543);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (304, 'penina', 'perez', 'uziel', 3455);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (5305, 'shirel', 'rabi', 'rmot', 2346);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (333, 'Seph Zuck', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (1, 'Sean-Amos', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (2, 'Hope-Lonsdale', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (3, 'Quentin-Makowic', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (4, 'Nickel-Winstone', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (5, 'Debby-Tambor', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (6, 'Eliza-Greene', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (7, 'Maury-Chappelle', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (8, 'Quentin-Ellis', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (9, 'Barry-Kimball', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (350, 'Boothe', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (351, 'Speaks', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (352, 'Hingle', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (353, 'Duvall', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (354, 'Stevens', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (355, 'LaPaglia', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (356, 'Waite', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (357, 'Orton', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (358, 'Walken', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (359, 'Knight', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (360, 'Torn', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (361, 'Coyote', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (362, 'Driver', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (363, 'Moore', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (364, 'Pitney', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (365, 'Young', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (366, 'Domino', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (367, 'Haysbert', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (368, 'Gill', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (369, 'Malone', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (370, 'Root', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (371, 'Chaplin', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (372, 'Fogerty', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (373, 'Leachman', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (374, 'Negbaur', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (375, 'Whitford', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (376, 'Coyote', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (377, 'Belles', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (378, 'Curry', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (379, 'Kline', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (380, 'Cooper', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (381, 'Pressly', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (382, 'Ermey', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (383, 'Neill', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (384, 'Slater', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (385, 'Penders', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (386, 'Bragg', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (387, 'Michael', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (388, 'Mellencamp', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (389, 'Orlando', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (390, 'Folds', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (391, 'Sutherland', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (392, 'Sossamon', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (393, 'Rippy', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (394, 'Presley', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (395, 'King', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (396, 'Makowicz', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (397, 'Kurtz', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (398, 'Gayle', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (399, 'Cole', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (400, 'Kudrow', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (401, 'Rickman', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (402, 'Chandler', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (403, 'Sewell', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (404, 'Wiedlin', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (405, 'Adler', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (406, 'Hewitt', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (407, 'Rauhofer', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (408, 'Crowe', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (409, 'Ferry', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (410, 'Linney', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (411, 'Cara', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (412, 'Christie', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (413, 'Merchant', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (414, 'Imbruglia', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (415, 'MacNeil', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (416, 'Atkins', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (417, 'Barrymore', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (418, 'Morton', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (419, 'Lunch', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (420, 'Diggs', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (421, 'Derringer', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (422, 'Nielsen', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (423, 'Costello', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (424, 'Beck', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (425, 'Payne', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (426, 'Dickinson', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (427, 'Shepard', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (428, 'Myers', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (429, 'Fender', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (430, 'Addy', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (431, 'Sedgwick', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (432, 'Sinatra', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (433, 'Sirtis', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (434, 'Miller', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (435, 'Fiennes', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (436, 'Hirsch', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (437, 'McGriff', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (438, 'Neil', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (439, 'Capshaw', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (440, 'Spears', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (441, 'Woods', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (442, 'Tambor', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (443, 'Reeves', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (444, 'Sandler', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (445, 'Ferry', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (446, 'Gallant', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (447, 'Dorff', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (448, 'Viterelli', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (449, 'James', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (450, 'Malkovich', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (451, 'Hayek', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (452, 'McCracken', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (453, 'Singletary', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (454, 'Stuart', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (455, 'Quatro', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (456, 'Pitney', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (457, 'Durning', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (458, 'Street', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (459, 'Scorsese', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (460, 'McCabe', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (461, 'Stormare', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (462, 'Merchant', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (463, 'Holmes', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (464, 'Zevon', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (465, 'Craig', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (466, 'Frampton', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (467, 'Suchet', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (468, 'Atlas', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (469, 'Day', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (470, 'Reinhold', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (471, 'Jackman', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (472, 'Garr', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (473, 'McKean', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (474, 'Abraham', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (475, 'Plowright', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (476, 'Berkoff', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (477, 'Sandler', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (478, 'Unger', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (479, 'Cassidy', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (480, 'Fraser', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (481, 'Holm', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (482, 'Carrington', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (483, 'McDonnell', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (484, 'Channing', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (485, 'Lorenz', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (486, 'Loveless', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (487, 'Whitmore', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (488, 'Butler', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (489, 'Branagh', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (490, 'Janssen', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (491, 'Tippe', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (492, 'Kinnear', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (493, 'Gooding', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (494, 'Donovan', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (495, 'LaBelle', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (496, 'Snider', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (497, 'Kirshner', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (498, 'Navarro', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (499, 'Burke', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (500, 'Khan', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (501, 'Black', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (502, 'Hersh', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (503, 'Ellis', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (504, 'Benson', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (505, 'Smith', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (506, 'Sarandon', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (507, 'Mollard', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (508, 'Colon', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (509, 'Gold', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (510, 'Johnson', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (511, 'Skerritt', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (512, 'Clinton', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (513, 'Redford', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (514, 'Squier', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (515, 'Sanders', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (516, 'Pepper', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (517, 'Negbaur', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (518, 'Hoffman', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (519, 'McNeice', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (520, 'Short', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (521, 'Zeta-Jones', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (522, 'Arnold', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (523, 'Smith', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (524, 'O''Donnell', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (525, 'Bullock', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (526, 'Evanswood', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (527, 'Sawa', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (528, 'Kurtz', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (529, 'Mellencamp', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (530, 'Curry', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (531, 'Rooker', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (532, 'Myles', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (533, 'Mathis', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (534, 'Leigh', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (535, 'Jessee', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (536, 'Posey', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (537, 'Peniston', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (538, 'Kline', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (539, 'Garza', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (540, 'McAnally', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (541, 'Judd', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (542, 'Hayek', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (543, 'Dukakis', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (544, 'Pierce', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (545, 'Jovovich', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (546, 'LaBelle', null, null, null);
insert into PERSON (id, f_name, l_name, address, phone_number)
values (547, 'Vincent', null, null, null);
prompt 492 records loaded
prompt Loading HELPED...
insert into HELPED (urgency, id)
values ('3', 13);
insert into HELPED (urgency, id)
values ('1', 15);
insert into HELPED (urgency, id)
values ('2', 62);
insert into HELPED (urgency, id)
values ('1', 196);
insert into HELPED (urgency, id)
values ('1', 187);
insert into HELPED (urgency, id)
values ('3', 29);
insert into HELPED (urgency, id)
values ('1', 112);
insert into HELPED (urgency, id)
values ('3', 64);
insert into HELPED (urgency, id)
values ('1', 236);
insert into HELPED (urgency, id)
values ('3', 21);
insert into HELPED (urgency, id)
values ('2', 217);
insert into HELPED (urgency, id)
values ('3', 250);
insert into HELPED (urgency, id)
values ('2', 303);
insert into HELPED (urgency, id)
values ('3', 304);
insert into HELPED (urgency, id)
values ('1', 5305);
insert into HELPED (urgency, id)
values ('2', 226);
insert into HELPED (urgency, id)
values ('3', 171);
insert into HELPED (urgency, id)
values ('1', 296);
insert into HELPED (urgency, id)
values ('2', 55);
insert into HELPED (urgency, id)
values ('1', 143);
insert into HELPED (urgency, id)
values ('2', 207);
insert into HELPED (urgency, id)
values ('1', 26);
insert into HELPED (urgency, id)
values ('2', 191);
insert into HELPED (urgency, id)
values ('3', 136);
insert into HELPED (urgency, id)
values ('3', 105);
insert into HELPED (urgency, id)
values ('1', 142);
insert into HELPED (urgency, id)
values ('2', 194);
insert into HELPED (urgency, id)
values ('3', 263);
insert into HELPED (urgency, id)
values ('3', 237);
insert into HELPED (urgency, id)
values ('3', 225);
insert into HELPED (urgency, id)
values ('3', 204);
insert into HELPED (urgency, id)
values ('2', 61);
insert into HELPED (urgency, id)
values ('1', 219);
insert into HELPED (urgency, id)
values ('2', 232);
insert into HELPED (urgency, id)
values ('2', 297);
insert into HELPED (urgency, id)
values ('1', 81);
insert into HELPED (urgency, id)
values ('3', 158);
insert into HELPED (urgency, id)
values ('2', 251);
insert into HELPED (urgency, id)
values ('2', 210);
insert into HELPED (urgency, id)
values ('3', 2222);
insert into HELPED (urgency, id)
values ('3', 154);
insert into HELPED (urgency, id)
values ('1', 222);
insert into HELPED (urgency, id)
values ('3', 259);
insert into HELPED (urgency, id)
values ('3', 122);
insert into HELPED (urgency, id)
values ('2', 193);
insert into HELPED (urgency, id)
values ('1', 58);
insert into HELPED (urgency, id)
values ('1', 152);
insert into HELPED (urgency, id)
values ('1', 261);
insert into HELPED (urgency, id)
values ('1', 120);
insert into HELPED (urgency, id)
values ('2', 101);
insert into HELPED (urgency, id)
values ('1', 41);
insert into HELPED (urgency, id)
values ('3', 72);
insert into HELPED (urgency, id)
values ('3', 125);
insert into HELPED (urgency, id)
values ('3', 229);
insert into HELPED (urgency, id)
values ('2', 162);
insert into HELPED (urgency, id)
values ('2', 23);
insert into HELPED (urgency, id)
values ('2', 182);
insert into HELPED (urgency, id)
values ('2', 115);
insert into HELPED (urgency, id)
values ('3', 289);
insert into HELPED (urgency, id)
values ('2', 293);
insert into HELPED (urgency, id)
values ('3', 189);
insert into HELPED (urgency, id)
values ('3', 223);
insert into HELPED (urgency, id)
values ('3', 40);
insert into HELPED (urgency, id)
values ('2', 218);
insert into HELPED (urgency, id)
values ('1', 124);
insert into HELPED (urgency, id)
values ('1', 31);
insert into HELPED (urgency, id)
values ('2', 140);
insert into HELPED (urgency, id)
values ('1', 238);
insert into HELPED (urgency, id)
values ('1', 32);
insert into HELPED (urgency, id)
values ('1', 174);
insert into HELPED (urgency, id)
values ('1', 98);
insert into HELPED (urgency, id)
values ('3', 7777);
insert into HELPED (urgency, id)
values ('1', 295);
insert into HELPED (urgency, id)
values ('1', 185);
insert into HELPED (urgency, id)
values ('1', 242);
insert into HELPED (urgency, id)
values ('2', 134);
insert into HELPED (urgency, id)
values ('3', 202);
insert into HELPED (urgency, id)
values ('2', 45);
insert into HELPED (urgency, id)
values ('1', 10);
insert into HELPED (urgency, id)
values ('2', 74);
insert into HELPED (urgency, id)
values ('1', 71);
insert into HELPED (urgency, id)
values ('2', 141);
insert into HELPED (urgency, id)
values ('2', 283);
insert into HELPED (urgency, id)
values ('2', 260);
insert into HELPED (urgency, id)
values ('3', 56);
insert into HELPED (urgency, id)
values ('2', 178);
insert into HELPED (urgency, id)
values ('3', 30);
insert into HELPED (urgency, id)
values ('3', 53);
insert into HELPED (urgency, id)
values ('1', 47);
insert into HELPED (urgency, id)
values ('3', 277);
insert into HELPED (urgency, id)
values ('3', 132);
insert into HELPED (urgency, id)
values ('2', 96);
insert into HELPED (urgency, id)
values ('2', 235);
insert into HELPED (urgency, id)
values ('3', 117);
insert into HELPED (urgency, id)
values ('2', 130);
insert into HELPED (urgency, id)
values ('3', 151);
insert into HELPED (urgency, id)
values ('3', 181);
insert into HELPED (urgency, id)
values ('1', 44);
insert into HELPED (urgency, id)
values ('1', 27);
insert into HELPED (urgency, id)
values ('2', 274);
insert into HELPED (urgency, id)
values ('3', 268);
insert into HELPED (urgency, id)
values ('2', 100);
insert into HELPED (urgency, id)
values ('1', 83);
insert into HELPED (urgency, id)
values ('2', 118);
insert into HELPED (urgency, id)
values ('1', 109);
insert into HELPED (urgency, id)
values ('1', 17);
insert into HELPED (urgency, id)
values ('3', 57);
insert into HELPED (urgency, id)
values ('1', 176);
insert into HELPED (urgency, id)
values ('3', 113);
insert into HELPED (urgency, id)
values ('1', 206);
insert into HELPED (urgency, id)
values ('2', 228);
insert into HELPED (urgency, id)
values ('2', 248);
insert into HELPED (urgency, id)
values ('1', 280);
insert into HELPED (urgency, id)
values ('3', 87);
insert into HELPED (urgency, id)
values (null, 1);
insert into HELPED (urgency, id)
values (null, 2);
insert into HELPED (urgency, id)
values (null, 3);
insert into HELPED (urgency, id)
values (null, 4);
insert into HELPED (urgency, id)
values (null, 5);
insert into HELPED (urgency, id)
values (null, 6);
insert into HELPED (urgency, id)
values (null, 7);
insert into HELPED (urgency, id)
values (null, 8);
insert into HELPED (urgency, id)
values (null, 9);
insert into HELPED (urgency, id)
values (null, 18);
insert into HELPED (urgency, id)
values (null, 19);
insert into HELPED (urgency, id)
values (null, 20);
insert into HELPED (urgency, id)
values (null, 22);
insert into HELPED (urgency, id)
values (null, 24);
insert into HELPED (urgency, id)
values (null, 25);
insert into HELPED (urgency, id)
values (null, 35);
insert into HELPED (urgency, id)
values (null, 37);
insert into HELPED (urgency, id)
values (null, 50);
insert into HELPED (urgency, id)
values (null, 52);
insert into HELPED (urgency, id)
values (null, 59);
insert into HELPED (urgency, id)
values (null, 68);
insert into HELPED (urgency, id)
values (null, 73);
insert into HELPED (urgency, id)
values (null, 82);
insert into HELPED (urgency, id)
values (null, 84);
insert into HELPED (urgency, id)
values (null, 88);
insert into HELPED (urgency, id)
values (null, 89);
insert into HELPED (urgency, id)
values (null, 93);
insert into HELPED (urgency, id)
values (null, 95);
insert into HELPED (urgency, id)
values (null, 97);
insert into HELPED (urgency, id)
values (null, 99);
insert into HELPED (urgency, id)
values (null, 102);
insert into HELPED (urgency, id)
values (null, 104);
insert into HELPED (urgency, id)
values (null, 107);
insert into HELPED (urgency, id)
values (null, 110);
insert into HELPED (urgency, id)
values (null, 114);
insert into HELPED (urgency, id)
values (null, 116);
insert into HELPED (urgency, id)
values (null, 119);
insert into HELPED (urgency, id)
values (null, 123);
insert into HELPED (urgency, id)
values (null, 126);
insert into HELPED (urgency, id)
values (null, 128);
insert into HELPED (urgency, id)
values (null, 137);
insert into HELPED (urgency, id)
values (null, 145);
insert into HELPED (urgency, id)
values (null, 149);
insert into HELPED (urgency, id)
values (null, 150);
insert into HELPED (urgency, id)
values (null, 153);
insert into HELPED (urgency, id)
values (null, 155);
insert into HELPED (urgency, id)
values (null, 157);
insert into HELPED (urgency, id)
values (null, 159);
insert into HELPED (urgency, id)
values (null, 161);
insert into HELPED (urgency, id)
values (null, 164);
insert into HELPED (urgency, id)
values (null, 172);
insert into HELPED (urgency, id)
values (null, 173);
insert into HELPED (urgency, id)
values (null, 175);
insert into HELPED (urgency, id)
values (null, 177);
insert into HELPED (urgency, id)
values (null, 186);
insert into HELPED (urgency, id)
values (null, 192);
insert into HELPED (urgency, id)
values (null, 195);
insert into HELPED (urgency, id)
values (null, 198);
insert into HELPED (urgency, id)
values (null, 200);
insert into HELPED (urgency, id)
values (null, 205);
insert into HELPED (urgency, id)
values (null, 333);
prompt 175 records loaded
prompt Loading CLIENT...
insert into CLIENT (clientid, clientname, numguests)
values (19, 'Rapha Ben', 340);
insert into CLIENT (clientid, clientname, numguests)
values (20, 'Liya Zuck', 300);
insert into CLIENT (clientid, clientname, numguests)
values (21, 'Elone Brami', 450);
insert into CLIENT (clientid, clientname, numguests)
values (222, 'Shail Ben', 350);
insert into CLIENT (clientid, clientname, numguests)
values (333, 'Seph Zuck', 500);
insert into CLIENT (clientid, clientname, numguests)
values (1, 'Sean-Amos', 759);
insert into CLIENT (clientid, clientname, numguests)
values (2, 'Hope-Lonsdale', 593);
insert into CLIENT (clientid, clientname, numguests)
values (3, 'Quentin-Makowic', 560);
insert into CLIENT (clientid, clientname, numguests)
values (4, 'Nickel-Winstone', 266);
insert into CLIENT (clientid, clientname, numguests)
values (5, 'Debby-Tambor', 244);
insert into CLIENT (clientid, clientname, numguests)
values (6, 'Eliza-Greene', 265);
insert into CLIENT (clientid, clientname, numguests)
values (7, 'Maury-Chappelle', 514);
insert into CLIENT (clientid, clientname, numguests)
values (8, 'Quentin-Ellis', 258);
insert into CLIENT (clientid, clientname, numguests)
values (9, 'Barry-Kimball', 173);
insert into CLIENT (clientid, clientname, numguests)
values (10, 'Miriam-Affleck', 214);
insert into CLIENT (clientid, clientname, numguests)
values (13, 'Nora-DeVita', 474);
insert into CLIENT (clientid, clientname, numguests)
values (15, 'Merrill-Winston', 223);
insert into CLIENT (clientid, clientname, numguests)
values (17, 'Sheena-Rhames', 162);
insert into CLIENT (clientid, clientname, numguests)
values (18, 'Noa Ben', 200);
insert into CLIENT (clientid, clientname, numguests)
values (22, 'Elisha Brami', 450);
insert into CLIENT (clientid, clientname, numguests)
values (23, 'Avigail Daby', 380);
insert into CLIENT (clientid, clientname, numguests)
values (24, 'Nath Cohen', 250);
insert into CLIENT (clientid, clientname, numguests)
values (25, 'Avi Dayan', 400);
insert into CLIENT (clientid, clientname, numguests)
values (26, 'Yehi Elf', 500);
insert into CLIENT (clientid, clientname, numguests)
values (27, 'Yael Hazot', 450);
insert into CLIENT (clientid, clientname, numguests)
values (29, 'Clara Marciano', 400);
insert into CLIENT (clientid, clientname, numguests)
values (30, 'Levana Smadj', 500);
insert into CLIENT (clientid, clientname, numguests)
values (31, 'Rhea-Lofgren', 476);
insert into CLIENT (clientid, clientname, numguests)
values (32, 'Penelope-Teng', 366);
insert into CLIENT (clientid, clientname, numguests)
values (35, 'Debi-Close', 218);
insert into CLIENT (clientid, clientname, numguests)
values (37, 'Janice-Campbell', 532);
insert into CLIENT (clientid, clientname, numguests)
values (40, 'Ty-Finney', 267);
insert into CLIENT (clientid, clientname, numguests)
values (41, 'Merle-Stevenson', 404);
insert into CLIENT (clientid, clientname, numguests)
values (44, 'Rupert-Woods', 216);
insert into CLIENT (clientid, clientname, numguests)
values (45, 'Wallace-Rooker', 731);
insert into CLIENT (clientid, clientname, numguests)
values (47, 'Miki-Akins', 531);
insert into CLIENT (clientid, clientname, numguests)
values (50, 'Jackson-Pullman', 573);
insert into CLIENT (clientid, clientname, numguests)
values (52, 'Tara-Morse', 416);
insert into CLIENT (clientid, clientname, numguests)
values (53, 'Kurt-Moody', 433);
insert into CLIENT (clientid, clientname, numguests)
values (55, 'Jay-Jeffreys', 533);
insert into CLIENT (clientid, clientname, numguests)
values (56, 'Sam-Jay', 318);
insert into CLIENT (clientid, clientname, numguests)
values (57, 'Clint-Clark', 357);
insert into CLIENT (clientid, clientname, numguests)
values (58, 'Cuba-Milsap', 602);
insert into CLIENT (clientid, clientname, numguests)
values (59, 'Johnny-Dawson', 739);
insert into CLIENT (clientid, clientname, numguests)
values (61, 'Rene-Dickinson', 495);
insert into CLIENT (clientid, clientname, numguests)
values (62, 'Derek-Barrymore', 547);
insert into CLIENT (clientid, clientname, numguests)
values (64, 'Gladys-Shalhoub', 564);
insert into CLIENT (clientid, clientname, numguests)
values (68, 'Dean-Martinez', 324);
insert into CLIENT (clientid, clientname, numguests)
values (71, 'Campbell-Guilfo', 579);
insert into CLIENT (clientid, clientname, numguests)
values (72, 'Andy-urban', 423);
insert into CLIENT (clientid, clientname, numguests)
values (73, 'Lydia-Shandling', 269);
insert into CLIENT (clientid, clientname, numguests)
values (74, 'Tommy-Vaughn', 317);
insert into CLIENT (clientid, clientname, numguests)
values (81, 'Ted-Connelly', 490);
insert into CLIENT (clientid, clientname, numguests)
values (82, 'Toni-Briscoe', 594);
insert into CLIENT (clientid, clientname, numguests)
values (83, 'Mae-Getty', 471);
insert into CLIENT (clientid, clientname, numguests)
values (84, 'Emmylou-Bandy', 623);
insert into CLIENT (clientid, clientname, numguests)
values (87, 'Goran-Gugino', 222);
insert into CLIENT (clientid, clientname, numguests)
values (88, 'Chi-Diggs', 251);
insert into CLIENT (clientid, clientname, numguests)
values (89, 'Cuba-Harris', 505);
insert into CLIENT (clientid, clientname, numguests)
values (93, 'Buffy-Culkin', 242);
insert into CLIENT (clientid, clientname, numguests)
values (95, 'Winona-Preston', 504);
insert into CLIENT (clientid, clientname, numguests)
values (96, 'Petula-Franks', 550);
insert into CLIENT (clientid, clientname, numguests)
values (97, 'Spike-Carnes', 374);
insert into CLIENT (clientid, clientname, numguests)
values (98, 'Howie-Secada', 440);
insert into CLIENT (clientid, clientname, numguests)
values (99, 'Deborah-Lucas', 361);
insert into CLIENT (clientid, clientname, numguests)
values (100, 'Marina-Ontivero', 470);
insert into CLIENT (clientid, clientname, numguests)
values (101, 'Shannon-Caine', 339);
insert into CLIENT (clientid, clientname, numguests)
values (102, 'Samantha-Vaughn', 692);
insert into CLIENT (clientid, clientname, numguests)
values (104, 'Neil-Chilton', 491);
insert into CLIENT (clientid, clientname, numguests)
values (105, 'Sinead-Flanery', 203);
insert into CLIENT (clientid, clientname, numguests)
values (107, 'Cary-Colton', 647);
insert into CLIENT (clientid, clientname, numguests)
values (109, 'Lou-Bachman', 389);
insert into CLIENT (clientid, clientname, numguests)
values (110, 'Jeanne-Gary', 236);
insert into CLIENT (clientid, clientname, numguests)
values (112, 'Anna-Pierce', 224);
insert into CLIENT (clientid, clientname, numguests)
values (113, 'Wesley-Cassidy', 474);
insert into CLIENT (clientid, clientname, numguests)
values (114, 'Maury-Peebles', 553);
insert into CLIENT (clientid, clientname, numguests)
values (115, 'Will-Hart', 280);
insert into CLIENT (clientid, clientname, numguests)
values (116, 'Larry-Crimson', 521);
insert into CLIENT (clientid, clientname, numguests)
values (117, 'Judge-Potter', 350);
insert into CLIENT (clientid, clientname, numguests)
values (118, 'Meg-Pride', 700);
insert into CLIENT (clientid, clientname, numguests)
values (119, 'Richard-Piven', 673);
insert into CLIENT (clientid, clientname, numguests)
values (120, 'Rhea-Osment', 462);
insert into CLIENT (clientid, clientname, numguests)
values (122, 'Gabriel-Kravitz', 607);
insert into CLIENT (clientid, clientname, numguests)
values (123, 'Heather-Garner', 353);
insert into CLIENT (clientid, clientname, numguests)
values (124, 'King-Laurie', 729);
insert into CLIENT (clientid, clientname, numguests)
values (125, 'Patricia-Richar', 233);
insert into CLIENT (clientid, clientname, numguests)
values (126, 'Debi-Gatlin', 426);
insert into CLIENT (clientid, clientname, numguests)
values (128, 'Dick-Lachey', 277);
insert into CLIENT (clientid, clientname, numguests)
values (130, 'Gailard-Marshal', 641);
insert into CLIENT (clientid, clientname, numguests)
values (132, 'Annie-McNarland', 405);
insert into CLIENT (clientid, clientname, numguests)
values (134, 'Chad-Smurfit', 544);
insert into CLIENT (clientid, clientname, numguests)
values (136, 'Anita-Colon', 497);
insert into CLIENT (clientid, clientname, numguests)
values (137, 'Gilberto-Rudd', 722);
insert into CLIENT (clientid, clientname, numguests)
values (140, 'Chely-Hagar', 358);
insert into CLIENT (clientid, clientname, numguests)
values (141, 'Cameron-Isaak', 661);
insert into CLIENT (clientid, clientname, numguests)
values (142, 'Vincent-Mitchel', 662);
insert into CLIENT (clientid, clientname, numguests)
values (143, 'Heather-Avalon', 333);
insert into CLIENT (clientid, clientname, numguests)
values (145, 'Jean-Lee', 364);
insert into CLIENT (clientid, clientname, numguests)
values (149, 'Raul-Berry', 366);
insert into CLIENT (clientid, clientname, numguests)
values (150, 'Isaiah-Dolenz', 380);
insert into CLIENT (clientid, clientname, numguests)
values (151, 'Mary-Zevon', 395);
insert into CLIENT (clientid, clientname, numguests)
values (152, 'Gladys-Jamal', 207);
insert into CLIENT (clientid, clientname, numguests)
values (153, 'Tori-Green', 597);
insert into CLIENT (clientid, clientname, numguests)
values (154, 'Carlos-Hatosy', 378);
insert into CLIENT (clientid, clientname, numguests)
values (155, 'Allan-Rifkin', 463);
insert into CLIENT (clientid, clientname, numguests)
values (157, 'Gary-Gray', 415);
insert into CLIENT (clientid, clientname, numguests)
values (158, 'Stellan-Huston', 559);
insert into CLIENT (clientid, clientname, numguests)
values (159, 'Nikka-Avital', 710);
insert into CLIENT (clientid, clientname, numguests)
values (161, 'Julia-Landau', 295);
insert into CLIENT (clientid, clientname, numguests)
values (162, 'Paul-McDowell', 431);
insert into CLIENT (clientid, clientname, numguests)
values (164, 'Reese-Gates', 478);
insert into CLIENT (clientid, clientname, numguests)
values (171, 'Brenda-Pesci', 760);
insert into CLIENT (clientid, clientname, numguests)
values (172, 'Ellen-Wilder', 582);
insert into CLIENT (clientid, clientname, numguests)
values (173, 'Liv-Sevigny', 527);
insert into CLIENT (clientid, clientname, numguests)
values (174, 'Wayne-Biehn', 356);
insert into CLIENT (clientid, clientname, numguests)
values (175, 'Alex-Lennix', 335);
insert into CLIENT (clientid, clientname, numguests)
values (176, 'Edie-MacDowell', 299);
insert into CLIENT (clientid, clientname, numguests)
values (177, 'Dick-Herrmann', 245);
insert into CLIENT (clientid, clientname, numguests)
values (178, 'Peter-Amos', 640);
insert into CLIENT (clientid, clientname, numguests)
values (181, 'Sophie-Schock', 749);
insert into CLIENT (clientid, clientname, numguests)
values (182, 'Yolanda-Ledger', 643);
insert into CLIENT (clientid, clientname, numguests)
values (185, 'Rita-Biel', 553);
insert into CLIENT (clientid, clientname, numguests)
values (186, 'Sissy-Atlas', 537);
insert into CLIENT (clientid, clientname, numguests)
values (187, 'Darius-Allison', 403);
insert into CLIENT (clientid, clientname, numguests)
values (189, 'Don-Wilson', 552);
insert into CLIENT (clientid, clientname, numguests)
values (191, 'Gina-Boyle', 312);
insert into CLIENT (clientid, clientname, numguests)
values (192, 'Randy-Osmond', 730);
insert into CLIENT (clientid, clientname, numguests)
values (193, 'Susan-Pride', 235);
insert into CLIENT (clientid, clientname, numguests)
values (194, 'Helen-Cagle', 531);
insert into CLIENT (clientid, clientname, numguests)
values (195, 'William-Ness', 717);
insert into CLIENT (clientid, clientname, numguests)
values (196, 'Gino-Checker', 589);
insert into CLIENT (clientid, clientname, numguests)
values (198, 'Teena-Ricci', 513);
insert into CLIENT (clientid, clientname, numguests)
values (200, 'Rod-Danger', 382);
insert into CLIENT (clientid, clientname, numguests)
values (202, 'Rupert-Bacharac', 388);
insert into CLIENT (clientid, clientname, numguests)
values (204, 'Daniel-Cocker', 710);
insert into CLIENT (clientid, clientname, numguests)
values (205, 'Jet-Nelligan', 552);
prompt 136 records loaded
prompt Loading EVENTTYPE...
insert into EVENTTYPE (typeid, typename)
values (123, ' Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (234, ' Wedding');
insert into EVENTTYPE (typeid, typename)
values (345, ' Birthday');
insert into EVENTTYPE (typeid, typename)
values (350, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (351, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (352, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (353, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (354, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (355, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (356, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (357, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (358, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (359, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (360, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (361, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (362, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (363, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (364, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (365, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (366, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (367, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (368, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (369, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (370, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (371, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (372, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (373, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (374, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (375, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (376, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (377, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (378, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (379, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (380, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (381, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (382, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (383, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (384, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (385, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (386, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (387, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (388, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (389, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (390, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (391, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (392, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (393, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (394, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (395, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (396, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (397, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (398, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (399, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (400, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (401, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (402, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (403, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (404, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (405, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (406, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (407, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (408, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (409, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (410, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (411, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (412, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (413, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (414, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (415, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (416, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (417, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (418, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (419, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (420, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (421, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (422, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (423, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (424, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (425, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (426, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (427, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (428, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (429, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (430, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (431, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (432, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (433, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (434, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (435, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (436, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (437, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (438, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (439, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (440, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (441, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (442, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (443, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (444, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (445, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (446, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (447, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (448, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (449, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (450, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (451, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (452, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (453, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (454, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (455, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (456, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (457, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (458, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (459, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (460, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (461, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (462, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (463, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (464, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (465, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (466, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (467, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (468, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (469, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (470, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (471, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (472, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (473, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (474, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (475, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (476, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (477, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (478, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (479, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (480, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (481, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (482, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (483, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (484, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (485, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (486, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (487, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (488, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (489, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (490, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (491, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (492, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (493, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (494, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (495, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (496, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (497, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (498, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (499, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (500, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (501, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (502, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (503, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (504, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (505, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (506, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (507, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (508, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (509, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (510, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (511, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (512, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (513, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (514, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (515, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (516, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (517, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (518, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (519, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (520, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (521, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (522, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (523, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (524, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (525, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (526, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (527, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (528, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (529, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (530, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (531, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (532, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (533, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (534, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (535, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (536, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (537, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (538, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (539, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (540, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (541, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (542, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (543, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (544, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (545, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (546, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (547, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (548, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (549, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (550, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (551, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (552, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (553, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (554, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (555, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (556, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (557, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (558, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (559, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (560, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (561, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (562, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (563, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (564, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (565, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (566, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (567, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (568, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (569, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (570, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (571, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (572, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (573, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (574, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (575, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (576, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (577, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (578, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (579, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (580, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (581, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (582, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (583, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (584, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (585, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (586, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (587, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (588, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (589, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (590, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (591, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (592, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (593, 'Wedding');
insert into EVENTTYPE (typeid, typename)
values (594, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (595, 'Brite');
insert into EVENTTYPE (typeid, typename)
values (596, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (597, 'Birthday');
insert into EVENTTYPE (typeid, typename)
values (598, 'Bar Mitsva');
insert into EVENTTYPE (typeid, typename)
values (599, 'Bar Mitsva');
prompt 253 records loaded
prompt Loading HALL...
insert into HALL (hallid, maxguests, halltype, area)
values (1, 400, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (2, 500, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (4, 350, 'oulam', 'Bney Brak');
insert into HALL (hallid, maxguests, halltype, area)
values (5, 541, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (6, 463, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (7, 667, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (8, 372, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (9, 375, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (10, 694, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (11, 676, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (12, 431, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (13, 626, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (14, 603, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (15, 497, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (16, 595, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (17, 323, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (18, 518, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (19, 302, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (20, 560, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (21, 516, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (22, 379, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (23, 364, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (24, 658, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (25, 371, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (26, 412, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (27, 368, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (28, 645, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (29, 584, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (30, 373, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (31, 500, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (32, 445, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (33, 380, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (34, 458, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (35, 577, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (36, 401, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (37, 645, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (38, 678, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (39, 401, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (40, 685, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (41, 603, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (42, 424, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (43, 632, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (44, 436, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (45, 399, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (46, 416, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (47, 344, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (48, 475, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (49, 383, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (50, 545, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (51, 363, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (52, 345, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (53, 457, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (54, 403, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (55, 344, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (56, 548, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (57, 493, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (58, 641, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (59, 496, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (60, 528, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (61, 574, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (62, 511, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (63, 517, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (64, 648, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (65, 676, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (66, 352, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (67, 427, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (68, 535, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (69, 319, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (70, 577, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (71, 481, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (72, 636, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (73, 435, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (74, 506, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (75, 641, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (76, 338, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (77, 566, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (78, 426, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (79, 584, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (80, 529, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (81, 634, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (82, 401, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (83, 544, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (84, 525, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (85, 612, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (86, 623, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (87, 543, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (88, 653, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (89, 323, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (90, 623, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (91, 522, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (92, 615, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (93, 512, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (94, 345, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (95, 322, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (96, 319, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (97, 396, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (98, 583, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (99, 629, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (100, 307, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (101, 656, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (102, 390, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (103, 429, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (104, 646, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (105, 470, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (106, 378, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (107, 694, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (108, 449, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (109, 551, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (110, 492, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (111, 437, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (112, 672, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (113, 586, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (114, 584, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (115, 659, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (116, 532, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (117, 441, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (118, 582, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (119, 534, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (120, 430, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (121, 538, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (122, 365, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (123, 338, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (124, 309, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (125, 550, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (126, 354, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (127, 492, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (128, 519, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (129, 433, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (130, 312, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (131, 601, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (132, 339, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (133, 345, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (134, 376, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (135, 470, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (136, 615, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (137, 461, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (138, 411, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (139, 386, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (140, 661, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (141, 631, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (142, 308, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (143, 432, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (144, 500, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (145, 305, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (146, 321, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (147, 333, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (148, 378, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (149, 464, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (150, 656, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (151, 597, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (152, 423, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (153, 570, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (154, 401, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (155, 645, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (156, 593, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (157, 495, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (158, 445, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (159, 509, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (160, 381, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (161, 631, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (162, 636, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (163, 371, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (164, 636, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (165, 333, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (166, 427, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (167, 338, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (168, 324, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (169, 518, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (170, 305, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (171, 521, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (172, 445, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (173, 344, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (174, 597, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (175, 404, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (176, 489, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (177, 419, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (178, 373, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (179, 595, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (180, 658, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (181, 657, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (182, 451, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (183, 517, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (184, 655, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (185, 607, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (186, 599, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (187, 547, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (188, 429, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (189, 611, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (190, 358, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (191, 358, 'oulam', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (192, 325, 'gan Irouim', 'Petach Tikva');
insert into HALL (hallid, maxguests, halltype, area)
values (193, 593, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (194, 576, 'gan Irouim', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (195, 571, 'gan Irouim', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (196, 580, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (197, 625, 'oulam', 'Netanya');
insert into HALL (hallid, maxguests, halltype, area)
values (198, 464, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (199, 473, 'oulam', 'Jerusalem');
insert into HALL (hallid, maxguests, halltype, area)
values (200, 640, 'gan Irouim', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (201, 307, 'oulam', 'Tel aviv');
insert into HALL (hallid, maxguests, halltype, area)
values (202, 694, 'gan Irouim', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (203, 306, 'oulam', 'Cholone');
insert into HALL (hallid, maxguests, halltype, area)
values (204, 458, 'gan Irouim', 'Netanya');
prompt 203 records loaded
prompt Loading SHIFT_MANAGER...
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 1111);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 3333);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 4444);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 5555);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 28);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 6666);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 65);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 208);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 188);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 272);
insert into SHIFT_MANAGER (num_volunteers, id)
values (6, 257);
insert into SHIFT_MANAGER (num_volunteers, id)
values (4, 108);
insert into SHIFT_MANAGER (num_volunteers, id)
values (4, 282);
insert into SHIFT_MANAGER (num_volunteers, id)
values (null, 180);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 183);
insert into SHIFT_MANAGER (num_volunteers, id)
values (4, 165);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 253);
insert into SHIFT_MANAGER (num_volunteers, id)
values (4, 221);
insert into SHIFT_MANAGER (num_volunteers, id)
values (null, 156);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 255);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 42);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 244);
insert into SHIFT_MANAGER (num_volunteers, id)
values (6, 179);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 92);
insert into SHIFT_MANAGER (num_volunteers, id)
values (6, 135);
insert into SHIFT_MANAGER (num_volunteers, id)
values (4, 170);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 80);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 111);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 133);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 144);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 241);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 77);
insert into SHIFT_MANAGER (num_volunteers, id)
values (3, 85);
insert into SHIFT_MANAGER (num_volunteers, id)
values (9, 184);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 75);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 51);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 233);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 49);
insert into SHIFT_MANAGER (num_volunteers, id)
values (null, 78);
insert into SHIFT_MANAGER (num_volunteers, id)
values (1, 66);
insert into SHIFT_MANAGER (num_volunteers, id)
values (2, 106);
insert into SHIFT_MANAGER (num_volunteers, id)
values (5, 43);
insert into SHIFT_MANAGER (num_volunteers, id)
values (null, 56);
prompt 43 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (s_m_id, id)
values (165, 302);
insert into VOLUNTEER (s_m_id, id)
values (65, 238);
insert into VOLUNTEER (s_m_id, id)
values (233, 94);
insert into VOLUNTEER (s_m_id, id)
values (106, 267);
insert into VOLUNTEER (s_m_id, id)
values (183, 139);
insert into VOLUNTEER (s_m_id, id)
values (165, 44);
insert into VOLUNTEER (s_m_id, id)
values (5555, 96);
insert into VOLUNTEER (s_m_id, id)
values (111, 275);
insert into VOLUNTEER (s_m_id, id)
values (28, 16);
insert into VOLUNTEER (s_m_id, id)
values (135, 127);
insert into VOLUNTEER (s_m_id, id)
values (257, 131);
insert into VOLUNTEER (s_m_id, id)
values (1111, 249);
insert into VOLUNTEER (s_m_id, id)
values (170, 124);
insert into VOLUNTEER (s_m_id, id)
values (135, 151);
insert into VOLUNTEER (s_m_id, id)
values (108, 168);
insert into VOLUNTEER (s_m_id, id)
values (184, 259);
insert into VOLUNTEER (s_m_id, id)
values (51, 79);
insert into VOLUNTEER (s_m_id, id)
values (77, 129);
insert into VOLUNTEER (s_m_id, id)
values (208, 34);
insert into VOLUNTEER (s_m_id, id)
values (253, 142);
insert into VOLUNTEER (s_m_id, id)
values (165, 160);
insert into VOLUNTEER (s_m_id, id)
values (253, 274);
insert into VOLUNTEER (s_m_id, id)
values (188, 271);
insert into VOLUNTEER (s_m_id, id)
values (179, 83);
insert into VOLUNTEER (s_m_id, id)
values (6666, 197);
insert into VOLUNTEER (s_m_id, id)
values (244, 166);
insert into VOLUNTEER (s_m_id, id)
values (92, 228);
insert into VOLUNTEER (s_m_id, id)
values (257, 287);
insert into VOLUNTEER (s_m_id, id)
values (184, 201);
insert into VOLUNTEER (s_m_id, id)
values (165, 224);
insert into VOLUNTEER (s_m_id, id)
values (253, 202);
insert into VOLUNTEER (s_m_id, id)
values (135, 256);
insert into VOLUNTEER (s_m_id, id)
values (106, 301);
insert into VOLUNTEER (s_m_id, id)
values (3333, 261);
insert into VOLUNTEER (s_m_id, id)
values (49, 121);
insert into VOLUNTEER (s_m_id, id)
values (43, 113);
insert into VOLUNTEER (s_m_id, id)
values (272, 210);
insert into VOLUNTEER (s_m_id, id)
values (85, 227);
insert into VOLUNTEER (s_m_id, id)
values (111, 154);
insert into VOLUNTEER (s_m_id, id)
values (65, 36);
insert into VOLUNTEER (s_m_id, id)
values (170, 273);
insert into VOLUNTEER (s_m_id, id)
values (184, 46);
insert into VOLUNTEER (s_m_id, id)
values (233, 278);
insert into VOLUNTEER (s_m_id, id)
values (144, 63);
insert into VOLUNTEER (s_m_id, id)
values (111, 91);
insert into VOLUNTEER (s_m_id, id)
values (184, 103);
insert into VOLUNTEER (s_m_id, id)
values (28, 115);
insert into VOLUNTEER (s_m_id, id)
values (135, 109);
insert into VOLUNTEER (s_m_id, id)
values (5555, 54);
insert into VOLUNTEER (s_m_id, id)
values (5555, 76);
insert into VOLUNTEER (s_m_id, id)
values (5555, 55);
insert into VOLUNTEER (s_m_id, id)
values (188, 167);
insert into VOLUNTEER (s_m_id, id)
values (221, 162);
insert into VOLUNTEER (s_m_id, id)
values (282, 203);
insert into VOLUNTEER (s_m_id, id)
values (244, 288);
insert into VOLUNTEER (s_m_id, id)
values (241, 258);
insert into VOLUNTEER (s_m_id, id)
values (42, 276);
insert into VOLUNTEER (s_m_id, id)
values (244, 56);
insert into VOLUNTEER (s_m_id, id)
values (233, 86);
insert into VOLUNTEER (s_m_id, id)
values (92, 10);
insert into VOLUNTEER (s_m_id, id)
values (75, 69);
insert into VOLUNTEER (s_m_id, id)
values (51, 72);
insert into VOLUNTEER (s_m_id, id)
values (77, 138);
insert into VOLUNTEER (s_m_id, id)
values (66, 292);
insert into VOLUNTEER (s_m_id, id)
values (108, 23);
insert into VOLUNTEER (s_m_id, id)
values (282, 152);
insert into VOLUNTEER (s_m_id, id)
values (4444, 246);
insert into VOLUNTEER (s_m_id, id)
values (272, 62);
insert into VOLUNTEER (s_m_id, id)
values (4444, 222);
insert into VOLUNTEER (s_m_id, id)
values (257, 268);
insert into VOLUNTEER (s_m_id, id)
values (170, 147);
insert into VOLUNTEER (s_m_id, id)
values (111, 48);
insert into VOLUNTEER (s_m_id, id)
values (1111, 47);
insert into VOLUNTEER (s_m_id, id)
values (179, 189);
insert into VOLUNTEER (s_m_id, id)
values (3333, 178);
insert into VOLUNTEER (s_m_id, id)
values (3333, 284);
insert into VOLUNTEER (s_m_id, id)
values (42, 212);
insert into VOLUNTEER (s_m_id, id)
values (179, 218);
insert into VOLUNTEER (s_m_id, id)
values (5555, 8888);
insert into VOLUNTEER (s_m_id, id)
values (179, 12);
insert into VOLUNTEER (s_m_id, id)
values (6666, 280);
insert into VOLUNTEER (s_m_id, id)
values (28, 281);
insert into VOLUNTEER (s_m_id, id)
values (179, 39);
insert into VOLUNTEER (s_m_id, id)
values (184, 148);
insert into VOLUNTEER (s_m_id, id)
values (184, 136);
insert into VOLUNTEER (s_m_id, id)
values (4444, 29);
insert into VOLUNTEER (s_m_id, id)
values (108, 17);
insert into VOLUNTEER (s_m_id, id)
values (170, 207);
insert into VOLUNTEER (s_m_id, id)
values (80, 70);
insert into VOLUNTEER (s_m_id, id)
values (77, 33);
insert into VOLUNTEER (s_m_id, id)
values (257, 140);
insert into VOLUNTEER (s_m_id, id)
values (184, 67);
insert into VOLUNTEER (s_m_id, id)
values (65, 11);
insert into VOLUNTEER (s_m_id, id)
values (144, 289);
insert into VOLUNTEER (s_m_id, id)
values (184, 32);
insert into VOLUNTEER (s_m_id, id)
values (85, 196);
insert into VOLUNTEER (s_m_id, id)
values (133, 105);
insert into VOLUNTEER (s_m_id, id)
values (28, 112);
insert into VOLUNTEER (s_m_id, id)
values (208, 27);
insert into VOLUNTEER (s_m_id, id)
values (255, 57);
insert into VOLUNTEER (s_m_id, id)
values (43, 45);
insert into VOLUNTEER (s_m_id, id)
values (43, 90);
insert into VOLUNTEER (s_m_id, id)
values (221, 31);
insert into VOLUNTEER (s_m_id, id)
values (92, 190);
insert into VOLUNTEER (s_m_id, id)
values (188, 14);
insert into VOLUNTEER (s_m_id, id)
values (179, 130);
insert into VOLUNTEER (s_m_id, id)
values (42, 26);
insert into VOLUNTEER (s_m_id, id)
values (65, 213);
insert into VOLUNTEER (s_m_id, id)
values (65, 199);
insert into VOLUNTEER (s_m_id, id)
values (221, 194);
insert into VOLUNTEER (s_m_id, id)
values (221, 2222);
insert into VOLUNTEER (s_m_id, id)
values (135, 254);
insert into VOLUNTEER (s_m_id, id)
values (6666, 270);
insert into VOLUNTEER (s_m_id, id)
values (43, 185);
insert into VOLUNTEER (s_m_id, id)
values (133, 146);
insert into VOLUNTEER (s_m_id, id)
values (4444, 262);
insert into VOLUNTEER (s_m_id, id)
values (257, 87);
insert into VOLUNTEER (s_m_id, id)
values (257, 181);
insert into VOLUNTEER (s_m_id, id)
values (111, 132);
insert into VOLUNTEER (s_m_id, id)
values (184, 163);
insert into VOLUNTEER (s_m_id, id)
values (282, 53);
insert into VOLUNTEER (s_m_id, id)
values (80, 169);
insert into VOLUNTEER (s_m_id, id)
values (233, 13);
insert into VOLUNTEER (s_m_id, id)
values (28, 101);
insert into VOLUNTEER (s_m_id, id)
values (6666, 229);
insert into VOLUNTEER (s_m_id, id)
values (6666, 283);
insert into VOLUNTEER (s_m_id, id)
values (4444, 40);
insert into VOLUNTEER (s_m_id, id)
values (43, 38);
insert into VOLUNTEER (s_m_id, id)
values (135, 209);
insert into VOLUNTEER (s_m_id, id)
values (282, 294);
insert into VOLUNTEER (s_m_id, id)
values (108, 223);
insert into VOLUNTEER (s_m_id, id)
values (85, 269);
insert into VOLUNTEER (s_m_id, id)
values (233, 300);
insert into VOLUNTEER (s_m_id, id)
values (null, 211);
insert into VOLUNTEER (s_m_id, id)
values (null, 214);
insert into VOLUNTEER (s_m_id, id)
values (null, 215);
insert into VOLUNTEER (s_m_id, id)
values (null, 216);
insert into VOLUNTEER (s_m_id, id)
values (null, 350);
insert into VOLUNTEER (s_m_id, id)
values (null, 351);
insert into VOLUNTEER (s_m_id, id)
values (null, 352);
insert into VOLUNTEER (s_m_id, id)
values (null, 353);
insert into VOLUNTEER (s_m_id, id)
values (null, 354);
insert into VOLUNTEER (s_m_id, id)
values (null, 355);
insert into VOLUNTEER (s_m_id, id)
values (null, 356);
insert into VOLUNTEER (s_m_id, id)
values (null, 357);
insert into VOLUNTEER (s_m_id, id)
values (null, 358);
insert into VOLUNTEER (s_m_id, id)
values (null, 359);
insert into VOLUNTEER (s_m_id, id)
values (null, 360);
insert into VOLUNTEER (s_m_id, id)
values (null, 361);
insert into VOLUNTEER (s_m_id, id)
values (null, 362);
insert into VOLUNTEER (s_m_id, id)
values (null, 363);
insert into VOLUNTEER (s_m_id, id)
values (null, 364);
insert into VOLUNTEER (s_m_id, id)
values (null, 365);
insert into VOLUNTEER (s_m_id, id)
values (null, 366);
insert into VOLUNTEER (s_m_id, id)
values (null, 367);
insert into VOLUNTEER (s_m_id, id)
values (null, 368);
insert into VOLUNTEER (s_m_id, id)
values (null, 369);
insert into VOLUNTEER (s_m_id, id)
values (null, 370);
insert into VOLUNTEER (s_m_id, id)
values (null, 371);
insert into VOLUNTEER (s_m_id, id)
values (null, 372);
insert into VOLUNTEER (s_m_id, id)
values (null, 373);
insert into VOLUNTEER (s_m_id, id)
values (null, 374);
insert into VOLUNTEER (s_m_id, id)
values (null, 375);
insert into VOLUNTEER (s_m_id, id)
values (null, 376);
insert into VOLUNTEER (s_m_id, id)
values (null, 377);
insert into VOLUNTEER (s_m_id, id)
values (null, 378);
insert into VOLUNTEER (s_m_id, id)
values (null, 379);
insert into VOLUNTEER (s_m_id, id)
values (null, 380);
insert into VOLUNTEER (s_m_id, id)
values (null, 381);
insert into VOLUNTEER (s_m_id, id)
values (null, 382);
insert into VOLUNTEER (s_m_id, id)
values (null, 383);
insert into VOLUNTEER (s_m_id, id)
values (null, 384);
insert into VOLUNTEER (s_m_id, id)
values (null, 385);
insert into VOLUNTEER (s_m_id, id)
values (null, 386);
insert into VOLUNTEER (s_m_id, id)
values (null, 387);
insert into VOLUNTEER (s_m_id, id)
values (null, 388);
insert into VOLUNTEER (s_m_id, id)
values (null, 389);
insert into VOLUNTEER (s_m_id, id)
values (null, 390);
insert into VOLUNTEER (s_m_id, id)
values (null, 391);
insert into VOLUNTEER (s_m_id, id)
values (null, 392);
insert into VOLUNTEER (s_m_id, id)
values (null, 393);
insert into VOLUNTEER (s_m_id, id)
values (null, 394);
insert into VOLUNTEER (s_m_id, id)
values (null, 395);
insert into VOLUNTEER (s_m_id, id)
values (null, 396);
insert into VOLUNTEER (s_m_id, id)
values (null, 397);
insert into VOLUNTEER (s_m_id, id)
values (null, 398);
insert into VOLUNTEER (s_m_id, id)
values (null, 399);
insert into VOLUNTEER (s_m_id, id)
values (null, 400);
insert into VOLUNTEER (s_m_id, id)
values (null, 401);
insert into VOLUNTEER (s_m_id, id)
values (null, 402);
insert into VOLUNTEER (s_m_id, id)
values (null, 403);
insert into VOLUNTEER (s_m_id, id)
values (null, 404);
insert into VOLUNTEER (s_m_id, id)
values (null, 405);
insert into VOLUNTEER (s_m_id, id)
values (null, 406);
insert into VOLUNTEER (s_m_id, id)
values (null, 407);
insert into VOLUNTEER (s_m_id, id)
values (null, 408);
insert into VOLUNTEER (s_m_id, id)
values (null, 409);
insert into VOLUNTEER (s_m_id, id)
values (null, 410);
insert into VOLUNTEER (s_m_id, id)
values (null, 411);
insert into VOLUNTEER (s_m_id, id)
values (null, 412);
insert into VOLUNTEER (s_m_id, id)
values (null, 413);
insert into VOLUNTEER (s_m_id, id)
values (null, 414);
insert into VOLUNTEER (s_m_id, id)
values (null, 415);
insert into VOLUNTEER (s_m_id, id)
values (null, 416);
insert into VOLUNTEER (s_m_id, id)
values (null, 417);
insert into VOLUNTEER (s_m_id, id)
values (null, 418);
insert into VOLUNTEER (s_m_id, id)
values (null, 419);
insert into VOLUNTEER (s_m_id, id)
values (null, 420);
insert into VOLUNTEER (s_m_id, id)
values (null, 421);
insert into VOLUNTEER (s_m_id, id)
values (null, 422);
insert into VOLUNTEER (s_m_id, id)
values (null, 423);
insert into VOLUNTEER (s_m_id, id)
values (null, 424);
insert into VOLUNTEER (s_m_id, id)
values (null, 425);
insert into VOLUNTEER (s_m_id, id)
values (null, 426);
insert into VOLUNTEER (s_m_id, id)
values (null, 427);
insert into VOLUNTEER (s_m_id, id)
values (null, 428);
insert into VOLUNTEER (s_m_id, id)
values (null, 429);
insert into VOLUNTEER (s_m_id, id)
values (null, 430);
insert into VOLUNTEER (s_m_id, id)
values (null, 431);
insert into VOLUNTEER (s_m_id, id)
values (null, 432);
insert into VOLUNTEER (s_m_id, id)
values (null, 433);
insert into VOLUNTEER (s_m_id, id)
values (null, 434);
insert into VOLUNTEER (s_m_id, id)
values (null, 435);
insert into VOLUNTEER (s_m_id, id)
values (null, 436);
insert into VOLUNTEER (s_m_id, id)
values (null, 437);
insert into VOLUNTEER (s_m_id, id)
values (null, 438);
insert into VOLUNTEER (s_m_id, id)
values (null, 439);
insert into VOLUNTEER (s_m_id, id)
values (null, 440);
insert into VOLUNTEER (s_m_id, id)
values (null, 441);
insert into VOLUNTEER (s_m_id, id)
values (null, 442);
insert into VOLUNTEER (s_m_id, id)
values (null, 443);
insert into VOLUNTEER (s_m_id, id)
values (null, 444);
insert into VOLUNTEER (s_m_id, id)
values (null, 445);
insert into VOLUNTEER (s_m_id, id)
values (null, 446);
insert into VOLUNTEER (s_m_id, id)
values (null, 447);
insert into VOLUNTEER (s_m_id, id)
values (null, 448);
insert into VOLUNTEER (s_m_id, id)
values (null, 449);
insert into VOLUNTEER (s_m_id, id)
values (null, 450);
insert into VOLUNTEER (s_m_id, id)
values (null, 451);
insert into VOLUNTEER (s_m_id, id)
values (null, 452);
insert into VOLUNTEER (s_m_id, id)
values (null, 453);
insert into VOLUNTEER (s_m_id, id)
values (null, 454);
insert into VOLUNTEER (s_m_id, id)
values (null, 455);
insert into VOLUNTEER (s_m_id, id)
values (null, 456);
insert into VOLUNTEER (s_m_id, id)
values (null, 457);
insert into VOLUNTEER (s_m_id, id)
values (null, 458);
insert into VOLUNTEER (s_m_id, id)
values (null, 459);
insert into VOLUNTEER (s_m_id, id)
values (null, 460);
insert into VOLUNTEER (s_m_id, id)
values (null, 461);
insert into VOLUNTEER (s_m_id, id)
values (null, 462);
insert into VOLUNTEER (s_m_id, id)
values (null, 463);
insert into VOLUNTEER (s_m_id, id)
values (null, 464);
insert into VOLUNTEER (s_m_id, id)
values (null, 465);
insert into VOLUNTEER (s_m_id, id)
values (null, 466);
insert into VOLUNTEER (s_m_id, id)
values (null, 467);
insert into VOLUNTEER (s_m_id, id)
values (null, 468);
insert into VOLUNTEER (s_m_id, id)
values (null, 469);
insert into VOLUNTEER (s_m_id, id)
values (null, 470);
insert into VOLUNTEER (s_m_id, id)
values (null, 471);
insert into VOLUNTEER (s_m_id, id)
values (null, 472);
insert into VOLUNTEER (s_m_id, id)
values (null, 473);
insert into VOLUNTEER (s_m_id, id)
values (null, 474);
insert into VOLUNTEER (s_m_id, id)
values (null, 475);
insert into VOLUNTEER (s_m_id, id)
values (null, 476);
insert into VOLUNTEER (s_m_id, id)
values (null, 477);
insert into VOLUNTEER (s_m_id, id)
values (null, 478);
insert into VOLUNTEER (s_m_id, id)
values (null, 479);
insert into VOLUNTEER (s_m_id, id)
values (null, 480);
insert into VOLUNTEER (s_m_id, id)
values (null, 481);
insert into VOLUNTEER (s_m_id, id)
values (null, 482);
insert into VOLUNTEER (s_m_id, id)
values (null, 483);
insert into VOLUNTEER (s_m_id, id)
values (null, 484);
insert into VOLUNTEER (s_m_id, id)
values (null, 485);
insert into VOLUNTEER (s_m_id, id)
values (null, 486);
insert into VOLUNTEER (s_m_id, id)
values (null, 487);
insert into VOLUNTEER (s_m_id, id)
values (null, 488);
insert into VOLUNTEER (s_m_id, id)
values (null, 489);
insert into VOLUNTEER (s_m_id, id)
values (null, 490);
insert into VOLUNTEER (s_m_id, id)
values (null, 491);
insert into VOLUNTEER (s_m_id, id)
values (null, 492);
insert into VOLUNTEER (s_m_id, id)
values (null, 493);
insert into VOLUNTEER (s_m_id, id)
values (null, 494);
insert into VOLUNTEER (s_m_id, id)
values (null, 495);
insert into VOLUNTEER (s_m_id, id)
values (null, 496);
insert into VOLUNTEER (s_m_id, id)
values (null, 497);
insert into VOLUNTEER (s_m_id, id)
values (null, 498);
insert into VOLUNTEER (s_m_id, id)
values (null, 499);
insert into VOLUNTEER (s_m_id, id)
values (null, 500);
insert into VOLUNTEER (s_m_id, id)
values (null, 501);
insert into VOLUNTEER (s_m_id, id)
values (null, 502);
insert into VOLUNTEER (s_m_id, id)
values (null, 503);
insert into VOLUNTEER (s_m_id, id)
values (null, 504);
insert into VOLUNTEER (s_m_id, id)
values (null, 505);
insert into VOLUNTEER (s_m_id, id)
values (null, 506);
insert into VOLUNTEER (s_m_id, id)
values (null, 507);
insert into VOLUNTEER (s_m_id, id)
values (null, 508);
insert into VOLUNTEER (s_m_id, id)
values (null, 509);
insert into VOLUNTEER (s_m_id, id)
values (null, 510);
insert into VOLUNTEER (s_m_id, id)
values (null, 511);
insert into VOLUNTEER (s_m_id, id)
values (null, 512);
insert into VOLUNTEER (s_m_id, id)
values (null, 513);
insert into VOLUNTEER (s_m_id, id)
values (null, 514);
insert into VOLUNTEER (s_m_id, id)
values (null, 515);
insert into VOLUNTEER (s_m_id, id)
values (null, 516);
insert into VOLUNTEER (s_m_id, id)
values (null, 517);
insert into VOLUNTEER (s_m_id, id)
values (null, 518);
insert into VOLUNTEER (s_m_id, id)
values (null, 519);
insert into VOLUNTEER (s_m_id, id)
values (null, 520);
insert into VOLUNTEER (s_m_id, id)
values (null, 521);
insert into VOLUNTEER (s_m_id, id)
values (null, 522);
insert into VOLUNTEER (s_m_id, id)
values (null, 523);
insert into VOLUNTEER (s_m_id, id)
values (null, 524);
insert into VOLUNTEER (s_m_id, id)
values (null, 525);
insert into VOLUNTEER (s_m_id, id)
values (null, 526);
insert into VOLUNTEER (s_m_id, id)
values (null, 527);
insert into VOLUNTEER (s_m_id, id)
values (null, 528);
insert into VOLUNTEER (s_m_id, id)
values (null, 529);
insert into VOLUNTEER (s_m_id, id)
values (null, 530);
insert into VOLUNTEER (s_m_id, id)
values (null, 531);
insert into VOLUNTEER (s_m_id, id)
values (null, 532);
insert into VOLUNTEER (s_m_id, id)
values (null, 533);
insert into VOLUNTEER (s_m_id, id)
values (null, 534);
insert into VOLUNTEER (s_m_id, id)
values (null, 535);
insert into VOLUNTEER (s_m_id, id)
values (null, 536);
insert into VOLUNTEER (s_m_id, id)
values (null, 537);
insert into VOLUNTEER (s_m_id, id)
values (null, 538);
insert into VOLUNTEER (s_m_id, id)
values (null, 539);
insert into VOLUNTEER (s_m_id, id)
values (null, 540);
insert into VOLUNTEER (s_m_id, id)
values (null, 541);
insert into VOLUNTEER (s_m_id, id)
values (null, 542);
insert into VOLUNTEER (s_m_id, id)
values (null, 543);
insert into VOLUNTEER (s_m_id, id)
values (null, 544);
insert into VOLUNTEER (s_m_id, id)
values (null, 545);
insert into VOLUNTEER (s_m_id, id)
values (null, 546);
insert into VOLUNTEER (s_m_id, id)
values (null, 547);
prompt 335 records loaded
prompt Loading ORCHESTRA...
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (10, 'Faithfull', 11992);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (11, 'Haslam', 15179);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (12, 'Belle', 12465);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (13, 'Harnes', 13839);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (14, 'Bean', 16488);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (16, 'Candy', 13558);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (17, 'Charles', 15006);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (23, 'Stallone', 14923);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (26, 'Houston', 12161);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (27, 'Witt', 16915);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (29, 'Marsden', 10768);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (31, 'Gayle', 13722);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (32, 'Turner', 14778);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (33, 'Oates', 14936);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (34, 'Unger', 16268);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (36, 'Chaykin', 16005);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (38, 'Caine', 16162);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (39, 'Purefoy', 16714);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (40, 'Arthur', 12801);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (44, 'Davidson', 16005);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (45, 'Cochran', 15100);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (46, 'Conroy', 12218);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (47, 'Cube', 16868);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (48, 'El-Saher', 16791);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (53, 'Shandling', 13625);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (54, 'Wiest', 11979);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (55, 'Warburton', 14868);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (56, 'Assante', 13053);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (57, 'Goldberg', 10250);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (62, 'Goldblum', 10765);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (63, 'Sossamon', 15182);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (67, 'Blackmore', 15944);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (69, 'Edmunds', 15190);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (70, 'Hawthorne', 11455);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (72, 'Brody', 14725);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (76, 'Venora', 13019);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (79, 'Hamilton', 14893);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (83, 'Estevez', 16443);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (86, 'Warwick', 16191);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (87, 'Lemmon', 13686);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (90, 'Shawn', 14977);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (91, 'Blades', 11945);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (94, 'Harrelson', 10819);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (96, 'Ward', 12207);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (101, 'Macy', 15419);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (103, 'Davidtz', 11272);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (105, 'Bello', 11518);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (109, 'Isaacs', 11404);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (112, 'Ryan', 16561);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (113, 'Oszajca', 14889);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (115, 'DeGraw', 10541);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (121, 'Oldman', 12530);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (124, 'Coward', 13967);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (127, 'Connery', 11933);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (129, 'Askew', 14326);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (130, 'Candy', 12795);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (131, 'Smurfit', 12384);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (132, 'Wong', 14273);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (136, 'McNarland', 15690);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (138, 'Condition', 11665);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (139, 'Vinton', 12580);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (140, 'De Niro', 15443);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (142, 'Nielsen', 15866);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (146, 'Lorenz', 12826);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (147, 'Stallone', 15224);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (148, 'Laws', 15949);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (151, 'Buscemi', 16445);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (152, 'Pepper', 10476);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (154, 'Stanley', 15180);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (160, 'Cusack', 15700);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (162, 'Paxton', 13149);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (163, 'Rush', 11644);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (166, 'Lerner', 10859);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (167, 'Hunt', 15829);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (168, 'Ward', 11655);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (169, 'Garr', 10311);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (178, 'Jackman', 11615);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (181, 'Salt', 13530);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (185, 'LaBelle', 16044);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (189, 'Kier', 10440);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (190, 'Kadison', 16983);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (194, 'Mollard', 11439);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (196, 'Woodward', 15280);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (197, 'Lerner', 10828);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (199, 'Lewin', 13609);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (201, 'Wilson', 14958);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (202, 'Magnuson', 10500);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (203, 'Thompson', 14160);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (207, 'Stewart', 14883);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (209, 'McGregor', 15087);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (210, 'Wood', 14190);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (211, 'McGriff', 14970);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (212, 'Biel', 10566);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (213, 'Rapaport', 14853);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (214, 'Holly', 12829);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (215, 'Dillane', 15709);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (216, 'Moore', 14869);
insert into ORCHESTRA (orchestraid, orchestraname, orchestraprice)
values (218, 'Scheider', 15340);
prompt 98 records loaded
prompt Loading PHOTOGRAPH...
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (11, 'Halpherin', 20000);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (33, 'Sutton', 15000);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (350, 'Boothe', 8098);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (351, 'Speaks', 12529);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (352, 'Hingle', 8014);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (353, 'Duvall', 9400);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (354, 'Stevens', 11473);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (355, 'LaPaglia', 11146);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (356, 'Waite', 12904);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (357, 'Orton', 12686);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (358, 'Walken', 12050);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (359, 'Knight', 7418);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (360, 'Torn', 12787);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (361, 'Coyote', 7867);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (362, 'Driver', 7644);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (363, 'Moore', 9059);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (364, 'Pitney', 12450);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (365, 'Young', 10779);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (366, 'Domino', 12986);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (367, 'Haysbert', 12365);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (368, 'Gill', 8889);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (369, 'Malone', 13722);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (370, 'Root', 9517);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (371, 'Chaplin', 8098);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (372, 'Fogerty', 15546);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (373, 'Leachman', 7367);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (374, 'Negbaur', 7169);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (375, 'Whitford', 11189);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (376, 'Coyote', 14439);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (377, 'Belles', 17156);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (378, 'Curry', 12258);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (379, 'Kline', 12473);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (380, 'Cooper', 8202);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (381, 'Pressly', 11938);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (382, 'Ermey', 11535);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (383, 'Neill', 7970);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (384, 'Slater', 14562);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (385, 'Penders', 9207);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (386, 'Bragg', 10227);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (387, 'Michael', 16943);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (388, 'Mellencamp', 17582);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (389, 'Orlando', 11403);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (390, 'Folds', 12508);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (391, 'Sutherland', 11657);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (392, 'Sossamon', 15863);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (393, 'Rippy', 11641);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (394, 'Presley', 10903);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (395, 'King', 15592);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (396, 'Makowicz', 13662);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (397, 'Kurtz', 13890);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (398, 'Gayle', 17638);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (399, 'Cole', 7078);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (400, 'Kudrow', 9960);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (401, 'Rickman', 12584);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (402, 'Chandler', 16918);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (403, 'Sewell', 13385);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (404, 'Wiedlin', 7466);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (405, 'Adler', 8670);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (406, 'Hewitt', 14154);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (407, 'Rauhofer', 10227);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (408, 'Crowe', 8551);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (409, 'Ferry', 7094);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (410, 'Linney', 17120);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (411, 'Cara', 11731);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (412, 'Christie', 9130);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (413, 'Merchant', 17728);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (414, 'Imbruglia', 15043);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (415, 'MacNeil', 9819);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (416, 'Atkins', 12472);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (417, 'Barrymore', 15723);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (418, 'Morton', 10641);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (419, 'Lunch', 16047);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (420, 'Diggs', 7955);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (421, 'Derringer', 15317);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (422, 'Nielsen', 17096);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (423, 'Costello', 7860);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (424, 'Beck', 13759);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (425, 'Payne', 15070);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (426, 'Dickinson', 8954);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (427, 'Shepard', 10315);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (428, 'Myers', 7481);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (429, 'Fender', 12530);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (430, 'Addy', 13982);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (431, 'Sedgwick', 16207);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (432, 'Sinatra', 8714);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (433, 'Sirtis', 11355);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (434, 'Miller', 15938);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (435, 'Fiennes', 8656);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (436, 'Hirsch', 16540);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (437, 'McGriff', 9853);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (438, 'Neil', 9305);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (439, 'Capshaw', 9126);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (440, 'Spears', 10969);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (441, 'Woods', 14976);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (442, 'Tambor', 7938);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (443, 'Reeves', 7879);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (444, 'Sandler', 7322);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (445, 'Ferry', 15736);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (446, 'Gallant', 7669);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (447, 'Dorff', 7864);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (448, 'Viterelli', 9542);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (449, 'James', 15072);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (450, 'Malkovich', 12832);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (451, 'Hayek', 17054);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (452, 'McCracken', 16443);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (453, 'Singletary', 10147);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (454, 'Stuart', 16740);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (455, 'Quatro', 11204);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (456, 'Pitney', 14905);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (457, 'Durning', 9085);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (458, 'Street', 13088);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (459, 'Scorsese', 10066);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (460, 'McCabe', 14996);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (461, 'Stormare', 7143);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (462, 'Merchant', 16305);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (463, 'Holmes', 14027);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (464, 'Zevon', 17043);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (465, 'Craig', 10324);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (466, 'Frampton', 13831);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (467, 'Suchet', 10187);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (468, 'Atlas', 9624);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (469, 'Day', 7426);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (470, 'Reinhold', 15341);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (471, 'Jackman', 14881);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (472, 'Garr', 9519);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (473, 'McKean', 11527);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (474, 'Abraham', 11903);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (475, 'Plowright', 9629);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (476, 'Berkoff', 11578);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (477, 'Sandler', 16910);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (478, 'Unger', 10072);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (479, 'Cassidy', 12536);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (480, 'Fraser', 13539);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (481, 'Holm', 14422);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (482, 'Carrington', 8927);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (483, 'McDonnell', 10114);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (484, 'Channing', 16779);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (485, 'Lorenz', 10278);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (486, 'Loveless', 8035);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (487, 'Whitmore', 13554);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (488, 'Butler', 14005);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (489, 'Branagh', 15292);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (490, 'Janssen', 13368);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (491, 'Tippe', 8430);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (492, 'Kinnear', 7879);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (493, 'Gooding', 15552);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (494, 'Donovan', 8140);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (495, 'LaBelle', 17845);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (496, 'Snider', 16587);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (497, 'Kirshner', 12534);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (498, 'Navarro', 9596);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (499, 'Burke', 15002);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (500, 'Khan', 11332);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (501, 'Black', 11648);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (502, 'Hersh', 13733);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (503, 'Ellis', 15232);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (504, 'Benson', 16783);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (505, 'Smith', 14226);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (506, 'Sarandon', 14952);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (507, 'Mollard', 17443);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (508, 'Colon', 11445);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (509, 'Gold', 12945);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (510, 'Johnson', 12660);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (511, 'Skerritt', 15014);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (512, 'Clinton', 12979);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (513, 'Redford', 12687);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (514, 'Squier', 15802);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (515, 'Sanders', 10126);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (516, 'Pepper', 7448);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (517, 'Negbaur', 10842);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (518, 'Hoffman', 12328);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (519, 'McNeice', 9529);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (520, 'Short', 8513);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (521, 'Zeta-Jones', 14040);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (522, 'Arnold', 13607);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (523, 'Smith', 12746);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (524, 'O''Donnell', 15555);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (525, 'Bullock', 14325);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (526, 'Evanswood', 8768);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (527, 'Sawa', 14716);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (528, 'Kurtz', 13739);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (529, 'Mellencamp', 12771);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (530, 'Curry', 15987);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (531, 'Rooker', 11875);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (532, 'Myles', 16023);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (533, 'Mathis', 13526);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (534, 'Leigh', 10700);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (535, 'Jessee', 11674);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (536, 'Posey', 15088);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (537, 'Peniston', 10300);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (538, 'Kline', 16773);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (539, 'Garza', 12531);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (540, 'McAnally', 10221);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (541, 'Judd', 9287);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (542, 'Hayek', 8588);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (543, 'Dukakis', 9229);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (544, 'Pierce', 10128);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (545, 'Jovovich', 11533);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (546, 'LaBelle', 9081);
insert into PHOTOGRAPH (photographid, photographname, photographprice)
values (547, 'Vincent', 12741);
prompt 200 records loaded
prompt Loading EVENT...
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (17, 25661, to_date('30-12-2013', 'dd-mm-yyyy'), 146, 394, 173, 353, 121);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (23, 1101069, to_date('26-09-2007', 'dd-mm-yyyy'), 73, 584, 171, 353, 218);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (31, 39871, to_date('17-10-1995', 'dd-mm-yyyy'), 41, 479, 25, 355, 13);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (34, 30934, to_date('17-08-1986', 'dd-mm-yyyy'), 65, 515, 205, 367, 63);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (37, 28363, to_date('06-09-2001', 'dd-mm-yyyy'), 176, 525, 119, 363, 121);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (52, 1101249, to_date('20-11-1987', 'dd-mm-yyyy'), 109, 490, 181, 365, 210);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (54, 31250, to_date('22-01-2021', 'dd-mm-yyyy'), 86, 463, 81, 351, 17);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (63, 38599, to_date('07-01-1982', 'dd-mm-yyyy'), 168, 452, 62, 366, 124);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (69, 28963, to_date('02-07-1980', 'dd-mm-yyyy'), 140, 548, 23, 351, 136);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (70, 35614, to_date('22-11-2010', 'dd-mm-yyyy'), 1, 568, 182, 354, 136);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (73, 1107688, to_date('08-10-1994', 'dd-mm-yyyy'), 106, 490, 29, 355, 146);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (77, 20330, to_date('21-03-1983', 'dd-mm-yyyy'), 9, 418, 81, 366, 79);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (82, 1104702, to_date('12-11-1994', 'dd-mm-yyyy'), 102, 408, 132, 360, 44);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (84, 34641, to_date('27-01-1984', 'dd-mm-yyyy'), 158, 541, 196, 362, 185);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (85, 34518, to_date('06-12-2020', 'dd-mm-yyyy'), 109, 592, 157, 353, 131);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (87, 1106748, to_date('28-09-1988', 'dd-mm-yyyy'), 90, 488, 21, 351, 136);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (98, 27027, to_date('30-03-1995', 'dd-mm-yyyy'), 184, 564, 50, 353, 48);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (100, 22335, to_date('19-01-1981', 'dd-mm-yyyy'), 54, 463, 110, 363, 34);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (103, 1101917, to_date('10-07-1991', 'dd-mm-yyyy'), 116, 442, 40, 357, 39);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (107, 32046, to_date('17-04-1984', 'dd-mm-yyyy'), 104, 480, 187, 354, 147);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (108, 26189, to_date('13-03-2010', 'dd-mm-yyyy'), 51, 379, 35, 364, 26);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (110, 1104348, to_date('02-02-2013', 'dd-mm-yyyy'), 4, 599, 29, 352, 76);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (112, 30199, to_date('01-11-1979', 'dd-mm-yyyy'), 83, 465, 20, 358, 210);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (114, 28537, to_date('06-07-2020', 'dd-mm-yyyy'), 37, 516, 61, 367, 213);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (116, 21322, to_date('10-07-2015', 'dd-mm-yyyy'), 195, 546, 114, 358, 169);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (119, 23808, to_date('02-11-2008', 'dd-mm-yyyy'), 79, 463, 205, 358, 168);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (126, 24846, to_date('08-07-2018', 'dd-mm-yyyy'), 172, 450, 157, 362, 27);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (128, 39897, to_date('22-08-2004', 'dd-mm-yyyy'), 67, 549, 100, 356, 26);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (131, 37596, to_date('25-05-2008', 'dd-mm-yyyy'), 58, 523, 68, 360, 40);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (137, 1106819, to_date('25-01-1984', 'dd-mm-yyyy'), 199, 386, 64, 352, 39);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (142, 39469, to_date('29-12-1993', 'dd-mm-yyyy'), 107, 513, 186, 358, 151);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (149, 28782, to_date('17-07-1994', 'dd-mm-yyyy'), 176, 458, 141, 354, 147);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (151, 29764, to_date('18-02-2016', 'dd-mm-yyyy'), 143, 364, 172, 357, 131);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (152, 22710, to_date('24-08-1998', 'dd-mm-yyyy'), 14, 595, 97, 355, 47);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (154, 1101002, to_date('15-05-2018', 'dd-mm-yyyy'), 164, 453, 189, 356, 14);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (155, 25479, to_date('09-09-1985', 'dd-mm-yyyy'), 75, 445, 145, 351, 167);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (156, 38405, to_date('21-10-1976', 'dd-mm-yyyy'), 17, 400, 52, 365, 210);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (157, 21085, to_date('25-01-1988', 'dd-mm-yyyy'), 191, 495, 37, 365, 10);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (158, 27193, to_date('20-10-1976', 'dd-mm-yyyy'), 93, 409, 59, 362, 154);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (160, 32414, to_date('15-02-1987', 'dd-mm-yyyy'), 173, 524, 52, 351, 131);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (163, 22241, to_date('08-02-2009', 'dd-mm-yyyy'), 75, 123, 41, 355, 202);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (165, 28394, to_date('30-11-1991', 'dd-mm-yyyy'), 54, 527, 141, 365, 131);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (170, 1109394, to_date('29-11-1996', 'dd-mm-yyyy'), 8, 525, 40, 354, 45);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (173, 20393, to_date('16-03-1996', 'dd-mm-yyyy'), 178, 545, 25, 353, 202);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (177, 20012, to_date('28-07-2006', 'dd-mm-yyyy'), 21, 392, 59, 363, 90);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (180, 38643, to_date('09-06-2007', 'dd-mm-yyyy'), 200, 570, 193, 353, 209);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (181, 34053, to_date('05-12-1984', 'dd-mm-yyyy'), 108, 123, 73, 364, 218);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (186, 26554, to_date('22-07-1987', 'dd-mm-yyyy'), 190, 402, 68, 352, 212);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (188, 1098039, to_date('08-08-1974', 'dd-mm-yyyy'), 179, 462, 29, 11, 96);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (203, 1096903, to_date('01-02-1975', 'dd-mm-yyyy'), 128, 387, 181, 351, 148);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (207, 25509, to_date('06-09-2013', 'dd-mm-yyyy'), 180, 519, 109, 367, 203);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (208, 29151, to_date('31-10-2022', 'dd-mm-yyyy'), 154, 439, 102, 352, 39);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (210, 27310, to_date('17-10-2009', 'dd-mm-yyyy'), 63, 369, 150, 366, 136);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (213, 39415, to_date('05-07-1986', 'dd-mm-yyyy'), 41, 414, 22, 359, 69);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (214, 1112754, to_date('04-08-1976', 'dd-mm-yyyy'), 178, 364, 136, 350, 211);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (216, 30418, to_date('04-09-1975', 'dd-mm-yyyy'), 112, 580, 24, 367, 148);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (219, 20849, to_date('05-08-1973', 'dd-mm-yyyy'), 181, 442, 200, 33, 209);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (224, 22370, to_date('06-10-1990', 'dd-mm-yyyy'), 10, 521, 26, 354, 203);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (228, 26853, to_date('08-04-1990', 'dd-mm-yyyy'), 155, 376, 172, 33, 209);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (230, 25804, to_date('04-02-1989', 'dd-mm-yyyy'), 97, 461, 192, 355, 72);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (231, 39004, to_date('22-08-1976', 'dd-mm-yyyy'), 7, 517, 182, 355, 203);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (234, 21476, to_date('29-11-2008', 'dd-mm-yyyy'), 177, 423, 143, 362, 124);
insert into EVENT (eventid, budget, eventdate, hallid, typeid, clientid, photographid, orchestraid)
values (239, 1108011, to_date('06-06-1983', 'dd-mm-yyyy'), 18, 505, 56, 354, 91);
prompt 63 records loaded
prompt Loading MANAGER...
insert into MANAGER (monthly_profit, id)
values (9606, 121);
insert into MANAGER (monthly_profit, id)
values (7477, 146);
insert into MANAGER (monthly_profit, id)
values (8486, 60);
insert into MANAGER (monthly_profit, id)
values (8608, 142);
insert into MANAGER (monthly_profit, id)
values (5568, 196);
prompt 5 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2250, '60', '3', 'On-call shift', 0);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2580, '27', '1', 'Holiday shift', 1);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2621, '11', '38', 'On-call shift', 2);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3472, '58', '40', 'On-call shift', 3);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2666, '17', '0', 'On-call shift', 4);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2596, '59', '24', 'Day shift', 5);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2199, '58', '20', 'Holiday shift', 6);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3983, '37', '56', 'Holiday shift', 7);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3236, '26', '44', 'On-call shift', 8);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2763, '34', '55', 'Weekend shift', 9);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3982, '45', '19', 'On-call shift', 10);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3748, '31', '6', 'Day shift', 11);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2717, '54', '16', 'On-call shift', 12);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3627, '40', '54', 'Weekend shift', 13);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3308, '10', '15', 'On-call shift', 14);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3794, '16', '2', 'On-call shift', 15);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2350, '32', '7', 'Night shift', 16);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2794, '18', '52', 'Night shift', 17);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3920, '55', '54', 'On-call shift', 18);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (4397, '6', '37', 'On-call shift', 19);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3968, '45', '8', 'Day shift', 20);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3299, '8', '15', 'Day shift', 21);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2329, '31', '38', 'Weekend shift', 22);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2447, '48', '28', 'Day shift', 23);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3361, '19', '13', 'On-call shift', 24);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (4987, '18', '3', 'On-call shift', 25);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3204, '29', '15', 'Weekend shift', 26);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3834, '37', '39', 'Holiday shift', 27);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (4665, '22', '59', 'On-call shift', 28);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3881, '26', '34', 'Day shift', 29);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3735, '3', '37', 'Night shift', 30);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3812, '15', '18', 'On-call shift', 31);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3721, '17', '26', 'Night shift', 32);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2561, '31', '0', 'Day shift', 33);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3012, '17', '20', 'Weekend shift', 34);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2380, '46', '26', 'Holiday shift', 35);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2462, '45', '42', 'Weekend shift', 36);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2542, '53', '15', 'Holiday shift', 37);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2403, '52', '28', 'Night shift', 38);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3661, '28', '30', 'Holiday shift', 39);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2283, '29', '41', 'Holiday shift', 40);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3643, '7', '31', 'On-call shift', 41);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3926, '9', '11', 'Night shift', 42);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3264, '58', '6', 'On-call shift', 43);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3418, '24', '46', 'On-call shift', 44);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3364, '2', '1', 'Day shift', 45);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2622, '1', '30', 'Day shift', 46);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (2674, '59', '47', 'Day shift', 47);
insert into SHIFTS (salary, start_time, finish_time, shift_type, s_id)
values (3312, '25', '30', 'Weekend shift', 48);
prompt 49 records loaded
prompt Loading VOLUNTEERING...
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 101, 151, 154, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 102, 296, 39, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-02-2022', 'dd-mm-yyyy'), 103, 113, 57, 47);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-05-2023', 'dd-mm-yyyy'), 104, 124, 103, 5);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 105, 293, 278, 20);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 106, 152, 203, 25);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-07-2022', 'dd-mm-yyyy'), 0, 261, 294, 16);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('22-01-2022', 'dd-mm-yyyy'), 1, 109, 109, 36);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('09-12-2022', 'dd-mm-yyyy'), 2, 176, 33, 20);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-11-2022', 'dd-mm-yyyy'), 3, 141, 197, 26);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-06-2022', 'dd-mm-yyyy'), 4, 235, 101, 24);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-01-2023', 'dd-mm-yyyy'), 5, 217, 163, 7);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 6, 113, 227, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-09-2022', 'dd-mm-yyyy'), 7, 189, 162, 39);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-01-2023', 'dd-mm-yyyy'), 8, 61, 13, 10);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('06-10-2023', 'dd-mm-yyyy'), 9, 31, 249, 27);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 10, 210, 224, 14);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('21-01-2023', 'dd-mm-yyyy'), 11, 71, 103, 19);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-12-2023', 'dd-mm-yyyy'), 12, 189, 11, 40);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 13, 53, 224, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 14, 141, 103, 38);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-08-2022', 'dd-mm-yyyy'), 15, 27, 223, 30);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('23-12-2022', 'dd-mm-yyyy'), 16, 206, 294, 41);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-05-2022', 'dd-mm-yyyy'), 17, 62, 151, 26);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('09-05-2022', 'dd-mm-yyyy'), 18, 261, 96, 5);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('10-10-2022', 'dd-mm-yyyy'), 19, 13, 39, 31);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('03-05-2023', 'dd-mm-yyyy'), 20, 115, 284, 24);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-05-2023', 'dd-mm-yyyy'), 21, 62, 94, 29);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-03-2022', 'dd-mm-yyyy'), 22, 122, 189, 28);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-06-2023', 'dd-mm-yyyy'), 23, 26, 148, 2);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('10-11-2023', 'dd-mm-yyyy'), 24, 242, 280, 5);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('03-12-2022', 'dd-mm-yyyy'), 25, 202, 63, 27);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('21-10-2023', 'dd-mm-yyyy'), 26, 185, 8888, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-01-2022', 'dd-mm-yyyy'), 27, 64, 278, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 28, 117, 201, 25);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('26-05-2023', 'dd-mm-yyyy'), 29, 178, 246, 28);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-04-2023', 'dd-mm-yyyy'), 30, 62, 261, 21);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('27-05-2023', 'dd-mm-yyyy'), 107, 142, 62, 0);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-05-2023', 'dd-mm-yyyy'), 108, 96, 39, 20);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-01-2023', 'dd-mm-yyyy'), 109, 31, 229, 30);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-01-2023', 'dd-mm-yyyy'), 110, 250, 69, 33);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('10-12-2023', 'dd-mm-yyyy'), 111, 277, 283, 22);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('04-08-2022', 'dd-mm-yyyy'), 112, 185, 70, 3);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('10-07-2023', 'dd-mm-yyyy'), 113, 15, 26, 36);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 114, 182, 194, 45);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('04-08-2022', 'dd-mm-yyyy'), 115, 182, 278, 3);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-01-2022', 'dd-mm-yyyy'), 116, 274, 292, 26);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('29-06-2022', 'dd-mm-yyyy'), 117, 296, 124, 9);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 118, 27, 57, 1);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('11-01-2022', 'dd-mm-yyyy'), 119, 10, 218, 25);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-05-2023', 'dd-mm-yyyy'), 120, 174, 26, 40);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 121, 64, 210, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-03-2022', 'dd-mm-yyyy'), 122, 101, 259, 29);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-02-2023', 'dd-mm-yyyy'), 123, 62, 163, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-06-2023', 'dd-mm-yyyy'), 124, 141, 148, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('01-05-2022', 'dd-mm-yyyy'), 125, 23, 270, 5);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-12-2022', 'dd-mm-yyyy'), 126, 280, 72, 26);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-06-2023', 'dd-mm-yyyy'), 127, 222, 288, 20);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-06-2022', 'dd-mm-yyyy'), 128, 56, 45, 28);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-10-2022', 'dd-mm-yyyy'), 129, 210, 152, 4);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-07-2022', 'dd-mm-yyyy'), 130, 29, 40, 19);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 131, 141, 163, 23);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('09-04-2022', 'dd-mm-yyyy'), 132, 223, 146, 3);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-08-2023', 'dd-mm-yyyy'), 133, 74, 199, 12);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-12-2022', 'dd-mm-yyyy'), 134, 134, 136, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('23-09-2022', 'dd-mm-yyyy'), 135, 210, 190, 17);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('01-03-2023', 'dd-mm-yyyy'), 136, 196, 63, 12);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-08-2022', 'dd-mm-yyyy'), 137, 194, 91, 18);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('04-05-2023', 'dd-mm-yyyy'), 31, 151, 86, 32);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-06-2023', 'dd-mm-yyyy'), 32, 118, 79, 29);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-11-2022', 'dd-mm-yyyy'), 33, 122, 222, 41);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 34, 17, 210, 40);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 35, 229, 40, 39);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-12-2023', 'dd-mm-yyyy'), 36, 71, 11, 27);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('17-06-2023', 'dd-mm-yyyy'), 37, 295, 209, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('10-06-2022', 'dd-mm-yyyy'), 38, 235, 36, 14);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('27-11-2023', 'dd-mm-yyyy'), 39, 236, 40, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('04-05-2022', 'dd-mm-yyyy'), 40, 100, 262, 25);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('26-12-2023', 'dd-mm-yyyy'), 41, 130, 268, 3);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 42, 56, 57, 9);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('29-03-2022', 'dd-mm-yyyy'), 43, 32, 276, 9);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-06-2023', 'dd-mm-yyyy'), 44, 238, 53, 42);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('28-01-2022', 'dd-mm-yyyy'), 45, 53, 203, 4);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-06-2023', 'dd-mm-yyyy'), 46, 223, 131, 15);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 47, 280, 197, 18);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('11-02-2022', 'dd-mm-yyyy'), 48, 251, 202, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('14-08-2022', 'dd-mm-yyyy'), 49, 228, 162, 13);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-12-2022', 'dd-mm-yyyy'), 50, 235, 48, 22);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('31-03-2022', 'dd-mm-yyyy'), 51, 55, 267, 45);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('07-06-2023', 'dd-mm-yyyy'), 52, 72, 210, 18);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-03-2022', 'dd-mm-yyyy'), 53, 280, 140, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('28-10-2023', 'dd-mm-yyyy'), 54, 130, 163, 37);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 55, 105, 289, 4);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-03-2023', 'dd-mm-yyyy'), 56, 162, 56, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-05-2023', 'dd-mm-yyyy'), 57, 132, 256, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('23-05-2023', 'dd-mm-yyyy'), 58, 117, 12, 10);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 59, 132, 45, 22);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-04-2022', 'dd-mm-yyyy'), 60, 274, 109, 32);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('09-03-2023', 'dd-mm-yyyy'), 61, 21, 273, 26);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 62, 7777, 31, 1);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('02-02-2023', 'dd-mm-yyyy'), 63, 297, 273, 15);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('03-01-2023', 'dd-mm-yyyy'), 64, 41, 56, 29);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 65, 142, 223, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('29-03-2023', 'dd-mm-yyyy'), 66, 61, 11, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('05-04-2022', 'dd-mm-yyyy'), 67, 261, 201, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-05-2023', 'dd-mm-yyyy'), 68, 140, 112, 43);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('28-10-2022', 'dd-mm-yyyy'), 69, 101, 238, 45);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('21-10-2022', 'dd-mm-yyyy'), 70, 118, 139, 33);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-10-2022', 'dd-mm-yyyy'), 71, 120, 218, 5);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('02-10-2023', 'dd-mm-yyyy'), 72, 202, 227, 8);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-01-2022', 'dd-mm-yyyy'), 73, 295, 146, 0);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('08-05-2022', 'dd-mm-yyyy'), 74, 109, 69, 10);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('01-10-2023', 'dd-mm-yyyy'), 75, 13, 213, 14);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('30-11-2022', 'dd-mm-yyyy'), 76, 248, 54, 45);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-04-2023', 'dd-mm-yyyy'), 77, 176, 34, 25);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-02-2022', 'dd-mm-yyyy'), 78, 72, 287, 19);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('13-05-2022', 'dd-mm-yyyy'), 79, 171, 115, 18);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('20-08-2022', 'dd-mm-yyyy'), 80, 136, 62, 41);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('26-03-2023', 'dd-mm-yyyy'), 81, 293, 94, 15);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('27-06-2022', 'dd-mm-yyyy'), 82, 178, 202, 16);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('03-04-2022', 'dd-mm-yyyy'), 83, 259, 79, 47);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-12-2023', 'dd-mm-yyyy'), 84, 64, 203, 12);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('21-02-2023', 'dd-mm-yyyy'), 85, 187, 283, 42);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-04-2022', 'dd-mm-yyyy'), 86, 15, 197, 0);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-11-2023', 'dd-mm-yyyy'), 87, 297, 115, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('18-09-2023', 'dd-mm-yyyy'), 88, 27, 121, 31);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('19-04-2023', 'dd-mm-yyyy'), 89, 171, 166, 33);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('02-05-2023', 'dd-mm-yyyy'), 90, 143, 11, 35);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('04-01-2023', 'dd-mm-yyyy'), 91, 283, 273, 10);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('22-08-2022', 'dd-mm-yyyy'), 92, 26, 287, 48);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('24-05-2023', 'dd-mm-yyyy'), 93, 98, 101, 42);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-07-2022', 'dd-mm-yyyy'), 94, 289, 136, 24);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('12-11-2022', 'dd-mm-yyyy'), 95, 222, 246, 31);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('27-12-2023', 'dd-mm-yyyy'), 96, 113, 87, 14);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-11-2022', 'dd-mm-yyyy'), 97, 242, 181, 22);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('26-06-2022', 'dd-mm-yyyy'), 98, 132, 273, 31);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('15-09-2022', 'dd-mm-yyyy'), 99, 87, 196, 46);
insert into VOLUNTEERING (v_date, v_id, h_id, vo_id, s_id)
values (to_date('25-10-2023', 'dd-mm-yyyy'), 100, 30, 148, 44);
prompt 138 records loaded
prompt Enabling foreign key constraints for HELPED...
alter table HELPED enable constraint SYS_C007128;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint SYS_C007391;
prompt Enabling foreign key constraints for SHIFT_MANAGER...
alter table SHIFT_MANAGER enable constraint SYS_C007134;
prompt Enabling foreign key constraints for VOLUNTEER...
alter table VOLUNTEER enable constraint SYS_C007140;
alter table VOLUNTEER enable constraint SYS_C007141;
prompt Enabling foreign key constraints for ORCHESTRA...
alter table ORCHESTRA enable constraint SYS_C007401;
prompt Enabling foreign key constraints for PHOTOGRAPH...
alter table PHOTOGRAPH enable constraint SYS_C007396;
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C007411;
alter table EVENT enable constraint SYS_C007412;
alter table EVENT enable constraint SYS_C007413;
alter table EVENT enable constraint SYS_C007414;
alter table EVENT enable constraint SYS_C007415;
prompt Enabling foreign key constraints for MANAGER...
alter table MANAGER enable constraint SYS_C007131;
prompt Enabling foreign key constraints for VOLUNTEERING...
alter table VOLUNTEERING enable constraint SYS_C007147;
alter table VOLUNTEERING enable constraint SYS_C007148;
alter table VOLUNTEERING enable constraint SYS_C007149;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for HELPED...
alter table HELPED enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for EVENTTYPE...
alter table EVENTTYPE enable all triggers;
prompt Enabling triggers for HALL...
alter table HALL enable all triggers;
prompt Enabling triggers for SHIFT_MANAGER...
alter table SHIFT_MANAGER enable all triggers;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for ORCHESTRA...
alter table ORCHESTRA enable all triggers;
prompt Enabling triggers for PHOTOGRAPH...
alter table PHOTOGRAPH enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for MANAGER...
alter table MANAGER enable all triggers;
prompt Enabling triggers for SHIFTS...
alter table SHIFTS enable all triggers;
prompt Enabling triggers for VOLUNTEERING...
alter table VOLUNTEERING enable all triggers;
set feedback on
set define on
prompt Done.
