USE horse_race_common_info_db_test;

CREATE TABLE sex
(
  id tinyint unsigned PRIMARY KEY,
  name varchar(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE horses
(
  id bigint(20) unsigned PRIMARY KEY,
  name varchar(20) NOT NULL,
  sex_id tinyint unsigned NOT NULL,
  birthday TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX sex_index (sex_id),

  FOREIGN KEY (sex_id) 
    REFERENCES sex(id)
    ON DELETE CASCADE
);

CREATE TABLE jockeys
(
  id bigint(20) unsigned PRIMARY KEY,
  name varchar(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE coursetypes
(
  id tinyint unsigned PRIMARY KEY,
  name varchar(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE racecourses
(
  id tinyint unsigned PRIMARY KEY,
  name varchar(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE courses
(
  id int(8) unsigned AUTO_INCREMENT PRIMARY KEY,
  racecourse_id tinyint unsigned NOT NULL,
  coursetype_id tinyint unsigned NOT NULL,
  course_length int(8) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX racecourse_index (racecourse_id),
  INDEX coursetype_index (coursetype_id),
  INDEX course_length_index (course_length),

  FOREIGN KEY (racecourse_id) 
    REFERENCES racecourses(id)
    ON DELETE CASCADE,
  FOREIGN KEY (coursetype_id) 
    REFERENCES coursetypes(id)
    ON DELETE CASCADE
);

CREATE TABLE helds
(
  id bigint(20) unsigned AUTO_INCREMENT PRIMARY KEY,
  racecourse_id tinyint unsigned NOT NULL,
  held_year tinyint unsigned NOT NULL,
  held_month tinyint unsigned NOT NULL,
  held_day tinyint unsigned NOT NULL,
  number_of_times tinyint unsigned NOT NULL,
  number_of_days tinyint unsigned NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX racecourse_index (racecourse_id),
  INDEX number_of_times_index (number_of_times),
  INDEX number_of_days_index (number_of_days),

  FOREIGN KEY (racecourse_id) 
    REFERENCES racecourses(id)
    ON DELETE CASCADE
);

CREATE TABLE races
(
  id bigint(20) unsigned AUTO_INCREMENT PRIMARY KEY,
  held_id bigint(20) unsigned NOT NULL,
  course_id int(8) unsigned NOT NULL,
  race_round tinyint NOT NULL,
  name varchar(20) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX course_index (course_id),
  INDEX helds_index (held_id),

  FOREIGN KEY (course_id) 
    REFERENCES courses(id)
    ON DELETE CASCADE,
  FOREIGN KEY (held_id) 
    REFERENCES helds(id)
    ON DELETE CASCADE
);

CREATE TABLE runs
(
  id bigint(20) unsigned AUTO_INCREMENT PRIMARY KEY,
  horse_id bigint(20) unsigned NOT NULL,
  race_id bigint(20) unsigned NOT NULL,
  burden_weight float NOT NULL,
  jockey_id bigint(20) unsigned NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX horse_index (horse_id),
  INDEX race_index (race_id),
  INDEX jockey_index (jockey_id),

  FOREIGN KEY (horse_id) 
    REFERENCES horses(id)
    ON DELETE CASCADE,
  FOREIGN KEY (race_id) 
    REFERENCES races(id)
    ON DELETE CASCADE,
  FOREIGN KEY (jockey_id) 
    REFERENCES jockeys(id)
    ON DELETE CASCADE
);

CREATE TABLE confirmed_barriers
(
  run_id bigint(20) unsigned PRIMARY KEY,
  bracket_number tinyint unsigned NOT NULL,
  horse_number tinyint unsigned NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  INDEX run_index (run_id),

  FOREIGN KEY (run_id) 
    REFERENCES runs(id)
    ON DELETE CASCADE
);

ALTER TABLE races ADD FULLTEXT KEY (name) WITH PARSER ngram;
CREATE FULLTEXT INDEX `name_fulltext_idx` ON `races` (`name`) WITH PARSER ngram;
