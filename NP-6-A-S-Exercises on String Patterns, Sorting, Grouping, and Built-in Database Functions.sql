SELECT * from indian_startup_funding 
-- columns (Date, StartupName, IndustryVertical, CityLocation, AmountinUSD))

-- 1. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
SELECT IndustryVertical, sum(AmountinUSD) from indian_startup_funding
where CityLocation = 'Bengaluru'
group by CityLocation


--2. Write SQL query to sort the table by startup name DESC
SELECT * from indian_startup_funding 
order by StartupName  -- lower case comes before upper case (Precedence special charachters --> numbers --> lower case --> upper case )

-- 3. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru” and AmountinUSD>380000
SELECT IndustryVertical, sum(AmountinUSD) from indian_startup_funding
where CityLocation = 'Bengaluru' and AmountinUSD > 380000
group by CityLocation

-- 4. Write SQL query to get all CityLocations that has an AmountinUSD >380000
SELECT CityLocation from indian_startup_funding 
where  AmountinUSD > 380000


-- 5. Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
SELECT distinct CityLocation from indian_startup_funding 
where  AmountinUSD > 380000

-- 6. Write SQL query to get all StartupNames where AmountinUSD<380000
SELECT StartupName from indian_startup_funding 
where  AmountinUSD > 380000

--7. Write SQL query to sort the output from the previous question DESC
SELECT StartupName from indian_startup_funding 
where  AmountinUSD > 380000
order by StartupName DESC

--8. Write SQL query to get the City location that has the maximum funding amount “Note that is the data is not cleaned properly you will get non logical result”
select CityLocation, max(AmountinUSD) from indian_startup_funding
where AmountinUSD not in ('unknown', 'undisclosed', 'Undisclosed')


--9. Write SQL query to get the total funding AmountinUSD for each IndustryVertical -- Repeat question 15
select IndustryVertical, sum(AmountinUSD) from indian_startup_funding
group by IndustryVertical

--10. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with letter “A”
SELECT IndustryVertical, sum(AmountinUSD) FROM indian_startup_funding
where IndustryVertical like 'A%'
group by IndustryVertical

--11. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with letter “A” and sort the output DESC by the total AmountinUSD
SELECT IndustryVertical, sum(AmountinUSD) FROM indian_startup_funding
where IndustryVertical like 'A%'
group by IndustryVertical
order by sum(AmountinUSD) DESC


--12. Write SQL query to count all the start_ups in the Education field
SELECT count(StartupName) FROM indian_startup_funding
where IndustryVertical = 'Education'



--13. Write SQL query to count all the start_Ups in the E-Commerce field
14. Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals “Bengaluru”
SELECT count(StartupName) FROM indian_startup_funding
where IndustryVertical = 'E-Commerce'
and CityLocation='Bengaluru'

--15. For each Industry Vertical find the total funding amount -- Repeat question 9
select IndustryVertical, sum(AmountinUSD) from indian_startup_funding
group by IndustryVertical


--16. For each Industry Vertical find the total funding amount as “Total_fund” and the average funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry
--Vertical, 2- using sub_queries
------------------using group by -------------------------
select IndustryVertical, sum(AmountinUSD) as Total_fund, avg(AmountinUSD) as Avg_fund from indian_startup_funding
group by IndustryVertical
---------------------using sub queries ----------------------
SELECT
    IndustryVertical,
    (SELECT SUM(AmountinUSD) FROM indian_startup_funding AS t2 WHERE t1.IndustryVertical = t2.IndustryVertical) AS Total_Fund,
    (SELECT AVG(AmountinUSD) FROM indian_startup_funding AS t2 WHERE t1.IndustryVertical = t2.IndustryVertical) AS Avg_Fund
FROM
    indian_startup_funding AS t1
GROUP BY
    IndustryVertical;

--17. Write SQL query to get the minimum value of funding for the “Uniphore” start_up
select min(AmountinUSD) from indian_startup_funding
where StartupName='Uniphore'

--18. Write SQL query to get the length of the city location names
select distinct CityLocation, length(CityLocation) from indian_startup_funding

--19. Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
select upper(StartupName) from indian_startup_funding
where AmountinUSD >380000

--20. Write SQL query to select distinct industry vertical names, knowing that names are mix of lowercase and uppercase values.
select distinct upper(IndustryVertical) as IndustryVertical from indian_startup_funding 
order by IndustryVertical