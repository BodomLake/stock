select count(*)
from stock.stocks
where market_type = 1
   or market_type = 0;
# 上海
select count(*)
from stock.stocks
where market_type = 0  order by codeStr;
#  深圳
select count(*)
from stock.stocks
where market_type = 1  order by codeStr;

select *
from stock.stocks
where name like '%康华%' and (market_type = 1
   or market_type = 0);

select *
from stock.stocks
where name like '%沪%' and (market_type = 1
   or market_type = 0);

select count(*)
from stock.stocks
where market_type = 5;

show variables like '%char%';

show warnings ;

/**
  上海股市财报重置
 */

delete from sh_finance.main_indicators where 1=1;
delete from sh_finance.profit_statement where 1=1;
delete from sh_finance.cash_flow_statement where 1=1;
delete from sh_finance.balance_sheets where 1=1;
delete from sh_finance.bank_specific_indicators where 1=1;

alter table sz_finance.main_indicators auto_increment=1;
alter table sz_finance.profit_statement auto_increment=1;
alter table sz_finance.cash_flow_statement auto_increment=1;
alter table sz_finance.balance_sheets auto_increment=1;
alter table sz_finance.bank_specific_indicators auto_increment=1;

/**
  深圳股市财报重置
 */

delete from sz_finance.main_indicators where 1=1;
delete from sz_finance.profit_statement where 1=1;
delete from sz_finance.cash_flow_statement where 1=1;
delete from sz_finance.balance_sheets where 1=1;
delete from sz_finance.bank_specific_indicators where 1=1;

alter table sz_finance.main_indicators auto_increment=1;
alter table sz_finance.profit_statement auto_increment=1;
alter table sz_finance.cash_flow_statement auto_increment=1;
alter table sz_finance.balance_sheets auto_increment=1;
alter table sz_finance.bank_specific_indicators auto_increment=1;

/**
  股票列表
 */
delete from stock.stocks where 1=1 ;
alter table stock.stocks auto_increment = 1;