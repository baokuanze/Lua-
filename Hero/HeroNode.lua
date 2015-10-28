scheduler = require(cc.PACKAGE_NAME .. ".scheduler") --计时器对象


local HeroNode = class("HeroNode", function( )
	return display.newNode()
end)
function HeroNode:ctor( )
	self:init()


end
function HeroNode:initProgressTimer()
    local barBg = display.newSprite("hp.png",0,150)
    barBg:addTo(self,1)

self.HPSp = display.newSprite("hpbg.png")
    self.HpBar = cc.ProgressTimer:create(self.HPSp)
    self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)  --设置为条形 type:cc.PROGRESS_TIMER_TYPE_RADIAL
    self.HpBar:setMidpoint(cc.p(0,0.5))             --设置起点在左边 1,0 起点在右边
    self.HpBar:setBarChangeRate(cc.p(1,0))          --设置为竖直方向
    self.HpBar:setPercentage(100)                   --设置初始进度为30
    self.HpBar:setPosition(0,150)
    self:addChild(self.HpBar,1)
       print("self.HpBar"..self.HpBar:getPositionX() )
end


function HeroNode:initProgressTimer1()
 local barBg = display.newSprite("hp.png",0,90)
    barBg:addTo(self,1)
self.HPSp = display.newSprite("hpbg.png")
    self.HpBar = cc.ProgressTimer:create(self.HPSp)
    self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)  --设置为条形 type:cc.PROGRESS_TIMER_TYPE_RADIAL
    self.HpBar:setMidpoint(cc.p(0,0.5))             --设置起点在左边 1,0 起点在右边
    self.HpBar:setBarChangeRate(cc.p(1,0))          --设置为竖直方向
    self.HpBar:setPercentage(100)                   --设置初始进度为30
    self.HpBar:setPosition(0,90)
    self:addChild(self.HpBar,1)
       print("self.HpBar"..self.HpBar:getPositionX() )


end  

function HeroNode:setRockbackData( Direction,Run,ButJn,Jntime )
	self.rocketDirection=Direction
	self.rocketRun = Run
end
function HeroNode:init()

if  HeroData.currentHero_Index ==2 then     --- 小黑人   
        self.t1 ={"daiji0.plist"}
        self.t2 ={"daiji0.png"}
        -- print( self.t1[1])
    
            display.addSpriteFrames("1009_role.plist", "1009_role.png")
      self.player = Player:new()
      print("HeroData.currentHero_Index ".. HeroData.currentHero_Index  )
      self.player.id = HeroData.currentHero_Index 
      self:addChild(self.player)


elseif  HeroData.currentHero_Index ==1 then  
               local HeroRole = require("app.Hero.HeroRole")
                 self.player = HeroRole.new()
                self:addChild(   self.player)
                self:setAnchorPoint(0.5,0.5)
                self.player:setAnchorPoint(0.5,0.5)
                self.player:setPosition(20,60)
                 self.player:setScale(0.8)
               if  self.player:canDoEvent("start") then
                 self.player:doEvent("start")
                end
              self.player.id  = HeroData.currentHero_Index 
             if self.player.id  == 1 then 
                 self:schedulerDemo()
             end 
            self:initProgressTimer()     
end 


    -- self.player.fsm:doEvent("stopAction")
    -- local effupSp = display.newSprite("hero_effup.png",5,20)
    -- effupSp:addTo(self,1)

    --英雄的属性
    local equihp = 0 
    local attak = 0 
    for i,v in ipairs(HeroData.pagkeequ) do
        if  v. wear == 1 then 

             equihp =  equihp + v.health
             attak = attak +v.atk
        end 
    end
          HeroData .Data.attak  = attak+HeroData.Hero[1].rank*200
         HeroData.setHP(1000+HeroData.Hero[1].rank*500 + equihp )

    self.Hp = HeroData.getHP()
    print("英雄的属血量"..   self.Hp)

    self.MoHp = HeroData.getHP()


  
end
function HeroNode:newRect(v)
        local size = v:getContentSize()
        local x = v:getPositionX()
        local y = v:getPositionY()
        local rect = cc.rect(x-size.width/2, y-size.height/2, size.width, size.height)
        return rect
end
function getHero()
    return self.player
end
function HeroNode:labelDemo()
	local namelabel = cc.ui.UILabel.new({
		UILabelType = 1,
		text = "大圣",
		font = "mytext.fnt",
		align = cc.ui.TEXT_ALIGN_CENTER -- 文字内部居中对齐 
		})
	namelabel:setPosition(-25,-25)
    namelabel:setScale(0.4)
	self:addChild(namelabel)
end

