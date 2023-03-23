WITH split_table AS (
    SELECT user_id,
        LEFT(
            filter_room_types,
            array_extract(',', filter_room_types + ',') -1
        ),
        STUFF(
            filter_room_types,
            1,
            CHAR_INDEX(',', filter_room_types + ','),
            ''
        )
    FROM airbnb_searches
    UNION ALL
    SELECT user_id,
        LEFT(
            filter_room_types,
            array_extract(',', filter_room_types + ',') -1
        ),
        STUFF(
            filter_room_types,
            1,
            CHAR_INDEX(',', filter_room_types + ','),
            ''
        )
    FROM split_table
    WHERE filter_room_types > ''
)
SELECT *
FROM split_table;