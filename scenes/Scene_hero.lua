

local Scene_hero = class("Scene_hero", function()
    return display.newScene(" Scene_hero")

end)
local Cell = class("Cell", function()
    return ccui.Widget:create()
    
end)
hero = {  
[1] ={["Image_head"]= "res/DOTA-HERO/AM.jpg" , ["lock"] =  0, ["kind"] = 1}, 
[2]={["Image_head"]= "res/DOTA-HERO/Lina.jpg",["lock"] =  0, ["kind"] = 0} , 
[3]={["Image_head"]= "res/DOTA-HERO/Coco.jpg",["lock"] =  0 , ["kind"] = 0} , 
[4]={["Image_head"]= "res/DOTA-HERO/WR.jpg",["lock"] =  0, ["kind"] = 1} , 
[5]={["Image_head"]= "res/DOTA-HERO/Sil.jpg",["lock"] = 1,["kind"] = 0}
}


function Cell:ctor(index  , temp)
if (index == 0)then 
  self:setContentSize(520 ,15)
  local cell  = cc.uiloader:load("res/RotateionView/Node_judge.csb"):addTo(self)
  return 
end 

local herosort = temp  
 if  (herosort[index*2-1]) then 
  local click = true 
  local cell  = cc.uiloader:load("res/RotateionView/Node_hero.csb")
  local  ListItem= cell:getChildByName("Button_cell_bg") 
  ListItem:setSwallowTouches(false)
  self:setContentSize(ListItem:getContentSize().width*2+100 ,ListItem:getContentSize().height )
  ListItem:setTag(index*2-1)
  local  Image_head = cell:getChildByName("Image_head")
  Image_head:loadTexture(herosort[index*2-1].Image_head)
   local  Image_Attribute = cell:getChildByName("Image_Attribute")
  print( herosort[index*2-1].kind)
  local  kind  = tonumber(herosort[index*2-1].kind)
    if    kind==0 then 
       Image_Attribute: loadTexture("res/Hero_Attribute/icon_str.pvr.png")
   elseif  kind== 1 then
    Image_Attribute:loadTexture("res/Hero_Attribute/icon_agi.pvr.png")
    end 
 
     
  ListItem:addTouchEventListener(function (sender,state )
  if (state ==1)then 
     click = false
  end

  if (state == 2)then
    if (click ==true)then   
    print("--------------------XXXXX")
    print(ListItem:getTag())
    
   local heroAttribute =Layer_heroAttribute.new()
  self :getParent():getParent():getParent():addChild(heroAttribute,2)  

    for i,v in ipairs(self :getParent():getParent():getParent():getChildren()) do
      print(v:getName())
    end
  end
  click =true  
  end  
 end)
 self:addChild(cell)
 end 
if  (herosort[index*2]) then 
  local cell  = cc.uiloader:load("res/RotateionView/Node_hero.csb")
  local  ListItem= cell:getChildByName("Button_cell_bg") 
  ListItem:setSwallowTouches(false)
  ListItem:setTag(index*2)
  local  Image_head = cell:getChildByName("Image_head")
  Image_head:loadTexture(herosort[index*2].Image_head)
  
  local  Image_Attribute = cell:getChildByName("Image_Attribute")

  local  kind  = tonumber(herosort[index*2].kind)
    if    kind==0 then 
       Image_Attribute: loadTexture("res/Hero_Attribute/icon_str.pvr.png")
   elseif  kind== 1 then
    Image_Attribute:loadTexture("res/Hero_Attribute/icon_agi.pvr.png")
    end    

  ListItem:addTouchEventListener(function (sender,state )
  if (state ==1)then 
    click = false
  end

  if (state == 2)then
    if (click ==true)then
       print("XXXXX")
       print(ListItem:getTag())
       local heroAttribute =Layer_heroAttribute.new()
       self :getParent():getParent():getParent():addChild(heroAttribute,2) 
    end 
    click = true 
  end      
 end)
  cell:setPosition(ListItem:getContentSize().width+50, 0)
 self:addChild(cell)
end 

 --  local widfirst = ccui.Widget:create()
 --     widfirst:addChild(cell )
 --     widfirst:setAnchorPoint(0,0)
 --      widfirst:setContentSize(ListItem:getContentSize())


 -- self.cell1  = cc.uiloader:load("res/RotateionView/Node_hero.csb")
 --     local widsecond= ccui.Widget:create()
 --     widsecond:addChild(self.cell1 )
 --     widsecond:setAnchorPoint(0,0)
 --      widsecond:setContentSize(ListItem:getContentSize())
 --      widsecond: setPosition(ListItem:getContentSize().width+50, 0)
 --     local hx ,hy =  widsecond: getPosition()
 --     print("hx".. hx ,"hy"..   hy)

 -- self:addChild(widfirst , 2 )
 --  self:addChild(widsecond , 2 )
 -- self:initui()

