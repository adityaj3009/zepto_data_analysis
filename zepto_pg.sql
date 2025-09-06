=drop table if exists zepto;

create table zepto(
    sku_id serial primary key,
    category varchar(100),
    name varchar(100) not null,
    mrp numeric(8,2),
    discountpercent numeric(5,2),
    availablequantity integer,
    discountedsellingprice numeric(8,2),
    weightingms integer,
    outofstock boolean,
    quantity integer
);

-- data exploration

-- count of rows
select count(*) from zepto;

-- sample data
select * from zepto limit 10;

-- null values
select *
from zepto
where category is null 
   or name is null 
   or mrp is null 
   or discountpercent is null 
   or weightingms is null 
   or outofstock is null 
   or quantity is null;

-- different product categories
select distinct category from zepto
order by category;

-- product in stock vs out of stock
select outofstock, count(name) 
from zepto
group by outofstock;

-- product names present multiple times
select name, count(sku_id) 
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

-- data cleaning

-- product with price = 0
select * from zepto
where mrp = 0 or discountedsellingprice = 0;

delete from zepto
where mrp = 0;

-- currently mrp in paisa so we have to convert it to rs
update zepto
set mrp = mrp / 100.0,
    discountedsellingprice = discountedsellingprice / 100.0;

-- top 10 best-value products based on the discount percentage
select distinct name, mrp, discountpercent
from zepto
order by discountpercent desc
limit 10;

-- products with high mrp but out of stock
select distinct name, mrp
from zepto
where outofstock = true and mrp > 200
order by mrp desc;

-- estimated revenue for each category
select category,
    sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- all products where mrp is greater than ₹500 and discount is less than 10%
select name, mrp, discountpercent
from zepto
where mrp > 500 and discountpercent < 10.0
order by mrp desc, discountpercent desc;

-- top 5 categories offering the highest average discount percentage
select category, round(avg(discountpercent), 2) as avg_disc
from zepto 
group by category
order by avg_disc desc
limit 5;

-- price per gram for products above 100g and sort by best value
select distinct name, weightingms, discountedsellingprice,
    round(discountedsellingprice / weightingms, 2) as price_per_gm
from zepto
where weightingms >= 100
order by price_per_gm;

-- categorize products into weight classes
select distinct name, weightingms,
    case 
        when weightingms < 1000 then 'low'    
        when weightingms < 5000 then 'medium'
        else 'bulk'
    end as weight_category
from zepto;

-- total inventory weight per category 
select category,
    sum(weightingms * availablequantity) as total_weight
from zepto
group by category
order by total_weight;
