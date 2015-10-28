local losewujing = class("losewujing", function()
	return display.newColorLayer(cc.c4b(100, 100, 100, 100))
end)

function losewujing:ctor()
	self:setTouchEnabled(true)
	self:setTouchSwallowEnabled(true)
	--self:setContentSize(cc.size(display.width,display.height))
	self:init()
end

function losewujing:init()

local bg = display.newSprite("Check/lose_bg.png")
	bg:setPosition(cc.p(display.cx, display.cy))
	self:addChild(bg)

self._quad = cc.ParticleSystemQuad:create("self_ui/failParticle.plist")
	self._quad:setPosition(cc.p(display.cx, display.cy-250))
	self._quad:setDuration(3.0)
	self:addChild(self._quad)
	


 self.uphero = ccui.Button:create("Check/uphero.png","Check/uphero.png")
	self.uphero :setScale(1.2)
self.uphero :setPosition(display.cx, display.cy-100)
self:addChild(self.uphero,1)
self.uphero:addTouchEventListener(function(sender, state)

 if(state ==2)then
     print("英雄升级")
        audio.playMusic("mp3/backgroundmusic.mp3",true)
     display.replaceScene(Scenes_Shop.new())
 
    end
  end)




 self.uplive = ccui.Button:create("Check/live.png","Check/live.png")
	self.uplive :setScale(1.2)
self.uplive :setPosition(display.cx+180, display.cy-30)
self:addChild(self.uplive,1)
self.uplive:addTouchEventListener(function(sender, state)

 if(state ==2)then
     print("复活")
    if   HeroData . Hero [1].Acer- 99>=0  then 
          HeroData . Hero [1].Acer= HeroData . Hero [1].Acer- 99     
          local str = json.encode(HeroData.Hero)
            ModifyData.WriteDataToDoc(str,1)

         	display.replaceScene(Scene_fighting.new())

      end 
    end
  end)


-- uplive=cc.ui.UIPushButton.new({normal="Check/live.png",pressed="Check/live.png"})
-- :setScale(1.2)
-- :pos(display.cx+180, display.cy-30)
-- :addTo(self)
-- :onButtonClicked(function (  )
-- 	print("复活")
-- 	display.replaceScene(Scene_Battle.new())
-- end)

--离开按钮

 self.upli = ccui.Button:create("Check/li.png","Check/li.png")
 self.upli :setScale(1.2)
self.upli :setPosition(display.cx+180, display.cy-100)
self:addChild(self.upli,1)
self.upli:addTouchEventListener(function(sender, state)

 if(state ==2)then
     print("离开")
   audio.playMusic("mp3/backgroundmusic.mp3",true)
display.replaceScene(GameLayer.new())
    end
  end)





	end
 





return losewujing