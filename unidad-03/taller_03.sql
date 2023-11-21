-- taller 03

-- 01. Las compras realizadas en el primer semestre de cualquier año.
-- forma 01
select *
from invoice
where month(InvoiceDate) between 1 and 6
order by InvoiceId, InvoiceDate;

-- forma 02
select *
from invoice
where extract(month from InvoiceDate) between 1 and 6
order by InvoiceId, InvoiceDate;

-- 02. El álbum con la mayor cantidad de canciones.
-- forma 1
select distinct AlbumId, count_songs_track(AlbumId) as num_songs
from track
order by num_songs desc
limit 1;

-- forma 2
select AlbumId, count(*) as num_canciones
from track
group by AlbumId
order by num_canciones desc
limit 1;

-- 03. Los clientes del empleado de la empresa de mayor edad.
select SupportRepId as "id_empleado_mayor", CustomerId, FirstName, LastName
from customer
where SupportRepId = (
	select EmployeeId
	from employee
	order by BirthDate
	limit 1
) order by CustomerId;

-- 04. El promedio de duración de las canciones por cada género musical.
-- forma 01
select GenreId, sum(Milliseconds) / count(*) as "avg_milliseconds_songs"
from track
group by GenreId;

-- forma 02
select GenreId, avg(Milliseconds) as "avg_milliseconds_songs"
from track
group by GenreId;

-- 05. La mayor cantidad vendida por año en una factura.
with RankedInvoices as (
    select
        year(InvoiceDate) as year,
        InvoiceId,
        total,
        row_number() over (partition by year(InvoiceDate) order by total desc) as RowNum
    from
        invoice
)
select year, InvoiceId, total
from RankedInvoices
where RowNum = 1
order by year;