

  local  Data_Manager1= require("app.scenes.Data_Manager")

  local Scene_shop = require("app.scenes.Scene_shop")

 -- local Scene_Hero = require("app.scenes.Scene_hero")

 local Roateview = require("app.scenes.Roateview")

 local Node_gold = require("app.scenes.Node_gold")


local GameLayer = class("GameLayer", function()
    return display.newScene("GameLayer")

end)

function  GameLayer:uploadcallback(message)
  print("____________________________")

    HeroData.Hero[1].rank = message["message"]["info"]["rank"]

   HeroData.Hero[1].exprise  = message["message"]["info"]["exprise"]

   HeroData.Hero[1].gold    = message["message"]["info"]["gold"]
       print("   HeroData.Hero[1].gold  :"..   HeroData.Hero[1].gold)
   HeroData.Hero[1].Acer   = message["message"]["info"]["acer"]
 print("   HeroData.Hero[1].Acer  :"..   HeroData.Hero[1].Acer)
   HeroData.Hero[1].stone   = message["message"]["info"]["stone"]

    HeroData.Hero[1].locknum    = message["message"]["info"]["locknum"]

    HeroData.Hero[1].signdate  = message["message"]["info"]["signdate"]

    HeroData.Hero[1].signtime    = message["message"]["info"]["signtime"]

   HeroData.Hero[1].scenenum = message["message"]["info"]["scenenum"]

   HeroData.Hero[1].chapternum = message["message"]["info"]["chapternum"]


 self:reshUI() 











end 

function  GameLayer:uploadequicallback(message)


   local equiarray=  message ["message"]["info"]
   dump(equiarray)

 HeroData.pagkeequ = nil 
    HeroData.pagkeequ ={}
    for i,v in ipairs(equiarray) do

      for i,a in ipairs(HeroData.Allequi) do
               if tonumber(v.type_id)  == a.id  and  a.star == tonumber(v.star)  then 
                print("---------------x")
                local   data  =  clone( a )
                data . level  =v. level
                data . wear = v.wear
                data.key = v.id 
                table.insert(  HeroData.pagkeequ ,data)

             end
       end 
   
      


    end

   dump ( HeroData.pagkeequ)

end  



function  GameLayer:initData()
  if sceneData .model == 1 then 
    local docpath1 = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"
    print(docpath1)
    if cc.FileUtils:getInstance():isFileExist(docpath1)==false then
            print("写入英雄herodata")
       local str = json.encode(HeroData.Hero)
       ModifyData.WriteDataToDoc(str,1)
      

 
    else
        print("读入英雄herodata")
        local str = ModifyData.ReadDataToDoc(1)
         HeroData.Hero = json.decode(str)
             
    end  

    local docpath2 = cc.FileUtils:getInstance():getWritablePath().."pagkeequ.txt"
      if cc.FileUtils:getInstance():isFileExist(docpath2)==false then
            print("写入英雄pagkeequ")
         local str = json.encode(HeroData.pagkeequ)
         ModifyData.WriteDataToDoc(str,3)
  
     else
           print("读入英雄pagkeequ")
           local str = ModifyData.ReadDataToDoc(3)
           HeroData.pagkeequ = json.decode(str)
             
    end

    else      ---- 网络模式   
      

       if not app.websocket then
            print("not connected")
            return
        end
       if app.callback["find"] then
          app.callback["find"] = nil
          app.callback["find"] = handler(self, self.uploadcallback)
      else
         app.callback["find"] = handler(self, self.uploadcallback)
      end

     local text = '{"type":3,"message":{"user_id":"'..HeroData.user_id..'","name":"'.."12".. '","rank":"' .. HeroData.Hero[1].rank ..'","exprise":"'..HeroData.Hero[1].exprise  ..'","gold":"'..HeroData.Hero[1].gold ..  '","acer":"'.. HeroData.Hero[1].Acer .. '","stone":"'.. HeroData.Hero[1].stone ..   '","locknum":"' .. HeroData.Hero[1].locknum..    '","signdate":"'.. HeroData.Hero[1].signdate ..   '","signtime":"'.. HeroData.Hero[1].signtime..   '","scenenum":"'..HeroData.Hero[1].scenenum ..  '","chapternum":"'..HeroData.Hero[1].chapternum..  '"}}'
     local text5 ='{"type":5,"message":{"user_id":"' .. HeroData.user_id ..'"}}'
     print(text5)


    if app.websocket:send(text5) then
        printf("获取英雄信息 %s", text5)
    end

  --  for i,v in ipairs(HeroData.pagkeequ) do

  --            if not app.websocket then
  --                 print("not connected")
  --                 return
  --           end
  --           if app.callback["equip"] then
  --              app.callback["equip"] = nil
  --              app.callback["equip"] = handler(self, self.uploadequicallback)
  --           else
  --              app.callback["equip"] = handler(self, self.uploadequicallback)
  --           end

  --     local text6 ='{"type":6,"message":{"user_id":"' .. HeroData.user_id ..'","type_id":"'.. v.id  .. '","level":"'.. v.level .. '","wear":"'.. v.wear .. '","star":"'.. v.star ..'"}}'
  --      printf("装备 %s", text6)
  --            if app.websocket:send(text6) then
               
  --             end


  -- end    

  if not app.websocket then
                  print("not connected")
                  return
            end
            if app.callback["equip"] then
               app.callback["equip"] = nil
               app.callback["equip"] = handler(self, self.uploadequicallback)
            else
               app.callback["equip"] = handler(self, self.uploadequicallback)
            end
   local  text7 = '{"type":7,"message":{"user_id":"' .. HeroData.user_id .. '"}}'
        printf("装备 %s", text7)
           if app.websocket:send(text7) then
               
            end



 end   

  
