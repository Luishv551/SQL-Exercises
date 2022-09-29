select wk.empfname 
from emp wk, emp boss
where wk.deptname = boss.deptname
and wk.bossno = boss.empno

select *
from emp wk, emp boss
where wk.bossno = "1"
and wk.bossno = boss.empno;

select wk.empfname, wk.deptname, boss.empfname
from emp wk, emp boss
where wk.bossno = boss.empno

select boss.empfname, count(*) as "num_sup"
from emp wk, emp boss
where wk.bossno = boss.empno
group by boss.empfname