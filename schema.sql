CREATE TABLE contacts (
  id        serial NOT NULL PRIMARY KEY,
  firstname      varchar(40) NOT NULL,
  lastname     varchar(40),
  email  varchar(40)
);