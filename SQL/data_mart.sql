CREATE TABLE dim_time (
  id_time varchar(255) PRIMARY KEY,
  year integer,
  quarter integer,
  semester integer,
  month integer,
  month_name varchar(255),
  week integer,
  day_year integer,
  day_month integer,
  day_name varchar(255)
);

CREATE TABLE dim_location (
  id_location varchar(255) PRIMARY KEY,
  name_location varchar(255),
  postal_code integer,
  poblation varchar(255),
  office varchar(255),
  provice varchar(255)
);

CREATE TABLE dim_proyect (
  id_proyect varchar(255) PRIMARY KEY
);

CREATE TABLE dim_auditor (
  id_auditor varchar(255) PRIMARY KEY
);


CREATE TABLE dim_evaluation (
  id_evaluation varchar(255) PRIMARY KEY,
  name_evaluation varchar(255)
);


CREATE TABLE facts (
  id_fact integer PRIMARY KEY,
  id_time varchar(255),
  id_location varchar(255),
  id_proyect varchar(255),
  id_auditor varchar(255),
  id_evaluation varchar(255),
  measure_result float
);

ALTER TABLE facts ADD FOREIGN KEY (id_time) REFERENCES dim_time (id_time);

ALTER TABLE facts ADD FOREIGN KEY (id_location) REFERENCES dim_location (id_location);

ALTER TABLE facts ADD FOREIGN KEY (id_proyect) REFERENCES dim_proyect (id_proyect);

ALTER TABLE facts ADD FOREIGN KEY (id_auditor) REFERENCES dim_auditor (id_auditor);

ALTER TABLE facts ADD FOREIGN KEY (id_evaluation) REFERENCES dim_evaluation (id_evaluation);



CREATE TRIGGER dividir_measure_result
BEFORE INSERT ON facts
FOR EACH ROW
BEGIN
    SET NEW.measure_result = NEW.measure_result / 1000;
END;



select count(*) from dim_time;
select count(*) from dim_proyect dp; 
select count(*) from dim_evaluation;
select count(*) from dim_auditor da;
select count(*) from dim_location dl;
select count(*) from facts;


select * from dim_time;
select * from dim_proyect dp; 
select * from dim_evaluation;
select * from dim_auditor da;
select * from dim_location dl;
select * from facts;


delete from dim_time;
delete from dim_proyect dp; 
delete from dim_evaluation;
delete from dim_auditor da;
delete from dim_location dl;
delete from facts;





