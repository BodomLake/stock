from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from config.config import dbConnInfo
from entity.stockList.stocks import Stocks

ENGINE = create_engine(dbConnInfo)
DBSession = sessionmaker(bind=ENGINE)
session = DBSession()


# 所有数据一并提交
def insertBatch(dataList: list):
    for data in dataList:
        session.add(data)
    session.commit()


def closeSession():
    session.close()


if __name__ == '__main__':
    stock = Stocks('a', code=300725, codeStr='300725', name='药石科技', market="深市", market_type=1)
