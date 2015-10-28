module("MonsterData",package.seeall)

--怪物属性表

SCENE={} --总表
SCENE[1] = {} --分表1对应场景1 
						--速度    攻击距离     攻击力     血量       --肉盾--                                             --法师--
SCENE[1][1] = {boy1 = {Speed = 1,range =100,power =100,hp = 1600} ,boy2 = {Speed = 1,range = 70,power = 532,hp = 1800},boy3 = {Speed = 1,range = 220,power = 1356,hp = 11000}}
SCENE[1][2] = {boy1 = {Speed = 1,range =100,power =120,hp = 1700} ,boy2 = {Speed = 1,range = 70,power = 552,hp = 1800},boy3 = {Speed = 1,range = 220,power = 1320,hp = 12000}}
SCENE[1][3] = {boy1 = {Speed = 2,range =120,power =140,hp = 1800} ,boy2 = {Speed = 2,range = 70,power = 570,hp = 2000},boy3 = {Speed = 2,range = 220,power = 1380,hp = 14000}}
SCENE[1][4] = {boy1 = {Speed = 2,range =120,power =160,hp = 1900} ,boy2 = {Speed = 2,range = 80,power = 580,hp = 2100},boy3 = {Speed = 2,range = 220,power = 1369,hp = 16000}}
SCENE[1][5] = {boy1 = {Speed = 3,range =130,power =180,hp = 1900},boy2 = {Speed = 2,range = 80,power = 590,hp = 2300},boy3 = {Speed = 2,range = 220,power = 1451,hp = 18000}}

SCENE[2]={}   --分表2对应场景2
						--速度    攻击距离     攻击力     血量       --肉盾--                                             --法师--
SCENE[2][1] = {boy1 = {Speed = 1,range =100,power =200,hp = 1800} ,boy2 = {Speed = 2,range = 80,power = 620,hp = 2700},boy3 = {Speed = 1,range = 240,power = 1540,hp = 25000}}
SCENE[2][2] = {boy1 = {Speed = 2,range =110,power =220,hp = 1800} ,boy2 = {Speed = 1,range = 80,power = 640,hp = 2800},boy3 = {Speed = 2,range = 280,power = 1460,hp = 24000}}
SCENE[2][3] = {boy1 = {Speed = 2,range =120,power =240,hp = 1900} ,boy2 = {Speed = 2,range = 80,power = 650,hp = 3000},boy3 = {Speed = 1,range = 260,power = 1481,hp = 26000}}
SCENE[2][4] = {boy1 = {Speed = 2,range =130,power =260,hp = 1900} ,boy2 = {Speed = 1,range = 90,power = 680,hp = 3500},boy3 = {Speed = 1,range = 300,power = 1524,hp = 25000}}
SCENE[2][5] = {boy1 = {Speed = 3,range =140,power =280,hp =2000} ,boy2 = {Speed = 2,range = 90,power = 690,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1537,hp = 30000}}

SCENE[3]={}   --分表3对应场景3
						--速度    攻击距离     攻击力     血量       --肉盾--                                             --法师--
SCENE[3][1] = {boy1 = {Speed = 2,range =100,power =300,hp = 1900} ,boy2 = {Speed = 3,range = 80,power = 754,hp = 3000},boy3 = {Speed = 2,range = 320,power = 1431,hp = 32000}}
SCENE[3][2] = {boy1 = {Speed = 3,range =120,power =320,hp = 1900} ,boy2 = {Speed = 2,range = 90,power = 749,hp = 3500},boy3 = {Speed = 2,range = 350,power = 1481,hp = 32000}}
SCENE[3][3] = {boy1 = {Speed = 2,range =130,power =340,hp =2000} ,boy2 = {Speed = 2,range =100,power = 760,hp = 4000},boy3 = {Speed = 2,range = 300,power = 1592,hp = 34000}}
SCENE[3][4] = {boy1 = {Speed = 3,range =150,power =360,hp =2000} ,boy2 = {Speed = 2,range =110,power = 840,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1524,hp = 36000}}
SCENE[3][5] = {boy1 = {Speed = 3,range =180,power =380,hp =2200} ,boy2 = {Speed = 3,range =120,power = 999,hp = 5000},boy3 = {Speed = 3,range = 400,power = 1640,hp = 38000}}
SCENE[4]={}   
SCENE[4][1] = {boy1 = {Speed = 2,range =100,power =400,hp =900} ,boy2 = {Speed = 3,range = 80,power = 754,hp = 3000},boy3 = {Speed = 2,range = 320,power = 1431,hp = 32000}}
SCENE[4][2] = {boy1 = {Speed = 3,range =120,power =420,hp = 2000} ,boy2 = {Speed = 2,range = 90,power = 749,hp = 3500},boy3 = {Speed = 2,range = 350,power = 1581,hp = 35000}}
SCENE[4][3] = {boy1 = {Speed = 2,range =130,power =440,hp =2000} ,boy2 = {Speed = 2,range =100,power = 760,hp = 4000},boy3 = {Speed = 2,range = 300,power = 1592,hp = 38000}}
SCENE[4][4] = {boy1 = {Speed = 3,range =150,power =460,hp =2200} ,boy2 = {Speed = 2,range =110,power = 840,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1624,hp = 41000}}
SCENE[4][5] = {boy1 = {Speed = 3,range =180,power =480,hp =2200} ,boy2 = {Speed = 3,range =120,power = 999,hp = 5000},boy3 = {Speed = 3,range = 400,power = 1740,hp = 42000}}

