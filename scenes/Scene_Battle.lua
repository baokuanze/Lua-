



local Scene_Battle = class("Scene_Battle", function()
    return display.newScene("Scene_Battle")
end)

function Scene_Battle:ctor()
    audio.playMusic("mp3/backgroundmusic1.mp3",true)
	  self:initBg()
	   self:initHRocker()
    self:initHero()   
	   self:initMs()


  -- 状态监测 

       self.draw = cc.DrawNode:create()    -- hero框
            self:addChild(self.draw)  

        self.draw1 = cc.DrawNode:create()   -- 怪物框
        self:addChild(self.draw1)


        

 self.id = scheduler.scheduleGlobal(handler(self, Scene_Battle.updatePos),1/60)  --- 遥感




end 
function  Scene_Battle:initHRocker()
	 --添加摇杆
	print("--------------------------" .. type(HRocker))
	 -- local a  = cc.Sprite:create("import1.png"):pos(display.cx , display.cy ) :addTo(self)
    --       print(type(HRocker))
    -- self.rocker = HRocker:createHRocker("import2.png","import1.png", cc.p(160, 150))
   -- self.rocker = HRocker:createHRocker("self_ui/Control.png","self_ui/ControlBG.png", cc.p(160, 150))
    self.rocker = HRocker:createHRocker("self_ui/battle_gongji_1.png","self_ui/img_joystick_bg.png", cc.p(160, 150))
    self.rocker:startRocker()
    self.rocker:addTo(self,5)

end
function Scene_Battle:initHero()
   SkillData .Data.P1 = 0
  SkillData .Data.P2 = 0
  SkillData .Data.P3 = 0
  SkillData .Data.P4 = 0
  SkillData .Data.P5 = 0 
    self.heroarray ={}

        HeroData.currentHero_Index  = 1
	self.hero = HeroNode.new() --HeroNode被声明为全局
    self.hero:setPosition(display.cx,display.cy)

    self:addChild(self.hero, 5)
    -- self:HeroZTL() --状态栏
    ModifyData.heroPos.x = self.hero:getPositionX()    --  记录英雄的位置 
    ModifyData.heroPos.y = self.hero:getPositionY()
   print( ModifyData.heroPos.x )
 table.insert(self.heroarray,self.hero)
   print(" ModifyData.heroPos.y " ..  ModifyData.heroPos.y )
  table.insert( ModifyData.heroarray ,self.hero)




-- self.herotwo_pos ={}     -- 第二只英雄的相对位置  
--     HeroData.currentHero_Index  = 2
--    self.hero1 = HeroNode.new() --HeroNode被声明为全局             ---第二只英雄
--     self.hero1:setPosition(display.cx-100,display.cy-200)
--     self:addChild(self.hero1, 5)
--     table.insert(self.heroarray,self.hero1)
--    table.insert( ModifyData.heroarray ,self.hero1  )
  
  
--   self.hero1.toMoved  =true 
--   self.hero1.toAccack =true 
--   self.current = 0

 
 
  

end  


function Scene_Battle:herorun()  --- 辅助英雄的轨迹  
    local speed = 100
    local dis  =  cc.pGetDistance(cc.p(self.hero:getPosition()),cc.p(self.hero1:getPosition()))
    print("dis " .. dis)

    local x = 0 
    local y = 0 
    if  dis> 200 then 
   
           local face = (ModifyData.heroPos.x -self.hero1:getPositionX())>0

      -- local y = (ModifyData.heroPos.y - self.hero1:getPositionY())
      -- local x = (ModifyData.heroPos.x - self.hero1:getPositionX()) 
      -- local y = (ModifyData.heroPos.y - self.hero1:getPositionY())

           if face then --控制面向
             self.hero1:setScaleX(1)
             x = ModifyData.heroPos.x - 50
             y = ModifyData.heroPos.y -50          
             self.fac1 = 0
          else
            self.hero1:setScaleX(-1)
            x = ModifyData.heroPos.x + 50
            y = ModifyData.heroPos.y +50
            self.fac1 = 1
           end      

    end 
    
   local funcN1 = cca.callFunc(function () 

             -- self.hero1:stopAllActions()
            
           self.current = self.fac1
           if self.hero1.player.fsm:canDoEvent("walkAction") then
              self.hero1.player.fsm:doEvent("walkAction")
           end
           local move = cc.MoveTo:create(dis/speed, cc.p(x, y))
             print("移动")
             self.hero1:runAction(move)           
            end) 
        local funcN2 = cca.callFunc(function ()   
            
     end) 
        local funcN3 = cca.callFunc(function () 

        if self.hero1.player.fsm:canDoEvent("stopAction") then
            self.hero1.player.fsm:doEvent("stopAction")
        end
       self.hero1.toAccack =true   
        self.hero1.toMoved  =true 
        end)


    if dis > 200 and   self.hero1.toMoved  ==true  then 
       self.hero1.toAccack =false 
        self.hero1.toMoved  =false 
        local seq = cc.Sequence:create(funcN1,cc.DelayTime:create(dis/speed) ,funcN2 ,funcN3)
        self:runAction(seq)   
    elseif  self.current ~= self.fac1 then
        self.hero1.toMoved  =true
                     if self.hero1.player.fsm:canDoEvent("stopAction") then
                       self.hero1.player.fsm:doEvent("stopAction")
                    end
      elseif self.hero1.toAccack ==true  and  self.hero1.toMoved ==true then  
   
             -- self.hero1.toAccack =false  
        self:heroattack ()
 
      end 
