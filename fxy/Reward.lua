--
-- Author: student
-- Date: 2015-09-25 10:50:42
--
local Reward=class("Reward", function (  )
    return display.newColorLayer(cc.c4b(100, 100, 150,200))
end)

function Reward:ctor(  )
	self.layer=cc.uiloader:load("rewardlayer.csb")
	self.layer:setAnchorPoint(cc.p(0.5,0.5))
	self.layer:setPosition(display.cx+50,display.cy)
	self:addChild(self.layer)
	self:init()

end
function Reward:init(  )

local d= cc.Director:getInstance():getEventDispatcher()
self.l = cc.EventListenerTouchOneByOne:create()
self.l :setSwallowTouches(true)
self.l:registerScriptHandler(function(touch ,event )
return true 
end,cc.Handler.EVENT_TOUCH_BEGAN)
self.l:registerScriptHandler(function (touch , event)
 end, cc.Handler.EVENT_TOUCH_MOVED)
self.l:registerScriptHandler(function(touch , event) 
	self:removeSelf()
end,cc.Handler.EVENT_TOUCH_ENDED)
d:addEventListenerWithSceneGraphPriority(self.l, self)

   local  t =  ccui.Text:create("每次抽取消耗，元宝   : 50" , "" , 20 )
   t: setPosition(display.cx-50,display.cy+150)
   self:addChild(t ,1)
      t:setTextColor(cc.c4b(150, 0, 200,255))

	self.text_name=self.layer:getChildByName("text_name")
	
	self.girl=self.layer:getChildByName("girl")
	self.box=self.layer:getChildByName("box")
	self.img1=self.layer:getChildByName("img1")
	self.img2=self.layer:getChildByName("img2")

	self.rewardbtn=self.layer:getChildByName("rewardbtn")
	self.rewardbtn:addClickEventListener(function (  )
     
         if   HeroData.Hero[1].  Acer  -  50 >=0 then 
		   self:addChild(Reward_get.new(),5) 
         end 


	end)
end


return Reward