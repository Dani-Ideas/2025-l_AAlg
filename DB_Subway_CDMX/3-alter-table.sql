USE metro_cdmx;

ALTER TABLE `stations`
MODIFY `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY(id);
-- ADD CONSTRAINT `trains_line_id_foreign`
-- FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`);

-- Para lines_stations
ALTER TABLE `lines_stations` 
ADD CONSTRAINT `lines_stations_line_id_foreign` 
FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`);

ALTER TABLE `lines_stations` 
ADD CONSTRAINT `lines_stations_station_id_foreign` 
FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`);

-- Para locations
ALTER TABLE `locations` 
ADD CONSTRAINT `locations_station_id_foreign` 
FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`);