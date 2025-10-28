create table wards(id integer primary key autoincrement, ward text, population integer)
insert into wards(ward, population) select ward, population from crimes where district like "Cambridge"