print("调用定时器")

 





end
function Scene_Battle:heroattack ()
      local speed = 100
    local mindis = 0
    local v1 ={}
    for i,v in ipairs(self.Ms1Array) do
        local dis  =  cc.pGetDistance(cc.p(self.hero1:getPosition()),cc.p(v:getPosition()))
        if i ==1 then  
            mindis= dis
            v1 = v
        elseif i>1 then 
               if mindis> mindis then 
                mindis= dis
                v1 = v
               end 
        end 

    end
 if mindis <  200 then 
    print("进入可攻击状态")

    local face = (self.hero1:getPositionX() -v1:getPositionX())>0
     local x =   v1 :getPositionX()
         if face then --控制面向
           self.hero1:setScaleX(-1)   
           self.fac1 = 0
           x = x +30
      else
          self.hero1:setScaleX(1)
          self.fac1 = 1
            x = x -30
      end     
    local y =  v1 :getPositionY()
 local time=0
    local funcN1 = cca.callFunc(function () 
      self.hero1.toAccack =false     
      self.hero1.toMoved =false
       if self.hero1.player.fsm:canDoEvent("walkAction") then
          self.hero1.player.fsm:doEvent("walkAction")
        end
         time = mindis/speed
        if time <2 then 
          time = 2
        end 
        
        local move = cc.MoveTo:create(time, cc.p(x, y)) 
             print("attack hero1移动")
             self.hero1:runAction(move) 
             print("执行")

     end)
    local funcN2 = cca.callFunc(function () 
           if self.hero1.player.fsm:canDoEvent("attackPAction") then
          self.hero1.player.fsm:doEvent("attackPAction")
          end

     end) 

    local funcN4 = cca.callFunc(function () 
    
      if self.hero1.player.fsm:canDoEvent("stopAction") then
          self.hero1.player.fsm:doEvent("stopAction")
      end  
    
     end) 

     local funcN5 = cca.callFunc(function () 
    
      
       self.hero1.toAccack =true 
        self.hero1.toMoved =true 
     end) 

      local seq = cc.Sequence:create(funcN1,cc.DelayTime:create(time+2), funcN2,cc.DelayTime:create(3.0), funcN4,cc.DelayTime:create(1.0) ,funcN5) 
       self:runAction(seq)  
  end   

  
end

function Scene_Battle:initMs()
    --添加怪物
    local Sc = ModifyData.getSceneNum()
    local Ch = ModifyData.getChapterNum()
    self.Ms1Array = {}
  CSData.MonsterArray={}

   self.Ms1num = CSData.SCENE[Sc][Ch].boy1
  self.Ms2num = CSData.SCENE[Sc][Ch].boy2
   self.Ms3num = CSData.SCENE[Sc][Ch].boy3
      -- table.insert(CSData.MonsterArray,MsNode3)
    self:updateMons()
 
