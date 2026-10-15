-- Problem: Ollivander's Inventory
-- Goal: Find the cheapest non-evil wand for each Age + Power combination.

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w

-- Connect Wands and Wands_Property using their common code.
JOIN Wands_Property wp
    ON w.code = wp.code

-- Exclude evil wands.
WHERE wp.is_evil = 0

-- Keep only wands whose price matches the minimum price
-- for the same age and power combination.
AND w.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    JOIN Wands_Property wp2
        ON w2.code = wp2.code

    -- Consider only non-evil wands in the inner query.
    WHERE wp2.is_evil = 0

    -- Match the age and power of the current outer wand.
    AND wp2.age = wp.age
    AND w2.power = w.power
)

-- Sort by highest power first, then highest age.
ORDER BY
    w.power DESC,
    wp.age DESC;
