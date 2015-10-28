local Layer_Gate = class("Layer_Gater", function( )
return display.newLayer()
end)


function Layer_Gate:ctor( data)
	self:init(data)
	
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


end


function Layer_Gate:init(data )
      local size = cc.Director:getInstance():getWinSize()

	   local data =  sceneData .selectData 
  self.Layer_selectorcheck = cc.uiloader:load("res/chapter1/Layer_selectorcheck.csb"):addTo(self,2) 

  self .Btn_back=self.Layer_selectorcheck:getChildByName("Btn_back")
    self .Btn_back: setPosition(40 ,  size.height-40)

  self.Btn_back:addClickEventListener(function ()
  print("移除场景")
   audio.playSound ("mp3/btn.mp3",false) 
  self:removeSelf()
 end)

  self .Img_pho=self.Layer_selectorcheck:getChildByName("Img_pho")
self .Img_pho:setPosition(150 ,  size.height-40)
--设置一个剪辑区域
self.Text_activity =self.Layer_selectorcheck:getChildByName("Text_activity")
self.m_pClipRect = cc.rect(0, display.cy-20, display.width * 0.2, display.height * 0.2)
self.m_pClipNode = display.newClippingRegionNode(self.m_pClipRect):addTo(self)


local textW = math.round( self.Text_activity:getContentSize().width)
 local nDistance = math.round( self.m_pClipRect.width) +textW
 local speed = 2 --一秒移动多少个文字的距离
--local nTime = math.floor(nDistance/wideWordWidth(FONT_NAME, ZySize.SCALE(26))/speed)
   local nTime = 10
-- 6 动作
local tarfinsh = function()
    if self.msgContent ~= nil then
        self.msgContent:removeSelf()
        self.msgContent = nil
    end
end


local pAction = cc.MoveBy:create(nTime, cc.p(-self.m_pClipRect.width, 0))

local pAction1 = cc.MoveBy:create(nTime, cc.p(self.m_pClipRect.width, 0))


-- local pCallback = cc.CallFunc:create(tarfinsh)



local rep = cc.Sequence:create(pAction, pAction1)
self.Text_activity:setString("想要一口气闯五关么,每日首抽 必得大礼， 你值得拥有！")
self.Text_activity:runAction(cc.RepeatForever:create(rep) )


  self.Text_context =self.Layer_selectorcheck:getChildByName("Text_context")
  self.Image_1bg  =  self.Layer_selectorcheck:getChildByName("Image_1bg")

   print( sceneData.selectData.imag1)                         --- 场景背景图片
   self. Image_1bg:loadTexture(sceneData.selectData.imag1) 

   self.Text_des= self.Layer_selectorcheck:getChildByName("Text_des")    --  关名
   self.Text_des:setString(sceneData.selectData.textname)

    self.Text_gatedes = self.Layer_selectorcheck:getChildByName("Text_gatedes")  -- 推荐等级 
    self.Text_gatedes:setString(sceneData.selectData.Text_gatedes)

   self .item_1  =  self.Layer_selectorcheck:getChildByName("item_1")
   self .item_1  =  self.Layer_selectorcheck:getChildByName("item_2")
   self .item_1  =  self.Layer_selectorcheck:getChildByName("item_3")
   self .item_1  =  self.Layer_selectorcheck:getChildByName("item_4")

   self.starr1 =self.Layer_selectorcheck:getChildByName("starr1")
   self.starr2 =self.Layer_selectorcheck:getChildByName("starr2")
   self.starr3 =self.Layer_selectorcheck:getChildByName("starr3")
self.Text_level =self.Layer_selectorcheck:getChildByName("Text_level")
self.Text_level :setString(HeroData.Hero[1].rank)


  self.btn_fight =self.Layer_selectorcheck:getChildByName("btn_fight")
  -- self.btn_fight:loadTextures("self_ui/mmn.jpg" ,"self_ui/xcxcx.jpg")
 
local a = math.random(1,4)
local b = math.random(1,4)
self.item_1 = self.Layer_selectorcheck:getChildByName("item_1")
self.item_1 :loadTexture(HeroData.Allequi[a].pic)
self. item_3=self.Layer_selectorcheck:getChildByName("item_3")
self.item_3 :loadTexture(HeroData.Allequi[b].pic)

   self.btn_fight:addClickEventListener(function ()
   print("进入战斗场景")

    print(" 进入战前 章" ..  ModifyData.getSceneNum() )  
      print(" 进入战前 关卡"..ModifyData.getChapterNum())    ---设置关卡num
  if sceneData.selectData.lock == 0 then 
     display.replaceScene(Scene_Battle.new())
   else  
   print( "请解锁 之前 关卡")    
  end 
 audio.playSound ("mp3/click.mp3",false)

 end)
     


end   


function Layer_Gate:onEnter()

end


function Layer_Gate:onExit()

end

return  Layer_Gate