end
function Scene_Battle:updateMons()
         
 for i=1,self.Ms1num do
  local x1 = math.random(0,500) 
   local y1 = math.random(10,600) 
   CSData.currentMonster_Index = 1
   local MsNode1 = OneMonsterNode:new()
   -- if i ==1 then 
    MsNode1:setPosition(x1 ,y1)
  
     table.insert(self.Ms1Array,MsNode1)
     table.insert(CSData.MonsterArray,MsNode1) --- 将怪物框架插入表中
     self:addChild(MsNode1,1)
       end 

 for i=1,self.Ms2num do
   local x2 = math.random(0,500) + 40
   local y2 = math.random(10,420) 
   CSData.currentMonster_Index = 2
   local MsNode2 = OneMonsterNode:new()
    MsNode2:setPosition(x2 ,y2)
     table.insert(self.Ms1Array,MsNode2)
     table.insert(CSData.MonsterArray,MsNode2) --- 将怪物框架插入表中
     self:addChild(MsNode2,1)
  end

 for i=1,self.Ms3num do
   local x3 = math.random(0,500) + 40
   local y3 = math.random(10,600) + 120
   CSData.currentMonster_Index = 3
   local MsNode3 = OneMonsterNode:new()
    MsNode3:setPosition(x3 ,y3)
    table.insert(self.Ms1Array,MsNode3)
    table.insert(CSData.MonsterArray,MsNode3) --- 将怪物框架插入表中
    self:addChild(MsNode3,1)

end 

 

end 


function Scene_Battle:initBg()
   local data =  sceneData .selectData 
	-- local data =  sceneData.data[1][1]
 -- sceneData.selectData = sceneData.data[1][1]
	 local bg =   cc.Sprite:create(	data.imag) 
	 bg:setPosition(display.cx, display.cy)
	 self:addChild(bg) 

self.ButtonSet = ccui.Button:create( "set.png","set.png")     --- 设置 
  self.ButtonSet:setPosition(50,display.top-50)
 self.ButtonSet :addTo(self)
   self.ButtonSet :setTouchSwallowEnabled(false)
   self.ButtonSet:addTouchEventListener(function (sender,state )
  if   (state ==2)then
      print("点击设置")
       sceneData .setLayer  = 1
      cc.Director:getInstance():pause()--暂停
     local   SetLaye = SetLayer.new()
     self:addChild(SetLaye,5)        
   end
  end) 



end 

function Scene_Battle:updatePos() 
     self.hero:setRockbackData(self.rocker.rocketDirection,self.rocker.rocketRun) --人物走动
       self: Ms1coll()  -- 对第一种怪物 监测 
       self:Herolose_Hp() 
      -- self:herorun()

end 
-- function Scene_Battle: Ms3coll() 
    
--     local frame = self.hero.player:getTextureRect()
--     local HeroRect = self:newHeroRect( self.hero,frame)
--     for i,v in ipairs(self.Ms3Array) do


        
--     end            
-- end 
function Scene_Battle:Ms3_v3(v , i)
    -- local frame = self.hero.player:getTextureRect()
       local frame = self.hero.player:getBoundingBox()
       -- local frame = self.hero.player:getBone("weapons"):getBoundingBox()
       local HeroRect = self:newHeroRect(self.hero,frame)

            local MsFrame = v.Ms3:getTextureRect()         --怪兽的矩形区域
            local w = MsFrame.width
        
            local h = MsFrame.height
             --  print("怪物的宽度" .. w)
             -- print("怪物的高度" .. h)
             
            local RectMs = self:newMonsterRect( v,w,h )
            if cc.rectIntersectsRect(RectMs, HeroRect) and (SkillData.Data.P1 == 1 or SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1) then              
                  --audio.playSound ("mp3/blood.mp3",false)
                if SkillData.Data.P1 == 1 then
                         print( "----  已经碰撞监测到  "  )
                    if v.Ms3.fsm:canDoEvent("hurtAction") then
                        v.Ms3.fsm:doEvent("hurtAction")
                        --伤害飘血
                        print("--伤害飘血")
                        local pow = HeroData.Data.A1 + math.random(HeroData.Data.A1/5,HeroData.Data.A1)
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                    end
                elseif SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1 
                     then
                    if v.Ms3.fsm:canDoEvent("hurtAction") then

                        v.Ms3.fsm:doEvent("hurtAction")
                       
                        -- --飘血
                        local pow = HeroData.Data.A2 + math.random(HeroData.Data.A2/5,HeroData.Data.A2)
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                        
                    end
                end
 -- --怪物死亡
               if v.MsHp<=0 and v.Ms3.fsm:canDoEvent("deadAction") then
                    local func1 = cca.callFunc(function() v.Ms3.fsm:doEvent("deadAction") 
                  --  table.remove(self.Ms1Array,i) 
                    --  table.remove(CSData.MonsterArray,i)
                            -- self:possible_win()
                     end)
                    local func2 = cca.callFunc(function() v:removeFromParent() 
                    local Mp = 2 + math.random(0,8)

                    -- if (ModifyData.getMP()+Mp)>=200 then
                    --   ModifyData.setMP(200)
                    -- else
                    --   ModifyData.setMP(ModifyData.getMP()+Mp)
                    -- end

                    local lab = Flylabel:create(Mp,"MpText.fnt")
                    self.hero:addChild(lab,10)
                    end)
                    local Seq = cc.Sequence:create(func1,cc.DelayTime:create(0.5),func2)
                     v:runAction(Seq)
                     v.HpBar:setPercentage(0)
                    
                else
                    print("刷新血条")
                   v.HpBar:setPercentage(100*v.MsHp/v.Hp)
                end

            end 
            --被攻击的怪物停止移动
           if v.Zt==false then
             v.Zt = true
             v:performWithDelay(function() v.Zt = false end, 0.4)
            end

