local Layer_leveup = class("Layer_leveup", function()
    return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)


function Layer_leveup:ctor()
 


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

    self.  Text_have=self. layer:getChildByName("Text_have")
    self.Text_havenum=self. layer:getChildByName("Text_havenum")
     self. Text_jian  = self. layer:getChildByName("Text_jian")
    self: reshUI()

end 
function Layer_leveup:reshUI( )
 for i,v in ipairs( self. layer:getChildren()) do
 	print(v:getName())
 end
    local index =  HeroData.leveup_index
    if index  == 0 then  
    self:removeSelf() 
    else  

	
      self. Image_equ:loadTexture(HeroData.pagkeequ[index].pic)
      self. Text_name:setString(HeroData.pagkeequ[index].name)
      self.Text_description:setString("+生命值 :"..HeroData.pagkeequ[index].health .. "\n+攻击 :".. HeroData.pagkeequ[index].atk.. "\n+防御力 :" ..HeroData.pagkeequ[index].def)
       self.  Text_have:setString("升至")
       local num = HeroData.pagkeequ[index].level+5 
       self.Text_havenum:setString(num)
       self. Text_jian :setString("级")
       local str  = "需要强化石 : " .. HeroData.Hero[1].stone .."/1\n最高等级为60"
        self. Text_Condition:setString(str)


         self.Button_wear:setTitleText("强化")
         self.Button_wear:addClickEventListener(function ( )   
         	if HeroData.Hero[1].stone- 1 >=0  and HeroData.pagkeequ[index].level<60 then 
         		HeroData.Hero[1].stone=HeroData.Hero[1].stone- 1
         		HeroData.pagkeequ[index].level = HeroData.pagkeequ[index].level+5 
   		        HeroData.packagelayerdegate:refreshListView()   --- 强化石未写入底层  
   		      local str1 = json.encode(HeroData.Hero)
                 ModifyData.WriteDataToDoc(str1,1)
   		      local str2 = json.encode(HeroData.pagkeequ)
                 ModifyData.WriteDataToDoc(str2,3)

              self:removeSelf()
         	end 


         end)


   end 
 end  

return Layer_leveup




