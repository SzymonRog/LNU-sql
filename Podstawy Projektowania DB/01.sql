insert into books (ISBN,title,author_id,publisher_id) values ("978-1905460762","The Daltons in the Blizzard",19,20);
select title, last_name, name from books left join publishers on publishers.id = books.publisher_id  left join authors on authors.id = books.author_id;
