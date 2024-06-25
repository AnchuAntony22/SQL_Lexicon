SELECT 
    Staff.first_name, 
    Staff.last_name, 
    Company.company_name, 
    Company.industry
FROM 
    Staff
JOIN 
    Company ON Staff.company_name = Company.company_name;
