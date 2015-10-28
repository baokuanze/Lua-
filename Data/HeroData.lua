module("HeroData",package.seeall)
Data = {}
user_id ={}
--属性
Data.HP = 1000 --血量
Data.MP = 200 --蓝量
Data.AC = 54  --攻击
Data.A1 = 185 --技能1
Data.A2 = 194 --技能2
Data.A3 = 153 --技能3
Data.A4 = 215 --技能4
Data.attak=0   -- gongji 

Data.SD = 0	  --技能点
Data.HPSD = 0
Data.ACSD = 0
Data.P1SD = 0
Data.P2SD = 0
Data.P3SD = 0
Data.P4SD = 0

Data.P5SD = 0

Data.isPlayMusic = true --音乐控制开关
Data.isPlaySound = true --音效控制开关
Heroequ ={}     ---  打算承装  



currentHero=
{

}

MonsterArray=
{

}
GameLayerdegate={}
 packagelayerdegate={}
   Hechenglayerdegate = {}
  reshobject ={}
currentHero_Index  = {}

 
 expriserank = {    -- 后面在维护 
     [1]  = 100 ,
     [2] = 300 , 
     [3] = 500 , 
     [4] = 1000 , 
     [5] = 1500 , 
     [6] = 2000 ,
     [7] = 2500 , 
     [8] = 3000 , 
     [9] = 3500 ,
     [10] = 4000 ,
     [11] = 4500 ,
     [12] = 5000 ,
     [13] = 5500 ,
     [14] = 6000 ,
     [15] = 6500 ,
     [16] = 7000 ,
     [17] = 7500 ,
     [18] = 8000 ,
     [19] = 8500 ,
     [20] = 9000 ,
     [21] = 9500 ,
     [22] = 10000 ,
     [23] = 10500 ,
     [24] = 11500 ,
     [25] = 12000 ,
     [26] = 12500 ,
     [27] = 13000 ,
     [28] = 13500 ,
     [29] = 14000 ,
     [30] = 14500 ,
     [31] = 15000 ,
     [32] = 15500 ,
     [33] = 16000 ,
     [34] = 16500 ,
     [35] = 17000 ,
     [36] = 17500 ,
     [37] = 18000 ,
     [38] = 18500 ,
     [39] = 19000 ,
     [40] = 19500 ,
     [41] = 20000 ,
     [42] = 20500 ,
     [43] = 21000 ,
     [44] = 21500 ,
     [45] = 22000 ,
     [46] = 22500 ,
     [47] = 23000 ,
     [48] = 23500 ,
     [49] = 24000 ,
     [50] = 24500 ,
     [51] = 25000 ,
     [52] = 25500 ,
     [53] = 26000 ,
     [54] = 26500 ,
     [55] = 27000 ,
     [56] = 27500 ,
     [57] = 28000 ,
     [58] = 28500 ,
     [59] = 29000 ,
     [60] = 29500 ,
     }




          --- 靴子   id   = 1  ,  
          ----武器 id =2 
          ----戒指或 手链 id =3 
          ----盔甲 id =4 
         ----   health    +血       atk  + 攻击     def   + 未定 
         --wear  =0   没有穿戴
 leveup_index= 0
shopdataselector ={}   --- 商店选择 
stone = {id = 5, level=1 , kind="宝石", name = "强化石",  star=3,  health = 0 ,    atk =0 ,    def = 0,    price = 200  ,  pic="5.png" }
Allequi = {
    [1] = {id = 1, level=0, kind="靴子", name = "柳叶绵竹靴", wear= 0, star=1,   health = 100 ,   atk =0 ,    def =100,   price = 500  ,  pic="1_1.png" },
    [2] = {id = 2, level=0, kind="武器", name = "霜魂剑",     wear= 0, star=1,  health = 100 ,   atk =100 ,   def =0 ,   price = 500  ,  pic="2_1.png" },
    [3] = {id = 3, level=0, kind="饰品", name = "孔雀翎",    wear= 0, star=1,  health = 0    ,  atk =100 ,  def = 100,  price = 500  ,  pic="3_1.png" },
    [4] = {id = 4, level=0, kind="盔甲", name = "狻猊铠",     wear= 0, star=1,  health = 100 ,   atk =0 ,   def = 100,  price = 500  ,  pic="4_1.png" },

    [5] = {id = 1, level=0, kind="靴子", name = "千里靴",    wear= 0, star=2,   health = 200 ,   atk =0 ,    def =200,   price = 1000  , pic="1_2.png" },
    [6] = {id = 2, level=0, kind="武器", name = "梅花亮银枪",  wear= 0, star=2,  health = 200 ,    atk =200 ,  def = 0,  price = 1000 ,  pic="2_2.png" },
    [7] = {id = 3, level=0, kind="饰品", name = "蓝田凤钗",  wear= 0, star=2,  health = 0   ,  atk =200 ,  def = 200,    price = 1000  ,  pic="3_2.png" },
    [8] = {id = 4, level=0, kind="盔甲", name = "方翅黄金铠",  wear= 0, star=2,  health = 200 ,  atk =0 ,    def = 200,  price = 1000  ,   pic="4_2.png" },
    
    [9] = {id = 1, level=0, kind="靴子", name = "紫金五龙靴", wear= 0, star=3,   health = 300 ,   atk =0 ,    def =300,   price = 1500  , pic="1_3.png" },
    [10] = {id = 2, level=0, kind="武器", name = "山河扇",     wear= 0, star=3,  health = 300 ,  atk =300 ,  def = 0,  price = 1500  ,  pic="2_3.png" },
    [11] = {id = 3, level=0, kind="饰品", name = "蕴云佩",   wear= 0, star=3,   health = 0   ,  atk =300 ,    def = 300, price = 1500  ,  pic="3_3.png" },
    [12] = {id = 4, level=0, kind="盔甲", name = "九天雪衣",    wear= 0, star=3,  health = 300 ,  atk =0 ,    def = 300,  price = 1500  ,   pic="4_3.png" }
}

