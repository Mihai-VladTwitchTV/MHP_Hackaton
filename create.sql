use hackaton_db;
drop table role;
drop table role_seq;
drop table user;
    create table booking (
        user_id integer,
        booking_id bigint not null,
        desk_id bigint,
        end_time datetime(6),
        start_time datetime(6),
        purpose varchar(255),
        status varchar(255),
        primary key (booking_id)
    ) engine=InnoDB;

    create table booking_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into booking_seq values ( 1 );

    create table desk (
        capacity integer not null,
        id bigint not null,
        room_id bigint,
        description varchar(255),
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table desk_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into desk_seq values ( 1 );

    create table floor (
        id bigint not null,
        floor_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table floor_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into floor_seq values ( 1 );

    create table office_event_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into office_event_seq values ( 1 );

    create table office_event (
        date date,
        end_time time(6),
        expected_attendance integer not null,
        start_time time(6),
        event_id bigint not null,
        prediction_id bigint,
        description varchar(255),
        name varchar(255),
        primary key (event_id)
    ) engine=InnoDB;

    create table prediction (
        date date,
        prediction_id bigint not null,
        confidence_interval varchar(255),
        predicted_busyness_level varchar(255),
        time_slot varchar(255),
        primary key (prediction_id)
    ) engine=InnoDB;

    create table prediction_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into prediction_seq values ( 1 );

    create table role (
        id bigint not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table role_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into role_seq values ( 1 );

    create table room (
        floor_id bigint,
        id bigint not null,
        room_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table room_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into room_seq values ( 1 );

    create table user (
        last_login date,
        registration_date date not null,
        userid integer not null auto_increment,
        role_id bigint,
        email varchar(255) not null,
        name varchar(255) not null,
        password varchar(255) not null,
        primary key (userid)
    ) engine=InnoDB;

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table booking 
       add constraint FKs8u9q0251nmlnoahefiakkmm 
       foreign key (desk_id) 
       references desk (id);

    alter table booking 
       add constraint FKkgseyy7t56x7lkjgu3wah5s3t 
       foreign key (user_id) 
       references user (userid);

    alter table desk 
       add constraint FK1bdrqq8yryu4slrjw05x8ao8s 
       foreign key (room_id) 
       references room (id);

    alter table office_event 
       add constraint FKctoemmo6mdofemhvb6m6w6u6p 
       foreign key (prediction_id) 
       references prediction (prediction_id);

    alter table room 
       add constraint FKstlo96g0nkwp4urd4e0ki5b3h 
       foreign key (floor_id) 
       references floor (id);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role (id);

    create table booking (
        user_id integer,
        booking_id bigint not null,
        desk_id bigint,
        end_time datetime(6),
        start_time datetime(6),
        purpose varchar(255),
        status varchar(255),
        primary key (booking_id)
    ) engine=InnoDB;

    create table booking_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into booking_seq values ( 1 );

    create table desk (
        capacity integer not null,
        id bigint not null,
        room_id bigint,
        description varchar(255),
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table desk_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into desk_seq values ( 1 );

    create table floor (
        id bigint not null,
        floor_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table floor_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into floor_seq values ( 1 );

    create table office_event_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into office_event_seq values ( 1 );

    create table office_event (
        date date,
        end_time time(6),
        expected_attendance integer not null,
        start_time time(6),
        event_id bigint not null,
        prediction_id bigint,
        description varchar(255),
        name varchar(255),
        primary key (event_id)
    ) engine=InnoDB;

    create table prediction (
        date date,
        prediction_id bigint not null,
        confidence_interval varchar(255),
        predicted_busyness_level varchar(255),
        time_slot varchar(255),
        primary key (prediction_id)
    ) engine=InnoDB;

    create table prediction_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into prediction_seq values ( 1 );

    create table role (
        id bigint not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table role_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into role_seq values ( 1 );

    create table room (
        floor_id bigint,
        id bigint not null,
        room_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table room_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into room_seq values ( 1 );

    create table user (
        last_login date,
        registration_date date not null,
        userid integer not null auto_increment,
        role_id bigint,
        email varchar(255) not null,
        name varchar(255) not null,
        password varchar(255) not null,
        primary key (userid)
    ) engine=InnoDB;

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table booking 
       add constraint FKs8u9q0251nmlnoahefiakkmm 
       foreign key (desk_id) 
       references desk (id);

    alter table booking 
       add constraint FKkgseyy7t56x7lkjgu3wah5s3t 
       foreign key (user_id) 
       references user (userid);

    alter table desk 
       add constraint FK1bdrqq8yryu4slrjw05x8ao8s 
       foreign key (room_id) 
       references room (id);

    alter table office_event 
       add constraint FKctoemmo6mdofemhvb6m6w6u6p 
       foreign key (prediction_id) 
       references prediction (prediction_id);

    alter table room 
       add constraint FKstlo96g0nkwp4urd4e0ki5b3h 
       foreign key (floor_id) 
       references floor (id);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role (id);

    create table booking (
        user_id integer,
        booking_id bigint not null,
        desk_id bigint,
        end_time datetime(6),
        start_time datetime(6),
        purpose varchar(255),
        status varchar(255),
        primary key (booking_id)
    ) engine=InnoDB;

    create table booking_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into booking_seq values ( 1 );

    create table desk (
        capacity integer not null,
        id bigint not null,
        room_id bigint,
        description varchar(255),
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table desk_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into desk_seq values ( 1 );

    create table floor (
        id bigint not null,
        floor_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table floor_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into floor_seq values ( 1 );

    create table office_event_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into office_event_seq values ( 1 );

    create table office_event (
        date date,
        end_time time(6),
        expected_attendance integer not null,
        start_time time(6),
        event_id bigint not null,
        prediction_id bigint,
        description varchar(255),
        name varchar(255),
        primary key (event_id)
    ) engine=InnoDB;

    create table prediction (
        date date,
        prediction_id bigint not null,
        confidence_interval varchar(255),
        predicted_busyness_level varchar(255),
        time_slot varchar(255),
        primary key (prediction_id)
    ) engine=InnoDB;

    create table prediction_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into prediction_seq values ( 1 );

    create table role (
        id bigint not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table role_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into role_seq values ( 1 );

    create table room (
        floor_id bigint,
        id bigint not null,
        room_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table room_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into room_seq values ( 1 );

    create table user (
        last_login date,
        registration_date date not null,
        userid integer not null auto_increment,
        role_id bigint,
        email varchar(255) not null,
        name varchar(255) not null,
        password varchar(255) not null,
        primary key (userid)
    ) engine=InnoDB;

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table booking 
       add constraint FKs8u9q0251nmlnoahefiakkmm 
       foreign key (desk_id) 
       references desk (id);

    alter table booking 
       add constraint FKkgseyy7t56x7lkjgu3wah5s3t 
       foreign key (user_id) 
       references user (userid);

    alter table desk 
       add constraint FK1bdrqq8yryu4slrjw05x8ao8s 
       foreign key (room_id) 
       references room (id);

    alter table office_event 
       add constraint FKctoemmo6mdofemhvb6m6w6u6p 
       foreign key (prediction_id) 
       references prediction (prediction_id);

    alter table room 
       add constraint FKstlo96g0nkwp4urd4e0ki5b3h 
       foreign key (floor_id) 
       references floor (id);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role (id);

    create table booking (
        user_id integer,
        booking_id bigint not null,
        desk_id bigint,
        end_time datetime(6),
        start_time datetime(6),
        purpose varchar(255),
        status varchar(255),
        primary key (booking_id)
    ) engine=InnoDB;

    create table booking_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into booking_seq values ( 1 );

    create table desk (
        capacity integer not null,
        id bigint not null,
        room_id bigint,
        description varchar(255),
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table desk_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into desk_seq values ( 1 );

    create table floor (
        id bigint not null,
        floor_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table floor_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into floor_seq values ( 1 );

    create table office_event_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into office_event_seq values ( 1 );

    create table office_event (
        date date,
        end_time time(6),
        expected_attendance integer not null,
        start_time time(6),
        event_id bigint not null,
        prediction_id bigint,
        description varchar(255),
        name varchar(255),
        primary key (event_id)
    ) engine=InnoDB;

    create table prediction (
        date date,
        prediction_id bigint not null,
        confidence_interval varchar(255),
        predicted_busyness_level varchar(255),
        time_slot varchar(255),
        primary key (prediction_id)
    ) engine=InnoDB;

    create table prediction_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into prediction_seq values ( 1 );

    create table role (
        id bigint not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table role_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into role_seq values ( 1 );

    create table room (
        floor_id bigint,
        id bigint not null,
        room_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table room_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into room_seq values ( 1 );

    create table user (
        last_login date,
        registration_date date not null,
        userid integer not null auto_increment,
        role_id bigint,
        email varchar(255) not null,
        name varchar(255) not null,
        password varchar(255) not null,
        primary key (userid)
    ) engine=InnoDB;

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table booking 
       add constraint FKs8u9q0251nmlnoahefiakkmm 
       foreign key (desk_id) 
       references desk (id);

    alter table booking 
       add constraint FKkgseyy7t56x7lkjgu3wah5s3t 
       foreign key (user_id) 
       references user (userid);

    alter table desk 
       add constraint FK1bdrqq8yryu4slrjw05x8ao8s 
       foreign key (room_id) 
       references room (id);

    alter table office_event 
       add constraint FKctoemmo6mdofemhvb6m6w6u6p 
       foreign key (prediction_id) 
       references prediction (prediction_id);

    alter table room 
       add constraint FKstlo96g0nkwp4urd4e0ki5b3h 
       foreign key (floor_id) 
       references floor (id);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role (id);

    create table booking (
        user_id integer,
        booking_id bigint not null,
        desk_id bigint,
        end_time datetime(6),
        start_time datetime(6),
        purpose varchar(255),
        status varchar(255),
        primary key (booking_id)
    ) engine=InnoDB;

    create table booking_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into booking_seq values ( 1 );

    create table desk (
        capacity integer not null,
        id bigint not null,
        room_id bigint,
        description varchar(255),
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table desk_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into desk_seq values ( 1 );

    create table floor (
        id bigint not null,
        floor_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table floor_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into floor_seq values ( 1 );

    create table office_event_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into office_event_seq values ( 1 );

    create table office_event (
        date date,
        end_time time(6),
        expected_attendance integer not null,
        start_time time(6),
        event_id bigint not null,
        prediction_id bigint,
        description varchar(255),
        name varchar(255),
        primary key (event_id)
    ) engine=InnoDB;

    create table prediction (
        date date,
        prediction_id bigint not null,
        confidence_interval varchar(255),
        predicted_busyness_level varchar(255),
        time_slot varchar(255),
        primary key (prediction_id)
    ) engine=InnoDB;

    create table prediction_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into prediction_seq values ( 1 );

    create table role (
        id bigint not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table role_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into role_seq values ( 1 );

    create table room (
        floor_id bigint,
        id bigint not null,
        room_name varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table room_seq (
        next_val bigint
    ) engine=InnoDB;

    insert into room_seq values ( 1 );

    create table user (
        last_login date,
        registration_date date not null,
        userid integer not null auto_increment,
        role_id bigint,
        email varchar(255) not null,
        name varchar(255) not null,
        password varchar(255) not null,
        primary key (userid)
    ) engine=InnoDB;

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table booking 
       add constraint FKs8u9q0251nmlnoahefiakkmm 
       foreign key (desk_id) 
       references desk (id);

    alter table booking 
       add constraint FKkgseyy7t56x7lkjgu3wah5s3t 
       foreign key (user_id) 
       references user (userid);

    alter table desk 
       add constraint FK1bdrqq8yryu4slrjw05x8ao8s 
       foreign key (room_id) 
       references room (id);

    alter table office_event 
       add constraint FKctoemmo6mdofemhvb6m6w6u6p 
       foreign key (prediction_id) 
       references prediction (prediction_id);

    alter table room 
       add constraint FKstlo96g0nkwp4urd4e0ki5b3h 
       foreign key (floor_id) 
       references floor (id);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role (id);
