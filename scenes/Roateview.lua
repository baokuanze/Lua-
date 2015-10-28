local Roateview = class("Roateview", function()
    return display.newLayer("Roateview")
end)



function Roateview:ctor()


self.location={ ["a"]= 145,["b"]=36 }    -- 椭圆的  a, b   ;
local a , b = self.location.a ,self.location.b 
 --  self. scene = cc.uiloader:load("res/RotateionView/Node_RoateView.csb"):addTo(self,2) 
  -- self.b1 = self.scene:getChildByName("Button_b1")

     self. scene1 = cc.Node:create() :addTo(self,2) 

    self.scene1:setAnchorPoint(0.5,0.5)
     self. b1 = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_challenge_normal.png",
  pressed = "res/self_ui/btn_challenge_selected.png"})
  self.b1:onButtonClicked(function(event) 
         if (self.clickswith ==true)then 
         print("-------------点击副本")  
         display.replaceScene(Layer_Slider.new())
          audio.playSound ("mp3/click.mp3",false)
         end   
    end)
  self.b1:setAnchorPoint(0.5,0.5)
 self. b1:addTo(self. scene1)
 self. b1:pos(0,-b)





  -- self.b1:addTouchEventListener(function (sender,state )
  --   local event = {x = 0, y = 0}
  --   print(state)
  --  if state == 0 then
  --   print("--------开始")
  --          -- event.name = "began"
     
        
  --     self.Touch_switch = false
  
  --   elseif ( state==1) then
  --    self.Touch_switch = true 
    
  
  --   elseif (state ==2)then 
  --   print("进入副本")
  --       self.Touch_switch = false
  --  end 
   
  --  if  ( self.Touch_switch == true  )then 
  --  print(  "执行")
  --       self.b1:setTouchEnabled(false)
    
  --     end  
  --   -- event.target = sender
  --   --   local target = event.target
  --   -- print( "event.target " .. tonumber(target)  )
  -- local hx ,hy =   sender:getPosition()
  --   print(hx, hy)

  -- end)

  self. b2 = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_lineup_normal.png",
  pressed = "res/self_ui/btn_lineup_selected.png"})
  self.b2:onButtonClicked(function(event) 
          if (self.clickswith ==true)then 
         print("-------------点击boos")  
           audio.playSound ("mp3/click.mp3",false)
              sceneData.gamemodel =1 
            display.replaceScene(Scene_Boss.new())
         end 
    end)
  self.b2:setAnchorPoint(0.5,0.5)
  self. b2:addTo(self. scene1)
 self. b2:pos(-a,0)


 --  self.b2 = self.scene:getChildByName("Button_b2")
 --  self.b2:addTouchEventListener(function (psender,event)
 --  if (event ==2)then 
 --  print("进入布阵")
 -- end 
 --  end)


  self. b3 = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_fight_normal.png",
  pressed = "res/self_ui/btn_fight_selected.png"})
  self.b3:onButtonClicked(function(event) 
         
        if (self.clickswith ==true)then 
         print("-------------点击wujing")  
          display.replaceScene(Scene_fighting.new())
            audio.playSound ("mp3/click.mp3",false)
         end    
    end)
  self.b3:setAnchorPoint(0.5,0.5)
 self. b3:addTo(self. scene1)
 self. b3:pos(0,b)
 local hx ,hy = self . b3:getPosition()
 print(hx ,hy)

 --  self.b3 = self.scene:getChildByName("Button_b3")
 --  self.b3:addTouchEventListener(function (psender,event)
 --  if (event ==2)then 
 --  print("进入出战")
 -- end 
 --  end)
 self. b4 = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_rank_normal.png",
  pressed = "res/self_ui/btn_rank_selected.png"})
 

 
  self.b4:onButtonClicked(function( event) 
        print(event.x .. "simida")
     if (self.clickswith ==true)then 
         print("-------------点击qiandao")  
          audio.playSound ("mp3/click.mp3",false)
      local chec =check.new() 
       self:getParent():addChild(chec, 5)    
         end  
    end)
  self.b4:setAnchorPoint(0.5,0.5)
 self. b4:addTo(self. scene1)
 self. b4:pos(a,0)


  -- self.b4 = self.scene:getChildByName("Button_b4")
  -- self.b4:addTouchEventListener(function (psender,event)
   
  -- if (event ==2)then 
  -- print("进入排行榜")
  -- end 
  -- end)

self.t ={}
self.t[1]=self.b1
self.t[1]:setOpacity(255) 
self.t[1]:setScale(1,1)  -- 7/8
self.t[1]:setLocalZOrder(3)


self.t[2]=self.b2
self.t[2]:setOpacity(100) 
self.t[2]:setScale(0.875,0.875)  -- 7/8
self.t[2]:setLocalZOrder(2)


self.t[3]=self.b3
self.t[3]:setOpacity(80) 
self.t[3]:setScale(0.875,0.875)  -- 7/8
self.t[3]:setLocalZOrder(1)


