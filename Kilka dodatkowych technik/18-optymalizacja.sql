create index index_name1 on Artists(name)
create index index_name2 on Artworks(artist)
SELECT title, artist, year_of_birth FROM Artworks JOIN Artists ON name = artist WHERE artist IN ("Powell, Joseph", "Singleton, Henry", "Cristall, Joshua");
