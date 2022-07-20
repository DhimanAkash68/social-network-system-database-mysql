CREATE TABLE user (
  id bigint(20) NOT NULL ,
  Name varchar(50) DEFAULT NULL,
  mobile varchar(15) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  passwordHash varchar(32) NOT NULL,
  registeredAt datetime NOT NULL,
  lastLogin datetime DEFAULT NULL,
  PRIMARY KEY (id));


create table gro(
  id int(5) NOT NULL,
  createdBy int(5)  NOT NULL,
  updatedBy int(5) NOT NULL,
  title varchar(75) NOT NULL,
  metaTitle varchar(100)  DEFAULT NULL,
  slug varchar(100)  NOT NULL,
  summary tinytext ,
  status smallint(6) NOT NULL DEFAULT 0,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  profile text ,
  content text,
  primary key(id),
  foreign key(createdBy) references user(id),
  foreign key(updatedBy) references user(id)
  );



CREATE TABLE group_follower (
  id bigint(20) NOT NULL ,
  groupId bigint(20) NOT NULL,
  userId bigint(20) NOT NULL,
  type smallint(6) NOT NULL DEFAULT 0,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),


  FOREIGN KEY (groupId) REFERENCES Gro(id),
  FOREIGN KEY (userId) REFERENCES User(id)
);










CREATE TABLE group_member (
  id bigint(20) NOT NULL,
  groupId bigint(20) NOT NULL,
  userId bigint(20) NOT NULL,
  roleId smallint(6) NOT NULL DEFAULT 0,
  status smallint(6) NOT NULL DEFAULT 0,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  notes varchar(20) ,
  PRIMARY KEY (id),

 
 FOREIGN KEY (groupId) REFERENCES gro(id),
 FOREIGN KEY (userId) REFERENCES user(id)
);






CREATE TABLE group_message (
  id bigint(20) NOT NULL,
  groupId bigint(20) NOT NULL,
  userId bigint(20) NOT NULL,
  message varchar(10)  NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),

  FOREIGN KEY (groupId) REFERENCES gro(id),
   FOREIGN KEY (userId) REFERENCES user(id)
) ;






CREATE TABLE group_meta(
  id bigint(20) NOT NULL,
  groupId bigint(20) NOT NULL,
  key varchar(50)  NOT NULL,
  content varchar(20),
  PRIMARY KEY (id),
  
 
 FOREIGN KEY (groupId) REFERENCES gro (id)
) ;



CREATE TABLE group_post(
   id bigint(20) NOT NULL,
  groupId bigint(20) NOT NULL,
  userId bigint(20) NOT NULL,
  message tinytext  NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (groupId) REFERENCES gro(id),
   FOREIGN KEY (userId) REFERENCES user(id)
);






CREATE TABLE user_follower(
  id bigint(20) NOT NULL ,
  sourceId bigint(20) NOT NULL,
  targetId bigint(20) NOT NULL,
  type int(6) NOT NULL DEFAULT 0,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),
 FOREIGN KEY (sourceId) REFERENCES user(id),
  FOREIGN KEY (targetId) REFERENCES user (id)
);








CREATE TABLE user_friend (
  id bigint(20) NOT NULL ,
  sourceId bigint(20) NOT NULL,
  targetId bigint(20) NOT NULL,
  type int(6) NOT NULL DEFAULT 0,
  status int(6) NOT NULL DEFAULT 0,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  notes text,
  PRIMARY KEY (id),
  FOREIGN KEY (sourceId) REFERENCES user(id),
  FOREIGN KEY (targetId) REFERENCES user(id)
);


CREATE TABLE user_message(
  id bigint(20) NOT NULL ,
  sourceId bigint(20) NOT NULL,
  targetId bigint(20) NOT NULL,
  message text  NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (sourceId) REFERENCES user(id),
  FOREIGN KEY (targetId) REFERENCES user(id)
);






CREATE TABLE user_post (
  id bigint(20) NOT NULL ,
  userId bigint(20) NOT NULL,
  senderId bigint(20) DEFAULT NULL,
  message tinytext  NOT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime DEFAULT NULL,
  PRIMARY KEY (id),
   FOREIGN KEY (senderId) REFERENCES user(id),
 FOREIGN KEY (userId) REFERENCES user(id));
