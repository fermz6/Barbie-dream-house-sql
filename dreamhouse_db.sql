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

CREATE TABLE rfid_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    rfid_uid VARCHAR(50) NOT NULL UNIQUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_rfid_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
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
INSERT INTO dreamhouse_rooms (room_name)
VALUES
    ('Bedroom'),
    ('Kitchen'),
    ('Bathroom'),
    ('Living Room'),
    ('Garage'),
    ('Garden'),
    ('Entrance');

INSERT INTO users (username)
VALUES
    ('Fernanda'),
    ('Vanessa'),
    ('Barbie');

INSERT INTO dreamhouse_devices (room_id, device_name, device_type)
VALUES
    (1, 'Bedroom LDR', 'Sensor'),
    (1, 'Bedroom LED', 'Actuator'),
    (2, 'Kitchen Stove Button', 'Sensor'),
    (2, 'Kitchen LED Stove', 'Actuator'),
    (2, 'Kitchen Oven Push Button', 'Sensor'),
    (2, 'Kitchen Oven LED', 'Actuator'),
    (2, 'Kitchen Oven Buzzer', 'Actuator'),
    (3, 'Bathroom LDR', 'Sensor'),
    (3, 'Bathroom LED', 'Actuator'),
    (4, 'Living Room BME280', 'Sensor'),
    (4, 'Living Room LED temperature', 'Actuator'),
    (5, 'VL5L0X Distance', 'Sensor'),
    (5, 'Garage Servo Motor', 'Actuator'),
    (6, 'Rain Sensor', 'Sensor'),
    (6, 'Garden Servo Motor', 'Actuator'),
    (6, 'RFID Reader', 'Input'),
    (6, 'Elevator Motor', 'Actuator'),
    (6, 'Oled display Welcome', 'Actuator'),
    (7, 'Push Button', 'Sensor'),
    (7, 'Buzzer', 'Actuator');

INSERT INTO sensors (device_id)
VALUES
    (1),   -- Bedroom LDR
    (3),   -- Kitchen Stove Button
    (5),   -- Kitchen Oven Push Button
    (8),   -- Bathroom LDR
    (10),  -- Living Room BME280
    (12),  -- VL5L0X Distance
    (14),  -- Rain Sensor
    (19);  -- Push Button

INSERT INTO actuators (device_id)
VALUES
    (2),   -- Bedroom LED
    (4),   -- Kitchen LED Stove
    (6),   -- Kitchen Oven LED
    (7),   -- Kitchen Oven Buzzer
    (9),   -- Bathroom LED
    (11),  -- Living Room LED temperature
    (13),  -- Garage Servo Motor
    (15),  -- Garden Servo Motor
    (17),  -- Elevator Motor
    (18),  -- Oled display Welcome
    (20);  -- Buzzer

