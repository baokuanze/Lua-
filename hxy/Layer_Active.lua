--
-- Author: hexinyi
-- Date: 2015-09-21 21:25:04
--
local Data_Manager = import(".Data_Manager")

local Layer_Active = class("Layer_Active", function( )
    return display.newColorLayer(cc.c4b(100, 100, 100,150))
end)

function Layer_Active:ctor( )
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
	

	Data_Manager:getInstance():setValueforKey("user_gold",20000)
	Data_Manager:getInstance():setValueforKey("user_diamond",1000)

	self.layer=cc.uiloader:load("Layer_Active.csb")
	self.layer:setAnchorPoint(0.5,0.5)
	self.layer:setPosition(display.cx , display.cy)
	self.layer:addTo(self)
	self:initUI()
end
function Layer_Active:initUI( )
	self.buy_25=self.layer:getChildByName("buy_25")
	self.buy_50=self.layer:getChildByName("buy_50")
	self.buy_60=self.layer:getChildByName("buy_60")
	self.buy_488=self.layer:getChildByName("buy_488")
	self:btnCallBack()
end

function Layer_Active:btnCallBack( )

	self.gold = Data_Manager:getInstance():getValueforKey("user_gold")
	self.diamond = Data_Manager:getInstance():getValueforKey("user_diamond")

	

	self.buy_25:addClickEventListener(function( )
		print("buy_25 ===============")


	end)

	self.buy_50:addClickEventListener(function( )
		print("buy_50 ===============")
		
	end)

	self.buy_60:addClickEventListener(function( )
		print("buy_60 ===============")
		
	end)

	self.buy_488:addClickEventListener(function( )
		print("buy_488 ===============")
		
	end)
	
end

return Layer_Active