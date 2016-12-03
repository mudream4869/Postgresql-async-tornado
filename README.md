# postgresql-async-tornado
A module for asynchronous PostgreSQL queries,works with Tornado and psycopg2.

对psycopg2的简单封装


Usage
-----

```
cur = yield db.cursor()
yield cur.execute(sqlstr, sqlarr)
row = cur.fetchone()
rows = cur.fetchall()
```

Thanks
------

[torndb](https://github.com/bdarnell/torndb)

[momoko](https://github.com/FSX/momoko)