function HeroNode:schedulerDemo()
      print("==============  print("..self:getPositionX())
    local scheduler = cc.Director:getInstance():getScheduler()
    self.is=scheduler:scheduleScriptFunc(handler(self,HeroNode.schedulerfunc), 1/60, false)
    
        local x = self:getPositionX()
    local y = self:getPositionY()
  

end


walk = true
AC = true

function HeroNode:schedulerfunc()

    local x = self:getPositionX()
    local y = self:getPositionY()


    local sudu = 6

 if SkillData.Data.P1 == 0 and SkillData.Data.P2 == 0 and SkillData.Data.P3 == 0 and SkillData.Data.P4 == 0 and SkillData.Data.P5 ~= 1 then
     local maxX  = sceneData.selectData.x 
     local  maxY = 380

    if self.rocketDirection == 0 and walk==true then
    	walk=false
        -- if self.player.fsm:canDoEvent("stopAction") then
        --     self.player.fsm:doEvent("stopAction")
        -- end
          
        print("-----------执行")
     
                  if  self.player:canDoEvent("start") then
                 self.player:doEvent("start")
            end

    elseif self.rocketDirection == 1 then --右走
        --if x+sudu>1920 then
      if x+sudu>maxX then
            self:setPosition(cc.p(maxX,y))
        else
            self:setPosition(cc.p(x+sudu,y))
        end
    elseif self.rocketDirection == 2 then
        if y+sudu>maxY then
            self:setPosition(cc.p(x,maxY))
        else
            self:setPosition(cc.p(x,y+sudu))
        end
    elseif self.rocketDirection == 3 then
        if x-sudu<20 then
            self:setPosition(cc.p(20,y))
        else
            self:setPosition(cc.p(x-sudu,y))
        end
    elseif self.rocketDirection == 4 then
        if y-sudu<120 then
            self:setPosition(cc.p(x,120))
        else
            self:setPosition(cc.p(x,y-sudu))
        end
    elseif self.rocketDirection == 5 then
        if x>20 and y>=maxY then
            self:setPosition(cc.p(x-sudu,maxY))
        end
        if x<=20 and y<maxY then
            self:setPosition(cc.p(20,y+sudu))
        end
        if x<=20 and y>=maxY then
            self:setPosition(cc.p(20,maxY))
        end
        if x>20 and y<maxY then 
            self:setPosition(cc.p(x-sudu+2,y+sudu-2)) --左上
        end
    elseif self.rocketDirection == 6 then
        if x>20 and y>120 then
            self:setPosition(cc.p(x-sudu+2,y-sudu+2)) --左下
        end
        if x<=20 and y>120 then
            self:setPosition(cc.p(20,y-sudu))
        end
        if x>20 and y<=120 then
            self:setPosition(cc.p(x-sudu,120))
        end
        if x<=20 and y<=120 then
            self:setPosition(cc.p(20,120))
        end
    elseif self.rocketDirection == 7 then
        if x<maxX and y<maxY then
            self:setPosition(cc.p(x+sudu-2,y+sudu-2)) --右上
        end
        if x>=maxX and y<maxY then
            self:setPosition(cc.p(maxX,y+sudu))
        end
        if x<maxX and y>=maxY then
            self:setPosition(cc.p(x+sudu,maxY))
        end
        if x>=maxX and y>=maxY then
            self:setPosition(cc.p(maxX,maxY))
        end
    elseif self.rocketDirection == 8 then
        if x<maxX and y>120 then
            self:setPosition(cc.p(x+sudu-2,y-sudu+2)) --右下
        end
        if x>=maxX and y>120 then
            self:setPosition(cc.p(maxX,y-sudu))
        end
        if x<maxX and y<=120 then
            self:setPosition(cc.p(x+sudu,120))
        end
        if x>=maxX and y<=120 then
            self:setPosition(cc.p(maxX,120))
        end
    end
    
    if self.rocketRun then --控制英雄的面向
    	self.player:setScaleX(-1)
    	else
    	self.player:setScaleX(1)
    end
end
   
   self:Adc()
   
end