end  


function Scene_Battle:Ms1_v1(v , i)
    -- local frame = self.hero.player:getTextureRect()
       local frame = self.hero.player:getBoundingBox()
       -- local frame = self.hero.player:getBone("weapons"):getBoundingBox()
     local HeroRect = self:newHeroRect(self.hero,frame)

            local MsFrame = v.Ms1:getTextureRect()         --怪兽的矩形区域
            local w = MsFrame.width
        
            local h = MsFrame.height
             --  print("怪物的宽度" .. w)
             -- print("怪物的高度" .. h)
             
            local RectMs = self:newMonsterRect( v,w,h )
            if cc.rectIntersectsRect(RectMs, HeroRect) and (SkillData.Data.P1 == 1 or SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1) then              
                 -- audio.playSound ("mp3/blood.mp3",false)
                if SkillData.Data.P1 == 1 then
                         print( "----  已经碰撞监测到  "  )
                

                    if v.Ms1.fsm:canDoEvent("hurtAction") then
                        v.Ms1.fsm:doEvent("hurtAction")
                        --伤害飘血
                        print("--伤害飘血")
                        local pow = HeroData.Data.A1 + math.random(HeroData.Data.A1/5,HeroData.Data.A1)
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                    end
                elseif SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1
                    then
                    if v.Ms1.fsm:canDoEvent("hurtAction") then
                        v.Ms1.fsm:doEvent("hurtAction")
                        -- --飘血
                        local pow = HeroData.Data.A2 + math.random(HeroData.Data.A2/5,HeroData.Data.A2)+ HeroData .Data.attak
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                        
                    end

          
 


                end
 -- --怪物死亡
               if v.MsHp<=0 and v.Ms1.fsm:canDoEvent("deadAction") then

                    local func1 = cca.callFunc(function() v.Ms1.fsm:doEvent("deadAction") 
                    --table.remove(self.Ms1Array,i) 
                     -- table.remove(CSData.MonsterArray,i)
                       -- self:possible_win()
                     end)
                    
                    local func2 = cca.callFunc(function() v:removeFromParent() 
                    local Mp = 2 + math.random(0,8)

                    -- if (ModifyData.getMP()+Mp)>=200 then
                    --   ModifyData.setMP(200)
                    -- else
                    --   ModifyData.setMP(ModifyData.getMP()+Mp)
                    -- end

                    local lab = Flylabel:create(Mp,"MpText.fnt")
                    self.hero:addChild(lab,10)
                    end)

                    local Seq = cc.Sequence:create(func1,cc.DelayTime:create(0.5),func2)
                     v:runAction(Seq)
                     v.HpBar:setPercentage(0)
                  
                else
                    print("刷新血条")
                   v.HpBar:setPercentage(100*v.MsHp/v.Hp)
                end

            end 
            --被攻击的怪物停止移动
           if v.Zt==false then
             v.Zt = true
             v:performWithDelay(function() v.Zt = false end, 0.4)
            end

 


