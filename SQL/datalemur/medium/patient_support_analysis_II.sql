SELECT ROUND((sum(case 
        when call_category is NULL then 1
        when call_category = 'n/a' then 1
        else 0
      end) / count(*)::decimal)*100, 1) as total_calls
FROM callers;
