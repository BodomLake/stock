from sqlalchemy import Column, Integer, String
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

from config.config import dbConnInfo

# 连接驱动
ENGINE = create_engine(dbConnInfo())

# Base是declarative_base的实例化对象
Base = declarative_base()

# 数据库对话对象
DBSession = sessionmaker(bind=ENGINE)

# 数据库对话
session = DBSession()


# 每个类都要继承Base
class Stocks(Base):
    # __tablename__是必须要的，它是设置实际存在数据库中的表名
    __tablename__ = "stocks"

    # Column是列的意思，固定写法 Column(字段类型, 参数)
    # primary_key主键、index索引、nullable是否可以为空
    id = Column(String(32), primary_key=True)
    code = Column(Integer, index=True)
    codeStr = Column(String(32), index=True)
    name = Column(String(32), nullable=True)
    market = Column(String(32), unique=False, nullable=True)
    market_type = Column(Integer, default=0, nullable=False)

    # 相当于Django的ORM的class Meta，是一些元信息
    # __table_args__ = (
    #     UniqueConstraint("id", "code"), Index("id", "code")
    # )


def create_db():
    # metadata.create_all创建所有表
    Base.metadata.create_all(ENGINE)


def drop_db():
    # metadata.drop_all删除所有表
    Base.metadata.drop_all(ENGINE)


# 所有数据一并提交
def batchInsert(dataList: list):
    for data in dataList:
        session.add(data)
    session.commit()


def selectBunchOfCode(startNo, size, market_type):
    sql = "select codeStr from stocks where market_type = " + str(market_type)
    sql += " order by codeStr limit "
    sql += str(startNo) + "," + str(size) + ";"
    cursor = session.execute(sql)
    session.commit()
    result = cursor.fetchall()
    return list(map(lambda rs: rs._row[0], result))


def closeSession():
    session.close()


if __name__ == '__main__':
    create_db()
    # print(selectBunchOfCode(5, 95, 0))
