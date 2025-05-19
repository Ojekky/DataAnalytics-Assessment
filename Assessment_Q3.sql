SELECT 
    savings_savingsaccount.plan_id,
    plans_plan.owner_id,
    CASE 
        WHEN plans_plan.is_regular_savings = 1 AND plans_plan.is_a_fund = 0 THEN 'Savings'
        WHEN plans_plan.is_regular_savings = 0 AND plans_plan.is_a_fund = 1 THEN 'Investment'
        WHEN plans_plan.is_regular_savings = 0 AND plans_plan.is_a_fund = 0 THEN NULL
        WHEN plans_plan.is_regular_savings = 1 AND plans_plan.is_a_fund = 1 THEN 'Savings & Investment'
    END AS type,
    MAX(savings_savingsaccount.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(savings_savingsaccount.transaction_date)) AS inactivity_days
FROM savings_savingsaccount
JOIN plans_plan ON plans_plan.owner_id = savings_savingsaccount.owner_id
WHERE savings_savingsaccount.transaction_date IS NOT NULL
GROUP BY 1,2,3;
