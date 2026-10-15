-- Barbie Dreamhouse Database
-- Fernanda Magaña Zapata A01663341
-- Vanessa Jacqueline Troncoso Ortega A01663244

CREATE DATABASE barbie_dreamhouse;

USE barbie_dreamhouse;

CREATE TABLE dreamhouse_rooms(
    room_id INT NOT NULL AUTOINCREMENT,
    room_name VARCHAR(50) NOT NULL UNIQUE,

)