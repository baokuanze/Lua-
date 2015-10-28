--
-- Author: student
-- Date: 2015-09-21 16:54:17
--
local WinLayer = class("WinLayer", function()
	return display.newColorLayer(cc.c4b(100, 100, 100, 100))
end)

function WinLayer:ctor()
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

	-- self:setTouchEnabled(true)
	-- self:setTouchSwallowEnabled(true)
	

     self.layer=cc.uiloader:load("Boom/Layer_Win.csb")
     self.layer:setAnchorPoint(cc.p(0.5,0.5))
     self.layer:pos(display.cx, display.cy)
     self:addChild(self.layer)

   self:initUI()


end


function WinLayer:initUI( )
    
self._quad = cc.ParticleSystemQuad:create("self_ui/winParticle.plist")
    self._quad:setPosition(cc.p(display.cx, display.cy+100))
    -- self._quad:setDuration(3.0)
    self:addChild(self._quad)
     
     self.gold = self.layer:getChildByName("Text_getGold")
     self.exp  = self.layer:getChildByName("Text_getExp")
     self.equip= self.layer:getChildByName("Image_getEquip")

     self.getBtn= self.layer:getChildByName("Button_get") 

     self:setUI()
end

function WinLayer:setUI(  )
     
     self.gold:setString("200")
     self.exp:setString("200")   
    local  a  =  math.random(1,10)
       if    a<=4     then 
            print(a) 
            self.equip:loadTexture( HeroData.Allequi[a].pic)
            local   equ =clone(HeroData.Allequi[a])
             table.insert(  HeroData.pagkeequ,equ )

        end     
              HeroData . Hero [1]. gold  = HeroData . Hero [1]. gold +tonumber( self.gold:getString())

            HeroData . Hero [1]. exprise  = HeroData . Hero [1]. exprise +tonumber( self.exp:getString())
                    if   HeroData .expriserank [HeroData . Hero [1].rank]<  HeroData . Hero [1]. exprise then 
                         HeroData . Hero [1]. exprise = 0 
                         HeroData . Hero [1].rank =HeroData.Hero [1].rank+1

                    end 


        local str1 = json.encode(HeroData.Hero)
       ModifyData.WriteDataToDoc(str1,1)

        local str = json.encode(HeroData.pagkeequ)
        ModifyData.WriteDataToDoc(str,3)




     self.getBtn:addClickEventListener(function ( )
          print("get")
           audio.playMusic("mp3/backgroundmusic.mp3",true)
            if  sceneData.gamemodel ==1 then 
                        sceneData.gamemodel =0
                 display.replaceScene(GameLayer.new())

            else 
               display.replaceScene(Layer_Slider.new())
            end 

     end)
end


return WinLayer