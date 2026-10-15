-- Barbie Dreamhouse Database
-- Fernanda Magaña Zapata A01663341
-- Vanessa Jacqueline Troncoso Ortega A01663244

-- REMEMBER: If you have already run it "IF NOT EXISTS"
DROP DATABASE IF EXISTS barbie_dreamhouse;
CREATE DATABASE IF NOT EXISTS barbie_dreamhouse;

USE barbie_dreamhouse;

-- Creating tables

CREATE TABLE dreamhouse_rooms(
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE dreamhouse_devices(
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    device_name VARCHAR(50) NOT NULL,
    device_type VARCHAR(50) NOT NULL
);

CREATE TABLE sensors(
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id  INT NOT NULL UNIQUE,
    sensor_name VARCHAR(50) NOT NULL,
    sensor_type VARCHAR(50) NOT NULL,
    current_value DECIMAL(10,2),
    updated DATETIME
);

CREATE TABLE actuators(
    actuator_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL UNIQUE,
    actuator_name VARCHAR(50) NOT NULL,
    actuator_type VARCHAR(50) NOT NULL,
    current_state VARCHAR(50),
    updated DATETIME
);

CREATE TABLE sensor_readings(
    reading_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    current_value DECIMAL(10,2) NOT NULL,
    time_reading DATETIME NOT NULL
);

CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE commands(
    command_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    actuator_id INT NOT NULL,
    value_command VARCHAR(50) NOT NULL,
    time_command DATETIME NOT NULL
);

-- Assigning Foreign Keys

ALTER TABLE dreamhouse_devices
ADD CONSTRAINT fk_room
FOREIGN KEY (room_id) REFERENCES dreamhouse_rooms(room_id);

ALTER TABLE sensors
ADD CONSTRAINT fk_dev
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE actuators
ADD CONSTRAINT fk_device
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE sensor_readings
ADD CONSTRAINT fk_sensor
FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id);

ALTER TABLE commands
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE commands
ADD CONSTRAINT fk_actuator
FOREIGN KEY (actuator_id) REFERENCES actuators(actuator_id);