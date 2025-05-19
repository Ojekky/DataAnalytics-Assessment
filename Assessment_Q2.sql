SELECT 
    frequency_category,
    COUNT(id) AS total_users,
    AVG(avg_transaction_count) AS overall_avg_transactions
FROM (
    SELECT 
        users_customuser.id,
        AVG(monthly.transaction_count) AS avg_transaction_count,
        CASE 
            WHEN AVG(monthly.transaction_count) >= 10 THEN 'High Frequency'
            WHEN AVG(monthly.transaction_count) BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM (
        SELECT 
            savings_savingsaccount.owner_id,
            DATE_FORMAT(savings_savingsaccount.transaction_date, '%Y-%m') AS month_year,
            COUNT(savings_savingsaccount.transaction_status) AS transaction_count
        FROM savings_savingsaccount
        GROUP BY savings_savingsaccount.owner_id, month_year
    ) AS monthly
    JOIN users_customuser ON users_customuser.id = monthly.owner_id
    GROUP BY users_customuser.id
) AS categorized_users
GROUP BY frequency_category;
