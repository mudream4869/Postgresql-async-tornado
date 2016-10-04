import tornado.ioloop
import tornado.web
from tornado import gen

import pg
import ptdb

class DBHandler:
    inst = None
    def __init__(self, db):
        self.db = db
        DBHandler.inst = self

    @gen.coroutine
    def insertRow(self, str1):
        cur = yield self.db.cursor()
        sqlstr = ('INSERT INTO "tTest"(str1) VALUES (%s)')
        sqlarr = (str1, )
        cur.execute(sqlstr, sqlarr)

    @gen.coroutine
    def listRow(self):
        cur = yield self.db.cursor()
        sqlstr = ('SELECT id1, str1 FROM "tTest" WHERE id1 = 123')
        rows = yield cur.execute(sqlstr)

        ret_rows = []

        for row in rows:
            ret_rows.append({
                "id" : row[0],
                "str" : row[1]
            })

        raise gen.Return(ret_rows)


class MainHandler(tornado.web.RequestHandler):
    @gen.coroutine
    def get(self):
        val = self.get_argument("str", default="")
        yield DBHandler.inst.insertRow(val)
        lst = yield DBHandler.inst.listRow()
        for ll in lst:
            print(ll)

        self.write("")


if __name__ == "__main__":
    app = tornado.web.Application([
        (r"/", MainHandler),
    ])
    app.listen(8763)
    db = ptdb.Connection("cultural107", "localhost", "5432", "cultural107", "cultural107")
    DBHandler(db)
    tornado.ioloop.IOLoop.current().start()
