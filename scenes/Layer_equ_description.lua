local Layer_equ_description = class("Layer_equ_description", function()
    return display.newColorLayer(cc.c4b(100, 100, 150,200))

end)

function Layer_equ_description:ctor()
 


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

self. layer = cc.uiloader:load("res/RotateionView/Layer_equ_des.csb"):addTo(self,2) 
 -- local Button_close =self. layer :getChildByName("Button_close")
 --   Button_close:addClickEventListener(function ( )
 --  self:removeSelf()
 -- end )
self. Image_equ  = self. layer:getChildByName("Image_equ")

self. Text_name=self. layer:getChildByName("Text_name")

 self.Text_description=self. layer:getChildByName("Text_description")

 self. Text_Condition=self. layer:getChildByName("Text_Condition")

 self.Button_wear=self. layer:getChildByName("Button_wear")

    self: reshUI()
end 
function Layer_equ_description:reshUI()
   if HeroData.currentequ_index ==  1 then  
      if   HeroData.wearequ[1].id  ~=nil then 
            local index = 0
      	    for i,v in ipairs(HeroData.pagkeequ) do
      		     if  v.id == 1 and   v.wear == 0   and ( v.star > HeroData.wearequ[1].star or (v.star ==HeroData.wearequ[1].star  and v.level> HeroData.wearequ[1].level) )then
                       index=1 

                    self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")
                    self.Button_wear:addClickEventListener(function ( )
                    	HeroData.wearequ[1].wear = 0 
                    

                    	v.wear= 1
                    	HeroData.wearequ[1] =v
                    	dump(HeroData.pagkeequ)
                      local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)


                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                             
                     end)
                     break 
      		      end   
      	    end
      	    if index  == 0 then 
      	      	self.Button_wear:removeSelf()
      	    end 
      	   
          self. Image_equ:loadTexture(HeroData.wearequ[1].pic)
          self. Text_name:setString(HeroData.wearequ[1].name)
          self.Text_description:setString("+生命值 :".. HeroData.wearequ[1].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.wearequ[1].def)
       else 
          
         local index = 0    
                   
                 for i,v in ipairs(HeroData.pagkeequ) do
      		       if  v.id == 1 and   v.wear == 0    then
                       index=1 

                       self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")

                        self. Image_equ:loadTexture(v.pic)
                        self. Text_name:setString(v.name)
                        self.Text_description:setString("+生命值 :".. v.health .. "\n+攻击 :".. "\n+防御力 :" ..v.def)
          

                        self.Button_wear:addClickEventListener(function ( )               
                    	v.wear= 1
                    	HeroData.wearequ[1] =v
                    	dump(HeroData.pagkeequ)
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                  
                        end)
                        break 
      		        end   
      	           end   
 
                    if    index== 1 then 

                      
                    else 
                       self. Image_equ:loadTexture(HeroData.Allequi[1].pic)
                       self. Text_name:setString(HeroData.Allequi[1].name)
                       self.Text_description:setString("+生命值 :".. HeroData.Allequi[1].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.Allequi[1].def)
                       self.Button_wear:addClickEventListener(function ( )
                       print(" 获取鞋子 界面跳转")
                        display.replaceScene(Scenes_Shop.new())
                       end )
                    end   
       end

    elseif HeroData.currentequ_index ==  2 then  
      if   HeroData.wearequ[2].id  ~=nil then 
            local index = 0
      	    for i,v in ipairs(HeroData.pagkeequ) do
      		     if  v.id == 2 and   v.wear == 0   and  v.star > HeroData.wearequ[2].star then
                       index=1 

                    self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")
                    self.Button_wear:addClickEventListener(function ( )
                    	HeroData.wearequ[2].wear = 0 
                    

                    	v.wear= 1
                    	HeroData.wearequ[2] =v
                    	dump(HeroData.pagkeequ)
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                             
                     end)
                     break 
      		      end   
      	    end
      	    if index  == 0 then 
      	      	self.Button_wear:removeSelf()
      	    end 
      	   
          self. Image_equ:loadTexture(HeroData.wearequ[2].pic)
          self. Text_name:setString(HeroData.wearequ[2].name)
          self.Text_description:setString("+生命值 :".. HeroData.wearequ[2].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.wearequ[2].def)
      
       else 

           local index = 0    
                   
                 for i,v in ipairs(HeroData.pagkeequ) do
      		       if  v.id == 2 and   v.wear == 0    then
                       index=1 

                       self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")

                        self. Image_equ:loadTexture(v.pic)
                        self. Text_name:setString(v.name)
                        self.Text_description:setString("+生命值 :".. v.health .. "\n+攻击 :".. "\n+防御力 :" ..v.def)
          

                        self.Button_wear:addClickEventListener(function ( )               
                    	v.wear= 1
                    	HeroData.wearequ[2] =v
                    	dump(HeroData.pagkeequ)
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                             
                        end)
                        break 
      		        end   
      	           end   
 
                    if    index== 1 then 

                      
                    else 



          
                         self. Image_equ:loadTexture(HeroData.Allequi[2].pic)
                         self. Text_name:setString(HeroData.Allequi[2].name)
                         self.Text_description:setString("+生命值 :".. HeroData.Allequi[2].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.Allequi[2].def)
                         self.Button_wear:addClickEventListener(function ( )
                         print(" 获取武器 界面跳转")
                          display.replaceScene(Layer_Slider.new())
                          end )
                    end     
       end

       elseif HeroData.currentequ_index ==  3 then  
      if   HeroData.wearequ[3].id  ~=nil then 
            local index = 0
      	    for i,v in ipairs(HeroData.pagkeequ) do
      		     if  v.id == 3 and   v.wear == 0   and  v.star > HeroData.wearequ[3].star then
                       index=1 

                    self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")
                    self.Button_wear:addClickEventListener(function ( )
                    	HeroData.wearequ[3].wear = 0 
                    

                    	v.wear= 1
                    	HeroData.wearequ[3] =v
                    	dump(HeroData.pagkeequ)

                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)

                    	HeroData.reshobject: reashui() ---

                         self: removeSelf() 
                                             
                     end)
                     break 
      		      end   
      	    end
      	    if index  == 0 then 
      	      	self.Button_wear:removeSelf()
      	    end 
      	   
          self. Image_equ:loadTexture(HeroData.wearequ[3].pic)
          self. Text_name:setString(HeroData.wearequ[3].name)
          self.Text_description:setString("+生命值 :".. HeroData.wearequ[3].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.wearequ[3].def)
      
       else 

                local index = 0    
                   
                 for i,v in ipairs(HeroData.pagkeequ) do
      		       if  v.id == 3 and   v.wear == 0    then
                       index=1 

                       self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")

                        self. Image_equ:loadTexture(v.pic)
                        self. Text_name:setString(v.name)
                        self.Text_description:setString("+生命值 :".. v.health .. "\n+攻击 :".. "\n+防御力 :" ..v.def)
          

                        self.Button_wear:addClickEventListener(function ( )               
                    	v.wear= 1
                    	HeroData.wearequ[3] =v
                    	dump(HeroData.pagkeequ)
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	HeroData.reshobject: reashui() ---
                         self: removeSelf() 
                                             
                        end)
                        break 
      		        end   
      	           end   
 
                    if    index== 1 then 

                      
                    else 

          
                           self. Image_equ:loadTexture(HeroData.Allequi[3].pic)
                           self. Text_name:setString(HeroData.Allequi[3].name)
                          self.Text_description:setString("+生命值 :".. HeroData.Allequi[3].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.Allequi[3].def)
                         self.Button_wear:addClickEventListener(function ( )
                          print(" 获取饰品 界面跳转")
                             display.replaceScene(Scenes_Shop.new())
                          end )
                    end      
       end

 elseif HeroData.currentequ_index ==  4 then  
      if   HeroData.wearequ[4].id  ~=nil then 
            local index = 0
      	    for i,v in ipairs(HeroData.pagkeequ) do
      		     if  v.id == 4 and   v.wear == 0   and  v.star > HeroData.wearequ[4].star then
                       index=1 

                    self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")
                    self.Button_wear:addClickEventListener(function ( )
                    	HeroData.wearequ[4].wear = 0 
                    

                    	v.wear= 1
                    	HeroData.wearequ[4] =v
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	dump(HeroData.pagkeequ)
                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                             
                     end)
                     break 
      		      end   
      	    end
      	    if index  == 0 then 
      	      	self.Button_wear:removeSelf()
      	    end 
      	   
          self. Image_equ:loadTexture(HeroData.wearequ[4].pic)
          self. Text_name:setString(HeroData.wearequ[4].name)
          self.Text_description:setString("+生命值 :".. HeroData.wearequ[4].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.wearequ[4].def)
      
       else 
                   local index = 0    
                   
                 for i,v in ipairs(HeroData.pagkeequ) do
      		       if  v.id == 4 and   v.wear == 0    then
                       index=1 

                       self.Button_wear: loadTextures( "pay_tubiao_1_2.png" ,"pay_tubiao_1_2.png")
                        self.Button_wear:setTitleText("")

                        self. Image_equ:loadTexture(v.pic)
                        self. Text_name:setString(v.name)
                        self.Text_description:setString("+生命值 :".. v.health .. "\n+攻击 :".. "\n+防御力 :" ..v.def)
          

                        self.Button_wear:addClickEventListener(function ( )               
                    	v.wear= 1
                    	HeroData.wearequ[4] =v
                        local str2 = json.encode(HeroData.pagkeequ)
                      ModifyData.WriteDataToDoc(str2,3)
                    	dump(HeroData.pagkeequ)
                    	HeroData.reshobject: reashui() --
                         self: removeSelf() 
                                             
                        end)
                        break 
      		        end   
      	           end   
 
                    if    index== 1 then 

                      
                    else 
                      self. Image_equ:loadTexture(HeroData.Allequi[4].pic)
                      self. Text_name:setString(HeroData.Allequi[4].name)
                      self.Text_description:setString("+生命值 :".. HeroData.Allequi[4].health .. "\n+攻击 :".. "\n+防御力 :" ..HeroData.Allequi[4].def)
                      self.Button_wear:addClickEventListener(function ( )
                      print(" 获取盔甲 界面跳转")
                      display.replaceScene(Layer_Slider.new())
                      end )
                    end   
        end



















    end 






end















function Layer_equ_description:onEnter()
end

function Layer_equ_description:onExit()
end

return Layer_equ_description
