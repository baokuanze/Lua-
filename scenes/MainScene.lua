local Layer_slider = require("app.scenes.Layer_Slider")



local  Data_Manager1= require("app.scenes.Data_Manager")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
 


     cc.ui.UILabel.new({
	
        UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
      self.scene = cc.uiloader:load("res/RotateionView/Layer_Land.csb"):addTo(self,2) 
      self. Image_bg=  self.scene:getChildByName("Image_bg")
     
   
 
   self.Button_Land = self.scene:getChildByName("Button_Land")
   self.Button_Land :setSwallowTouches(true)
   self.Button_Land:addTouchEventListener(function (sender,state )
  if 	(state ==2)then
  	print("跳转")
    local   Data =  Data_Manager1:getInstance()
    local land = {}
    Data :setTableforKey("1" , land)
    Data:setValueforKey("1","simida")
    sceneData.land = 1    -- - 登陆  表示 
     sceneData .model = 1 
  

    display.replaceScene(GameLayer.new())
  end
  end) 

self.Button_register = self.scene:getChildByName("Button_register")
self.Button_register:addClickEventListener(function ()
print("进入注册")
    sceneData.land = 1  
        sceneData .model = 0    --- 联网
  local scene_register= require("app.scenes.scene_register")
 display.replaceScene(scene_register.new())
 end)
   

   
end






function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
