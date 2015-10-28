local Reward_get = class("Reward_get", function()
    return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)


function Reward_get:ctor()
 


local d= cc.Director:getInstance():getEventDispatcher()
self.l = cc.EventListenerTouchOneByOne:create()
self.l :setSwallowTouches(true)
self.l:registerScriptHandler(function(touch ,event )
return true 
end,cc.Handler.EVENT_TOUCH_BEGAN)

self.l:registerScriptHandler(function (touch , event)
 end, cc.Handler.EVENT_TOUCH_MOVED)

self.l:registerScriptHandler(function(touch , event)  

end,cc.Handler.EVENT_TOUCH_ENDED)
d:addEventListenerWithSceneGraphPriority(self.l, self)



self. layer = cc.uiloader:load("res/RotateionView/Layer_equ_des.csb"):addTo(self,2) 
 -- local Button_close =self. layer :getChildByName("Button_close")
 --   Button_close:addClickEventListener(function ( )
 --  self:removeSelf()
 -- end )
self. Image_equ  = self. layer:getChildByName("Image_equ")

self. Text_name=self. layer:getChildByName("Text_name")

 self.Text_description=self. layer:getChildByName("Text_description")

 self. Text_Condition=self. layer:getChildByName("Text_Condition")

 self.Button_wear=self. layer:getChildByName("Button_wear")

 self.Button_wear:setTitleText("抽取成功")
    self.  Text_have=self. layer:getChildByName("Text_have")
    self.Text_havenum=self. layer:getChildByName("Text_havenum")
     self. Text_jian  = self. layer:getChildByName("Text_jian")
    self: reshUI()

end 
function Reward_get:reshUI( )

     
 local  a  =  math.random(5,8)
	
      self. Image_equ:loadTexture(HeroData.Allequi[a].pic)
      self. Text_name:setString(HeroData.Allequi[a].name)
      self.Text_description:setString("+生命值 :"..HeroData.Allequi[a].health .. "\n+攻击 :".. HeroData.Allequi[a].atk.. "\n+防御力 :" ..HeroData.Allequi[a].def)
    
      HeroData.Hero[1].  Acer  =   HeroData.Hero[1].  Acer  -  50 
    
      local   equ =clone(HeroData.Allequi[a])
             table.insert(  HeroData.pagkeequ,equ )


    local str1 = json.encode(HeroData.Hero)
                 ModifyData.WriteDataToDoc(str1,1)
            local str2 = json.encode(HeroData.pagkeequ)
                 ModifyData.WriteDataToDoc(str2,3)
     

         self.Button_wear:addClickEventListener(function ( )       
   		  
              HeroData.GameLayerdegate:reshUI()
              self:removeSelf()
         	


         end)


  
 end  

return Reward_get