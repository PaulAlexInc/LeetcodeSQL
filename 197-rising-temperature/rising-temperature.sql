# Write your MySQL query statement below
SELECT id 
FROM (SELECT id, 
temperature AS today_temp, 
lag (temperature,1) OVER (order by recordDate) AS yesterday_temp,
recordDate AS Today, lag(recordDate, 1) OVER (order by recordDate) AS Yesterday 
FROM Weather) SUB 
WHERE today_temp > yesterday_temp AND DATEDIFF(Today, Yesterday) = 1