end

function Scene_hero:ctor()

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


  self. scene = cc.uiloader:load("res/RotateionView/Scene_Hero.csb"):addTo(self,2) 
  self.ListView_selectHero = self. scene:getChildByName("ListView_selectHero")
  self.CheckBox_all =self. scene:getChildByName("CheckBox_all")
  self.CheckBox_all:setSelected(true)
  self.CheckBox_all:addEventListener(function(psender,event)
    	print("全部");
    	print(event);
      self.CheckBox_all:setSelected(true)
    	self.CheckBox_Font:setSelected(false)
    	self.CheckBox_after:setSelected(false)
       self:Sortall()
    end)

  self.CheckBox_Font =self. scene:getChildByName("CheckBox_Font")
  self.CheckBox_Font:addEventListener(function(psender,event)
    	print("前排");
    	print(event);
        self.CheckBox_Font:setSelected(true)
        self.CheckBox_all:setSelected(false)
    	self.CheckBox_after:setSelected(false)
     self :Sortfont()
    end)
  self.CheckBox_after=self. scene:getChildByName("CheckBox_after")
  self.CheckBox_after:addEventListener(function(psender,event)
    	print("后排");
    	print(event);
             self.CheckBox_after:setSelected(true)
    	 self.CheckBox_all:setSelected(false)
    	 self.CheckBox_Font:setSelected(false)
       self:Sortafter()
    end)
  local   Button_back=self. scene:getChildByName("Button_back")
  
   Button_back:addClickEventListener(function ( )
  self:removeSelf()
 end )
  
  self:Sortall()

	end 


function Scene_hero:Sortall()
 -- local heroAttribute =Layer_heroAttribute.new()
 --    self :addChild(heroAttribute,5) 

 self.ListView_selectHero: removeAllItems()
local temp =  { }
   for i,v in ipairs(hero) do    -- 全部
      
      if (v .lock  ==0)then  
        table.insert(temp, v) 
      end 
   end
 local num = #temp/2
   if (#hero%2~=0)then 
    num = num+1
    end

  for i=1, num do      
  self.cell= Cell.new(i , temp)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 
   self.cell= Cell.new(0 , temp)
   self.ListView_selectHero:pushBackCustomItem(self.cell)

local templock = {}
  for i,v in ipairs(hero) do    -- 未能召唤
      if (v .lock  ==1)then  
        table.insert(templock, v) 
      end 
   end
 local num1 = #templock/2
   if (#templock%2~=0)then 
    num1 = num1+1
    end

  for i=1, num1 do      
  self.cell= Cell.new(i , templock)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 

 
end


function Scene_hero:Sortfont()
self.ListView_selectHero: removeAllItems()
local temp =  { }
   for i,v in ipairs(hero) do    --   解锁 前排
      if (v .lock  ==0 and v.kind ==0 )then  
        table.insert(temp, v) 
      end 
   end
 local num = #temp/2
   if (#hero%2~=0)then 
    num = num+1
    end

  for i=1, num do      
  self.cell= Cell.new(i , temp)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 
   self.cell= Cell.new(0 , temp)
   self.ListView_selectHero:pushBackCustomItem(self.cell)

local templock = {}
  for i,v in ipairs(hero) do    -- 未能召唤
      if (v .lock  ==1 and v.kind == 0)then  
        table.insert(templock, v) 
      end 
   end
 local num1 = #templock/2
   if (#templock%2~=0)then 
    num1 = num1+1
    end

  for i=1, num1 do      
  self.cell= Cell.new(i , templock)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 


end   

function Scene_hero:Sortafter()

self.ListView_selectHero: removeAllItems()
local temp =  { }
   for i,v in ipairs(hero) do    --   解锁 后排
      if (v .lock  ==0 and v.kind ==1 )then  
        table.insert(temp, v) 
      end 
   end
 local num = #temp/2
   if (#hero%2~=0)then 
    num = num+1
    end

  for i=1, num do      
  self.cell= Cell.new(i , temp)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 
   self.cell= Cell.new(0 , temp)
   self.ListView_selectHero:pushBackCustomItem(self.cell)

local templock = {}
  for i,v in ipairs(hero) do    -- 未能召唤
      if (v .lock  ==1 and v.kind == 1)then  
        table.insert(templock, v) 
      end 
   end
 local num1 = #templock/2
   if (#templock%2~=0)then 
    num1 = num1+1
    end

  for i=1, num1 do      
  self.cell= Cell.new(i , templock)
  self.ListView_selectHero:pushBackCustomItem(self.cell)
  end 


 end  



function Scene_hero:onEnter()
end

function Scene_hero:onExit()
end

return Scene_hero