self.t[4]=self.b4
self.t[4]:setOpacity(100) 
self.t[4]:setScale(0.875,0.875)  
self.t[4]:setLocalZOrder(2)


for i,v in ipairs(self.t) do
    if (i==1) then
    
     v:setTouchEnabled(true)
   
    else
      v:setTouchEnabled(false)
      
    end
  v:setTouchSwallowEnabled(false)

end






self.touchlayer = display.newLayer(); 
self.touchlayer:setPosition(-200,-150)
--local n = cc.Sprite:create("res/RotateionView/btn_fight_selected.png"):pos(-200, -150):addTo(self)
--n:setContentSize(300,300)
self.touchlayer:setContentSize(400,300)
--local n1 = cc.Sprite:create("res/RotateionView/btn_fight_selected.png"):pos(200, 150):addTo(self)
self.touchlayer:setTouchEnabled(true)
self.touchlayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
  print("self.touchlayer")
return self:onTouch(event.name ,event.x, event.y )
end )
self:addChild(self.touchlayer,0)
-- self.touchlayer:setLocalZOrder()

self.right = false
self.left =false
self.clickswith =true
  self.click = true   -- 判断是否可以点击旁边的
-- self.b1:onButtonClicked(function(event) 
--          -- if clickFlag rh 
--          print("点击")    
--     end)

end

function moveto()                                             

end
 function Roateview:onTouchBegan (touch , event  )
  print(event.x)
return true
  end 

function Roateview:onTouch(event, x, y )

   
 if (event =="began")then 
  print("x".. x) 
  print("y" .. y)
  self ._touchinit= {["x"]=x , ["y"]=y}

 return true 
  
 elseif (event=="moved")then
  --print("move")
   local a = self.location["a"]
   local b = self.location["b"]
   local dis = x - self ._touchinit.x 
   --print(dis)
   if dis >=10 and dis<=a then
    self.clickswith =false
      
         
       local x1 = dis
       local y1 = -math.sqrt((1-x1*x1/(a*a))*b*b)
       self.t[1]:setPosition(x1,y1)
       self.t[1]:setOpacity(255-(dis/a)*155) 
       self.t[1]:setScale(1-(dis/a)*0.125,1-(dis/a)*0.125)
       self.t[1]:setLocalZOrder(2)

       local x2 = -a+dis
       local y2 = -math.sqrt((1-x2*x2/(a*a))*b*b)
       self.t[2]:setPosition(x2,y2)
       self.t[2]:setOpacity(100+(dis/a)*155) 
       self.t[2]:setScale(0.875+(dis/a)*0.125,0.875+(dis/a)*0.125)  -- 7/8
       self.t[2]:setLocalZOrder(3)


      local x3 = -dis
      local y3 = math.sqrt((1-x3*x3/(a*a))*b*b)
      self.t[3]:setPosition(x3,y3)
      self.t[3]:setOpacity(80+(dis/a)*20) 
      -- self.t[3]:setScale(1+(dis/a)*0.125,1+(dis/a)*0.125)
      self.t[3]:setLocalZOrder(2)


      
      local x4 = a-dis
      local y4 = math.sqrt((1-x4*x4/(a*a))*b*b)
      self.t[4]:setPosition(x4,y4)
      self.t[4]:setOpacity(100-(dis/a)*20) 
      -- self.t[4]:setScale(1+(dis/a)*0.125,1+(dis/a)*0.125)
      self.t[4]:setLocalZOrder(1)
       

       if(dis>50)then 
       self.Direction_right = true 
       self.Direction_left= false 
      end
   elseif dis <=-10 and dis>=-a  then
     
       local x1 = dis
       local y1 = -math.sqrt((1-x1*x1/(a*a))*b*b)
       self.t[1]:setPosition(x1,y1)
       self.t[1]:setOpacity(255-(-dis/a)*155) 
       self.t[1]:setScale(1-(-dis/a)*0.125,1-(-dis/a)*0.125)
       self.t[1]:setLocalZOrder(2)

       local x2 = -a-dis
       local y2 = math.sqrt((1-x2*x2/(a*a))*b*b)
       self.t[2]:setPosition(x2,y2)
       self.t[2]:setOpacity(100-(-dis/a)*20) 
       self.t[2]:setLocalZOrder(1)

      local x3 = -dis
      local y3 = math.sqrt((1-x3*x3/(a*a))*b*b)
      self.t[3]:setPosition(x3,y3)
      self.t[3]:setOpacity(80+(-dis/a)*20) 
      -- self.t[3]:setScale(1+(dis/a)*0.125,1+(dis/a)*0.125)
      self.t[3]:setLocalZOrder(2)
     

      
      local x4 = a+dis
      local y4 = -math.sqrt((1-x4*x4/(a*a))*b*b)
      self.t[4]:setPosition(x4,y4)
      self.t[4]:setOpacity(100+(-dis/a)*155) 
      self.t[4]:setScale(0.875+(-dis/a)*0.125,0.875+(-dis/a)*0.125)
      self.t[4]:setLocalZOrder(3)
    if(dis<-50)then 
       self.Direction_left = true 
       self.Direction_right= false 
    end

   self.click =false
  end
 





    
 elseif (event=="ended")then 

   self.clickswith =true
   local a = self.location["a"]
   local b = self.location["b"]

     if (self.Direction_right ==true and self.Direction_left==false ) then 
       self.Direction_right = false 
         self.click =false
       self:movetoRight()
     elseif (self.click ==true)then 
       print("asdsdasdasd")
       local Rect2 = cc.rect (-a-156/2, -228/2,156,228)

       local Rect4 =  cc.rect (a -156/2, -228/2,156,228)

       -- self.t[4]:getBoundingBox()
      local zx = {} 
    local zx  =  self:convertToNodeSpace(cc.p(self ._touchinit.x,self ._touchinit.y))
       local Rect1  = cc.rect (zx.x,zx.y,0,0
        )
       print("self ._touchinit.x".. self ._touchinit.x- display.cx)
       print("self ._touchinit.y" .. self ._touchinit.y - display.cy)
       print("Rect4.x" .. Rect4.x)
       print("Rect4.y" .. Rect4.y)
         print("Rect4.width" .. Rect4.width)
         print("Rect4.he" .. Rect4.height)
      
       if cc.rectContainsPoint(Rect4 ,Rect1) then
       print("+++++++++++") 
         self.click =false
           self:movetoLeft() 
   
       elseif cc.rectContainsPoint(Rect2 ,Rect1) then
           self.click =false
            self:movetoRight ()
          
     
       end
    elseif (self.Direction_right ==false and self.Direction_left==true ) then
          self.Direction_left = false 
            self.click =false
          self:movetoLeft()
    else
           self.click =false
          self:movetoGoback()     
    end   
  end 

