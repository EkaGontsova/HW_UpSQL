CREATE TABLE IF NOT EXISTS Performers (
    Performer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    Genre_ID SERIAL PRIMARY KEY,
    Name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performers_Genres (
    ID SERIAL PRIMARY KEY,
    Performer_ID SERIAL,
    Genre_ID SERIAL,
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID)
);

CREATE TABLE IF NOT EXISTS Albums (
    Album_ID SERIAL PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Year INT
);

CREATE TABLE IF NOT EXISTS Performers_Albums (
    ID SERIAL PRIMARY KEY,
    Performer_ID SERIAL,
    Album_ID SERIAL,
    FOREIGN KEY (Performer_ID) REFERENCES Performers(Performer_ID),
    FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);

CREATE TABLE IF NOT EXISTS Tracks (
    Track_ID SERIAL PRIMARY KEY,
    Name VARCHAR(60),
    Duration INT,
    Album_ID SERIAL,
    FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);

CREATE TABLE IF NOT EXISTS Collections (
    Collection_ID SERIAL PRIMARY KEY,
    Name VARCHAR(60),
    Year INT
);

CREATE TABLE IF NOT EXISTS Collections_Tracks (
    ID SERIAL PRIMARY KEY,
    Collection_ID SERIAL,
    Track_ID SERIAL,
    FOREIGN KEY (Collection_ID) REFERENCES Collections(Collection_ID),
    FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);