SCENE[5]={}   
SCENE[5][1] = {boy1 = {Speed = 2,range =100,power =500,hp = 2000} ,boy2 = {Speed = 3,range = 80,power = 754,hp = 3000},boy3 = {Speed = 2,range = 320,power = 1531,hp = 42000}}
SCENE[5][2] = {boy1 = {Speed = 3,range =120,power =520,hp = 2000} ,boy2 = {Speed = 2,range = 90,power = 749,hp = 3500},boy3 = {Speed = 2,range = 350,power = 1581,hp = 45000}}
SCENE[5][3] = {boy1 = {Speed = 2,range =130,power =540,hp =2200} ,boy2 = {Speed = 2,range =100,power = 760,hp = 4000},boy3 = {Speed = 2,range = 300,power = 1692,hp = 48000}}
SCENE[5][4] = {boy1 = {Speed = 3,range =150,power =560,hp =2200} ,boy2 = {Speed = 2,range =110,power = 840,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1724,hp = 51000}}
SCENE[5][5] = {boy1 = {Speed = 3,range =180,power =580,hp =2400} ,boy2 = {Speed = 3,range =120,power = 999,hp = 5000},boy3 = {Speed = 3,range = 400,power = 1800,hp = 52000}}

SCENE[6]={}   
SCENE[6][1] = {boy1 = {Speed = 2,range =100,power =600,hp = 2000} ,boy2 = {Speed = 3,range = 80,power = 754,hp = 3000},boy3 = {Speed = 2,range = 320,power = 1631,hp = 52000}}
SCENE[6][2] = {boy1 = {Speed = 3,range =120,power =620,hp = 2200} ,boy2 = {Speed = 2,range = 90,power = 749,hp = 3500},boy3 = {Speed = 2,range = 350,power = 1681,hp = 55000}}
SCENE[6][3] = {boy1 = {Speed = 2,range =130,power =640,hp =2400} ,boy2 = {Speed = 2,range =100,power = 760,hp = 4000},boy3 = {Speed = 2,range = 300,power = 1792,hp = 58000}}
SCENE[6][4] = {boy1 = {Speed = 3,range =150,power =660,hp =2600} ,boy2 = {Speed = 2,range =110,power = 840,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1824,hp = 61000}}
SCENE[6][5] = {boy1 = {Speed = 3,range =180,power =680,hp =2600} ,boy2 = {Speed = 3,range =120,power = 999,hp = 5000},boy3 = {Speed = 3,range = 400,power = 1940,hp = 62000}}

SCENE[7]={}   
SCENE[7][1] = {boy1 = {Speed = 2,range =100,power =700,hp = 2200} ,boy2 = {Speed = 3,range = 80,power = 754,hp = 3000},boy3 = {Speed = 2,range = 320,power = 1645,hp = 62000}}
SCENE[7][2] = {boy1 = {Speed = 3,range =120,power =720,hp = 2400} ,boy2 = {Speed = 2,range = 90,power = 749,hp = 3500},boy3 = {Speed = 2,range = 350,power = 1781,hp = 65000}}
SCENE[7][3] = {boy1 = {Speed = 2,range =130,power =740,hp =2600} ,boy2 = {Speed = 2,range =100,power = 760,hp = 4000},boy3 = {Speed = 2,range = 300,power = 1892,hp = 68000}}
SCENE[7][4] = {boy1 = {Speed = 3,range =150,power =760,hp =2600} ,boy2 = {Speed = 2,range =110,power = 840,hp = 4500},boy3 = {Speed = 2,range = 320,power = 1924,hp = 71000}}
SCENE[7][5] = {boy1 = {Speed = 3,range =180,power =780,hp =2800} ,boy2 = {Speed = 3,range =120,power = 999,hp = 5000},boy3 = {Speed = 3,range = 400,power = 2040,hp = 72000}}