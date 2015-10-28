--
-- Author: student
-- Date: 2015-09-17 19:39:36
--
module("sceneData", package.seeall)
setLayer={}     ----   对设置页面的 BUTTON 进行设置 ，  
land  = 0 
model =  0     --- 网络或单机

        --- 对章 的 解锁     
  gamemodel =0         -- 游戏模式 
                                   
  text  = 
{  
  [1]  = { Text_numchapter  = "第\n一\n章" ,Text_num ="壹" , lock =0 },
  [2]  = { Text_numchapter  = "第\n二\n章" ,Text_num ="贰" , lock =1 },
  [3]  = { Text_numchapter  = "第\n三\n章" ,Text_num ="三" , lock =1 },
  [4]  = { Text_numchapter  = "第\n四\n章" ,Text_num ="肆" , lock =1 },
  [5]  = { Text_numchapter  = "第\n五\n章" ,Text_num ="伍" , lock =1 },
  [6]  = { Text_numchapter  = "第\n六\n章" ,Text_num ="陆" , lock =1 },
  [7]  = { Text_numchapter  = "第\n七\n章" ,Text_num ="柒" , lock =1 },       
}




selectData={}   

 data =
 { 
   [1]={
        [1]={ imag = "res/chapter/bbg_underground_mine.jpg" , imag1 = "res/chapter/bbg_underground_mine_1.png", textname ="路\n阻\n火\n焰\n山" ,Text_gatedes = "推荐等级：1"  ,x = 960  , lock =0 } ,
        [2]={ imag = "res/chapter/bbg_underground_hall.jpg" , imag1 = "res/chapter/bbg_underground_hall_1.png"  , textname ="昆\n仑\n寻\n仙\n子" ,Text_gatedes = "推荐等级：2" ,x = 960, lock =0 },
        [3]={ imag = "res/chapter/bbg_temple_corridor.jpg" , imag1 = "res/chapter/bbg_temple_corridor_1.png"  , textname ="首\n探\n奈\n何\n桥" ,Text_gatedes = "推荐等级：3",x = 960 , lock =1 },
        [4]={ imag = "res/chapter/bbg_temple_circle.jpg" , imag1 = "res/chapter/bbg_temple_circle_1.png"  , textname ="花\n果\n山\n寻\n踪" ,Text_gatedes = "推荐等级：4" ,x = 960, lock =1  },
        [5]={ imag = "res/chapter/bbg_spring.jpg" , imag1 = "res/chapter/bbg_spring_1.png"  , textname ="永\n别\n奈\n何\n桥",Text_gatedes = "推荐等级：5",x = 960   , lock =1  }
     },
[2]={  
        [1]={ imag = "res/chapter/bbg_spring_wooden_city.jpg" , imag1 = "res/chapter/bbg_spring_wooden_city_1.png"  , textname ="摄\n魂\n无\n所\n知",Text_gatedes = "推荐等级：5" ,x = 960 , lock =1  } ,
        [2]={ imag = "res/chapter/bbg_spring_sprite.jpg" , imag1 = "res/chapter/bbg_spring_sprite_1.png"  , textname ="初\n至\n五\n行\n山" ,Text_gatedes = "推荐等级：7" ,x = 960 , lock =1 },
        [3]={ imag = "res/chapter/bbg_spring_ruin.jpg" , imag1 = "res/chapter/bbg_spring_ruin_1.png"  , textname ="斩\n仙\n坛\n偶\n遇" ,Text_gatedes = "推荐等级：10",x = 960 , lock =1  },
        [4]={ imag = "res/chapter/bbg_spring_out_of_city.jpg" , imag1 = "res/chapter/bbg_spring_out_of_city_1.png"  , textname ="广\n寒\n觅\n八\n戒",Text_gatedes = "推荐等级：12"  ,x = 960 , lock =1 },
        [5]={ imag = "res/chapter/bbg_spring_gate.jpg" , imag1 = "res/chapter/bbg_spring_gate_1.png"  , textname ="流\n年\n默\n相\n守",Text_gatedes = "推荐等级：13" ,x = 960  , lock =1 }
  
    },  



    [3]={
        [1]={ imag = "res/chapter/bbg_burning_land.jpg" , imag1 = "res/chapter/bbg_burning_land_1.png"  , textname ="再\n见\n奈\n何\n桥"  ,Text_gatedes = "推荐等级：15",x = 960, lock =1  } ,
        [2]={ imag = "res/chapter/bbg_cave_hall.jpg" , imag1 = "res/chapter/bbg_cave_hall_1.png"  , textname ="水\n下\n有\n洞\n天",Text_gatedes = "推荐等级：16" ,x = 960 , lock =1  },
        [3]={ imag = "res/chapter/bbg_dark_forest.jpg" , imag1 = "res/chapter/bbg_dark_forest_1.png"  , textname ="定\n海\n神\n针\n曲" , Text_gatedes = "推荐等级：18" ,x = 960 , lock =1 },
        [4]={ imag = "res/chapter/bbg_dark_forest_end.jpg" , imag1 = "res/chapter/bbg_dark_forest_end_1.png"  , textname ="跋\n履\n山\n川\n险" , Text_gatedes = "推荐等级：20",x = 960  , lock =1 },
        [5]={ imag = "res/chapter/bbg_spring_ship.jpg" , imag1 = "res/chapter/bbg_spring_ship_1.png"  , textname ="碧\n波\n潭\n盛\n况", Text_gatedes = "推荐等级：22",x = 960 , lock =1   }
     },
  [4]={  
        [1]={ imag = "res/chapter/bbg_e1.png" , imag1 = "res/chapter/bbg_excavate_diamond_l_1.png"  , textname ="隐\n迹\n奈\n何\n桥" ,Text_gatedes = "推荐等级：24"  ,x = 960 , lock =1 } ,
        [2]={ imag = "res/chapter/bbg_excavate_exp_l.jpg" , imag1 = "res/chapter/bbg_excavate_exp_l_1.png"  , textname ="误\n入\n炼\n毒\n窟",Text_gatedes = "推荐等级：28" ,x = 960  , lock =1  },
        [3]={ imag = "res/chapter/bbg_excavate_exp_s.jpg" , imag1 = "res/chapter/bbg_excavate_exp_s_1.png"  , textname ="溯\n流\n知\n隐\n情" ,Text_gatedes = "推荐等级：30" ,x = 960 , lock =1  },
        [4]={ imag = "res/chapter/bbg_excavate_exp_m.jpg" , imag1 = "res/chapter/bbg_excavate_exp_m_1.png"  , textname ="再\n战\n五\n行\n山" ,Text_gatedes = "推荐等级：32",x = 960 , lock =1   },
        [5]={ imag = "res/chapter/bbg_excavate_gold_l.jpg" , imag1 = "res/chapter/bbg_excavate_gold_l_1.png"  , textname ="力\n战\n食\n火\n妖" ,Text_gatedes = "推荐等级：34" ,x = 960 , lock =1  }
      },


[5]={
	    [1]={ imag = "res/chapter/bbg_spring_forest.jpg" , imag1 = "res/chapter/bbg_spring_forest_1.png"  , textname ="惊\n战\n神\n秘\n人" ,Text_gatedes = "推荐等级：36"  ,x = 960 , lock =1 } ,
        [2]={ imag = "res/chapter/bbg_spring_dragonbone.jpg" , imag1 = "res/chapter/bbg_spring_dragonbone_1.png"  , textname ="喋\n血\n奈\n何\n桥",Text_gatedes = "推荐等级：40"  ,x = 960 , lock =1  },
        [3]={ imag = "res/chapter/bbg_spring_beach.jpg" , imag1 = "res/chapter/bbg_spring_beach_1.png"  , textname ="勇\n闯\n南\n天\n门" ,Text_gatedes = "推荐等级：41"  ,x = 960 , lock =1 },
        [4]={ imag = "res/chapter/bbg_snow_road.jpg" , imag1 = "res/chapter/bbg_snow_road_1.png"  , textname ="泣\n雨\n见\n君\n颜"  ,Text_gatedes = "推荐等级：42" ,x = 960, lock =1  },
        [5]={ imag = "res/chapter/bbg_snow_dragon.jpg" , imag1 = "res/chapter/bbg_snow_dragon_1.png"  , textname ="醉\n酒\n且\n当\n歌" ,Text_gatedes = "推荐等级：43" ,x = 960 , lock =1  }
      },
[6]={
        [1]={ imag = "res/chapter/bbg_snow_castle.jpg" , imag1 = "res/chapter/bbg_snow_castle_1.png"  , textname ="奈\n何\n桥\n复\n仇"  ,Text_gatedes = "推荐等级：45",x = 960 , lock =1  } ,
        [2]={ imag = "res/chapter/bbg_snow_bone.jpg" , imag1 = "res/chapter/bbg_snow_bone_1.png"  , textname ="神\n狂\n诛\n鬼\n兵"  ,Text_gatedes = "推荐等级：48" ,x = 960 , lock =1 },
        [3]={ imag = "res/chapter/bbg_sea_board.jpg" , imag1 = "res/chapter/bbg_sea_board_1.png"  , textname ="刑\n天\n舞\n干\n戚" ,Text_gatedes = "推荐等级：49" ,x = 960 , lock =1  },
        [4]={ imag = "res/chapter/bbg_sand_street.jpg" , imag1 = "res/chapter/bbg_sand_street_1.png"  , textname ="横\n扫\n五\n行\n山"  ,Text_gatedes = "推荐等级：50" ,x = 960 , lock =1 },
        [5]={ imag = "res/chapter/bbg_sand_bone.jpg" , imag1 = "res/chapter/bbg_sand_bone_1.png"  , textname ="偈\n语\n梦\n境\n人" ,Text_gatedes = "推荐等级：51",x = 960  , lock =1  }
        },
[7]={
        [1]={ imag = "res/chapter/bbg_night_elf_city.jpg" , imag1 = "res/chapter/bbg_night_elf_city_1.png"  , textname ="追\n杀\n灵\n感\n王" ,Text_gatedes = "推荐等级：52" ,x = 960  , lock =1 } ,
        [2]={ imag = "res/chapter/bbg_fall_grassland.jpg" , imag1 = "res/chapter/bbg_fall_grassland_1.png"  , textname ="千\n里\n战\n英\n魂" ,Text_gatedes = "推荐等级：53" ,x = 960 , lock =1  },
        [3]={ imag = "res/chapter/bbg_fall_cityofmage2.jpg" , imag1 = "res/chapter/bbg_fall_cityofmage2_1.png"  , textname ="秘\n计\n露\n端\n倪" ,Text_gatedes = "推荐等级：54" ,x = 960 , lock =1  },
        [4]={ imag = "res/chapter/bbg_fall_cityofmage.jpg" , imag1 = "res/chapter/bbg_fall_cityofmage_1.png"  , textname ="斧\n战\n南\n天\n门"  ,Text_gatedes = "推荐等级：55",x = 960 , lock =1  },
        [5]={ imag = "res/chapter/bbg_fall_bridge.jpg" , imag1 = "res/chapter/bbg_fall_bridge_1.png"  , textname ="智\n斗\n火\n毕\n方"  ,Text_gatedes ="推荐等级：60",x = 960 , lock =1  }
    }
}