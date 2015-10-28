--
-- Author: student
-- Date: 2015-09-23 14:59:47
--
local ThreeMosterNode= class("ThreeMosterNode", function (  )
	  return display.newNode()
end)

function ThreeMosterNode:ctor(  )
	  self.Zt=false
    --创建怪物
    self.Ms3=require("app.Moster.ThreeMoster").new()
    self.Ms3:addTo(self)
    --添加血条
    self:MsProgressTimer()
    --跟随
    --self:GoonMs()

--获取怪物血量


end

function ThreeMosterNode:MsProgressTimer(  )
	 --血条
    self.HPSp = display.newSprite("#master_2.png")
    self.HpBar = cc.ProgressTimer:create(self.HPSp)
    self.HpBar:setType(cc.PROGRESS_TIMER_TYPE_BAR)  --设置为条形 type:cc.PROGRESS_TIMER_TYPE_RADIAL
    self.HpBar:setMidpoint(cc.p(0,0.5))             --设置起点在左边 1,0 起点在右边
    self.HpBar:setBarChangeRate(cc.p(1,0))          --设置为竖直方向
    self.HpBar:setPercentage(100)                   
    self.HpBar:setPosition(0,90)
    self:addChild(self.HpBar,1)
end


function ThreeMosterNode:GoonMS(  )
	
	local speed =3
	local Range=3
	EnemyGoonMudo:enemyGoon(self,self.Ms3,speed,Range)
end

return ThreeMosterNode

