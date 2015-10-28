--
-- Author: student
-- Date: 2015-09-22 15:33:49
--

local OneMonsterNode =class("OneMonsterNode", function (  )
	return display.newNode()
end)


function OneMonsterNode:ctor( )
	 display.addSpriteFrames("firemonster.plist" ,"firemonster.png")
	 display.addSpriteFrames("boy.plist" ,"boy.png")
	 display.addSpriteFrames("BOOS.plist" ,"BOOS.png")
	self.Zt=false 


    local Sc = ModifyData.getSceneNum()
    local Ch = ModifyData.getChapterNum()

if CSData.currentMonster_Index  == 1 then 
 self.Ms1=require("app.Moster.OneMoster"):new()
    self.Ms1.kind = 1     
    self.Ms1:addTo(self)
    self.Ms1:setAnchorPoint(0.5,0.5)
   self.Ms1:setPosition(0,40)
   self.Ms1:setFlippedX(true)
      --添加血条
 self:MsProgressTimer()
   -- --跟随英雄移动
  -- self:GoonMs()
      self.Hp =  MonsterData.SCENE[Sc][Ch].boy1.hp
    self.MsHp = MonsterData.SCENE[Sc][Ch].boy1.hp
    self.MsPower = MonsterData.SCENE[Sc][Ch].boy1.power


elseif CSData.currentMonster_Index  == 2 then 
	print("进入了二")
   self.Ms2=require("app.Moster.OneMoster"):new()
    self.Ms2.kind = 2     
    self.Ms2:addTo(self)
    self.Ms2:setAnchorPoint(0.5,0.5)
   self.Ms2:setPosition(0,45)
   self.Ms2:setFlippedX(true)
      --添加血条
 self:MsProgressTimer()
 self.Hp =  MonsterData.SCENE[Sc][Ch].boy2.hp
    self.MsHp = MonsterData.SCENE[Sc][Ch].boy2.hp
    self.MsPower = MonsterData.SCENE[Sc][Ch].boy2.power


elseif CSData.currentMonster_Index  == 3 then 
   print("进入了三")
   self.Ms3=require("app.Moster.OneMoster"):new()
    self.Ms3.kind = 3     
    self.Ms3:addTo(self)
    self.Ms3:setAnchorPoint(0.5,0.5)
   self.Ms3:setPosition(0,80)
   self.Ms3:setFlippedX(true)
   self:MsProgressTimer1()
    self.Hp =  MonsterData.SCENE[Sc][Ch].boy3.hp
    self.MsHp = MonsterData.SCENE[Sc][Ch].boy3.hp
    self.MsPower = MonsterData.SCENE[Sc][Ch].boy3.power

 end 

   -- --跟随英雄移动
  self:GoonMs()



 


  







  



--血量
-- self.MsHp=1000

end
-- function OneMonsterNode:GoonMs() --跟随人物
--     -- local sceneNum = ModifyData.getSceneNum()
--     -- local chapterNum = ModifyData.getChapterNum()
--     -- -- local speed = MonsterData.SCENE[sceneNum][chapterNum].boy3.Speed
--     -- local Range = MonsterData.SCENE[sceneNum][chapterNum].boy3.range

--     --    local sceneNum = ModifyData.getSceneNum()
--     -- local chapterNum = ModifyData.getChapterNum()
--     local speed =10
--     local Range =10
--     EnemyGoonMudo:enemyGoon(self,self.Ms1,speed,Range)
-- end


 function OneMonsterNode:MsProgressTimer1()
 -- 	local barBg=display.newSprite("hp.png",0,150)
	-- barBg:addTo(self,1)
	 -- 血条
	 self.HpSp=display.newSprite("hpbg.png")
	 self.HpBar=cc.ProgressTimer:create(self.HpSp)
	 self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)

	 self.HpBar:setMidpoint(cc.p(0,0.5))
	 self.HpBar:setBarChangeRate(cc.p(1,0))
	 self.HpBar:setPercentage(100)
	 self.HpBar:setPosition(0,180)
	 self:addChild(self.HpBar, 1)

  end 

function OneMonsterNode:MsProgressTimer(  )
	-- local barBg=display.newSprite("battle_bar_direnhp_1.png",0,90)
	-- barBg:addTo(self,1)
	 -- 血条
	 self.HpSp=display.newSprite("bar_hp.png")
	 self.HpBar=cc.ProgressTimer:create(self.HpSp)
	 self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)

	 self.HpBar:setMidpoint(cc.p(0,0.5))
	 self.HpBar:setBarChangeRate(cc.p(1,0))
	 self.HpBar:setPercentage(100)
	 self.HpBar:setPosition(0,90)
	 self:addChild(self.HpBar, 1)
end


function OneMonsterNode:GoonMs(  ) --跟随人物移动
local speed=10
local range=100
 print("怪物 位置x" .. self : getPositionX()  )
  print("怪物 位置y" .. self : getPositionY()  )
  if CSData.currentMonster_Index  == 1 then 
     EnemyGoonMudo:enemyGoon(self,self.Ms1,10,range)
 elseif CSData.currentMonster_Index== 2 then 
  	 EnemyGoonMudo:enemyGoon(self,self.Ms2,10,range)
 elseif CSData.currentMonster_Index== 3 then 
     EnemyGoonMudo:enemyGoon(self,self.Ms3,5,range)
 end 

end

return OneMonsterNode