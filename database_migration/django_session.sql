CREATE TABLE django_session (
  session_key   varchar(40),
  session_data  text,
  expire_date   datetime
);


INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
  ('6urek0p2t9upovwqszcttatpegpm7lyk', 'M2IxNTg4Y2RjNGQ2YTRhMjlhNTkxYjdhOGNjOTI0YmI1Njc0ODUxNDp7InJlc2V0X2ZpbHRlciI6dHJ1ZSwiZmlsdHJlX3NvdXNfY2F0X2lkIjpudWxsLCJmaWx0cmVfbWFycXVlX2lkIjpudWxsLCJmaWx0cmVfcHJpeCI6bnVsbH0=', '2018-07-20 13:17:18'),
  ('tzfcatjskhlkmqjpmvydfnkkzlwordo4', 'MWZjYWMwNmJmMGU2MDZjMjQyOTVhZjU3NGJiN2Y5ZGFhY2YwMDg3Mzp7InByb2R1aXRzIjp7fSwidG90YWwiOjAsInJlc2V0X2ZpbHRlciI6dHJ1ZSwiZmlsdHJlX3NvdXNfY2F0X2lkIjpudWxsLCJmaWx0cmVfbWFycXVlX2lkIjpudWxsLCJmaWx0cmVfcHJpeCI6bnVsbCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMyMzk4MTdjYjlkMzVmYjEzZWE2YmY2MzVhM2I4N2VjNGQyNGJjYzAifQ==', '2018-07-20 14:08:10');
