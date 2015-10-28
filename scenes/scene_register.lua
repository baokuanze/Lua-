
   
local scene_register = class("scene_register", function()
    return display.newScene("scene_register")
end)

function scene_register:ctor()
self.scene = cc.uiloader:load("res/RotateionView/Scene_register.csb"):addTo(self,2) 
local Button_determine=self.scene:getChildByName("Button_determine")

local TextField_account=self.scene:getChildByName("TextField_account")
local TextField_password=self.scene:getChildByName("TextField_password")
local TextField_confirmation=self.scene:getChildByName("TextField_confirmation")
local TextField_mailbox=self.scene:getChildByName("TextField_mailbox")
if sceneData.land ==0 then 
         TextField_confirmation:removeSelf()
         TextField_mailbox:removeSelf()
          Button_determine:addTouchEventListener(function (sender,state )
               print("判断")
           if  (state ==2)then
                local str =    TextField_account:getString()   
                local passworld1 = TextField_password: getString()  
                if str ~=nil and passworld1 ~=nil then 
                            self:login()

                end 

            end 
          end)  
else 

     Button_determine:addTouchEventListener(function (sender,state )
                 print("判断")
       if 	(state ==2)then
               local str =    TextField_account:getString()   
               local passworld1 = TextField_password: getString()  
               local passworld2 = TextField_confirmation: getString()  
               print(passworld1)
               print(passworld2)
               print(str)

        if (passworld1==passworld2  and str ~= nil and passworld1 ~=nil)then 

                print("ok")
              if ( GameLayer)then 
            	   print("this is right")
               end 


             self:register()
         -- display.replaceScene(GameLayer.new())
       end 
     end 


  end)
end 

local Button_cancel=self.scene:getChildByName("Button_cancel")
 Button_cancel:addClickEventListener(function ()
print("取消")
local MainScene= require("app.scenes.MainScene")
  
    display.replaceScene(MainScene.new())

 end)



end 
  function scene_register:register()

    local TextField_account=self.scene:getChildByName("TextField_account")
local TextField_password=self.scene:getChildByName("TextField_password")
local TextField_confirmation=self.scene:getChildByName("TextField_confirmation")
local TextField_mailbox=self.scene:getChildByName("TextField_mailbox")

    if not app.websocket then
        print("not connected")
        return
    end
    if app.callback["reg"] then
        app.callback["reg"] = nil
        app.callback["reg"] = handler(self, self.login_callback1)
    else
        app.callback["reg"] = handler(self, self.login_callback1)
    end
    local str =    TextField_account:getString()   
    local passworld1 = TextField_password: getString()  
    local text = '{"type":1,"message":{"user_name":"'..str..'","password":"'..passworld1..'"}}'
     print(text)
    if app.websocket:send(text) then
        printf("注册 %s", text)
    end
end



function scene_register:login_callback1(message)
    print("mainscene_function","login")
    if message["code"] == 0 then
        local user_id = message["message"]["user_id"]
        print("注册成功 success",user_id)
         HeroData.user_id = user_id 
         display.replaceScene(GameLayer.new())
    end

  end 

  function scene_register:login()
    local TextField_account=self.scene:getChildByName("TextField_account")
local TextField_password=self.scene:getChildByName("TextField_password")
local TextField_confirmation=self.scene:getChildByName("TextField_confirmation")
local TextField_mailbox=self.scene:getChildByName("TextField_mailbox")

    if not app.websocket then
        print("not connected")
        return
    end
    if app.callback["login"] then
        app.callback["login"] = nil
        app.callback["login"] = handler(self, self.login_callback)
    else
        app.callback["login"] = handler(self, self.login_callback)
    end
    local str =    TextField_account:getString()   
    local passworld1 = TextField_password: getString()  
    local text = '{"type":2,"message":{"user_name":"'..str..'","password":"'..passworld1..'"}}'
     print(text)
    if app.websocket:send(text) then
        printf("1send text msg: %s", text)
    end
end
function scene_register:login_callback(message)
    print("mainscene_function","login")
    if message["code"] == 0 then
        local user_id = message["message"]["user_id"]

        print("登陆 success",user_id)
                 HeroData.user_id = user_id 
          display.replaceScene(GameLayer.new())
    end
end




function scene_register:onEnter()
end

function scene_register:onExit()
end

return scene_register