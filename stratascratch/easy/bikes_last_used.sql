select bike_number,
    MAX(end_time) AS last_used
from dc_bikeshare_q1_2012
GROUP BY bike_number;