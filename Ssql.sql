select c.name, b.title, c.maksimalno from 

(select max(a.suma) as maksimalno, a.name from
(select
f.title,
c.name, 
sum(p.amount)as suma
from payment p
inner join rental r
on p.rental_id=r.rental_id
inner join inventory i
on r.inventory_id=i.inventory_id
inner join film_category fc
on i.film_id=fc.film_id
inner join category c
on fc.category_id=c.category_id
inner join film f
on fc.film_id=f.film_id
group by 
c.name, f.title
order by name, sum(p.amount))a

group by a.name)c


left join
(select
f.title,
c.name, 
sum(p.amount)as suma
from payment p
inner join rental r
on p.rental_id=r.rental_id
inner join inventory i
on r.inventory_id=i.inventory_id
inner join film_category fc
on i.film_id=fc.film_id
inner join category c
on fc.category_id=c.category_id
inner join film f
on fc.film_id=f.film_id
group by 
c.name, f.title
order by name, sum(p.amount))b
on b.suma=c.maksimalno

