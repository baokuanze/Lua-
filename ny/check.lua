
local check = class("check", function()
	return display.newColorLayer(cc.c4b(100, 100, 100, 0))
end)

function check:ctor()

local d= cc.Director:getInstance():getEventDispatcher()
self.l = cc.EventListenerTouchOneByOne:create()
self.l :setSwallowTouches(true)
self.l:registerScriptHandler(function(touch ,event )
return true 
end,cc.Handler.EVENT_TOUCH_BEGAN)
self.l:registerScriptHandler(function (touch , event)
 end, cc.Handler.EVENT_TOUCH_MOVED)
self.l:registerScriptHandler(function(touch , event) 
    self:removeSelf()
end,cc.Handler.EVENT_TOUCH_ENDED)
d:addEventListenerWithSceneGraphPriority(self.l, self)
self:init()

end 

function check:init()
   

self.checkarray ={}
  print("--------" ..HeroData.Hero[1].signdate   )
  local a  = os.date("%d",os.time())

  if  HeroData.Hero[1].signdate == 0   then 
       HeroData.Hero[1].signdate   =1 
   else  

      if tonumber(HeroData.Hero[1].signdate) >=8  and tonumber( a- HeroData.Hero[1].signtime) ==1  then 
       HeroData.Hero[1].signdate   =1
        HeroData.Hero[1].signtime= 0
      end 


     if  tonumber( a- HeroData.Hero[1].signtime) >=2 then 
      print("-----修改")
            HeroData.Hero[1].signdate   =1 
             HeroData.Hero[1].signtime= 0

      elseif    a- HeroData.Hero[1].signtime == 1   then
                 
            -- HeroData.Hero[1].signdate   =  HeroData.Hero[1].signdate+1
           
       end 


     
  end  

   


self. num =  HeroData.Hero[1].signdate    --- 次数
 self. datatime   = HeroData.Hero[1].signtime  --- 时间  


self. layer1 = cc.uiloader:load("res/Boom/Layer_Daily.csb")
self.layer1:setAnchorPoint(0.5,0.5)
self.layer1: setPosition(display.cx ,display.cy)
self:addChild(self.layer1 , 5)
    
    self.oneday= self.layer1:getChildByName("CheckBox_1day")
    table.insert(self. checkarray, self.oneday) 

    self.twoday  = self.layer1:getChildByName("CheckBox_2day")
      table.insert(self. checkarray, self.twoday ) 

    self.threeday= self.layer1:getChildByName("CheckBox_3day")
  table.insert(self. checkarray, self.threeday ) 

    self.fourday= self.layer1:getChildByName("CheckBox_4day")
     table.insert(self. checkarray, self.fourday ) 

    self.fiveday= self.layer1:getChildByName("CheckBox_5day")
     table.insert(self. checkarray, self.fiveday ) 

    self.sixday= self.layer1:getChildByName("CheckBox_6day")
     table.insert(self. checkarray, self.sixday ) 

    self.sevenday= self.layer1:getChildByName("CheckBox_7day") 
     table.insert(self. checkarray, self.sevenday ) 
self: reshUI()
self:setUI()

end 
function check:reshUI()
  -- self. num = 4
  -- self. datatime = 6

print( "reshUI"..HeroData.Hero[1].signdate)

      for i,v in ipairs(self.checkarray ) do
      
         if i <   HeroData.Hero[1].signdate  then  
         v :setSelected(true)

       else
                  v :setSelected(false)
         end  
     
      end
     
            for i,v in ipairs(self.checkarray ) do
               print(v :isSelected())
     
      end
 


