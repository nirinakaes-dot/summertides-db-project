CREATE TABLE artists (
    artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    genre VARCHAR,
    country VARCHAR
);

CREATE TABLE attendees (
    attendee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL
);

CREATE TABLE stages (
    stage_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    capacity INTEGER NOT NULL,
    location VARCHAR
);

CREATE TABLE performances (
    performance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    artist_id INTEGER NOT NULL,
    stage_id INTEGER NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    festival_day DATE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (stage_id) REFERENCES stages(stage_id)
);

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ticket_type VARCHAR CHECK (ticket_type IN ('VIP', 'General')),
    attendee_id INTEGER,
    purchase_date DATE,
    FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id)
);

CREATE TABLE vendors (
    vendor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    category VARCHAR,
    location VARCHAR
);

CREATE TABLE sponsors (
    sponsor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    contribution_amount DECIMAL
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vendor_id INTEGER NOT NULL,
    attendee_id INTEGER NOT NULL,
    amount DECIMAL,
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id)
);

CREATE TABLE stage_sponsors (
    stage_id INTEGER NOT NULL,
    sponsor_id INTEGER NOT NULL,
    PRIMARY KEY (stage_id, sponsor_id),
    FOREIGN KEY (stage_id) REFERENCES stages(stage_id),
    FOREIGN KEY (sponsor_id) REFERENCES sponsors(sponsor_id)
);