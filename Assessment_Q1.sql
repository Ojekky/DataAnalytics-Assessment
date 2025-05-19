SELECT
    users_customuser.id AS owner_id,
    CONCAT(users_customuser.first_name, ' ', users_customuser.last_name) AS name,
    COUNT(CASE WHEN plans_plan.is_regular_savings = 1 THEN plans_plan.id END) AS savings_count,
    COUNT(CASE WHEN plans_plan.is_a_fund = 1 THEN plans_plan.id END) AS investment_count,
    SUM(savings_savingsaccount.amount) AS total_deposits
FROM
    users_customuser 
JOIN
    savings_savingsaccount ON users_customuser.id = savings_savingsaccount.owner_id
JOIN
    plans_plan ON users_customuser.id = plans_plan.owner_id
GROUP BY
    users_customuser.id, name;