end
  
function  Roateview:movetoGoback()
  self.touchlayer:setTouchEnabled(false)
   local a = self.location["a"]
  local b = self.location["b"]

   transition.moveTo(self.t[1], {x = 0, y = -b ,time = 0.2})
    print("----------------------")
    transition.moveTo(self.t[2], {x = -a,y = 0 ,time = 0.2})
    transition.moveTo(self.t[3], {x = 0,y = b ,time = 0.2})
    transition.moveTo(self.t[4], {x = a, y =0  ,time = 0.2,onComplete = function()
    self:modify()
     
    end})

end 

function  Roateview:movetoLeft()
  self.touchlayer:setTouchEnabled(false)
   local a = self.location["a"]
   local b = self.location["b"]
   
    transition.moveTo(self.t[1], {x = -a, y = 0 ,time = 0.2})
    print("----------------------")
    transition.moveTo(self.t[2], {x = 0,y = b ,time = 0.2})
    transition.moveTo(self.t[3], {x = a,y = 0 ,time = 0.2})
    transition.moveTo(self.t[4], {x = 0, y =-b  ,time = 0.2,onComplete = function()
         self:modify()
         
            end})


end

function Roateview:movetoRight ( )
  self.touchlayer:setTouchEnabled(false)
    local a = self.location["a"]
    local b = self.location["b"]
 
    transition.moveTo(self.t[1], {x = a, y = 0 ,time = 0.2})
    print("----------------------")
    transition.moveTo(self.t[2], {x = 0,y = -b ,time = 0.2})
    transition.moveTo(self.t[3], {x = -a,y = 0 ,time = 0.2})
    transition.moveTo(self.t[4], {x = 0, y = b ,time = 0.2,onComplete = function()
         self:modify()
         
            end})
     
end




function Roateview:modify()
  local temp ={}
  local a = self.location["a"]
  local b = self.location["b"]
  print("a".. a)
  print("b".. b)
  for i,v in pairs(self.t) do

      
           local hx, hy =  v:getPosition()
           -- print("hx , hy" .. hx , hy)
         
       

      --  local t3= self:convertToNodeSpace(self:vec2(v:getPosition()))  
          
           
           if(hx==0 and hy==-b)then 
             temp[1]=v 
             v:setTouchEnabled(true)
             v:opacity(255)
              v:setScale(1,1)
            --v:setScale(1-(dis/a)*0.125,1-(dis/a)*0.125)
            v:setLocalZOrder(3)

           elseif (hx==-a and hy==0)  then
             temp[2]=v 
             v:opacity(100)
             v:setTouchEnabled(false)
             v:opacity(100)
             v:setScale(0.875,0.875)
             v:setLocalZOrder(2)
           elseif (hx==0 and hy==b)  then
             temp[3]=v 
             v:setTouchEnabled(false)
             v:opacity(80)
             v:setScale(0.875,0.875)
             v:setLocalZOrder(1)

           elseif (hx==a and hy==0)  then
             temp[4]=v 
             v:setTouchEnabled(false)
             v:opacity(100)
             v:setScale(0.875,0.875)
             v:setLocalZOrder(2)
           end  
           
          self.t =temp
           
           
  end
    self.click = true 
 self.touchlayer:setTouchEnabled(true)

 end 
 
     

return Roateview