-- Barbie Dreamhouse Database
-- Fernanda Magaña Zapata A01663341
-- Vanessa Jacqueline Troncoso Ortega A01663244

CREATE DATABASE barbie_dreamhouse;

USE barbie_dreamhouse;

CREATE TABLE dreamhouse_rooms(
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL UNIQUE,
);

CREATE TABLE dreamhouse_devices(
    device_id INT AUTO_INCREMENT NOT NULL,
    room_id INT AUTO_INCREMENT,
    device_name VARCHAR(50),
    device_type VARCHAR(50)
);

CREATE TABLE sensors(
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id  INT AUTO_INCREMENT NOT NULL,
    sensor_name VARCHAR(50) NOT NULL,
    current_value DECIMAL(10,2),
    updated DATETIME
);

CREATE TABLE actuators(
    actuator_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT AUTO_INCREMENT NOT NULL,
    actuator_name VARCHAR(50) NOT NULL,
    current_state DECIMAL(10,2),
    updated DATETIME
);

CREATE TABLE sensor_readings(
    reading_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT AUTO_INCREMENT NOT NULL,
    current_value DECIMAL(10,2),
    time_reading DATETIME, 
);

CREATE TABLE commands(
    command_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT AUTO_INCREMENT,
    actuator_id INT AUTO_INCREMENT NOT NULL,
    value VARCHAR(50) NOT NULL,
    time_command DATETIME
);

CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50)
);

ALTER TABLE dreamhouse_devices
ADD CONSTRAINT fk_room
FOREIGN KEY (room_id) REFERENCES dreamhouse_rooms(room_id);

ALTER TABLE sensors
ADD CONSTRAINT fk_device
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE actuators
ADD CONSTRAINT fk_device
FOREIGN KEY (device_id) REFERENCES dreamhouse_devices(device_id);

ALTER TABLE sensor_readings
ADD CONSTRAINT fk_sensor
FOREIGN KEY (sensor_id) REFERENCES dreamhouse_devices(sensor_id);

ALTER TABLE commands
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id) REFERENCES dreamhouse_devices(user_id);

ALTER TABLE commands
ADD CONSTRAINT fk_actuator
FOREIGN KEY (actuator_id) REFERENCES dreamhouse_devices(actuator_id);


