local Layer_Hechengfail = class("Layer_Hechengfail", function()
    return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)

function Layer_Hechengfail:ctor()
 local  EQData   =  HeroData.pagkeequ
	local d= cc.Director:getInstance():getEventDispatcher()
self.l = cc.EventListenerTouchOneByOne:create()
self.l :setSwallowTouches(true)
self.l:registerScriptHandler(function(touch ,event )
return true 
end,cc.Handler.EVENT_TOUCH_BEGAN)
self.l:registerScriptHandler(function (touch , event)
 end, cc.Handler.EVENT_TOUCH_MOVED)
self.l:registerScriptHandler(function(touch , event) 
   local str2 = json.encode(HeroData.pagkeequ)
  ModifyData.WriteDataToDoc(str2,3)

HeroData.  Hechenglayerdegate :refreshlistview()
	self:removeSelf()
end,cc.Handler.EVENT_TOUCH_ENDED)
d:addEventListenerWithSceneGraphPriority(self.l, self)


self. layer1 = cc.Sprite :create("hechengfail.png")
self.layer1:setAnchorPoint(0.5,0.5)
self.layer1: setPosition(display.cx ,display.cy)
self:addChild(self.layer1 , 5)




for i,v in ipairs(EQData) do
      if   v .remove ~= nil then 
        table.remove  ( EQData ,  i)
        break
      end  

end
for i,v in ipairs(EQData) do
      if   v .remove ~= nil then 
        table.remove  ( EQData ,  i)
        break
      end  

end 

for i,v in ipairs(EQData) do
      if   v .remove ~= nil then 
        table.remove  ( EQData ,  i)
        break 
      end  
end       
dump(EQData)


	
end 



function Layer_Hechengfail:onEnter()

end

function Layer_Hechengfail:onExit()
end

return Layer_Hechengfail