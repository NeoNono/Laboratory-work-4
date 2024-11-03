-- RelationDB_DetailedDataSchema.sql

CREATE TABLE System (
    id INT PRIMARY KEY,
    internetConnection BOOLEAN NOT NULL,
    stability BOOLEAN NOT NULL
);

CREATE TABLE User (
    userId CHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    CHECK (name ~ '^[A-Za-z]{3,20}$')  
);

CREATE TABLE InstallationPackage (
    id INT PRIMARY KEY,
    files TEXT[] NOT NULL 
);

CREATE TABLE InstallationProcess (
    id INT PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    CHECK (status ~ '^(completed|in_progress|failed)$') 
);

CREATE TABLE BasicConfiguration (
    id INT PRIMARY KEY,
    settings JSONB NOT NULL  
);

CREATE TABLE UpdateProcess (
    id INT PRIMARY KEY,
    version VARCHAR(20) NOT NULL
);

CREATE TABLE DeprecatedComponents (
    id INT PRIMARY KEY,
    components TEXT[] NOT NULL
);

-- Встановлення зовнішніх ключів
ALTER TABLE InstallationProcess
ADD CONSTRAINT fk_update_version
FOREIGN KEY (id) REFERENCES UpdateProcess (id);

ALTER TABLE BasicConfiguration
ADD CONSTRAINT fk_system_id
FOREIGN KEY (id) REFERENCES System (id);
