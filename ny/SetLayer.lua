--
-- Author: student
-- Date: 2015-09-19 10:32:26
--

local SetLayer=class("SetLayer",function (  )
	return display.newColorLayer(cc.c4b(100, 100, 100, 0))
end )

function SetLayer:ctor(  )
	self:setTouchEnabled(true)
	
	self:init()
end

SetLayer.SLIDER_IMAGES = {
    bar = "Check/slider.png",
    button = "Check/a.png",
}
SetLayer.isPlayMusic = true
SetLayer.isPlaySound = true

function SetLayer:init(  )

    local d= cc.Director:getInstance():getEventDispatcher()
self.l = cc.EventListenerTouchOneByOne:create()
self.l :setSwallowTouches(true)
self.l:registerScriptHandler(function(touch ,event )
return true 
end,cc.Handler.EVENT_TOUCH_BEGAN)
self.l:registerScriptHandler(function (touch , event)
 end, cc.Handler.EVENT_TOUCH_MOVED)
self.l:registerScriptHandler(function(touch , event) 
     cc.Director:getInstance():resume()
    self:removeSelf()
end,cc.Handler.EVENT_TOUCH_ENDED)
d:addEventListenerWithSceneGraphPriority(self.l, self)

	 
local bg = display.newSprite("Check/menu_bg.jpg")
	bg:setPosition(cc.p(display.cx, display.cy)):addTo(self):setScale(1.2)
   bg:setOpacity(250)


  if sceneData .setLayer  ==0 then 

    self.back = ccui.Button:create( "Check/exit.png","Check/exit1.png")
    self.back:setPosition(display.cx,display.cy-200)
    self.back :addTo(self,1)
    self.back :setTouchSwallowEnabled(false)
    self.back:addTouchEventListener(function (sender,state )
    if   (state ==2)then
        os.exit()
    end
    end) 
elseif  sceneData .setLayer  ==1 then 
       self.back = ccui.Button:create( "Check/failed.png","Check/failed.png")
       self.back:setPosition(display.cx,display.cy-200)
       self.back :addTo(self,1)
       self.back :setTouchSwallowEnabled(false)
       self.back:addTouchEventListener(function (sender,state )
  if   (state ==2)then
        print("点击投降")
          cc.Director:getInstance():resume()
            audio.playMusic("mp3/backgroundmusic.mp3",true)
        display.replaceScene(Layer_Slider.new())
   
  end
  end) 

end 




cc.ui.UILabel.new({text = "音乐", size = 24,  color = display.COLOR_WHITE}):pos(150, 180):addTo(bg)

cc.ui.UILabel.new({text = "音效", size = 24,  color = display.COLOR_WHITE}):pos(150, 280):addTo(bg)

 
    local silder1=ccui.Slider:create()
     silder1:loadBarTexture("Check/progress.png")
     silder1:loadSlidBallTextures("Check/a.png","Check/a.png","")
     silder1:loadProgressBarTexture("Check/slider.png")
     silder1:align(display.LEFT_BOTTOM, 200, self:getContentSize().height/2-50)
     silder1:addTo(bg)
       local d =  cc.UserDefault:getInstance()
     silder1:setPercent(d:getIntegerForKey  ("affect"))
     silder1:addEventListener(function ( sender,event )
         local num=sender:getPercent()

   
         local num=sender:getPercent()
        -- print(num)

          if (num>0)  then 
              d:setIntegerForKey("affect", num)
             audio.setSoundsVolume( d:getIntegerForKey  ("affect")/100)
             d:flush()
     
 
        
 else 
            d:setIntegerForKey("affect", 0)
             audio.setSoundsVolume( d:getIntegerForKey  ("affect")/100)
             d:flush()
 

 end 





         print(num)
     end)