currentequ_index = 0

--- 当前 背包
   pagkeequ={

    [1] = {id = 1, level=0, kind="靴子", name = "柳叶绵竹靴", wear= 1, star=1,   health = 100 ,   atk =0 ,    def =100,   price = 500  ,  pic="1_1.png" },
    [2] = {id = 2, level=0, kind="武器", name = "霜魂剑",     wear= 1, star=1,  health = 100 ,  atk =100 ,  def = 100,  price = 1000  ,  pic="2_1.png" },
    [3] = {id = 3, level=0, kind="饰品", name = "孔雀翎",    wear= 0, star=1,  health = 100   ,  atk =100 ,  def = 100,  price = 1500  ,  pic="3_1.png" },
   -- [4] = {id = 4, level=0, kind="盔甲", name = "狻猊铠",     wear= 1, star=0,  health = 100 ,  atk =300 ,   def = 100,  price = 3000  ,    pic="4_1.png" },
    [4] = {id = 1, level=0, kind="靴子", name = "柳叶绵竹靴", wear= 0, star=2,   health = 100 ,   atk =0 ,    def =100,   price = 500  ,  pic="1_1.png" },
    }     

    wearequ={
    [1] ={} ,           ----  mark  id  
    [2] ={} ,
    [3] ={} ,
    [4] ={} ,
    }       ---  当前穿戴  
     

Hero={
     [1]={

     
     stand2="stand2"    , st2time="",   -- 站立
     walk="walk",        worktime="",  -- 跑步
     fall="fall"        ,faltime="",  -- 死亡
     attack1="attack-3",
    --attack1="attack-1" ,at1time="",   -- 普通攻击
    skill="skill"      ,skltime="",   --   技能1
    change3="change3"  , ch3time="",  -- 技能2
    xuzuostand1="xuzuo-stand1",s1time="",  -- 技能3
    attack2="attack-2" ,at2time="",    --- 技能四
 
     rank = 1 ,       --- 等级 
     exprise = 0  ,     ---  经验    ---   升级  ；
     gold = 1000 ,
     Acer = 100 ,    --- 元宝
     stone = 2 ,   --- 强化石
     locknum = 1 ,   --  解锁的章 数   默认为一
     signdate = 0,               --- 签到 
     signtime = 0,                --  签到时间 
    scenenum  =1,
    chapternum= 1 ,


     equip="equip"      , eqitime="",
     stand="stand" ,    st1time="",
     penhuo="penhuo20"  ,pentime="",
     beaten="beaten"    ,btntime="",
    
     attack3="attack-3" ,at3time="",
     attack4="attack-4" ,at4time="",
     attack5="attack-5" ,at5time="",
     change1="change1"  ,ch1time="",
     change2="change2"  , ch2time="",

    
     xuzuostand2="xuzuo-stand2",s2time="",
     xuzuostand3="xuzuo-stand3",s3time="",
     xuzuowalk1="xuzuo-walk1"  ,w1time="",
     xuzuowalk2="xuzuo-walk2"  ,w2time="",
     xuzuowalk3="xuzuo-walk3"  ,w3time="",
     xuzuohurt="xuzuo-hurt"    ,hutime="",
     xuzuohurt1="xuzuo-hurt1"  ,hu1time="",




     },
     [2]={
     stand="start"      ,    stime="1",
     run="run"          ,    rtime="2",   
     attack1="attack1"  ,    at1time="2",
     attack2="attack2"  ,    at2time="1",
     block="bk"         ,    bktime="3",
     beaten="b"         ,    btime="3",
     fall="f"           ,    ftime="1",
     death="dead"       ,   dtime="1",
     leipi="lp"     ,   ltime="2",
     ranshao="rs"       ,   rtime="3",
     jifei="jf"         ,   jtime="1",
     }
}




function MusicSound()
    if Data.isPlaySound then
        audio.playSound("click.mp3")
    end
end
function MusicBack()
    if Data.isPlayMusic==true then
        audio.playMusic("menubackmusic.mp3",true)
        audio.setMusicVolume(0.75)
    end
end

function getSD()
	return Data.SD
end
function setSD(x)
	Data.SD = x
end
function getHP()
	return Data.HP
end
function setHP(x)
	Data.HP = x
end
function getMP()
	return Data.MP
end
function setMP(x)
	Data.MP = x
end