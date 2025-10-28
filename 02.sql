insert into publishers (name,country) values("Cinebook", "Great Britain");
insert into authors (first_name,last_name,country,date_of_birth,date_of_death) values("Rene","Goscinny", "France", "1926-08-14","1977-11-05");
INSERT INTO books VALUES('978-1905460762','The Daltons in the Blizzard',19,20);
select title, last_name, name from books left join publishers on publishers.id = books.publisher_id  left join authors on authors.id = books.author_id;