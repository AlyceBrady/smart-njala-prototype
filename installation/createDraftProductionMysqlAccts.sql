-- DRAFT file to create Mysql accounts for a Production environment with
-- additional Test and Staged Next Version environments.

--
-- SMART: Software for Managing Academic Records and Transcripts
--   Prototype developed for Njala University.
--   Built on top of RAMP - Record and Activity Management Program
--
-- Create the basic MySQL user accounts for interacting with the
-- databases underlying the Production, Test, and Staged Next Version
-- environments of the Njala Smart Prototype.
--
-- There are two types of accounts: those that may be used by
-- database administrators interacting directly with the database
-- (e.g., at the mysql command line or using phpMyAdmin), and 
-- accounts that are used by the SMART software (one per environment).

-- [Not currently being done...
--    Create similar accounts for the database used for regression testing.
--    Create the regression testing database also.
-- ]

-- You may use this file as a guide for creating accounts interactively
-- in MySQL, or you may edit it and then execute it within MySQL:
--      mysql> SOURCE filename.sql
-- You must run MySQL as root (or some other user that has CREATE USER
-- and GRANT permissions to execute the commands found in this file.
--
-- Please read the installation instructions in INSTALL_DB.txt,
-- particularly the section on "Addressing Security Concerns,"
-- BEFORE using this file as a guide or executing these SQL instructions.

-- AT THE VERY LEAST, use different passwords than are specified in this
-- file.  If you put the new passwords in this file before executing it,
-- change the permissions on the file to be readable only by the owner.

-- When finished, create and edit a custom properties file in the configs
-- directory for each environment and then use them to build an
-- application.ini file.  See the README file in the configs directory
-- for more information.
-- Be sure to edit the username and password fields in the custom
-- properties files to match the SMART user accounts and passwords you
-- have set below.


-- 1a. CREATE DBA ACCOUNT(S) for interacting with the database directly
--     if they are not set up already.
-- 
-- Examples:

CREATE USER 'dba_1'@'localhost' IDENTIFIED BY 'need_password';
-- CREATE USER 'dba_2'@'localhost' IDENTIFIED BY 'need_password';

-- 1b. CREATE WEB-BASED SMART ACCESS ACCOUNT(S) for different
--     environments:
--
-- Example:

CREATE USER 'smart'@'localhost' IDENTIFIED BY 'need_password';

CREATE USER 'smarttest'@'localhost' IDENTIFIED BY 'need_password';

CREATE USER 'smartstage'@'localhost' IDENTIFIED BY 'need_password';


-- [Remember to create custom properties files in the configs
-- directory and build an application.ini file according to the
-- instructions in the configs/README file.]


-- 2a. SET UP PRIVILEGES FOR DBA ACCOUNT(S):
--     Grant permissions for MySQL access to the database administrator.
-- 
-- Examples:

GRANT ALL ON `njala_production`.* TO 'dba_1'@'localhost';
GRANT ALL ON `njala_test_env`.* TO 'dba_1'@'localhost';
GRANT ALL ON `njala_stage_env`.* TO 'dba_1'@'localhost';

-- 2b. SET UP PRIVILEGES FOR WEB-BASED SMART ACCESS ACCOUNT:
--     Grant SMART software permission to view, add, edit, and delete
--     data, but not to change table schemas.  The actual access
--     permissions for different types of SMART users depend on role-based
--     authorization defined in the SMART authorizations table
--     (ramp_auth_auths); that table might, for example, only allow
--     read-only access to a demo database for non-admin users.

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER, EXECUTE ON `njala_production`.*
    TO 'smart'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER, EXECUTE ON `njala_test_env`.*
    TO 'smarttest'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE, TRIGGER, EXECUTE ON `njala_stage_env`.*
    TO 'smartstaging'@'localhost';

-- NOTE: Smart databases require additional permissions for
-- procedures and functions that allow the database to do some of
-- its own consistency maintenance, but these can't be set up until
-- the database and the relevant procedures and functions have been
-- created.  Therefore, you should execute the MySQL commands in
-- grant_func_proc_privs.sql after the database has been created.
-- (See SetupSmartDevEnv.sql for an example.)

