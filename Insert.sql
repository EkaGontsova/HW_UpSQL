INSERT INTO Performers (Name) 
VALUES ('Taylor Swift'), ('Muse'), ('Nina Simone'), ('Queen');

INSERT INTO Genres (Name) 
VALUES ('Pop'), ('Rock'), ('Jazz');

INSERT INTO Performers_Genres (Performer_ID, Genre_ID) 
VALUES (1, 1), (2, 3), (3, 2), (4, 3);

INSERT INTO Albums (Name, Year) 
VALUES ('Forbidden Fruit', 1961), ('The Miracle', 1989), ('Folklore', 2020), ('Will of the People', 2022);

INSERT INTO Performers_Albums (Performer_ID, Album_ID) 
VALUES (1, 3), (2, 4), (3, 1), (4, 2);

INSERT INTO Tracks (Name, Duration, Album_ID) 
VALUES ('My Tears Ricochet', 255, 3), ('Liberation', 186, 4), ('My Baby Does Me', 203, 2), ('Euphoria', 213, 4), ('The Invisible Man', 237, 2), ('My Ship', 214, 1);

INSERT INTO Collections (Name, Year) 
VALUES ('Absolute Greatest', 2010), ('Rock Hits', 2021), ('Summer Jams', 2022), ('Best of 2020', 2020);

INSERT INTO Collections_Tracks (Collection_ID, Track_ID) 
VALUES (1, 2), (1, 6), (2, 5), (2, 4), (2, 2), (3, 1), (3, 4), (4, 4);
