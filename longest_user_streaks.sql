-- Step 1: Assign row numbers to track sequential activity
WITH ActivityData AS (
    SELECT 
        user_id,
        streak_active,
        streak_created,
        -- Row number for all activity per user
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY streak_created) as rn_total,
        -- Row number for only the active streaks per user
        ROW_NUMBER() OVER (PARTITION BY user_id, streak_active ORDER BY streak_created) as rn_active
    FROM user_streaks_sql
),
-- Step 2: Group consecutive active streaks using the difference between row numbers
GroupedStreaks AS (
    SELECT 
        user_id,
        (rn_total - rn_active) as streak_group,
        COUNT(*) as streak_length
    FROM ActivityData
    WHERE streak_active = 1
    GROUP BY user_id, (rn_total - rn_active)
)
-- Step 3: Find the maximum streak per user and filter for 30+
SELECT 
    user_id,
    MAX(streak_length) AS max_streak_length
FROM GroupedStreaks
GROUP BY user_id
HAVING MAX(streak_length) >= 30
ORDER BY max_streak_length DESC;