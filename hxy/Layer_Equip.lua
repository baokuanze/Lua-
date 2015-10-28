--
-- Author: hexinyi
-- Date: 2015-09-21 16:02:09
--

local Data_Manager = import(".Data_Manager") 


local Layer_Equip = class("Layer_Equip ", function( )
	return display.newLayer("Layer_Equip ")
end)

function Layer_Equip:ctor( )
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


	self.gold = Data_Manager:getInstance():getValueforKey("user_gold")
	self.diamond = Data_Manager:getInstance():getValueforKey("user_diamond")

	print(self.gold)
	print(self.diamond)

	self.layer=cc.uiloader:load("Layer_Equip.csb"):addTo(self)

	self:initUI()
end

function Layer_Equip:initUI( )


	self.Button_back = self.layer:getChildByName("Button_equip_back")
	self.Button_buy=self.layer:getChildByName("Button_buy")

	self.Image_icon=self.layer:getChildByName("Image_icon")
	self.Image_star = {}
	for i=1,3 do
		local str = "Image_star_" .. i
		self.Image_star[i]=self.layer:getChildByName(str)
	end
	
	self.Text_name=self.layer:getChildByName("Text_name")
	self.Text_level=self.layer:getChildByName("Text_level")
	self.Text_kind=self.layer:getChildByName("Text_kind")
	self.Text_price=self.layer:getChildByName("Text_price")
	self.Text_equip_des=self.layer:getChildByName("Text_equip_des")
      
    self:refreshDes()
    
	self:btCallBack()

end

function Layer_Equip:btCallBack( )
	self.Button_back:addClickEventListener(function ( )
		print("Layer_Equip ----Button_back")
		self:removeFromParent()
	end)
	self.Button_buy:addClickEventListener(function ( )
		if self.data.id== 5 then
		     if  HeroData .Hero[1].gold - self.data.price >= 0 then 
                 HeroData .Hero[1].gold =HeroData .Hero[1].gold- tonumber(self.data.price)
                 HeroData .Hero[1].stone = HeroData .Hero[1].stone+1
				local str1 = json.encode(HeroData.Hero)
      			     ModifyData.WriteDataToDoc(str1,1)
      			     self:removeSelf()
      	    end 		     
 
		else 
	    
	         	if  HeroData .Hero[1].gold - self.data.price >= 0 then 
		            HeroData .Hero[1].gold =HeroData .Hero[1].gold- tonumber(self.data.price)    --- 扣钱  
		 			print(HeroData .Hero[1].gold)
        			local   equ =clone(self.data)
       				table.insert(HeroData.pagkeequ ,equ)
        			dump(HeroData.pagkeequ)

      				local str1 = json.encode(HeroData.Hero)
      			     ModifyData.WriteDataToDoc(str1,1)

     				local str = json.encode(HeroData.pagkeequ)
     				ModifyData.WriteDataToDoc(str,3)
       				self:removeSelf()

       			end  
       	end 		

		-- Data_Manager:getInstance():setValueforKey("user_gold",self.gold)
	end)
end

function Layer_Equip:refreshDes()
	print("---------------------------------")
	self.data =HeroData .shopdataselector 

	print("refreshDes")
	local text = ""
	if self.data.health >0 then
		text=text .. "+ " .. self.data.health .. " 生命值\r\n"	
	end
	if self.data.atk>0 then
		text=text .. "+ " .. self.data.atk .. " 攻击力\r\n"	
	end
	if self.data.def>0 then
		text=text .. "+ " .. self.data.def .. " 防御力\r\n"	
	end

	self.Text_name:setString(self.data.name) 
	self.Text_level:setString(self.data.level)
	self.Text_kind:setString(self.data.kind)
	self.Text_price:setString(tostring(self.data.price))
	self.Text_equip_des:setString(text)
	self.Image_icon:loadTexture(self.data.pic)

         
	for i=1,self.data.star do
		self.Image_star[i]:loadTexture("detail_star.pvr.png")
	end


end

return Layer_Equip 











