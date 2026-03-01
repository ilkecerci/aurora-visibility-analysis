SELECT country, 
       AVG(advanced_score) as avg_score, 
       MAX(advanced_score) as max_score,
       COUNT(*) as record_count
FROM aurora_gold_data 
GROUP BY country 
ORDER BY avg_score DESC;