end  


function Scene_Battle:Ms2_v2(v , i)

   local frame = self.hero.player:getBoundingBox()
       -- local frame = self.hero.player:getBone("weapons"):getBoundingBox()
     

     local HeroRect = self:newHeroRect(self.hero,frame)

            local MsFrame = v.Ms2:getTextureRect()         --怪兽的矩形区域
            local w = MsFrame.width
        
            local h = MsFrame.height
      
               
            local RectMs = self:newMonsterRect( v,w,h )
            if cc.rectIntersectsRect(RectMs, HeroRect) and (SkillData.Data.P1 == 1 or SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1) then              
                 --audio.playSound ("mp3/blood.mp3",false)
                if SkillData.Data.P1 == 1 then
                         print( "----  已经碰撞监测到  "  )
                          
                    if v.Ms2.fsm:canDoEvent("hurtAction") then
                        v.Ms2.fsm:doEvent("hurtAction")
                        --伤害飘血
                        print("--伤害飘血")
                        local pow = HeroData.Data.A1 + math.random(HeroData.Data.A1/5,HeroData.Data.A1)+HeroData .Data.attak
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                    end
                elseif SkillData.Data.P2 == 1 or SkillData.Data.P3 == 1 or SkillData.Data.P4 == 1 or SkillData.Data.P5 == 1
                    then
                    if v.Ms2.fsm:canDoEvent("hurtAction") then
                        v.Ms2.fsm:doEvent("hurtAction")
                        -- --飘血
                        local pow = HeroData.Data.A2 + math.random(HeroData.Data.A2/5,HeroData.Data.A2)+HeroData .Data.attak
                        local lab = Flylabel:create(pow,"NumFont.fnt")
                        v:addChild(lab,10)
                        v.MsHp = v.MsHp - pow
                        
                    end

          
 


                end
 -- --怪物死亡
               if v.MsHp<=0 and v.Ms2.fsm:canDoEvent("deadAction") then
                    local func1 = cca.callFunc(function() 
                      v.Ms2.fsm:doEvent("deadAction") 
                    -- table.remove(self.Ms1Array,i) 
                    --   table.remove(CSData.MonsterArray,i)
             
                     end)
                    
                    local func2 = cca.callFunc(function() v:removeFromParent() 
                    local Mp = 2 + math.random(0,8)

                    -- if (ModifyData.getMP()+Mp)>=200 then
                    --   ModifyData.setMP(200)
                    -- else
                    --   ModifyData.setMP(ModifyData.getMP()+Mp)
                    -- end

                    local lab = Flylabel:create(Mp,"MpText.fnt")
                    self.hero:addChild(lab,10)
                    end)

                    local Seq = cc.Sequence:create(func1,cc.DelayTime:create(0.5),func2)
                     v:runAction(Seq)
                     v.HpBar:setPercentage(0)
                    
                else
                    print("刷新血条")
                   v.HpBar:setPercentage(100*v.MsHp/v.Hp)
                end
           
            end 
            --被攻击的怪物停止移动
           if v.Zt==false then
             v.Zt = true
             v:performWithDelay(function() v.Zt = false end, 0.4)
            end



end  



function Scene_Battle: Ms1coll() 
      -- local frame = self.hero.player:getTextureRect()
     -- local frame = self.hero.player:getBoundingBox()
     --  local HeroRect = self:newHeroRect( self.hero,frame )
        --第一种怪物的碰撞检测
    for i,v in ipairs(self.Ms1Array) do
        -- if v.Ms1~=nil then
            if v.Ms3~=nil then
              self:Ms3_v3(v ,i)
            elseif v.Ms2~=nil then
              self:Ms2_v2(v ,i)
            elseif v.Ms1~=nil then
              self:Ms1_v1(v ,i)
            end 

    end        


self:possible_win()
   

