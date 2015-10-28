local Layer_heroAttribute = class("Layer_heroAttribute", function()
    return display.newColorLayer(cc.c4b(100, 100, 100,150))

end)

 function Layer_heroAttribute:initequi()
HeroData.wearequ=nil 
   HeroData.wearequ={[1]={} , [2]={},[3]={},[4]={}}

    for i,v in ipairs( HeroData.pagkeequ) do
           if  v.id == 1 and   v.wear == 1  then  
           	  HeroData.wearequ[1] = v    
           elseif  v.id == 2 and   v.wear == 1  then  
           	  HeroData.wearequ[2] = v
           elseif  v.id == 3 and   v.wear == 1  then  
          	  HeroData.wearequ[3] = v
           elseif  v.id == 4 and   v.wear == 1  then  
           	  HeroData.wearequ[4] = v

           end 

       end  


 end 



function Layer_heroAttribute:ctor()
	HeroData.reshobject =self 


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


self. layer = cc.uiloader:load("res/RotateionView/Layer_HeroWear.csb"):addTo(self,2) 

 local Button_close =self.layer:getChildByName("Button_close")
   Button_close:addClickEventListener(function ( )
   self:removeSelf()
 end )

     self.Button_weapon =self. layer:getChildByName("Button_weapon")
     self. Button_weapon:addClickEventListener(function ()
     print("进入背包武器")
    HeroData.currentequ_index = 2
    local layer_equ_description =Layer_equ_description.new()
    self:addChild( layer_equ_description, 10)
    end)

   self. Button_Clothes=self. layer:getChildByName("Button_Clothes")
       self.Button_Clothes:setTitleText("")
    self. Button_Clothes:addClickEventListener(function ()
     print("进入背包衣服")
       HeroData.currentequ_index = 4
    local layer_equ_description =Layer_equ_description.new()
    self:addChild( layer_equ_description, 10)
    end)


     self. Button_Bracelet=self. layer:getChildByName("Button_Bracelet")
    self. Button_Bracelet:addClickEventListener(function ()
     print("进入背包手镯")
      HeroData.currentequ_index = 3
    local layer_equ_description =Layer_equ_description.new()
    self:addChild( layer_equ_description, 10)
    end)

    self. Button_shope=self. layer:getChildByName("Button_shope")
    self. Button_shope:addClickEventListener(function ()
     print("进入背包鞋子")
       HeroData.currentequ_index = 1
    local layer_equ_description =Layer_equ_description.new()
    self:addChild( layer_equ_description, 10)
    end)


   self:reashui()
 

end   


function  Layer_heroAttribute:reashui()
    self:initequi()
	dump(HeroData.wearequ[2])

   if   HeroData.wearequ[2].id  ~=nil then 
     self.Button_weapon:loadTextures( HeroData.wearequ[2].pic ,HeroData.wearequ[2].pic)
    else
     	self.Button_weapon:loadTextures ( "jiajiaimg.png" ,"jiajiaimg.png")
    end 

    if   HeroData.wearequ[4].id  ~=nil then 
     self.Button_Clothes:loadTextures( HeroData.wearequ[4].pic ,HeroData.wearequ[4].pic)
    else
 	self.Button_Clothes:loadTextures ( "jiajiaimg.png" ,"jiajiaimg.png")
    end 


    if   HeroData.wearequ[3].id  ~=nil then 
     self.Button_Bracelet:loadTextures( HeroData.wearequ[3].pic ,HeroData.wearequ[3].pic)
     else
 	  self.Button_Bracelet:loadTextures ( "jiajiaimg.png" ,"jiajiaimg.png")
   end 


    if   HeroData.wearequ[1].id  ~=nil then 
     self.Button_shope:loadTextures( HeroData.wearequ[1].pic ,HeroData.wearequ[1].pic)

    else
 	  self.Button_shope:loadTextures ( "jiajiaimg.png" ,"jiajiaimg.png")
    end 



 end  








function Layer_heroAttribute:onEnter()

end

function Layer_heroAttribute:onExit()
end

return Layer_heroAttribute
