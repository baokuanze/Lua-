local Layer_slider = class("Layer_slider", function( )
return display.newScene()
end)

local t =
 { 
   [1]={
        [1]={ imag = "res/ /  " , imag1 = " "  , textname =" "  } ,
        [2]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [3]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [4]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [5]={ imag = "res/ /  " , imag1 = " "  , textname =" "  }
     },
[2]={  
        [1]={ imag = "res/ /  " , imag1 = " "  , textname =" "  } ,
        [2]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [3]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [4]={ imag = "res/ /  " , imag1 = " "  , textname =" "  },
        [5]={ imag = "res/ /  " , imag1 = " "  , textname =" "  }
  
    },      
[3]={},
[4]={}, 
[5]={},
[6]={},
[7]={}
}



local  text  = 
{  
  [1]  = { Text_numchapter  = "第\n一\n章" ,Text_num ="壹" , lock =0 },
  [2]  = { Text_numchapter  = "第\n二\n章" ,Text_num ="贰" , lock =1 },
  [3]  = { Text_numchapter  = "第\n三\n章" ,Text_num ="三" , lock =1 },
  [4]  = { Text_numchapter  = "第\n四\n章" ,Text_num ="肆" , lock =1 },
  [5]  = { Text_numchapter  = "第\n五\n章" ,Text_num ="伍" , lock =1 },
  [6]  = { Text_numchapter  = "第\n六\n章" ,Text_num ="陆" , lock =1 },
  [7]  = { Text_numchapter  = "第\n七\n章" ,Text_num ="柒" , lock =1 },
         



}


local datumPoint= {x=0 , y = 0 , point=1 , width= 160, index =0}

function Layer_slider:initbg()
  local bg = cc.Sprite:create("selc.jpg")
  bg :setAnchorPoint(0.5,0.5)
  bg:setPosition(display.cx,display.cy)
  self:addChild(bg )
  




 -- self.back = ccui.Button:create( "IMG_7.png","IMG_7.png")
 --self.back = ccui.Button:create( "self_ui/domob_preview.png","self_ui/domob_preview.png")

self.back = ccui.Button:create( "self_ui/goback_normal.png","self_ui/goback_perss.png")

  self.back:setPosition(100,  100)
 self.back :addTo(self,3)
   self.back :setTouchSwallowEnabled(false)
   self.back:addTouchEventListener(function (sender,state )

  if   (state ==2)then
        audio.playSound ("mp3/btn.mp3",false)
      print("点击返回")
        display.replaceScene(GameLayer.new())

  end
  end) 

     
 --    self. back = cc.ui.UIPushButton.new({normal = "IMG_7.png",
 --  pressed = "IMG_7.png"})
 --  self.back:onButtonClicked(function(event) 
      
 --         print("-------------返回")  
      
 --    end)
 --  self.back:setScale(0.5)
 --  self.back:setAnchorPoint(0.5,0.5)
 --  self. back:addTo(self,5)
 -- self. back:pos(100,display.top-100)
end 

function Layer_slider:initModifyData()

     local docpath = cc.FileUtils:getInstance():getWritablePath().."sceneData.txt"
    if cc.FileUtils:getInstance():isFileExist(docpath)==false then
         print("写入场景数据")
       local str = json.encode(sceneData.data)
       ModifyData.WriteDataToDoc(str,2)
       -- ModifyData.publicdata = Data.SCENE
    else
       print("读入场景数据")
       local str = ModifyData.ReadDataToDoc(2)
           sceneData.data= json.decode(str)
       -- ModifyData.publicdata = json.decode(str)
       --    sceneData.data= ModifyData.publicdata       
    end

    print(docpath)
    

    local docpath1 = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"
    if cc.FileUtils:getInstance():isFileExist(docpath1)==false then
            print("写入英雄herodata")
       local str = json.encode(HeroData.Hero)
       ModifyData.WriteDataToDoc(str,1)
       -- ModifyData.publicdata = Data.SCENE
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
       -- ModifyData.publicdata = Data.SCENE
    else
       print("读入英雄pagkeequ")
       local str = ModifyData.ReadDataToDoc(3)
        HeroData.pagkeequ = json.decode(str)
             
    end



      
