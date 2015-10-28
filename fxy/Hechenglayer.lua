
local  EQData={}
local SelectedBtn={}   --- 加数据
local currenteqData = {}

local EQCell=class("EQCell", function (  )
	return ccui.Widget:create()
end)
function EQCell:ctor( eq_id )
	self.id=eq_id
	self.cell=cc.uiloader:load("hechengnode.csb")
    self.cell:pos(0, 0)
    self:addChild(self.cell)
	self:setContentSize(cc.size(380, 80))
	self.cell:setTouchEnabled(true)
	self:init()
    self.is_Moved=false
    isclick=true
end
function EQCell:init(  )
	print("---------cell init----------")
	self.img_icon=self.cell:getChildByName("img_icon")
	self.Text_name=self.cell:getChildByName("Text_name")
	self.Text_level=self.cell:getChildByName("Text_level")
	self.CheckBox=self.cell:getChildByName("CheckBox")    ----    每个  checkbox  self.id   ---  mark 
     self.CheckBox:setEnabled(false)
  -- self.CheckBox:addEventListener(function(psender,event)
  --       print("选择的装备 id :" .. self.id);
      


    
  --   end)

    
	self.Button_btn=self.cell:getChildByName("Button_btn")
    self:refreshCell()
end

function EQCell:refreshCell(  )

	local data=EQData[self.id]
	self.img_icon:loadTexture(data.pic)
	self.Text_name:setString(data.name)
	self.Text_level:setString(data.level)

end

local Hechenglayer=class("Hechenglayer", function (  )
        return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)

function Hechenglayer:ctor(  )
	HeroData.  Hechenglayerdegate = self 
	self.Top  =  0 
    self.Left  =  0 
    self.Right  =  0 
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

EQData = HeroData.pagkeequ

self:initUI()	

end
function Hechenglayer:removecallback (message)
  dump(message)


end 


function Hechenglayer:initUI(  )

    self.layer=cc.uiloader:load("hechenglayer.csb")
    self.layer:setAnchorPoint(cc.p(0,0))
    self.layer:pos(0,0)
    self:addChild(self.layer)

    self.listview=self.layer:getChildByName("ListView")
    self.Button1=self.layer:getChildByName("Button1")
    self.Button2=self.layer:getChildByName("Button2")
    self.Button3=self.layer:getChildByName("Button3")
    self.xuan=self.layer:getChildByName("xuan")
    self.xuan:loadTexture("tavern_magicsoul_circle_2.png")
    local rotate=cc.RotateBy:create(5,360)
    self.xuan:runAction(cc.RepeatForever:create(rotate))


    self.hebtn=self.layer:getChildByName("hebtn")   --- hecheng
    self.hebtn:removeSelf()

    self.hebtn = ccui.Button:create( "self_ui/blank1_normal.png","self_ui/blank1_press.png")
  self.hebtn:setPosition(display.cx-165,  display.cy-100)
 self.hebtn :addTo(self)
   self.hebtn :setTouchSwallowEnabled(false)
  

    -- self.hebtn:loadTextures("self_ui/blank1_normal.png","self_ui/blank1_press.png")
     self.hebtn:setTitleText("合成")
          self.hebtn:setTitleColor(cc.c3b(0, 0, 255))
 self.hebtn:setTitleFontSize(28)
    self.hebtn :addClickEventListener (function ()





         math.randomseed(os.time())
         local  a  =  math.random(1,10)
           print(a) 
      
            if   a >=6 then 


             local star_index = 0 
              for i,v in ipairs(EQData) do
                 if   v .remove ~= nil then 
      	          star_index = v . star  
      	                break
                end  
               end 
              if  star_index <3  then 
                       if  self. Top == 1  and   self.Left ==1    and self.Right == 1   then
                       	 self.Button1:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
                        self.Button2:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
                         self.Button3:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
                       self:succcess()
                       self. Top = 0   
                        self.Left =0    
                        self.Right = 0 
                       end 
              end 
             else 
             	  local star_index = 0 
                   for i,v in ipairs(EQData) do
                      if   v .remove ~= nil then 
      	                 star_index = v . star  
      	                 break
                      end  
                     end 
                    if  star_index <3  then 
                    	  if  self. Top == 1  and   self.Left ==1    and self.Right == 1   then
                       	 		  self.Button1:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
                        		  self.Button2:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
                       			  self.Button3:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
             	          		  self:defeat()
             	          		  self. Top = 0   
                                  self.Left =0    
                                  self.Right = 0 
             	          end 
                    end 
            end  

  --        if not app.websocket then
  --           print("not connected")
  --           return
  --       end
  --      if app.callback["remove"] then
  --         app.callback["remove"] = nil
  --         app.callback["remove"] = handler(self, self.removecallback)
  --     else
  --        app.callback["remove"] = handler(self, self.removecallback)
  --     end

  --     local text8 ='{"type":8,"message":{"user_id":"' .. HeroData.user_id .. '","id":"'.. 3 ..','.. 4 .. '"}}'
  --    print(text8)
  -- if app.websocket:send(text8) then
  --        end









    end)
     self.backbtn=self.layer:getChildByName("backbtn")          ---   返回
      self.backbtn:removeSelf()
    -- self.backbtn:loadTextures("self_ui/goback_normal.png","self_ui/goback_perss.png")
    -- self.backbtn:addClickEventListener(function (  )
    --   for i,v in ipairs( HeroData.pagkeequ) do
    --        if v. remove ~= nil  then  
    --         v.remove = nil 
    --        end 
    --   end

    -- 		HeroData.packagelayerdegate:refreshListView()
    --    self:removeSelf()
    -- end)
    

