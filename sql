script sql untuk tabel di database

create table users (
    user_id int not null auto_increment primary key,
    username varchar(255) not null unique,
    category varchar(255) not null default '',
    unique_id varchar(255) not null default '',
    followers int not null default 0,
    unique (user_id, unique_id, category, followers)
);

create table posts (
    post_id int not null auto_increment primary key,
    user_id int not null,
    unique_id_post varchar(255) not null default '',
    username varchar(255) not null default '',
    created_at datetime not null,
    thumbnail_url varchar(255) not null default '',
    caption varchar(255) not null default '',
    post_code varchar(255) not null default '',
    comments varchar(255) not null default '',
    likes int not null default 0,
    media_name varchar(255) not null default '',
    product_type varchar(255) not null default '',
    tagged_users longtext not null default '',
);

create table mainComments (
    main_comment_id int not null auto_increment primary key,
    user_id int not null,
    username varchar(255) not null default '',
    post_code varchar(255) not null default '',
    comment_unique_id varchar(255) not null default '',
    created_at datetime not null,
    commenter_username varchar(255) not null default '',
    commenter_userid varchar(255) not null default '',
    comment_text varchar(255) not null default '',
    comment_like_count int not null default 0,
    child_comment_count varchar(255) not null default ''
);

create table fairscore (
    fairscore_id int not null auto_increment primary key,
    user_id int not null,
    category varchar(255) not null default '',
    unique_id varchar(255) not null default '',
    followers int not null default 0,
    followers_bobot int not null default 0,
    followers_score int not null default 0,
    activities int not null default 0,
    activities_bobot int not null default 0,
    activities_score int not null default 0,
    interaction int not null default 0,
    interaction_bobot int not null default 0,
    interaction_score int not null default 0,
    responsiveness int not null default 0,
    responsiveness_bobot int not null default 0,
    responsiveness_score int not null default 0,
    fairscore int not null default 0,
    foreign key (user_id) references users(user_id)
    on update cascade on delete cascade
);