function HeroNode:Adc()
    local x = self:getPositionX()
    local y = self:getPositionY()
  -- print("SkillData.Data.P5"..  SkillData.Data.P5)
   if self.rocketDirection ~= 0 and SkillData.Data.P5 ~= 1 then 
        walk=true

           if  self.player:canDoEvent("run") then
                 self.player:doEvent("run")
           
            end
               
        -- if self.player.fsm:canDoEvent("walkAction") then
        --     self.player.fsm:doEvent("walkAction")
        -- end
    end

    -- if self.player.fsm:canDoEvent("attackAAction") and SkillData.Data.P1 == 1 then
    --     walk=true
    --     self.player.fsm:doEvent("attackAAction")


     if self.player:canDoEvent("attackAAction") and SkillData.Data.P1 == 1 then
        walk=true
        self.player:doEvent("attackAAction")   

        self:performWithDelay(function() self.player:doEvent("start") SkillData.Data.P1 = 0 end, 2.0)

    -- elseif self.player.fsm:canDoEvent("attackBAction") and SkillData.Data.P2 == 1 then
    --     walk=true
    --     self.player.fsm:doEvent("attackBAction")

    --     local jump = nil
    --     if self.rocketRun then
    --         jump = cca.jumpTo(1.0, self:getPositionX()-350 , self:getPositionY(), 100, 1)
    --         else
    --         jump = cca.jumpTo(1.0, self:getPositionX()+350 , self:getPositionY(), 100, 1)
    --     end
    --     self:runAction(jump)
elseif self.player:canDoEvent("attackBAction") and SkillData.Data.P2 == 1 then
        walk=true
        self.player:doEvent("attackBAction")
        
        local jump = nil
        if self.rocketRun then
            jump = cca.jumpTo(1.0, self:getPositionX()-350 , self:getPositionY(), 100, 1)
            else
            jump = cca.jumpTo(1.0, self:getPositionX()+350 , self:getPositionY(), 100, 1)
        end
        self:runAction(jump)
  self:performWithDelay(function() self.player:doEvent("start") SkillData.Data.P2 = 0 end, 2.0)

    -- elseif self.player.fsm:canDoEvent("attackCAction") and SkillData.Data.P3 == 1 then
    --     walk=true
    --     self.player.fsm:doEvent("attackCAction")
elseif self.player:canDoEvent("attackCAction") and SkillData.Data.P3 == 1 then
        walk=true
        self.player:doEvent("attackCAction")

  self:performWithDelay(function() self.player:doEvent("start") SkillData.Data.P3 = 0 end, 2.0)


    -- elseif self.player.fsm:canDoEvent("attackDAction") and SkillData.Data.P4 == 1 then
    --     walk=true
    --     self.player.fsm:doEvent("attackDAction")
    --     local move = nil
    --     if self.rocketRun then
    --         move = cca.moveTo(2.0, self:getPositionX()-450 , self:getPositionY())
    --         else
    --         move = cca.moveTo(2.0, self:getPositionX()+450 , self:getPositionY())
    --     end
    --     self:runAction(move)
    -- end
    elseif self.player:canDoEvent("attackDAction") and SkillData.Data.P4 == 1 then
        walk=true
        self.player:doEvent("attackDAction")
        -- local move = nil
        -- if self.rocketRun then
        --     move = cca.moveTo(2.0, self:getPositionX()-450 , self:getPositionY())
        --     else
        --     move = cca.moveTo(2.0, self:getPositionX()+450 , self:getPositionY())
        -- end
        -- self:runAction(move)
          self:performWithDelay(function() self.player:doEvent("start") SkillData.Data.P4 = 0 end, 2.0)

    end



    if SkillData.Data.P5 == 1 then
         
        -- if self.player.fsm:canDoEvent("attackPAction") then
        --     walk=true
        --     self.player.fsm:doEvent("attackPAction")

        -- end
          if  self.player:canDoEvent("attackPAction") then
             walk=true
                 self.player:doEvent("attackPAction")
            end
    elseif SkillData.Data.P5 == 2 and SkillData.Data.P1 == 0 and SkillData.Data.P2 == 0 and SkillData.Data.P3 == 0 and SkillData.Data.P4 == 0  then
        SkillData.Data.P5 = 0
        -- if self.player.fsm:canDoEvent("stopAction") then
        --    self.player.fsm:doEvent("stopAction")
        -- end
         if  self.player:canDoEvent("start") then
                 self.player:doEvent("start")
            end
    end
    if x<20 then
        self:setPositionX(20)
    elseif x>1920 then
        self:setPositionX(1920)
    end
 
    ModifyData.heroPos.x = x
    ModifyData.heroPos.y = y

    --怪物3 闪电攻击
    if SkillData.Data.Ms3Ac == true then
        SkillData.Data.Ms3Ac = false
        self:Ace()
    end
end



function HeroNode:Ace()

      local frames = display.newFrames("2003_Q_effup/10%.2i",0,11)  
      local animation = display.newAnimation(frames, 0.5/11)
      local ain = cc.Animate:create(animation)
      local Sp = display.newSprite("#2003_Q_effup/1000")
      Sp:addTo(self,2)
      local func = cca.callFunc(function()
          Sp:removeFromParent()
      end)
      
      local seqAct = cc.Sequence:create(cc.TargetedAction:create(Sp, ain),func)
      Sp:runAction(seqAct)

end
return HeroNode