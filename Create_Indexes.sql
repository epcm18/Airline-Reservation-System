USE b_airways;

CREATE INDEX idx_departure ON Trip(departure);
CREATE INDEX idx_arrival ON Trip(arrival);
