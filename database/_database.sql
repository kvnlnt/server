-- Reset db

DROP DATABASE IF EXISTS valtworks;
CREATE DATABASE valtworks;

-- Select db for usage

USE valtworks;

-- create tables, procs, etc.

source ./database/people.sql
source ./database/properties.sql
source ./database/paths.sql
source ./database/pages.sql
source ./database/parts.sql
source ./database/pieces.sql