

local Scene_shop= class("Scene_shop", function()
    return display.newScene()

end)


local Cell = class("Cell", function()
    return ccui.Widget:create()
    
end)

 equ  ={ 
 [1]={["Image_equ"]= "res/shop/item_10.png",["name"] ="盾牌" , ["Text_Item_attribute"]="+防御力 1000\n+生命 500",["Text_item_price"]="500" } ,
 [2]={["Image_equ"]= "res/shop/item_1.png", ["name"] ="战靴" , ["Text_Item_attribute"]="+防御力 500\n+移动速度 10%",["Text_item_price"]="600"} , 
 [3]={["Image_equ"]= "res/shop/item_3.png", ["name"] ="护腕" , ["Text_Item_attribute"]="+防御力 600\n+生命 500",["Text_item_price"]="500"} ,
 [4]={["Image_equ"]= "res/shop/item_5.png", ["name"] ="战袍" , ["Text_Item_attribute"]="+防御力 1500\n+生命 800",["Text_item_price"]="800"} ,
 [5]={["Image_equ"]= "res/shop/item_7.png", ["name"] ="大天使长剑" , ["Text_Item_attribute"]="+攻击力 3000\n+防御力 800",["Text_item_price"]="1500"} 
} 
function Cell:ctor(index)
  if  (equ[index*3-2]) then 
 self:setContentSize(470,80)
 self:setAnchorPoint(0,0)
 local click = true 

  local cell  = cc.uiloader:load("res/RotateionView/Node_equ.csb")
  local  Button_equ= cell:getChildByName("Button_equ")
  local   Image_equ= cell :getChildByName("Image_equ")
   Image_equ:loadTexture(equ[index*3-2].Image_equ )  
   Button_equ:setSwallowTouches(false)
   Button_equ:setTag(index*3-2)
   Button_equ:addTouchEventListener(function(sender, state)
   if (state ==1)then 
     click = false
   end

        if (state == 2)then
          if (click ==true)then 
            print("进入")
           local Image_item =Panel_des:getChildByName("Image_item")
           Image_item :loadTexture(equ[index*3-2].Image_equ )

           local Text_Item_name=Panel_des:getChildByName("Text_Item_name")
           Text_Item_name: setString(equ[index*3-2].name)

           local Text_Item_attribute=Panel_des:getChildByName("Text_Item_attribute")
           Text_Item_attribute: setString(equ[index*3-2].Text_Item_attribute)

           local Text_item_price=Panel_des:getChildByName("Text_item_price")
           Text_item_price: setString(equ[index*3-2].Text_item_price)
           Panel_des:setVisible(true)  
          end
           click =true
        end
  end)
  Button_equ:setPosition(0,0)
  self:addChild(cell)
end 
  if  (equ[index*3-1]) then
  local click = true 
  local cell1  = cc.uiloader:load("res/RotateionView/Node_equ.csb")
  local  Button_equ1= cell1:getChildByName("Button_equ")
  local   Image_equ= cell1 :getChildByName("Image_equ")
  Image_equ:loadTexture(equ[index*3-1].Image_equ )
  Button_equ1:setSwallowTouches(false)
  Button_equ1:setTag(index*3-1)
  Button_equ1:addTouchEventListener(function(sender, state)
  if (state ==1)then 
    click = false
  end

   if (state == 2)then
    if (click ==true)then   
     print(Button_equ1:getTag().." asdasd")
     local Image_item =Panel_des:getChildByName("Image_item")
     Image_item :loadTexture(equ[index*3-1].Image_equ )
     local Text_Item_name=Panel_des:getChildByName("Text_Item_name")
     Text_Item_name: setString(equ[index*3-1].name)
     local Text_Item_attribute=Panel_des:getChildByName("Text_Item_attribute")
     Text_Item_attribute: setString(equ[index*3-1].Text_Item_attribute)
     local Text_item_price=Panel_des:getChildByName("Text_item_price")
     Text_item_price: setString(equ[index*3-1].Text_item_price) 
     Panel_des:setVisible(true)  
    end
    click =true 
   end  
  end )
  cell1:setPosition(150,0)   
  self:addChild(cell1)
end 

  if  (equ[index*3]) then
    local click = true 
    local cell2  = cc.uiloader:load("res/RotateionView/Node_equ.csb")
    local  Button_equ2= cell2:getChildByName("Button_equ")
    local   Image_equ= cell2 :getChildByName("Image_equ")
    Image_equ:loadTexture(equ[index*3].Image_equ )
    Button_equ2:setSwallowTouches(false)
    Button_equ2:setTag(index+2)
    Button_equ2:addTouchEventListener(function(sender, state)
    if (state ==1)then 
     click = false
     end

   if (state == 2)then
    if (click ==true)then   
        	print(Button_equ2:getTag().." asdasd")
          local Image_item =Panel_des:getChildByName("Image_item")
          Image_item :loadTexture(equ[index*3].Image_equ )
          local Text_Item_name=Panel_des:getChildByName("Text_Item_name")
          Text_Item_name: setString(equ[index*3].name)
          local Text_Item_attribute=Panel_des:getChildByName("Text_Item_attribute")
          Text_Item_attribute: setString(equ[index*3].Text_Item_attribute)
          local Text_item_price=Panel_des:getChildByName("Text_item_price")
          Text_item_price: setString(equ[index*3].Text_item_price)
          Panel_des:setVisible(true)  
     end
     click =true 
    end    	

  end)
  cell2:setPosition(300,0)
  self:addChild(cell2)
end 

end 



function Scene_shop:ctor()
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



self. scene = cc.uiloader:load("res/RotateionView/Scene_shop.csb"):addTo(self,2) 
  self.ListView_equ =  self. scene:getChildByName("ListView_equ")
  Panel_des = self. scene:getChildByName("Panel_des")
   Panel_des:setVisible(false)
   -- for i,v in pairs(self.Panel_des :getChildren()) do
   --          print(v:getName())
   --        end

local  Button_back=self. scene:getChildByName("Button_back")
Button_back:addClickEventListener(function ( )
print("aasdasdasd")
self:removeSelf()
end)
local Text_item_price=Panel_des:getChildByName("Text_item_price")
local Text_Item_num=Panel_des:getChildByName("Text_Item_num")


local Button_add=Panel_des:getChildByName("Button_add")
Button_add:addClickEventListener(function ()
print("数量加")
Text_Item_num:setString(Text_Item_num:getString()+1)

 end)

local Button_sub=Panel_des:getChildByName("Button_sub")
Button_sub:addClickEventListener(function ()
print("数量减")
 local num = tonumber( Text_Item_num:getString())
if (num>1)then 
Text_Item_num:setString(num-1)
end 
 end)


local Button_pay=Panel_des:getChildByName("Button_pay")
Button_pay:addClickEventListener(function ()
local Text_gold=  self:getParent():getChildByName("Node"):getChildByName("Text_gold") 
local gold =  tonumber(Text_gold:getString())
gold = gold- tonumber( Text_Item_num:getString())*tonumber(Text_item_price:getString()) 
Text_gold:setString(gold)
print("购买")
 end)



     local num = #equ/3
if (#equ%3~=0)then 
   num = #equ/3+1
   for i=1,num do
      self.cell= Cell.new(i)
   self.ListView_equ:pushBackCustomItem(self.cell)
      end
end  

end 

function Scene_shop:onEnter()
end

function Scene_shop:onExit()
end

return Scene_shop