--
-- Author: hexinyi
-- Date: 2015-09-21 10:57:32




-- local Data_Manager = import(".Data_Manager") 
-- local Layer_Equip = import(".Layer_Equip")


local Scenes_Shop = class("Scenes_Shop", function( )
	return display.newScene("Scenes_Shop")
end)

function Scenes_Shop:ctor( )
	self.layer=cc.uiloader:load("Layer_Shop.csb"):addTo(self)
	self:initUI()


	-- Data_Manager:getInstance():setValueforKey("user_gold",20000)
	-- Data_Manager:getInstance():setValueforKey("user_diamond",1000)


end

function Scenes_Shop:initUI( )
	self.btn_table = {}
	self.button_b1 =self.layer:getChildByName("Button_b1")
 
	self.button_b2 =self.layer:getChildByName("Button_b2")
	self.button_b3 =self.layer:getChildByName("Button_b3")
	self.button_b4 =self.layer:getChildByName("Button_b4")
	self.button_b5 =self.layer:getChildByName("Button_b5")

	self.text_name1=self.layer:getChildByName("Text_name1")
	self.text_name2=self.layer:getChildByName("Text_name2")
	self.text_name3=self.layer:getChildByName("Text_name3")
	self.text_name4=self.layer:getChildByName("Text_name4")
	self.text_name5=self.layer:getChildByName("Text_name5")

	self.image_equip1=self.layer:getChildByName("Image_equip_1")
	  self.image_equip1:loadTexture(HeroData.Allequi[1].pic)
	  
	self.image_equip2=self.layer:getChildByName("Image_equip_2")
	 self.image_equip2:loadTexture(HeroData.Allequi[2].pic)

	self.image_equip3=self.layer:getChildByName("Image_equip_3")
	 self.image_equip3:loadTexture(HeroData.Allequi[3].pic)
	self.image_equip4=self.layer:getChildByName("Image_equip_4")
	self.image_equip4:loadTexture(HeroData.Allequi[4].pic)

	self.image_equip5=self.layer:getChildByName("Image_equip_5")

	self.button_back=self.layer:getChildByName("Button_Shop_back")

	self:btnCallBack()
	self:initText()
	-- print(type(self.button_b1))

	table.insert(self.btn_table ,self.button_b1)
	table.insert(self.btn_table ,self.button_b2)
	table.insert(self.btn_table ,self.button_b3)
	table.insert(self.btn_table ,self.button_b4)
	table.insert(self.btn_table ,self.button_b5)

	-- dump(self.btn_table)

	local ro = cc.RotateBy:create(3,360)
	local re =  cc.RepeatForever:create(ro)
	-- self.button_b1:runAction(re)
	-- self.button_b2:runAction(re:clone())
	-- self.button_b3:runAction(re)
	-- self.button_b4:runAction(re)
	--self.nodeMenu:runAction(re)
    -- for i=1,v in ipairs(self.btn_table) do
    -- 	v:runAction(re)
    -- end
    for i=1,5 do
    	print(self.btn_table[i])
    	self.btn_table[i]:runAction(re:clone())
    end


end

function Scenes_Shop:btnCallBack( )

-- local d= cc.Director:getInstance():getEventDispatcher()
-- self.l = cc.EventListenerTouchOneByOne:create()
-- self.l :setSwallowTouches(true)
-- self.l:registerScriptHandler(function(touch ,event )
-- return true 
-- end,cc.Handler.EVENT_TOUCH_BEGAN)
-- self.l:registerScriptHandler(function (touch , event)
--  end, cc.Handler.EVENT_TOUCH_MOVED)
-- self.l:registerScriptHandler(function(touch , event) 
-- end,cc.Handler.EVENT_TOUCH_ENDED)
-- d:addEventListenerWithSceneGraphPriority(self.l, self)
	
	self.button_back:addClickEventListener(function ( )     --- 返回主界面
        print("----------self.button_back---------")        
        display.replaceScene(GameLayer.new())   
	end)


	self.button_b1:addClickEventListener(function ( )
         -- print("----------self.button_b1---------")               
	    HeroData .shopdataselector =   HeroData.Allequi[1]
	     self.equiplayer=require("app.hxy.Layer_Equip").new():setAnchorPoint(cc.p(0.5,0.5)):addTo(self):pos(720, 400)
 
	end)
		self.button_b1:setSwallowTouches(false)

	self.button_b2:addClickEventListener(function ( )
		--print("----------self.button_b2---------")
		HeroData .shopdataselector =   HeroData.Allequi[2]
		self.equiplayer=require("app.hxy.Layer_Equip").new():setAnchorPoint(cc.p(0.5,0.5)):addTo(self):pos(720, 400)	

	end)

	self.button_b3:addClickEventListener(function ( )
		--print("----------self.button_b3---------")
			HeroData .shopdataselector =   HeroData.Allequi[3]
		self.equiplayer=require("app.hxy.Layer_Equip").new():setAnchorPoint(cc.p(0.5,0.5)):addTo(self):pos(720, 400)
	
	end)

	self.button_b4:addClickEventListener(function ( )

		--print("----------self.button_b4---------")
	HeroData .shopdataselector =   HeroData.Allequi[4]
		self.equiplayer=require("app.hxy.Layer_Equip").new():setAnchorPoint(cc.p(0.5,0.5)):addTo(self):pos(720, 400)		
	end)

	self.button_b5:addClickEventListener(function ( )

		--print("----------self.button_b4---------")
	 HeroData .shopdataselector = HeroData.stone
		self.equiplayer=require("app.hxy.Layer_Equip").new():setAnchorPoint(cc.p(0.5,0.5)):addTo(self):pos(720, 400)		
	end)
end

function Scenes_Shop:initText()
	self.text_name1:setString(HeroData.Allequi[1].name)
	self.text_name2:setString(HeroData.Allequi[2].name)
	self.text_name3:setString(HeroData.Allequi[3].name)
	self.text_name4:setString(HeroData.Allequi[5].name)
	self.text_name5:setString("强化石")

end

-- function Layer_Shop:initData( )
	
-- 	local data_count = Data.getData_Count()

-- end









return Scenes_Shop