end 
function Layer_slider:ctor()
  self:initModifyData()
 self:initbg()

   -- print(self.Button_select:getName())
  dump( sceneData.data[1] )
 self. scene1 = cc.Node:create() :pos(100 ,display.cy) : addTo(self,2) 
  self:touchinit()
 self:ButtonInit()

  
 
 end
function Layer_slider:touchinit()
-- self.touchlayer = display.newLayer(); 
-- self.touchlayer:setPosition(-100,-150)
-- local n = cc.Sprite:create("res/barH.png"):pos(-100, -150):addTo(self,3)
-- n:setAnchorPoint(0,0)
-- -- n:setContentSize(400,300)
-- self.touchlayer:setContentSize(960,300)
-- --local n1 = cc.Sprite:create("res/RotateionView/btn_fight_selected.png"):pos(200, 150):addTo(self)
-- self.touchlayer:setTouchEnabled(true)
-- self.touchlayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
--   -- print("self.touchlayer")
-- return self:onTouch(event.name ,event.x, event.y )
-- end )
-- self:addChild(self.touchlayer,0)

  local d= cc.Director:getInstance():getEventDispatcher()
  self.l = cc.EventListenerTouchOneByOne:create()
  self.l :setSwallowTouches(true)
  self.l:registerScriptHandler(function(touch ,event )
  
     self.point ={}
     for i,v in ipairs(self.Btttonlist) do
     self.point[i]=  self.Btttonlist[i]:getPositionX();
     end

     local  tt =    touch:getLocation()
     print("event.x".. tt.x , "event.y".. tt.y)
     self._touchinit= {["x"]=tt.x , ["y"]=tt.y}
 
     return true 
     end,cc.Handler.EVENT_TOUCH_BEGAN)

     self.l:registerScriptHandler(function(touch , event)

       local  tt =    touch:getLocation()
       print("event.x".. tt.x , "event.y".. tt.y)
       local dis = tt.x - self ._touchinit.x 
       print("dis".. dis )
       local  Button_1x = self.Btttonlist[1]:getPositionX();
       -- print(#self.Btttonlist)
      local  Button_7x = self.Btttonlist[#self.Btttonlist]:getPositionX();
   
     
      
       if (dis>10 and Button_1x < 100) then    --对首个Buttonlist 的 元素 进行  区域限制
           self.ismove =true 
           self.buttonclick =false
           for i=1,#self.Btttonlist do
             self.Btttonlist[i]:setPosition( self.point[i]+ dis, 0)
            end

        elseif (dis<-10 and Button_7x > 600) then   
             self.ismove =true 
              self.buttonclick =false
            for i=1,#self.Btttonlist do
             self.Btttonlist[i]:setPosition(self.point[i]+ dis, 0)
              -- transition.moveTo(self.Btttonlist[i], {x =self.Btttonlist[i]:getPositionX()+dis, y = 0 ,time = 0})
            end 
        elseif dis>-10 and dis < 10 then  
           self.buttonclick =true 
 
       end 
          end, cc.Handler.EVENT_TOUCH_MOVED)



          self.l:registerScriptHandler(function(touch , event) 

        if self.ismove == true then   
            self.ismove =false
           print("执行 ---------1")
           local  Button_1x = self.Btttonlist[1]:getPositionX();
           local  Button_7x = self.Btttonlist[#self.Btttonlist]:getPositionX();
           if (Button_1x >0)then 
                for i=1,#self.Btttonlist do
                  transition.moveBy(self.Btttonlist[i], {x =-Button_1x, y = 0 ,time = 0.2})
                end 
          elseif  (Button_7x <750) then
             
                for i=1,#self.Btttonlist do
                  transition.moveBy(self.Btttonlist[i], {x =750-Button_7x, y = 0 ,time = 0.2})
                end
           end
            self.buttonclick =true
        end 
          
end,cc.Handler.EVENT_TOUCH_ENDED)

d:addEventListenerWithSceneGraphPriority(self.l, self. scene1 )







end 

function  Layer_slider:onTouch( event ,x ,y)
   if (event =="began")then 
     self.point ={}
     for i,v in ipairs(self.Btttonlist) do
     self.point[i]=  self.Btttonlist[i]:getPositionX();
     end
 
     self._touchinit= {["x"]=x , ["y"]=y}

     return true 
  elseif  (event=="moved") then
     self.buttonclick =false
    --  local zx = {} 
    -- local zx  =  self:convertToNodeSpace(cc.p(self ._touchinit.x,self ._touchinit.y))
    --    local Rect1  = cc.rect (zx.x,zx.y,0,0
    --     )
        local dis = x - self ._touchinit.x 
        print("dis".. dis )
        local  Button_1x = self.Btttonlist[1]:getPositionX();
        print(#self.Btttonlist)
        local  Button_7x = self.Btttonlist[#self.Btttonlist]:getPositionX();
         self.ismove =true 
      
       if (dis>10 and Button_1x < 100) then    --对首个Buttonlist 的 元素 进行  区域限制
           for i=1,#self.Btttonlist do
             self.Btttonlist[i]:setPosition( self.point[i]+ dis, 0)
            end

        elseif (dis<-10 and Button_7x > 600) then   
            for i=1,#self.Btttonlist do
             self.Btttonlist[i]:setPosition(self.point[i]+ dis, 0)
              -- transition.moveTo(self.Btttonlist[i], {x =self.Btttonlist[i]:getPositionX()+dis, y = 0 ,time = 0})
            end 
 
       end 

     print("x".. x) 
     print("y" .. y)

  elseif  (event=="ended") then


    print("执行  -----------------end ")
           local  Button_1x = self.Btttonlist[1]:getPositionX();
           print("Button_1x" .. Button_1x)
           local  Button_7x = self.Btttonlist[#self.Btttonlist]:getPositionX();
           if (Button_1x >0)then 
            self.touchlayer:setTouchEnabled(false)
                for i=1,#self.Btttonlist do
                  transition.moveBy(self.Btttonlist[i], {x =-Button_1x, y = 0 ,time = 0.2})
                end 
          elseif  (Button_7x <750) then
                self.touchlayer:setTouchEnabled(false)
                for i=1,#self.Btttonlist do
                  transition.moveBy(self.Btttonlist[i], {x =750-Button_7x, y = 0 ,time = 0.2})
                end
           end
 
  end 
end 

function Layer_slider:ButtonInit()
    datumPoint. index= 0 
self.Btttonlist  = {}
local point = datumPoint.point 
local  datum= datumPoint.x	
local width = datumPoint.width
print(point)
print(datum) 
for i=1,point-1  do
  local button = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_challenge_normal.png",
  pressed = "res/self_ui/btn_challenge_selected.png"})
  --   local button = cc.ui.UIPushButton.new({normal = "res/picture/bbg_blood_elf_door_1.png",
  -- pressed = "res/picture/bbg_blood_elf_door_1.png"})
  button :addTo( self. scene1 )
  button :setAnchorPoint(0.5,0.5)

  button :onButtonClicked(function(event) 
         --  if (self.clickswith ==true)then 
         -- print("-------------点击")  
         -- end 
         print(i)
    end)
  button :pos(datum-width*(i),0)
  button :setTouchSwallowEnabled(false)
  self.Btttonlist[i]=button
end

for i=point,#t do
  
   -- local button = cc.ui.UIPushButton.new({normal = "res/self_ui/btn_challenge_normal.png",
   --   pressed = "res/self_ui/btn_challenge_selected.png"})

    local  b1 = cc.uiloader:load("res/chapter1/Node_ates.csb")
    local Button_select =b1:getChildByName("Button_select")
    
    local Text_numchapter = b1:getChildByName("Text_numchapter")
    Text_numchapter :setString(text [i].Text_numchapter) 

    local  Text_num = b1:getChildByName("Text_num")
    Text_num:setString(text [i].Text_num) 
    
    -- if text [i]. lock == 0      then 
    print("HeroData.Hero[1].locknum " .. HeroData.Hero[1].locknum)
       if i<= tonumber(HeroData.Hero[1].locknum)    then 
    local Image_lock = b1:getChildByName("Image_lock") 
    Image_lock:removeSelf()
    end 
              

    Button_select:addTouchEventListener(function(sender, state)
    print("button   的点击 ")
   

    if(state ==2)then
          print("button   的点击状态2 ")
    print(i)
        if self.buttonclick ==true then 
          self.buttonclick =false
        self:ModifyToPostiongo(i)   
            audio.playSound ("mp3/btn.mp3",false) 

        end  
    end
    end)

   b1:addTo(self.scene1,2)
   b1 :setAnchorPoint(0.5,0.5)
   b1 :pos(datum+width*(i-point),0)
   self.Btttonlist[i]=b1 
   Button_select:setSwallowTouches(false)
   self.buttonclick =true
end

      

end 
function Layer_slider:ModifyToPostiongo( a)
   -- self.touchlayer:setTouchEnabled(false)
  print( datumPoint. index)
  if  datumPoint. index ==a then 

        self:goback()
   
  else 
     --todo    ---                            
     -- self:ModifyToPostionback()
     if datumPoint.index == 0 then 
        self:click( a )
     else  
        print("-----------------------------------点击不同 ")         
        local c1= cc.CallFunc:create(function ()    ----  移除单元 
        for i=1,5 do  
           self.Btttonlist[datumPoint.index+1]:removeSelf()
           table.remove(self.Btttonlist , datumPoint.index+1)        
        end      
        end)

        local c2= cc.CallFunc:create(function ()
        self:ModifyToPostionback1()  
        end)

        local c3 = cc.CallFunc:create(function ()
        -- self.buttonclick =true
        self:click(a)       
        end)

      local seq = cc.Sequence:create(c1,c2,cc.DelayTime:create(0.4),c3 )
      self:runAction(seq)
     end
   end 

end  

function Layer_slider:goback ()
      local a = datumPoint.index
      local c1= cc.CallFunc:create(function ()    ----  移除单元 
        for i=1,5 do  
            self.Btttonlist[a+1]:removeSelf()
           table.remove(self.Btttonlist , a+1)        
        end
       
      end)

      local c2= cc.CallFunc:create(function ()        --  向左靠  
      self:ModifyToPostionback1() 
      end)

        local c3= cc.CallFunc:create(function ()  
        print(" datumPoint.index"..  datumPoint.index) 
        if  a >=3 and self.Btttonlist[#self.Btttonlist]:getPositionX()<750 then   --   根据最后一张图片     开始
           for i=1,#self.Btttonlist do
            transition.moveBy(self.Btttonlist[i], {x =750-self.Btttonlist[#self.Btttonlist]:getPositionX(), y = 0 ,time = 0.2})
           end   
          
        end      
        self.buttonclick =true   
        end)

        local seq = cc.Sequence:create( c1,cc.DelayTime:create(0.4), c2 ,cc.DelayTime:create(0.3),c3 )
        self:runAction(seq)
end  

function  Layer_slider:click( a )       ----------------------插入  
   if self.buttonclick ==false then 
    -- self.buttonclick =false
         local  x=  self.Btttonlist[a]:getPositionX()  
         local c1= cc.CallFunc:create(function ()   
            for i=a,1,-1 do
             transition.moveBy(self.Btttonlist[i], {x =-x, y = 0 ,time = 0.2})
            end   
         end)

        local c2= cc.CallFunc:create(function ()   
         local point = datumPoint.point 
         local datum= datumPoint.x  
         local width = datumPoint.width
         for i,v in ipairs(sceneData.data[a]) do
                 -- local button = cc.ui.UIPushButton.new({normal =sceneData.data[a][i].imag1,
                 -- pressed = sceneData.data[a][i].imag1})

                  local  b1 = cc.uiloader:load("res/chapter1/Node_gates.csb")
                  local Button_gate =b1:getChildByName("Button_gate")
                  Button_gate:loadTextures(sceneData.data[a][i].imag1    ,sceneData.data[a][i].imag1)
                  b1:addTo(self.scene1)
                  b1:setAnchorPoint(0.5,0.5)
                  -- Button_gate:onButtonClicked(function(event) 
                   --                print("点击" .. i)
                  --  end)
                    
                   if sceneData.data[a][i].lock == 0 then 
                       local  Image_lock1= b1:getChildByName("Image_lock1")  -------- 
                        Image_lock1:removeSelf()
                     end 

                 local  Text_des= b1:getChildByName("Text_des")
                 Text_des:setString(sceneData.data[a][i].textname)

                 local Text_gatedes =b1:getChildByName("Text_gatedes")
                 Text_gatedes:setString(sceneData.data[a][i].Text_gatedes)
 
                  Button_gate:addTouchEventListener(function(sender, state)
                  if(state ==2)then
                  print("跳转   -- 场景"  ..a.."  " .. i   )
                    if self.buttonclick ==true then  
                         audio.playSound ("mp3/click.mp3",false)
                                      -----------------
                        ModifyData.setSceneNum(a)  ---  设置场景num
                        ModifyData.setChapterNum(i)    ---设置关卡num
                       sceneData.selectData =  sceneData.data[a][i]
                       local Layer_gate  = Layer_Gater.new()  
                       Layer_gate :setAnchorPoint(0.5,0.5)
                       Layer_gate:setPosition(display.cx,display.cy)
                       self:addChild(Layer_gate,3) 
                       
                    end 
                  end
                  end)

                b1:pos(datum,0)
                table.insert(self.Btttonlist, a+i,b1)
                Button_gate:setSwallowTouches(false)
                 -- button :pos(0,0)
                --button :pos(datum+width*(i),0)

                transition.moveTo( b1 , {x =datum+width*(i), y = 0 ,time = 0.2})
          end
          end)

          local c3= cc.CallFunc:create(function ()  
          if(self.Btttonlist[a+6])then    --  存在
           
              if  self.Btttonlist[a+6]:getPositionX()>960 then 
                  dis =  - (self.Btttonlist[a+6]:getPositionX()-960)  
                  print("dis"..dis)  
              else 
                  dis =  - (self.Btttonlist[a+6]:getPositionX()-960)
              end 
                 -- datumPoint.dis = dis 
              for i=a+6,# self.Btttonlist do
                 transition.moveBy(self.Btttonlist[i], {x =dis, y = 0 ,time = 0.2})
              end  
             
          end
        
          end)

              local c4= cc.CallFunc:create(function () 
                  self.buttonclick =true
                end)
        local seq = cc.Sequence:create(c1,cc.DelayTime:create(0.22), c2 ,cc.DelayTime:create(0.21),c3,cc.DelayTime:create(0.21),c4 )
        self:runAction(seq)

        self.movedistance =x 
        datumPoint.index =a
  end         
end


function Layer_slider:ModifyToPostionback1()     --   左边靠
     -- print("self.Btttonlist [datumPoint.index+1] :getPositionX()".. self.Btttonlist [datumPoint.index+1]:getPositionX())
    local a  =   self.Btttonlist [datumPoint.index]:getPositionX()+160;
    if (self.Btttonlist [datumPoint.index+1]) then 
      local  dis =  self.Btttonlist [datumPoint.index+1] :getPositionX() -a
      for i=datumPoint.index+1,#self.Btttonlist do
         transition.moveBy(self.Btttonlist[i], {x = -dis, y = 0 ,time = 0.2})
      end
   end   
  datumPoint. index= 0 
end 






function Layer_slider:MoveToright()
	
end


function Layer_slider:MoveToletf()
	
end

function Layer_slider:MoveTogoback()
	
end


return Layer_slider