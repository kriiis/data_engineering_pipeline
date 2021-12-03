drop database gans;
create database gans;
use gans;

drop table if exists city_pop;
CREATE TABLE IF NOT EXISTS city_pop (
    city VARCHAR(255),
    country VARCHAR(255),
    country_code VARCHAR(3),
    population DOUBLE,
    elevation_meters DOUBLE,
    latitude DOUBLE,
    longitude DOUBLE,
    municipality_iso_country VARCHAR(255),
    PRIMARY KEY (municipality_iso_country)
); 

drop table if exists airport;
CREATE TABLE IF NOT EXISTS airport (
    airport_name VARCHAR(255),
    latitude_deg DOUBLE,
    longitude_deg DOUBLE,
    elevation_ft DOUBLE,
    iso_country VARCHAR(3),
    iso_region VARCHAR(255),
    municipality VARCHAR(255),
    icao_code VARCHAR(255),
    iata_code VARCHAR(255),
    municipality_iso_country VARCHAR(255),
    PRIMARY KEY (icao_code),
    FOREIGN KEY (municipality_iso_country)
        REFERENCES city_pop (municipality_iso_country)
);


drop table if exists weather_data;
CREATE TABLE IF NOT EXISTS weather_data (
    weather_id INT AUTO_INCREMENT,
    weather_datetime DATETIME,
    main_weather VARCHAR(255),
    weather_detail VARCHAR(255),
    temperature DOUBLE,
    feels_like DOUBLE,
    humidity INTEGER,
    wind DOUBLE,
    prob_perc DOUBLE,
    rain_qty DOUBLE,
    snow DOUBLE,
    municipality_iso_country VARCHAR(255),
    PRIMARY KEY (weather_id),
    FOREIGN KEY (municipality_iso_country)
        REFERENCES city_pop (municipality_iso_country)
);

drop table if exists flight_arrival;
CREATE TABLE IF NOT EXISTS flight_arrival (
    arrival_id INT AUTO_INCREMENT,
    scheduled_arrival_time DATETIME,
    flight_number VARCHAR(255),
    dep_airport VARCHAR(255),
    terminal INTEGER,
    airline VARCHAR(255),
    aircraft VARCHAR(255),
    icao_code VARCHAR(255),
    PRIMARY KEY (arrival_id),
    FOREIGN KEY (icao_code) REFERENCES airport (icao_code)
);
