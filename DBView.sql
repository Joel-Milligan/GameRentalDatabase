CREATE VIEW GamerRentalSummary AS
SELECT Gamer.gamer_id, 
    first_name || ' ' || last_name AS gamer_name, 
    title AS game_title,
    release_year AS game_release_year,
    platform AS game_platform,
    COUNT(*) AS times_rented,
    printf("%.2f", SUM(rental_cost)) AS total_rental_cost
FROM Gamer
    NATURAL JOIN gameRental
    NATURAL JOIN GameLicense
    NATURAL JOIN GameTitle
GROUP BY
    gamer_id,
    title,
    release_year,
    game_platform;