
-- sp_top_sql_io.sql
-- Jared Still - Pythian
-- 2017-09-07 still@pythian.com jkstill@gmail.com

-- get top 10 SQL statements based on disk reads

with sqlreads as (
	select distinct sql_id, snap_id, instance_number,  max(disk_reads) over (partition by sql_id) disk_reads
	from perfstat.stats$sql_summary
	order by 4 desc
)
select *
from sqlreads
where rownum <= 10
/
