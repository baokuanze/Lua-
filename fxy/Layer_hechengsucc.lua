local Layer_hechengsucc = class("Layer_hechengsucc", function()
    return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)

function Layer_hechengsucc:ctor()
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


self. layer1 = cc.uiloader:load("res/fxy/Layer_HechengSuccess.csb")
self.layer1:setAnchorPoint(0.5,0.5)
self.layer1: setPosition(display.cx ,display.cy)
self:addChild(self.layer1 , 5)
local star_index = 0 
for i,v in ipairs(EQData) do
      if   v .remove ~= nil then 
      	star_index = v . star  
      	break
      end  
end
  
   if   star_index ==  1  then 
         local  a  =  math.random(5,8)
   		   self.  Image_hechengEquip =self. layer1:getChildByName("Image_hechengEquip")
   		   self.  Image_hechengEquip :loadTexture(HeroData.Allequi[a].pic ) 
         local   equ =clone(HeroData.Allequi[a])
   		   table.insert(  HeroData.pagkeequ,equ )
        local str = json.encode(HeroData.pagkeequ)
        ModifyData.WriteDataToDoc(str,3)


   elseif   star_index ==  2  then 
   			 local  a  =  math.random(9,12)
   			 self.  Image_hechengEquip =self. layer1:getChildByName("Image_hechengEquip")
      		self.  Image_hechengEquip :loadTexture(HeroData.Allequi[a].pic )
      	 local   equ =clone(HeroData.Allequi[a])
           table.insert(  HeroData.pagkeequ,equ )
        local str = json.encode(HeroData.pagkeequ)
        ModifyData.WriteDataToDoc(str,3)
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

for i,v in ipairs(EQData) do
      if   v .remove ~= nil then 
        table.remove  ( EQData ,  i)
        break 
      end  
end       
dump(EQData)


	
end 



function Layer_hechengsucc:onEnter()

end

function Layer_hechengsucc:onExit()
end

return Layer_hechengsucc