end 

function GameLayer:ctor()
          HeroData.GameLayerdegate = self 
          self: initData()
   --   local   Data =  Data_Manager1:getInstance()

    
   --    local  yy=  Data:getTableforKey("1")
   --  print(type (yy))
   --  for i,v in ipairs(yy) do
   --    print(i,v)
   --  end
   -- print(  Data:getValueforKey("1"))




self. scene = cc.uiloader:load("res/RotateionView/Scene_main.csb"):addTo(self,2) 
  
  local Image_bg =self. scene :getChildByName("Image_bg")
  Image_bg:removeSelf()
local __curFilter = {"HUE", {90}}

  
  local __filters, __params = unpack(__curFilter)
  if __params and #__params == 0 then
    __params = nil
  end

  local sp = display.newFilteredSprite("first_scene_bg.jpg", __filters, __params)
    :align(display.CENTER, display.cx, display.cy)
   :addTo(self, 1)
    
  self._snow = cc.ParticleSnow:createWithTotalParticles(40)
  self._snow:setPosition(cc.p(display.cx, display.top))
  self:addChild(self._snow,1,1)
    self._snow1 = cc.ParticleFlower:createWithTotalParticles(60)
  self._snow1:setPosition(cc.p(display.cx-280, display.cy-100))
  self:addChild(self._snow1,1,1)

  local size =  cc.Director:getInstance():getWinSize()



 self.ButtonSet = ccui.Button:create( "set.png","set.png")     --- 设置 
  self.ButtonSet:setPosition(80,display.top-80)
   -- self.ButtonSet:setScale(0.2)
 self.ButtonSet :addTo(self,5)
   self.ButtonSet :setTouchSwallowEnabled(false)
   self.ButtonSet:addTouchEventListener(function (sender,state )
  if   (state ==2)then
       audio.playSound ("mp3/btn.mp3",false) 
      print("点击设置")
       sceneData .setLayer  = 0 
     local   SetLaye = SetLayer.new()
     self:addChild(SetLaye, 5)        -- 
   end
  end) 


  

  self.Button_sign = self.scene:getChildByName("Button_sign")
    self.Button_sign:removeSelf()
 --  self.Button_sign:addTouchEventListener(function (sender,state )
 
 --   if(state ==2)then
 --     print("跳转   -- 签到")
 --     local chec =check.new() 
 --       self:addChild(chec, 5)    
 -- audio.playSound ("mp3/click.mp3",false)
 --   end
 --  end) 

  self.Button_store = self.scene:getChildByName("Button_store")
  self.Button_store:addTouchEventListener(function (sender,state )
   if(state ==2)then
     print("跳转   -- 商店")
     

         -- local scence1 =  Scene_shop.new()
         --  self:addChild(scence1,6)
         -- Scenes_Shop
         -- self:addChild( Layer_Shop.new() ,5)
             display.replaceScene(Scenes_Shop.new())
              audio.playSound ("mp3/click.mp3",false)
   end
  end) 

  self.Button_task = self.scene:getChildByName("Button_task")
    self.Button_task:setPosition(size.width-80 ,size.height-100 )
  self.Button_task:addTouchEventListener(function (sender,state )
   if(state ==2)then
     print("跳转   -- 任务")
     local   R =  Reward.new()
      self:addChild(R, 5)        --  抽奖
       audio.playSound ("mp3/click.mp3",false)
   end

  end) 

  self.Button_hero = self.scene:getChildByName("Button_hero")
  self.Button_hero:setPosition(size.width-80 , size.height-100-(size.height-200)/4 )
  self.Button_hero:addTouchEventListener(function (sender,state )
        
   if(state ==2)then
     print("跳转   -- 英雄")
    -- local selectorHero  = Scene_Hero.new()
    --     self:addChild(selectorHero,5)
      local Layer_heroAttribut = Layer_heroAttribute.new()
        self:addChild(Layer_heroAttribut,5)
         audio.playSound ("mp3/click.mp3",false)
   end
  end) 
   self.Button_page= self.scene:getChildByName("Button_page")
  local size1 = self.Button_page:getContentSize()
  print("----------" ..size1.width)
  print("------"..size1.height)
       self.Button_page:setPosition(size.width-80 , size.height-100-(size.height-200)/4*2 )
  self.Button_page:addTouchEventListener(function (sender,state )
   if(state ==2)then
     print("跳转   fxy的-- 背包")    
 display.replaceScene(packagelayer.new())
  audio.playSound ("mp3/click.mp3",false)
       
  --    local layer_equ_description =Layer_equ_description.new()
  -- self:addChild( layer_equ_description, 10)
  
   end
  end) 

   self.Button_activity= self.scene:getChildByName("Button_activity")
        self.Button_activity:setPosition(size.width-80 , size.height-100-(size.height-200)/4*3  )
  self.Button_activity:addTouchEventListener(function (sender,state )
   if(state ==2)then
     print("跳转   -- 活动")

         local Layer_Activ  = Layer_Active.new()
        self:addChild(Layer_Activ,5)
     audio.playSound ("mp3/click.mp3",false)
   end
  end) 
  
  local layer =Roateview.new()
  layer:setPosition(cc.p(display.cx, display.cy))
  self:addChild(layer, 5)
