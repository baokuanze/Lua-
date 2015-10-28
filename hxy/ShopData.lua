--
-- Author: hexinyi
-- Date: 2015-09-21 17:19:01
--

module( "Data", package.seeall)
 Data = {
	[1] = {id = 1, level=25, kind="靴子", name = "龙行靴",  star=1,   health = 100 ,	atk =0 ,	def =100,	price = 100  ,  pic="1.png" },
	[2] = {id = 2, level=33, kind="戒子", name = "土灵戒",  star=3,	health = 0   ,	atk =100 ,	def = 100,	price = 100  ,  pic="2.png" },
	[3] = {id = 3, level=61, kind="戒子", name = "龙牙戒",  star=2,	health = 100 ,	atk =100 ,	def = 100,	price = 200  ,  pic="3.png" },
	[4] = {id = 4, level=18, kind="盔甲", name = "凤尾甲",  star=0,	health = 100 ,	atk =100 ,	def = 100,	price = 200  ,  pic="4.png" },
	[5] = {id = 5, level=1 , kind="宝石", name = "强化石",  star=3,	health = 0 ,	atk =0 ,	def = 0,	price = 200  ,  pic="5.png" },
}

dataselector ={}




-- function Data.getData_Count()
-- 	return #Date
-- end



-- return Data