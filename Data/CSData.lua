module("CSData",package.seeall)

--调用表 CSData.SCENE[][] ...
function getAllStarNum() --得到星星总数
	local starnum = 0
	for i=1,3 do
		for j=1,5 do
			starnum = starnum + CSData.SCENE[i][j].star
		end
	end
	return starnum
end
--locl   1开0关
--star   所得星星数
--boy    怪物数

currentMonsterect = { 
      
       [1] = {},
       [2] = {}

} 

currentMonster=
{

}

MonsterArray=
{

}


currentMonster_Index  = {}

 Monster =
 {
    [1] = { 
             
            ["hurt_newSprite"]="#attack6.png" ,["hurt_newFames"] ="diee%d.png", ["hurt_n1"]=1, ["hurt_n2"]= 2 ,["hurt_timer"]=0.5/2 
           ,["dead_newFrames"] ="diee%d.png", ["dead_n1"]=1  , ["dead_n2"]= 6 
           , ["walk_newFrames"]="attack%d.png",["walk_n1"]=1  , ["walk_n2"]= 6 ,["walk_timer"]=0.5/6 
           ,   ["attackA_newFrames"]="skill%d.png",["attackA_n1"]=1  , ["attackA_n2"]= 5 ,["attackA_timer"]=0.5/6 
            } ,
      [2]  = {             
            ["hurt_newSprite"]="#a1.png" ,["hurt_newFames"] ="d%d.png", ["hurt_n1"]=1, ["hurt_n2"]= 4 ,["hurt_timer"]=0.5/4 
           ,["dead_newFrames"] ="d%d.png", ["dead_n1"]=1  , ["dead_n2"]= 6 
           ,["walk_newFrames"]="b%d.png",["walk_n1"]=1  , ["walk_n2"]= 6 ,["walk_timer"]=0.5/6 
           ,["attackA_newFrames"]="c%d.png",["attackA_n1"]=1  , ["attackA_n2"]= 6 ,["attackA_timer"]=0.5/6 
            }  ,  
       [3]  = {             
            ["hurt_newSprite"]="#stay1.png" ,["hurt_newFames"] ="die%d.png", ["hurt_n1"]=1, ["hurt_n2"]= 2 ,["hurt_timer"]=0.5/2 
           ,["dead_newFrames"] ="die%d.png", ["dead_n1"]=1  , ["dead_n2"]= 6 
           ,["walk_newFrames"]="stay%d.png",["walk_n1"]=1  , ["walk_n2"]= 6 ,["walk_timer"]=0.5/6 
           ,["attackA_newFrames"]="play%d.png",["attackA_n1"]=1  , ["attackA_n2"]= 9 ,["attackA_timer"]=0.5/9 
            }       
}

SCENE={} --总表
SCENE[1] = {} --分表1对应场景1
SCENE[1][1] = {lock = 1, star = 0, boy1 = 5 ,boy2 = 1,boy3 = 0}
SCENE[1][2] = {lock = 0, star = 0, boy1 = 4 ,boy2 = 2,boy3 = 0}
SCENE[1][3] = {lock = 0, star = 0, boy1 = 3 ,boy2 = 3,boy3 = 0}
SCENE[1][4] = {lock = 0, star = 0, boy1 = 2 ,boy2 = 4,boy3 = 1}
SCENE[1][5] = {lock = 0, star = 0, boy1 = 1 ,boy2 = 5,boy3 = 2}

SCENE[2]={}   --分表2对应场景2
SCENE[2][1] = {lock = 0, star = 0, boy1 = 6 ,boy2 = 2,boy3 = 0} --关卡
SCENE[2][2] = {lock = 0, star = 0, boy1 = 5 ,boy2 = 3,boy3 = 0}
SCENE[2][3] = {lock = 0, star = 0, boy1 = 4 ,boy2 = 4,boy3 = 1}
SCENE[2][4] = {lock = 0, star = 0, boy1 = 3 ,boy2 = 5,boy3 = 1}
SCENE[2][5] = {lock = 0, star = 0, boy1 = 2 ,boy2 = 6,boy3 = 2}

SCENE[3]={}   --分表3对应场景3
SCENE[3][1] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 3,boy3 = 0} --关卡
SCENE[3][2] = {lock = 0, star = 0, boy1 = 6 ,boy2 = 4,boy3 = 1}
SCENE[3][3] = {lock = 0, star = 0, boy1 = 5 ,boy2 = 5,boy3 = 1}
SCENE[3][4] = {lock = 0, star = 0, boy1 = 4 ,boy2 = 6,boy3 = 2}
SCENE[3][5] = {lock = 0, star = 0, boy1 = 3 ,boy2 = 7,boy3 = 2}

SCENE[4]={}   --分表4对应场景4
SCENE[4][1] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 4,boy3 = 1} --关卡
SCENE[4][2] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 5,boy3 = 1}
SCENE[4][3] = {lock = 0, star = 0, boy1 = 6 ,boy2 = 6,boy3 = 2}
SCENE[4][4] = {lock = 0, star = 0, boy1 = 5 ,boy2 = 7,boy3 = 2}
SCENE[4][5] = {lock = 0, star = 0, boy1 = 4 ,boy2 = 8,boy3 = 2}

SCENE[5]={}   --分表5对应场景5
SCENE[5][1] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 6,boy3 = 1} --关卡
SCENE[5][2] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 7,boy3 = 2}
SCENE[5][3] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 7,boy3 = 2}
SCENE[5][4] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 8,boy3 = 2}
SCENE[5][5] = {lock = 0, star = 0, boy1 = 6 ,boy2 = 8,boy3 = 3}

SCENE[6]={}   --分表6对应场景6
SCENE[6][1] = {lock = 0, star = 0, boy1 = 9 ,boy2 = 7,boy3 = 2} --关卡
SCENE[6][2] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 7,boy3 = 2}
SCENE[6][3] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 8,boy3 = 2}
SCENE[6][4] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 8,boy3 = 3}
SCENE[6][5] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 9,boy3 = 3}

SCENE[7]={}   --分表7对应场景7
SCENE[7][1] = {lock = 0, star = 0, boy1 = 9 ,boy2 = 7,boy3 = 2} --关卡
SCENE[7][2] = {lock = 0, star = 0, boy1 = 9 ,boy2 = 8,boy3 = 2}
SCENE[7][3] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 8,boy3 = 3}
SCENE[7][4] = {lock = 0, star = 0, boy1 = 8 ,boy2 = 9,boy3 = 3}
SCENE[7][5] = {lock = 0, star = 0, boy1 = 7 ,boy2 = 9,boy3 = 3}