end 
function  Scene_Battle:possible_win()
 for i,v in ipairs(self.Ms1Array) do
    if    v.MsHp<=0  then  
    table.remove(self.Ms1Array,i)  
    table.remove(CSData.MonsterArray,i)
    end 
 end


 
   if # self.Ms1Array  == 0 then  

    scheduler.unscheduleGlobal(self.id)         --关闭碰撞检测
    scheduler.unscheduleGlobal(self.hero.is)    --关闭摇杆
    scheduler.unscheduleGlobal(self.rocker.id)    --  关闭 技能缓冲定时器
    audio.stopAllSounds()
    -- if HeroData.Data.isPlaySound then
    --     audio.playSound("failure.mp3", false)
    -- end
   

     self:modify()
  
   
    self:performWithDelay(function() 
    audio.stopAllSounds()   
       audio.playSound("mp3/victory.mp3", false)
      local win = WinLayer.new()
      win:setPosition(0, 0)
      win:addTo(self,10)  
    end, 2)



 end 

end 

 

function Scene_Battle:modify()
local SceneNum = ModifyData.getSceneNum()
local ChapterNum = ModifyData.getChapterNum()
   if  ChapterNum == 5 then  
         if sceneData.data[ SceneNum+1] then
            HeroData.Hero[1].locknum=SceneNum+1
            local str1 = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str1 , 1)

          sceneData.data[SceneNum+1][1] .lock=0  -- 解锁   
         else
           print("恭喜你全部通关")

         end 
   else
      sceneData.data[SceneNum][ChapterNum+1] .lock=0  -- 解锁
   end  

   local str = json.encode(sceneData.data)
 ModifyData.WriteDataToDoc(str , 2)


end 




function Scene_Battle:Herolose_Hp ()    -- 英雄失血

  for i,v in ipairs(self.Ms1Array) do
        if v.Ms1~=nil then
            if v.Ms1.MsAc == true then
               audio.playSound ("mp3/d_hz_lly.mp3",false) 
                print("英雄受伤2")
                v.Ms1.MsAc = false
                local pow = v.MsPower + math.random(v.MsPower/5,v.MsPower)
                local lab = Flylabel:create(pow,"MStext.fnt")
                self.hero:addChild(lab,10) --飘血
                self.hero.MoHp = self.hero.MoHp - pow
                if self.hero.MoHp<=0 then  
                    self.hero.HpBar:setPercentage(0)
                           self:Defeated()
                    break
                else
                    self.hero.HpBar:setPercentage(100*self.hero.MoHp/self.hero.Hp)
                end
            end 
        end 

          
         if v.Ms2~=nil then
            if v.Ms2.MsAc == true then
               audio.playSound ("mp3/d_hz_lly.mp3",false) 
                print("英雄受伤2")
                v.Ms2.MsAc = false
                local pow = v.MsPower + math.random(v.MsPower/5,v.MsPower)
                        local lab = Flylabel:create(pow,"MStext.fnt")
                        self.hero:addChild(lab,10) --飘血
                        self.hero.MoHp = self.hero.MoHp - pow
                    if self.hero.MoHp<=0 then                
                       self.hero.HpBar:setPercentage(0)
                                self:Defeated()
                        break
                    else
                        self.hero.HpBar:setPercentage(100*self.hero.MoHp/self.hero.Hp)
                    end
            end 
        end 


        
         if v.Ms3~=nil then
            if v.Ms3.MsAc == true then
                 audio.playSound ("mp3/d_hz_lly.mp3",false) 
                print("英雄受伤3")
                v.Ms3.MsAc = false
                local pow = v.MsPower + math.random(v.MsPower/5,v.MsPower)
                        local lab = Flylabel:create(pow,"MStext.fnt")
                        self.hero:addChild(lab,10) --飘血
                        self.hero.MoHp = self.hero.MoHp - pow
                    if self.hero.MoHp<=0 then                
                       self.hero.HpBar:setPercentage(0)
                                self:Defeated()
                        break
                    else
                        self.hero.HpBar:setPercentage(100*self.hero.MoHp/self.hero.Hp)
                    end
            end 
        end 



   end 

 



end 



