CREATE TABLE user_user (
  id            integer,
  password      varchar(128),
  last_login    datetime,
  is_superuser  bool,
  username      varchar(150),
  first_name    varchar(30),
  last_name     varchar(150),
  email         varchar(254),
  is_staff      bool,
  is_active     bool,
  date_joined   datetime,
  rue           text,
  ville         text,
  code_postal   varchar(5),
  phone_number  varchar(12)
);


INSERT INTO `user_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `rue`, `ville`, `code_postal`, `phone_number`) VALUES
  (1, 'pbkdf2_sha256$100000$7J33nQQ5ZrWp$VZ5MzCbzT6sITmrjNS9yhl/AaMt6TLhDQlfPAMv2p3Y=', '2018-07-06 13:17:45', '1', 'admin', '', '', '', '1', '1', '2018-07-04 16:04:16', '', '', '', '');
