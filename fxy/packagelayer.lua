--
-- Author: student
-- Date: 2015-09-20 14:10:34
--


 local EQData={}

local EQCell=class("EQCell", function (  )
	return ccui.Widget:create()---容器
end)

function EQCell:ctor( eq_id )
self.id=eq_id
self.is_Moved=false
self.cell=cc.uiloader:load("cellnode.csb")
self.cell:pos(0, 0)
self:addChild(self.cell)
self:setContentSize(cc.size(390,80))
self:init()
self:setTouchEnabled(true)
end

function EQCell:init( )
	print("-------EQCellm init()--------")
	self.Image_euq_icon=self.cell:getChildByName("Image_euq_icon")
	self.Text_equ_name=self.cell:getChildByName("Text_equ_name")
	self.Text_rank=self.cell:getChildByName("Text_rank")

	self.star={}
	for i=1,3 do
		self.star[i]=self.cell:getChildByName("Image_star"..i)
	end
    self.Button_b  =  self.cell:getChildByName("Button_b")
	self:refreshUI()

end



function EQCell:refreshUI()
	print("====")
	local data=EQData[self.id]
	print(j)
	print(data.id)
	self.Image_euq_icon:loadTexture(data.pic)

	self.Text_equ_name:setString(data.name)
	self.Text_rank:setString(tostring(data.level))
    if  data.star == 0 then 
    	self.star[1]:removeSelf()
    end 
   
	for i=1,data.star do
		print("几颗星")
		self.star[i]:loadTexture("star.png")
	end
	
end

local packagelayer=class("packagelayer", function (  )
	return display.newScene("packagelayer")
end)
function packagelayer:ctor(  )
	HeroData.packagelayerdegate =self 
	 EQData = HeroData.pagkeequ

	 dump(EQData)

	self:initbg()
	self.selected_index=0
    self._i=1
	self:initUI()
end

 function packagelayer:initbg()   
 	local  Bg   =   cc.Sprite :create("res/hxy/bg.png"):pos(display.cx ,display.cy):addTo(self) 


 end 
function packagelayer:initUI(  )
	self.layer=cc.uiloader:load("packagelayer.csb")
	 
	self.layer:setAnchorPoint(cc.p(0,0))
	self.layer:pos(0,0)
	self:addChild(self.layer)
        
	self.listview=self.layer:getChildByName("ListView_2")

	self.Panel=self.layer:getChildByName("Panel_1")


    self. Button_strong  = self.Panel:getChildByName("Button_strong")
    -- self.Button_strong:loadTextures("self_ui/blank_normal.png", "self_ui/blank_press.png")
    self.Button_strong:addClickEventListener(function (  )
    	 
     print( "升级")  
      	   self:addChild(Layer_leveup.new(),5) 
      

	end)


	self.Text_kind1=self.Panel:getChildByName("Text_kind1")

	self.Image_icon=self.Panel:getChildByName("Image_icon")
     
	self.Text_name=self.Panel:getChildByName("Text_name")

	self.Text_rank=self.Panel:getChildByName("Text_rank")

	self.Text_kind=self.Panel:getChildByName("Text_kind")

	self.Text_attribute=self.Panel:getChildByName("Text_attribute")


	-- ------button
	self.Button_syn=self.layer:getChildByName("Button_syn")    --- 合成
	self.Button_syn:loadTextures("self_ui/blank1_normal.png","self_ui/blank1_press.png")


		self.Button_syn:addClickEventListener(function (  )
	
		   self:addChild(Hechenglayer.new(),5) 
	end)
    


	self.backbtn=self.layer:getChildByName("backbtn")     --- 返回
	self.backbtn:removeSelf()
  
self.backbtn = ccui.Button:create( "self_ui/goback_normal.png","self_ui/goback_perss.png")

  self.backbtn:setPosition(150,  display.top-100)
 self.backbtn :addTo(self)
   self.backbtn :setTouchSwallowEnabled(false)


	self.backbtn:addClickEventListener(function (  )
		display.replaceScene(require("app.scenes.GameLayer").new())
	end)


	self:refreshListView()
end


function packagelayer:refreshListView(  )
	self.listview:removeAllChildren()
	self.cell={}
	for i=1,#EQData do
		self.cell[i]=EQCell.new(i)
		print(self.cell[i])
		self.listview:pushBackCustomItem(self.cell[i])
		self.cell[i]:setTouchEnabled(true)
		self.cell[i]:setTag(i)
        self.cell[i].Button_b:setSwallowTouches(false)
       

        self.cell[i].Button_b:addTouchEventListener(function ( sender,touch_event )
        	  if touch_event==0 then
        	  	   return true
        	  	   elseif touch_event==1 then 
        	  	   	self.is_Moved=true
        	  	   	elseif self.is_Moved then
        	  	   	   self.is_Moved=false
        	  	   	else 
        	  	   		tag=self.cell[i]:getTag()
        	  	   		self._i=tag 
        	  	   		
        	  	   		self:refreshDes()
        	  end
        end)
	

	end
	
	self:refreshDes()
end

function packagelayer:refreshDes(  )
 
	-- self. Text_kind1=self.Panel:getChildByName("Text_kind1")

	-- self.Image_icon=self.Panel:getChildByName("Image_icon")

	-- self.Text_name=self.Panel:getChildByName("Text_name")

	-- self.Text_rank=self.Panel:getChildByName("Text_rank")

	-- self.Text_kind=self.Panel:getChildByName("Text_kind")

	-- self.Text_attribute=self.Panel:getChildByName("Text_attribute")
      
      
	  local data=EQData[self._i]
	     dump(data)
       HeroData.leveup_index =self._i 
	--self.Image_icon:loadTexture("a_"..data.id..".png")

  	self.Image_icon:loadTexture(data.pic)

	self.Text_name:setString(data.name)

	self.Text_kind:setString(data.kind)

	self.Text_rank:setString(data.level)
	local Text_attribute = ""
	-- if data.add.life ~=0 then
	-- 	Text_attribute= Text_attribute.."+ "..data.add.life.." 生命值\r\n"
	-- end
	-- if data.add.physic ~=0 then
	-- 	Text_attribute = Text_attribute.."+ "..data.add.physic.." 物理反弹\r\n"
	-- end
	-- if data.add.magic ~=0 then
	-- 	Text_attribute = Text_attribute.."+ "..data.add.magic.." 魔力反弹\r\n"
	-- end
     Text_attribute  =  "+生命值  :" .. data.health .."\n+攻击力 :"..data.atk .."\n+防御力 :" .. data.def
	self.Text_attribute:setString(Text_attribute)


   for i=1,3 do
   	    local Image_star1  = self.Panel:getChildByName("Image_star"..i)
   	     Image_star1:loadTexture("anstar.png")
   end
 
    if (data. star >0)  then 
      local Image_star1  = self.Panel:getChildByName("Image_star1")
       Image_star1:loadTexture("star.png")
    end
        if (data. star >1)  then 
      local Image_star2  = self.Panel:getChildByName("Image_star2")
      Image_star2:loadTexture("star.png")
       end
      if (data. star >2)  then 
      local Image_star3  = self.Panel:getChildByName("Image_star3")
      Image_star3:loadTexture("star.png")
      end



end





return packagelayer