self. node = cc.uiloader:load("res/RotateionView/Node_gold.csb") :pos(display.cx-150, display.top -50) :addTo(self,8)
-- local size={}
 local size  = cc.Director:getInstance():getWinSize()
 print(size .width)
 print(size)

 self. node:setAnchorPoint(0.5,0.5)
self. node:setPosition(size.width/2 - 150 , size.height-50)

self.Text_diamond= self.node:getChildByName("Text_diamond")
  self.Button_add= self.node:getChildByName("Button_add")
    self.Button_add:loadTextures("self_ui/add_gold.png", "self_ui/add_gold.png")
  self.Button_add:addTouchEventListener(function (sender,state )
   if(state ==2)then
         print("Button_add")
         -- local num =   self.Text_diamond:getString()+100
         -- self.Text_diamond :setString(tostring(num))   
            local Layer_Activ  = Layer_Active.new()
           self:addChild(Layer_Activ,10)
             audio.playSound ("mp3/click.mp3",false)
   end
  end) 
   self.Text_gold  =  self.node:getChildByName("Text_gold")



 self.Button_moneyadd= self.node:getChildByName("Button_moneyadd")
 

 self.Button_moneyadd :loadTextures("self_ui/add_gold.png", "self_ui/add_gold.png")

  self. Image_diamond  = self.node:getChildByName("Image_diamond")

   

  self.Button_moneyadd:addTouchEventListener(function (sender,state )
   if(state ==2)then
         print("Button_moneyadd:  钻石兑换  金币") 
          audio.playSound ("mp3/click.mp3",false)
            local Layer_GoldAndDiamond  = Layer_GoldAndDiamond.new()
  
           self:addChild(Layer_GoldAndDiamond,10)
   end
  end) 


  --  self.Node_gold:setPosition(cc.p(display.cx-150, display.top -50))
  -- self:addChild( self.Node_gold, 8)
  self. node:setTag(101)


 self:reshUI() 

end 
function GameLayer:reshUI()     ---准备刷新  
self.Text_diamond:setString(HeroData.Hero[1].Acer)  -- 元宝
 self.Text_gold :setString(HeroData.Hero[1].gold)




end 


function GameLayer:onEnter()
end

function GameLayer:onExit()
end

return GameLayer