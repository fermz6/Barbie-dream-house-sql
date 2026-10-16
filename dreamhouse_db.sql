-- Dreamhouse Database
-- Fernanda Magaña Zapata A01663341
-- Vanessa Jacqueline Troncoso Ortega A01663244

--CREATE DATABASE dreamhouse_db;
CREATE DATABASE IF NOT EXISTS dreamhouse_db;

USE dreamhouse_db;

CREATE TABLE dreamhouse_rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL
);

CREATE TABLE dreamhouse_devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    device_name VARCHAR(50) NOT NULL,
    device_type VARCHAR(50) NOT NULL
);

CREATE TABLE sensors (
    device_id INT NOT NULL PRIMARY KEY
);

CREATE TABLE actuators (
    device_id INT NOT NULL PRIMARY KEY,
    current_state VARCHAR(50),
    updated DATETIME
);

CREATE TABLE sensor_readings (
    reading_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    measurement_type VARCHAR(30) NOT NULL,
    reading_value DECIMAL(10,2) NOT NULL,
    unit VARCHAR(10) NOT NULL,
    time_reading DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE commands (
    command_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    device_id INT NOT NULL,
    value_command VARCHAR(50) NOT NULL,
    command_source VARCHAR(20) NOT NULL,
    command_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    time_command DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE dreamhouse_devices
ADD CONSTRAINT fk_device_room
FOREIGN KEY (room_id) REFERENCES dreamhouse_rooms(room_id);

ALTER TABLE sensors
ADD CONSTRAINT fk_sensor_device
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE actuators
ADD CONSTRAINT fk_actuator_device
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE sensor_readings
ADD CONSTRAINT fk_reading_sensor
FOREIGN KEY (device_id) REFERENCES sensors(device_id);

ALTER TABLE commands
ADD CONSTRAINT fk_command_user
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE commands
ADD CONSTRAINT fk_command_actuator
FOREIGN KEY (device_id) REFERENCES actuators(device_id);

-- Inserting elements
INSERT INTO dreamhouse_rooms (room_id, room_name)
VALUES
    (1, 'Bedroom'),
    (2, 'Kitchen'),
    (3, 'Bathroom'),
    (4, 'Living Room'),
    (5, 'Garage'),
    (6, 'Garden');

INSERT INTO dreamhouse_devices