self.back = ccui.Button:create( "self_ui/goback_normal.png","self_ui/goback_perss.png")

  self.back:setPosition(150,  display.top-100)
 self.back :addTo(self)
   self.back :setTouchSwallowEnabled(false)
   self.back:addTouchEventListener(function (sender,state )

  if   (state ==2)then
     for i,v in ipairs( HeroData.pagkeequ) do
           if v. remove ~= nil  then  
           v.remove = nil 
           end 
     end
     
      HeroData.packagelayerdegate:refreshListView()
       self:removeSelf()

  end
  end) 

self:refreshlistview()

end




  function Hechenglayer:defeat()

  local Layer_Hechengfai   =  Layer_Hechengfail.new() 
    self:addChild(Layer_Hechengfai)

  	end 
 function Hechenglayer:succcess()
  local Layer_hechengsuc   =  Layer_hechengsucc.new() 
    self:addChild(Layer_hechengsuc)

end 
function Hechenglayer:refreshlistview(  )
	self.listview:removeAllChildren()
	dump (EQData)
	self.cell={}

   	for i=1,#EQData do
              self.cell[i]=EQCell.new(i)
              self.listview:pushBackCustomItem(self.cell[i])
              self.cell[i]:setTouchEnabled(true)
              self.cell[i]:setTag(i)
              self.cell[i].Button_btn:setSwallowTouches(false)
     self.cell[i].Button_btn:addTouchEventListener(function ( sender ,touch_event )
    
    	if touch_event==0 then
    		 self.is_Moved=false
    	 	return true
       elseif touch_event ==1 then
    		 self.is_Moved=true

    	elseif  touch_event== 2 then 
	print("-------------------------------------  " ..self.cell[i]:getTag())
	      local tag=self.cell[i]:getTag()
	         if   EQData[tag] .remove  ~= nil  then 
               
               if  EQData[tag] .remove == 1 then 
                  	self.Top =0
               	    EQData[tag] .remove = nil 
               	  self.Button1:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
               	  self.cell[i]. CheckBox :setSelected(false)
               	  return
                elseif   EQData[tag] .remove == 2 then 
                  	self.Left =0
               	    EQData[tag] .remove = nil 
               	  self.Button2:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
               	  self.cell[i]. CheckBox :setSelected(false) 
               	  return
               	 elseif   EQData[tag] .remove == 3 then 
                  	self.Right =0
               	    EQData[tag] .remove = nil 
               	  self.Button3:loadTextures("jiajiaimg.png", "jiajiaimg.png" )
               	  self.cell[i]. CheckBox :setSelected(false) 
               	  return
               	  	
                end 
             end 
       
   


            
                   local star_index  = 0
                  local  r =false
                  local num  = 0
              for i,v in ipairs( EQData ) do
                     	 if v .remove  ~= nil then
                     	 	star_index = v.star 
                     	 	 num  =num +1
                     	 	break 
                     	 end  
                     end    
                     if    num  == 0 then 
                        star_index =  EQData[tag].star
                    end 


                       if EQData[tag].star ==  star_index then 
                       	r= true

                       end 


    		  if     self.is_Moved== false  then  
                     if  self.Top == 0  and EQData[tag] .remove ==nil and r  then             
                      print(tag) 

                    EQData[tag] .remove = 1 
                    self.Top =1
                      self.Button1:loadTextures(EQData[tag].pic , EQData[tag].pic )
                     self.cell[i]. CheckBox :setSelected(true)
 

                      elseif self.Left == 0 and EQData[tag] .remove ==nil and r then 
                      	  EQData[tag] .remove = 2 
                       self.Left =1
                      	        self.Button2:loadTextures(EQData[tag].pic , EQData[tag].pic )
                      	            self.cell[i]. CheckBox :setSelected(true)
                      	elseif self.Right == 0 and EQData[tag] .remove ==nil and r then 
                      	EQData[tag] .remove = 3 
                        self.Right =1
                       self.Button3:loadTextures(EQData[tag].pic , EQData[tag].pic )
                           self.cell[i]. CheckBox :setSelected(true)

  					 end




    		  end 
      	     		

      end
       self.is_Moved=false
     end)
    end
self:refreshDes()
end

function Hechenglayer:refreshDes(  )
   	
   	local data=EQData[self.id]
   	

end
	
return Hechenglayer




