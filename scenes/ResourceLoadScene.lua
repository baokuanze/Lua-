local ui=require("framework.ui")
local ResourceLoadScene = class("ResourceLoadScene", function()
	 return display.newScene("ResourceLoadScene")
     end)

function ResourceLoadScene:ctor()
	    self:init()
	    self:loadMusic()
end

function ResourceLoadScene:loadMusic()
	 d =  cc.UserDefault:getInstance()
    music =  d:getBoolForKey("switch")
   
     f  = d:getBoolForKey("Notfirst")
print(music,f)

   if( music and f)  then
 print(1233)
 print( d:getIntegerForKey  ("sound")/100)
   audio.setMusicVolume( d:getIntegerForKey  ("sound")/100)
   audio.setSoundsVolume( d:getIntegerForKey  ("affect")/100)
    audio.playMusic("mp3/backgroundmusic.mp3",true)
   end

  if (not f) then  
    d:setBoolForKey("switch",true)
    d:setBoolForKey("Notfirst",true )
    d:setIntegerForKey  ("sound", 50)

    d:setIntegerForKey  ("affect", 50)

    d:flush()   
    audio.setMusicVolume(d:getIntegerForKey("sound")/100)
    audio.playMusic("mp3/backgroundmusic.mp3",true)

   end

end 




function ResourceLoadScene:init()
	--背景


	local bg = display.newSprite("self_ui/one.png")
    bg:setScale(2)
	bg:setPosition(display.cx , display.cy)
	self:addChild(bg)
   
   self._quad = cc.ParticleSystemQuad:create("self_ui/BlueFountains.plist")
	self._quad:setPosition(cc.p(100, 60))
	self._quad:setDuration(2.0)
	self:addChild(self._quad)
 ---  100  ,   80 
	--进度条
	
	local timer = cc.ProgressTimer:create(cc.Sprite:create("self_ui/loading.png"))
	timer:setPosition(display.cx, 60)

	timer:setBarChangeRate(cc.p(1,0))

	timer:setType(display.PROGRESS_TIMER_BAR)
	timer:setMidpoint(cc.p(0,0.5))--基准点
	timer:setPercentage(0)
	timer:addTo(self)

	

 local a =  cc.MoveTo:create(2.0, cc.p(850, 60));
 self._quad:runAction(a)
    local progress =cc.ProgressTo:create(2.0, 100)
    local call=cc.CallFunc:create(function()
	local scene = MainScene.new()
	local turn = cc.TransitionPageTurn:create(0.5, scene, false)
	cc.Director:getInstance():replaceScene(turn)
	end)

    local seq=cc.Sequence:create(progress,call)
	timer:runAction(seq)


	--label：loading
	local lab = ui.newTTFLabel({text = "loading", size = 40, color = cc.c3b(0, 0, 200)})
	lab:setPosition(cc.p(display.cx, 60))
	lab:addTo(self)

end



function ResourceLoadScene:onEnter()
end

function ResourceLoadScene:onExit()
end

return ResourceLoadScene