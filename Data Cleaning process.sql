select * from netflix_raw 
where show_id='s5023';

- 
select show_id,COUNT(*) 
from netflix_raw
group by show_id 
having COUNT(*)>1

select * from netflix_raw
where concat(upper(title),type)  in (
select concat(upper(title),type) 
from netflix_raw
group by upper(title) ,type
having COUNT(*)>1
)
order by title

with cte as (
select * 
,ROW_NUMBER() over(partition by title , type order by show_id) as rn
from netflix_raw
)
select show_id,type,title,cast(date_added as date) as date_added,release_year
,rating,case when duration is null then rating else duration end as duration,description
into netflix_final
from cte 

select * from netflix_final



select show_id , trim(value) as country
into netflix_country
from netflix_raw
cross apply string_split(country,',')



select * from netflix_drector
select * from netflix_country
select * from netflix_cast
select * from netflix_genre


select    from netflix_raw where country is null

insert into netflix_country
select  show_id,m.country 
from netflix_raw nr
inner join (
select director,country
from  netflix_country nc
inner join netflix_director nd on nc.show_id=nd.show_id
group by director,country
) m on nr.director=m.director
where nr.country is null

select * from netflix_raw where director='Ahishor Solomon'

select director,country
from  netflix_country nc
inner join netflix_directors nd on nc.show_id=nd.show_id
group by director,country

-------------------
select * from netflix_raw where duration is null









