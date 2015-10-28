--
-- Author: hexinyi
-- Date: 2015-09-30 20:15:09
--
-- local Data_Manager = import(".Data_Manager")

local Layer_GoldAndDiamond = class("Layer_GoldAndDiamond", function( )
 return display.newColorLayer(cc.c4b(100, 100, 100, 100))
end)

function Layer_GoldAndDiamond:ctor( )


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

	self.layer=cc.uiloader:load("AddLayer.csb") 
	self.layer:setAnchorPoint(0.5,0.5)
	self.layer:setPosition(display.cx, display.cy)
    self:addChild(self.layer)


	-- self.gold = Data_Manager:getInstance():getValueforKey("user_gold")
	-- self.diamond = Data_Manager:getInstance():getValueforKey("user_diamond")
	-- print("gold " .. self.gold .. " diamond " .. self.diamond)

	self:initUI( )
end

function Layer_GoldAndDiamond:initUI( )
	--钻石换金币
	self.add__bt1=self.layer:getChildByName("add__bt1")
	self.text_diamond1=self.layer:getChildByName("Text_diamond1")
	self.text_gold1=self.layer:getChildByName("Text_gold1")

	self.add__bt2=self.layer:getChildByName("add__bt2")
	self.text_diamond2=self.layer:getChildByName("Text_diamond2")
	self.text_gold2=self.layer:getChildByName("Text_gold2")

	self.add__bt3=self.layer:getChildByName("add__bt3")
	self.text_diamond3=self.layer:getChildByName("Text_diamond3")
	self.text_gold3=self.layer:getChildByName("Text_gold3")

	self.add__bt4=self.layer:getChildByName("add__bt4")
	self.text_diamond4=self.layer:getChildByName("Text_diamond4")
	self.text_gold4=self.layer:getChildByName("Text_gold4")

	self.add__bt5=self.layer:getChildByName("add__bt5")
	self.text_diamond5=self.layer:getChildByName("Text_diamond5")
	self.text_gold5=self.layer:getChildByName("Text_gold5")

	self.add__bt6=self.layer:getChildByName("add__bt6")
	self.text_diamond6=self.layer:getChildByName("Text_diamond6")
	self.text_gold6=self.layer:getChildByName("Text_gold6")

	--退出	
	self.add__back=self.layer:getChildByName("exit_bt")

	self:buttonCallBack( )
end

function Layer_GoldAndDiamond:updatecallback(message)
print("gexing   ==================")
 dump (message)
	-- HeroData.Hero[1].rank = message["message"]["info"]["rank"]
       
 --   HeroData.Hero[1].exprise  = message["message"]["info"]["exprise"]

 --   HeroData.Hero[1].gold    = message["message"]["info"]["gold"]

 --   HeroData.Hero[1].Acer   = message["message"]["info"]["acer"]

 --   HeroData.Hero[1].stone   = message["message"]["info"]["stone"]

 --    HeroData.Hero[1].locknum    = message["message"]["info"]["locknum"]

 --    HeroData.Hero[1].signdate  = message["message"]["info"]["signdate"]

 --    HeroData.Hero[1].signtime    = message["message"]["info"]["signtime"]

 --   HeroData.Hero[1].scenenum = message["message"]["info"]["scenenum"]

 --   HeroData.Hero[1].chapternum = message["message"]["info"]["chapternum"]

end   