end 
function check:setUI(  )

    self.oneday:addClickEventListener(function ( )

        -- if  self. num < 1  then  
        --    self.oneday :setSelected(true)
        --  elseif self.num ==1 and  self.oneday:isSelected() == false then 
        --         self.oneday :setSelected(true) 
        --         print( "元宝增加")
        --    elseif  self. num >1  then    
        --       self.oneday :setSelected(false) 
        --  end 
  local a  = os.date("%d",os.time())

      print(self.oneday:isSelected())
     
      if  self. num < 1  then  

           self.oneday :setSelected(true)
    
      elseif self.num ==1   and ( (self. datatime== 0) or (a- self. datatime==1) )  then 
            HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 
        print(  "点击".. HeroData.Hero[1].signdate)
          HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+48
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI()
          self.oneday :setSelected(false)    ---  已经点过了  
        
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >1  then    
              self.oneday :setSelected(false) 
       else    --- 

               if   a- self. datatime==1  then 
              self.oneday:setSelected(false)
            else
             self.oneday:setSelected(true)
            end  
              -- self.oneday:setSelected(false)
              print( "  ---- ")
       end








        print("1day")
    end)
          self.twoday_index = 0
    self.twoday:addClickEventListener(function ( )
     local a  = os.date("%d",os.time())


     
      if  self. num < 2  then  
           self.twoday :setSelected(true)
           --and  self.twoday_index ==0 
      elseif self.num ==2   and   (a- self. datatime==1)   then 
            HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 

        HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+68
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI()  
                self.twoday :setSelected(false)    ---  已经点过了  
          
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >2  then    
        self.twoday :setSelected(false) 
      else    ---  
            if   a- self. datatime==1  then 
              self.twoday:setSelected(false)
            else
             self.twoday:setSelected(true)
            end 

              print( "  ---- ")
       end
                   
        
        print("2day")
    end)
    self.threeday:addClickEventListener(function ( )
  
      local a  = os.date("%d",os.time())


     
      if  self. num < 3  then  
           self.threeday :setSelected(true)
           --and  self.twoday_index ==0 
      elseif self.num ==3   and   (a- self. datatime==1)   then 
    
         HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 

    
        HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+88
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI()  
 

                self.threeday :setSelected(false)    ---  已经点过了  
            
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >3  then    
        self.threeday :setSelected(false) 
      else    ---  

            if   a- self. datatime==1  then 
              self.threeday:setSelected(false)
            else
             self.threeday:setSelected(true)
            end 



              print( "  ---- ")
       end      






        print("3day")
    end)
    self.fourday:addClickEventListener(function ( )
        
    local a  = os.date("%d",os.time())


     
      if  self. num < 4  then  
           self.fourday :setSelected(true)
    
      elseif self.num ==4   and   (a- self. datatime==1)   then 
  
         HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 
          
                self.fourday :setSelected(false)    ---  已经点过了  



        HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+108
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI() 
        
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >4  then    
        self.fourday :setSelected(false) 
      else    ---  
              -- self.fourday:setSelected(false)
               if   a- self. datatime==1  then 
                  self.fourday:setSelected(false)
              else
                  self.fourday:setSelected(true)
               end 

              print( "  ---- ")
       end      
  


    end)
    self.fiveday:addClickEventListener(function ( )
       local a  = os.date("%d",os.time())


     
      if  self. num < 5  then  
           self.fiveday :setSelected(true)

      elseif self.num ==5   and   (a- self. datatime==1)   then 
           
         HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 
          
                self.fiveday :setSelected(false)    ---  已经点过了  

                   HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+128
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI() 
        
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >5  then    
        self.fiveday :setSelected(false) 
      else    ---  

              if   a- self. datatime==1  then 
                  self.fiveday:setSelected(false)
              else
                  self.fiveday:setSelected(true)
               end 

              -- self.fiveday:setSelected(false)
              print( "  ---- ")
       end     
        print("5day")
    end)
    self.sixday:addClickEventListener(function ( )

         local a  = os.date("%d",os.time())


     
      if  self. num < 6  then  
           self.sixday :setSelected(true)
      
      elseif self.num ==6   and   (a- self. datatime==1)   then 
         
         HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 

        HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+148
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI() 
          
                self.sixday :setSelected(false)    ---  已经点过了  
        
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >6  then    
        self.sixday :setSelected(false) 
      else    ---  
   

                if   a- self. datatime==1  then 
                  self.sixday:setSelected(false)
              else
                  self.sixday:setSelected(true)
               end 

                     print( "  ---- ")

       end 
        print("6day")
    end)
    self.sevenday:addClickEventListener(function ( )



         local a  = os.date("%d",os.time())


     
      if  self. num < 7  then  
           self.sevenday :setSelected(true)
        
      elseif self.num ==7   and   (a- self. datatime==1)   then 
    
         HeroData.Hero[1].signtime =a 
        HeroData.Hero[1].signdate= HeroData.Hero[1].signdate+1 
                self.sevenday :setSelected(false)    ---  已经点过了  


        HeroData.Hero[1].Acer=  HeroData.Hero[1].Acer+168
        local str = json.encode(HeroData.Hero)
          ModifyData.WriteDataToDoc(str,1)
          HeroData.GameLayerdegate:reshUI() 
        
                print( "元宝增加")  
                --- 写入文件  
      elseif  self. num >7  then    
        self.sevenday :setSelected(false) 
      else    ---  
              -- self.sevenday:setSelected(false)

                 if   a- self. datatime==1  then 
                  self.sevenday:setSelected(false)
              else
                  self.sevenday:setSelected(true)
               end 
              print( "  ---- ")
       end 

        print("7day")
    end)
end





return check 