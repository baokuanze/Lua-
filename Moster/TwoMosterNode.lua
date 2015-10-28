--
-- Author: student
-- Date: 2015-09-23 10:56:35
--
local TwoMosterNode = class("TwoMsterNode", function (  )
	return display.newNode()
end)

function TwoMosterNode:ctor(  )
	self.Zt = false
  	--添加怪物  
    self.Ms2=require("app.Moster.TwoMoster"):new()
   self.Ms2:addTo(self)
   --添加血条
   self:MsProgressTimer()
   --跟随英雄移动
  -- self:GoonMs()


--血量
self.MsHp=1000
end
function TwoMosterNode:MsProgressTimer(  )
	--血条
    self.HPSp = display.newSprite("#master_2.png")
    self.HpBar = cc.ProgressTimer:create(self.HPSp)
    self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)  --设置为条形 type:cc.PROGRESS_TIMER_TYPE_RADIAL
    self.HpBar:setMidpoint(cc.p(0,0.5))             --设置起点在左边 1,0 起点在右边
    self.HpBar:setBarChangeRate(cc.p(1,0))          --设置为竖直方向
    self.HpBar:setPercentage(100)                   -- 设置初始进度为100
    self.HpBar:setPosition(0,90)
    self:addChild(self.HpBar,1)
end

function TwoMosterNode:GoonMs(  )
	local speed =2
    local Range = 2
    EnemyGoonMudo:enemyGoon(self,self.Ms2,speed,Range)
end

return TwoMosterNode