function Scene_Battle:Defeated() --失败
    scheduler.unscheduleGlobal(self.id)         --关闭碰撞检测
    scheduler.unscheduleGlobal(self.hero.is)    --关闭摇杆
    scheduler.unscheduleGlobal(self.rocker.id)    --  关闭 技能缓冲定时器
    audio.stopAllSounds()
    -- if HeroData.Data.isPlaySound then
    --     audio.playSound("failure.mp3", false)
    -- end
  

  self:performWithDelay(function()
       audio.stopAllSounds() 
    audio.playSound ("mp3/failure.mp3",false)     
local loseLayer = Loselayer.new()
    loseLayer:setPosition(0, 0)
    loseLayer:addTo(self,10)
     self:stopMster()
    end, 2)
    
    -- loseLayer:setTouchEnabled(false)

    -- local func = cca.callFunc(function() loseLayer:setTouchEnabled(true) end)
    -- local move = cc.MoveTo:create(1.0,cc.p(0,60))
    -- local Seq = cc.Sequence:create(move,func)

    -- loseLayer:runAction(move)

  self.hero.player:doEvent("deadAction")  --英雄死亡
   -- self:stopMster() --怪物移除
  -- self.hero.player.fsm:doEvent("deadAction")  --英雄死亡
  --   self:stopMster() --怪物移除

end
function Scene_Battle:stopMster() --停止所有怪物的行动
    for k,v in pairs(self.Ms1Array) do
        v:removeFromParent()

    end

    for k,v in pairs(self.Ms2Array) do
        v:removeFromParent()
    end
    for k,v in pairs(self.Ms3Array) do
        v:removeFromParent()
    end
end



function Scene_Battle:newMonsterRect( v,width,height )     --  怪物框架  
        local x = v:getPositionX()
        local y = v:getPositionY()
-- print("newMonsterRect width" .. width)
-- print("newMonsterRect height" .. height)
-- print("newMonsterRect X" .. x)
-- print("newMonsterRect Y" .. y)

        local rect = cc.rect(x-width/2, y, width,height-20)
        -- self.draw1:clear()
     
        -- self.draw1:drawRect(cc.p(x-width/2,y),cc.p(x+width/2,y+height-20), cc.c4f(1,0,0,1))
        return rect
end



function Scene_Battle:newHeroRect( v,frame )
          local width = frame.width
        local height = frame.height
        local x = v:getPositionX()
        local y = v:getPositionY()
        if self.rocker.rocketRun then--print("左")
            x = x - width+100
            width = width-65
            height = 60
            else--print("右")
            x = x-30
            width = width*3.0/4 - 30
            height = 60
        end
        if SkillData.Data.P1 == 1 then
            x = v:getPositionX()
            y = v:getPositionY()
            width = frame.width
            height = frame.height
            
            if self.rocker.rocketRun then--print("左")
                x = x - width+100
                width = width-60
                height = 60
                else--print("右")
                x = x-10
                width = width*3.0/4 - 10
                height = 60
            end
        elseif SkillData.Data.P2 == 1 then
                y = v:getPositionY()
                y = y-30
        elseif SkillData.Data.P3 == 1 then
            if self.rocker.rocketRun then--print("左")
                x = v:getPositionX()
                x = x - width/2
                height = 80
                else--print("右")
                x = x-10
                width = width
                height = 80
            end
        elseif SkillData.Data.P4 == 1 then
            x = v:getPositionX()
            y = v:getPositionY()
            width = frame.width
            height = frame.height
             if self.rocker.rocketRun then   --- 左
            x = x - width+60
            width =width
            height = 70

          else     --- 右
             x = x +60
            width =width
            height = 70

          end 


        elseif SkillData.Data.P5 == 1 then
            x = v:getPositionX()
            y = v:getPositionY()
            width = frame.width
            height = frame.height
            if self.rocker.rocketRun then--print("左")
              print("左边")
                x = x - width/2+80
                width = width*0.2
                height = 60
            else--print("右")
                  print("右边")       
             
                ---   在这个位置的状态监测    --  have a trouble      
                 -- local zx = {} 
                 -- local zx  =  self:convertToWorldSpace(cc.p(v.player:getBone("weapons"):getPositionX(),v.player:getBone("weapons"):getPositionY()))
                 x = x +80                                  
                width = width/3
                height = 60
            end
        end
        local rect = cc.rect(x, y, width,height)
        -- self.draw:clear()
        -- self.draw:drawRect(cc.p(x,y),cc.p(x+width,y+height), cc.c4f(1,0,0,1))
        return rect
        
end

function Scene_Battle:onEnter()

end

function Scene_Battle:onExit()
    scheduler.unscheduleGlobal(self.id)         --关闭碰撞检测
    scheduler.unscheduleGlobal(self.hero.is)    --关闭摇杆
    scheduler.unscheduleGlobal(self.rocker.id)    --  关闭 技能缓冲定时器
end

return Scene_Battle