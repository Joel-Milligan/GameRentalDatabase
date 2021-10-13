CREATE TRIGGER RentalCalculator AFTER UPDATE OF date_back ON gameRental
BEGIN
    UPDATE gameRental
    SET rental_cost = 3 + 0.05 * (julianday(date_back) - julianday(date_out)) * 
        (SELECT GameTitle.price
        FROM GameTitle
        NATURAL JOIN GameLicense
        NATURAL JOIN gameRental
        WHERE gameRental.license_id == old.license_id AND gameRental.gamer_id == old.gamer_id)
    WHERE date_back IS NOT NULL AND rental_cost IS NULL;
END;