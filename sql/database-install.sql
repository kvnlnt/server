-- Reset db

DROP DATABASE IF EXISTS valtworks;
CREATE DATABASE valtworks;

-- Select db for usage

USE valtworks;

-- create tables, procs, etc.

source ./sql/people-install.sql
source ./sql/properties-install.sql
source ./sql/paths-install.sql
source ./sql/pages-install.sql
source ./sql/parts-install.sql
source ./sql/pieces-install.sql