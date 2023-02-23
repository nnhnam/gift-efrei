CREATE TABLE Company
(
    company_id SERIAL PRIMARY KEY,
    name       VARCHAR(50)  NOT NULL,
    address    VARCHAR(100) NOT NULL
);

CREATE TABLE Intern_Group
(
    group_id SERIAL PRIMARY KEY,
    name     VARCHAR(50) NOT NULL
);

CREATE TABLE Internship
(
    internship_id          SERIAL PRIMARY KEY,
    description            VARCHAR(100) NOT NULL,
    manager_name           VARCHAR(50)  NOT NULL,
    comment                VARCHAR(100),
    start_date             DATE         NOT NULL,
    end_date               DATE         NOT NULL,
    is_report_done         BOOLEAN      NOT NULL,
    is_oral_defense_done   BOOLEAN      NOT NULL,
    is_visit_planning_done BOOLEAN      NOT NULL,
    is_visit_done          BOOLEAN      NOT NULL,
    company_id             INTEGER      REFERENCES Company (company_id)
);

CREATE TABLE Supervisor
(
    supervisor_id SERIAL PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    login         VARCHAR(50) NOT NULL,
    password_hash VARCHAR(60) NOT NULL
);

CREATE TABLE Intern
(
    intern_id         SERIAL PRIMARY KEY,
    first_name        VARCHAR(50) NOT NULL,
    last_name         VARCHAR(50) NOT NULL,
    has_cdc           BOOLEAN     NOT NULL,
    has_visit_sheet   BOOLEAN     NOT NULL,
    has_test_sheet    BOOLEAN     NOT NULL,
    has_online_survey BOOLEAN     NOT NULL,
    supervisor_id     INTEGER     NOT NULL REFERENCES Supervisor (supervisor_id),
    internship_id     INTEGER     NOT NULL REFERENCES Internship (internship_id) UNIQUE,
    group_id          INTEGER     NOT NULL REFERENCES Intern_Group (group_id)
);


INSERT INTO Company (name, address)
VALUES ('ACME Corporation', '123 Main St, Anytown USA'),
       ('Globex Corporation', '456 Broad St, Anytown USA'),
       ('Initech, Inc.', '789 Oak St, Anytown USA'),
       ('Stark Industries', '42 Jarvis St, New York, NY'),
       ('Wayne Enterprises', '1007 Mountain Drive, Gotham City');
INSERT INTO Intern_Group (name)
VALUES ('Group A'),
       ('Group B'),
       ('Group C'),
       ('Group D'),
       ('Group E');

INSERT INTO Internship (description, manager_name, comment, start_date, end_date, is_report_done, is_oral_defense_done, is_visit_planning_done, is_visit_done, company_id)
VALUES ('Software Development Internship', 'manager 1', NULL, '2022-06-01', '2022-12-01', false, false, false, false, 1),
       ('Marketing Internship', 'manager 2', 'Great intern!', '2022-05-01', '2022-11-01', true, false, true, true, 2),
       ('Engineering Internship', 'manager 3', NULL, '2022-06-01', '2022-12-01', true, true, true, true, 3),
       ('Finance Internship', 'manager 4', 'Excellent communication skills', '2022-07-01', '2022-12-31', false, false, false, false, 4),
       ('Human Resources Internship', 'manager 5', NULL, '2022-05-01', '2022-11-01', true, true, false, false, 5);
INSERT INTO Supervisor (first_name, last_name, login, password_hash)
VALUES ('Mark', 'Johnson', 'markj', '$2a$10$cFLcNs.CGibOy/UibemL3e1QugufdY8ae8lbGeUXpgY2FunZn8RSK'),
       ('Linda', 'Wang', 'lindaw', '$2a$10$cFLcNs.CGibOy/UibemL3e1QugufdY8ae8lbGeUXpgY2FunZn8RSK'),
       ('David', 'Lee', 'davidl', '$2a$10$cFLcNs.CGibOy/UibemL3e1QugufdY8ae8lbGeUXpgY2FunZn8RSK'),
       ('Sarah', 'Jones', 'sarahj', '$2a$10$cFLcNs.CGibOy/UibemL3e1QugufdY8ae8lbGeUXpgY2FunZn8RSK'),
       ('Michael', 'Chen', 'michaelc', '$2a$10$cFLcNs.CGibOy/UibemL3e1QugufdY8ae8lbGeUXpgY2FunZn8RSK');

INSERT INTO Intern (first_name, last_name, has_cdc, has_visit_sheet, has_test_sheet, has_online_survey, supervisor_id, internship_id, group_id)
VALUES ('John', 'Smith', true, true, false, false, 1, 1, 1),
       ('Jane', 'Doe', false, false, true, true, 2, 2, 2),
       ('Bob', 'Johnson', true, true, true, false, 3, 3, 1),
       ('William', 'Lee', false, false, false, true, 4, 4, 3),
       ('James', 'Wilson', true, false, true, false, 5, 5, 4);