# '数据库类型+数据库驱动名称://用户名:口令@机器地址:端口号/数据库名'
def dbConnInfo(user='root', password='rex123456', host='127.0.0.1', port='3306', args='charset=utf8mb4', schema='stock'):
    return 'mysql+pymysql://' + user + ':' + password + '@' + host + ':' + port + '/' + schema + '?' + args
