-- Crear la base de datos

CREATE DATABASE metro_cdmx;

-- Crear las tablas

USE metro_cdmx;

CREATE TABLE `lines` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(10) NOT NULL,
    `color` VARCHAR(15) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- Creación de la tabla de stations
CREATE TABLE `stations` (

    `id` BIGINT(20),

    `name` VARCHAR(50) NOT NULL,
    `location` POINT NOT NULL, 
    `icon` VARCHAR(100),

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 

    `intersection1`BIGINT(20),
    `intersection2`BIGINT(20),
    `intersection3`BIGINT(20)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- Creación de la tabla de trains
CREATE TABLE `trains` (

    `serial_number` VARCHAR(10) NOT NULL,

    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `type` TINYINT(4) NOT NULL,
    `year` INT(4) NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (serial_number),
    CONSTRAINT `trains_line_id_foreign` 
    FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- Creación de la tabla lines_stations
CREATE TABLE `lines_stations` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- Creación de la tabla locations
CREATE TABLE `locations` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,
    `location` POINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