-- cc.ui.UICheckBoxButton.new({on ="Check/open.png",off ="Check/close.png" })
--         :setButtonLabelOffset(-130, 0)
--         :pos(320,300)
--         :onButtonStateChanged(function(event)	
--         	if event.state == "on" then
--         		print("on 音乐")
--         		SetLayer.isPlayMusic = true
-- 				--audio.resumeMusic()
-- 			elseif  event.state == "off" then
-- 			   print("off 音乐")
-- 			   SetLayer.isPlayMusic = false
-- 				--audio.pauseMusic()
-- 			end
--         	end)
--         :addTo(bg)

-- cc.ui.UICheckBoxButton.new({on ="Check/open.png",off ="Check/close.png" })
--         :setButtonLabelOffset(-130, 0)
--         :pos(640,300)
--         :onButtonStateChanged(function(event)	
--         	if event.state == "on" then
--         		print("on 音效")
--         		SetLayer.isPlaySound = true
-- 			elseif  event.state == "off" then
-- 			   print("off 音效")
-- 			   SetLayer.isPlaySound = false
-- 			end
--         	end)
--         :addTo(bg)





-- ccui.UILabel.new({text = "智能施法", size = 24,  color = display.COLOR_WHITE}):pos(130, 200):addTo(bg)
-- cc.ui.UILabel.new({text = "技能提示", size = 24,  color = display.COLOR_WHITE}):pos(420, 200):addTo(bg)

-- cc.ui.UICheckBoxButton.new({on ="Check/open.png",off ="Check/close.png" })
--         :setButtonLabelOffset(-130, 0)
--         :pos(320,190)
--         :onButtonStateChanged(function(event)	
--         	if event.state == "on" then
--         		print("on 智能施法")
-- 			elseif  event.state == "off" then
-- 			   print("off  智能施法")
-- 			end
--         	end)
--         :addTo(bg)

-- cc.ui.UICheckBoxButton.new({on ="Check/open.png",off ="Check/close.png" })
--         :setButtonLabelOffset(-130, 0)
--         :pos(640,190)
--         :onButtonStateChanged(function(event)	
--         	if event.state == "on" then
--         		print("on 技能提示")
-- 			elseif  event.state == "off" then
-- 			   print("off 技能提示")
-- 			end
--         	end)
--         :addTo(bg)



 -- cc.ui.UISlider.new(display.LEFT_TO_RIGHT,{ bar = "Check/slider.png",
 --    button = "Check/a.png"}, {scale9 = true})
 --        :onSliderValueChanged(function(event)
 --        	print(event.value)
 --        end)
 --        :setSliderSize(400, 20)
 --        :setSliderValue(100)
 --        :align(display.LEFT_BOTTOM, 200, self:getContentSize().height/2-230)
 --        :addTo(bg)
  local d =  cc.UserDefault:getInstance()
    local silder=ccui.Slider:create()
     silder:loadBarTexture("Check/progress.png")
     silder:loadSlidBallTextures("Check/a.png","Check/a.png","")
     silder:loadProgressBarTexture("Check/slider.png")
     silder:align(display.LEFT_BOTTOM, 200, self:getContentSize().height/2-150)
     silder:addTo(bg)
     silder:setPercent(d:getIntegerForKey("sound"))
           
     silder:addEventListener(function ( sender,event )
        local d =  cc.UserDefault:getInstance()
   

         local num=sender:getPercent()
        -- print(num)

          if (num>0)  then 
            print(audio.isMusicPlaying())
           if   audio.isMusicPlaying() ==true  then 
             
              d:setBoolForKey("switch" , true)
              d:setIntegerForKey("sound", num)
              audio.setMusicVolume (num/100)
             d:flush()
           else
              audio.playMusic("mp3/backgroundmusic.mp3",true)
              d:setBoolForKey("switch" , true)
              d:setIntegerForKey("sound", num)
              audio.setMusicVolume (num/100)
              d:flush()
           end 
 
        
 else 
        audio.stopMusic("mp3/backgroundmusic.mp3")
        d:setBoolForKey("switch" , false)
        d:setIntegerForKey("sound",0)
        d:flush()
 

 end 



     end)
  



end

return SetLayer
