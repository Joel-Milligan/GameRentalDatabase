CREATE TABLE GameTitle (
title        TEXT,
release_year INTEGER,
platform     TEXT,
price        REAL,
PRIMARY KEY(title, release_year, platform)
);

CREATE TABLE GameLicense (
license_id   TEXT PRIMARY KEY NOT NULL
    CHECK (length(license_id) == 5),
title        TEXT,
release_year INTEGER,
platform     TEXT
);

CREATE TABLE gameRental (
gamer_id    INTEGER NOT NULL 
    REFERENCES Gamer(gamer_id) 
    ON UPDATE CASCADE
    ON DELETE CASCADE,
license_id  TEXT NOT NULL
    REFERENCES GameLicense(license_id),
date_out    TEXT,
date_back   TEXT,
rental_cost REAL
);

CREATE TABLE Gamer (
gamer_id   INTEGER PRIMARY KEY NOT NULL,
first_name TEXT,
last_name  TEXT,
email      TEXT
);