function Layer_GoldAndDiamond:buttonCallBack( )
	self.add__bt1:addClickEventListener(function( )
		print("button1")
		local strdiamond1= self.text_diamond1:getString()
		local strgold1=self.text_gold1:getString()

       if  HeroData.Hero[1].Acer- 60 >= 0 then 
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 60 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+600

            if sceneData.model == 0 then 
          			 
          			if not app.websocket then
          				  print("not connected")
            				return
               		end
              		if app.callback["update"] then
          				app.callback["update"] = nil
         			   app.callback["update"] = handler(self, self.updatecallback)
      				else
       				  app.callback["update"] = handler(self, self.updatecallback)
    				end 
                      -- local text = '{"type":4,"message":{"user_id":"'..HeroData.user_id.. '","rank":"' .. HeroData.Hero[1].rank ..'","exprise":"'..HeroData.Hero[1].exprise  ..'","gold":"'..HeroData.Hero[1].gold ..  '","acer":"'.. HeroData.Hero[1].Acer .. '","stone":"'.. HeroData.Hero[1].stone ..   '","locknum":"' .. HeroData.Hero[1].locknum..    '","signdate":"'.. HeroData.Hero[1].signdate ..   '","signtime":"'.. HeroData.Hero[1].signtime..   '","scenenum":"'..HeroData.Hero[1].scenenum ..  '","chapternum":"'..HeroData.Hero[1].chapternum..  '"}}'  

                        local text = '{"type":4,"message":{"user_id":"'..HeroData.user_id.. '","rank":"' .. 0 ..'","exprise":"'.. 0 ..'","gold":"'.. 600 ..  '","acer":"'.. -60 .. '","stone":"'.. 0 ..   '","locknum":"' .. 0 ..    '","signdate":"'.. 0 ..   '","signtime":"'.. 0 ..   '","scenenum":"'.. 0 ..  '","chapternum":"'.. 0 ..  '"}}' 



                         if app.websocket:send(text) then
        						printf("更新 %s", text)
  						 end



            else 
                local str = json.encode(HeroData.Hero)   
                 ModifyData.WriteDataToDoc(str,1)

            end 


        HeroData.GameLayerdegate:reshUI() 
		end 
		-- Data_Manager:getInstance():setValueforKey("user_gold",self.gold)
		-- Data_Manager:getInstance():setValueforKey("user_gold",self.diamond)
		
	end)

	self.add__bt2:addClickEventListener(function( )
		print("button2")
		local strdiamond2= self.text_diamond2:getString()
		local strgold2=self.text_gold2:getString()
		
	if  HeroData.Hero[1].Acer- 100 >= 0 then 
              
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 100 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+1000
           local str = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str,1)
              HeroData.GameLayerdegate:reshUI() 

		end
		
		-- Data_Manager:getInstance():setValueforKey("user_gold",self.gold)
		-- Data_Manager:getInstance():setValueforKey("user_gold",self.diamond)
	
	end)

	self.add__bt3:addClickEventListener(function( )
		print("button3")
		local strdiamond3= self.text_diamond3:getString()
		local strgold3=self.text_gold3:getString()
		
			if  HeroData.Hero[1].Acer- 160 >= 0 then 
              
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 160 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+1600
           local str = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str,1)
               HeroData.GameLayerdegate:reshUI() 

		end

	
	end)

	self.add__bt4:addClickEventListener(function( )
		print("button4")
		local strdiamond4= self.text_diamond4:getString()
		local strgold4=self.text_gold4:getString()
		

		if  HeroData.Hero[1].Acer- 200 >= 0 then 
              
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 200 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+2000
           local str = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str,1)
             HeroData.GameLayerdegate:reshUI() 

		end	
	
	end)

	self.add__bt5:addClickEventListener(function( )
		print("button5")
		local strdiamond5= self.text_diamond5:getString()
		local strgold5=self.text_gold5:getString()
	

		if  HeroData.Hero[1].Acer- 260 >= 0 then 
              
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 260 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+2600
           local str = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str,1)
             HeroData.GameLayerdegate:reshUI() 

		end	
	
	end)

	self.add__bt6:addClickEventListener(function( )
		print("button6")
		local strdiamond6= self.text_diamond6:getString()
		local strgold6=self.text_gold6:getString()
		
		if  HeroData.Hero[1].Acer- 300 >= 0 then 
              
            HeroData.Hero[1].Acer= HeroData.Hero[1].Acer- 300 
            HeroData.Hero[1].gold=  HeroData.Hero[1].gold+3000
           local str = json.encode(HeroData.Hero)
             ModifyData.WriteDataToDoc(str,1)
                HeroData.GameLayerdegate:reshUI() 

		end	

	
	end)

	self.add__back:addClickEventListener(function( )
		self:removeSelf()
     audio.playSound ("mp3/btn.mp3",false) 
	end)

end

return Layer_GoldAndDiamond








