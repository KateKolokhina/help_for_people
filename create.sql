
    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);

    create table category (
       id bigint not null auto_increment,
        name varchar(255) not null,
        season_is_need bit not null,
        type varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request (
       id bigint not null auto_increment,
        admin_comment varchar(255),
        comment varchar(255),
        date_closed date,
        date_create date not null,
        status varchar(255) not null,
        admin_id bigint,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table help_request_line (
       product_id bigint not null,
        request_id bigint not null,
        amount integer not null,
        primary key (product_id, request_id)
    ) engine=InnoDB;

    create table product (
       id bigint not null auto_increment,
        gender varchar(255) not null,
        name varchar(255) not null,
        season varchar(255),
        size integer not null,
        total_count integer not null,
        category_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
       id bigint not null auto_increment,
        login varchar(255) not null,
        password varchar(255) not null,
        phone varchar(255) not null,
        pib varchar(255) not null,
        role varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    alter table category 
       add constraint UK_46ccwnsi9409t36lurvtyljak unique (name);

    alter table help_request 
       add constraint FKj27jiwq9bcu3y6g5lymgqg40k 
       foreign key (admin_id) 
       references user (id);

    alter table help_request 
       add constraint FK1aacigelwr8r5ek89nm3cfukf 
       foreign key (user_id) 
       references user (id);

    alter table help_request_line 
       add constraint FKddikah5k6ieivqpeyrjmurm9l 
       foreign key (product_id) 
       references product (id);

    alter table help_request_line 
       add constraint FKlj3yhpkyvyfuf046ydaxlnjas 
       foreign key (request_id) 
       references help_request (id);

    alter table product 
       add constraint FK1mtsbur82frn64de7balymq9s 
       foreign key (category_id) 
       references category (id);
