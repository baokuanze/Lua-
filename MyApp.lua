require("config")
require("cocos.init")
require("framework.init")
GameLayer = require("app.scenes.GameLayer")
Layer_heroAttribute=require("app.scenes.Layer_heroAttribute")
Scene_fighting =require("app.scenes.Scene_fighting")
Layer_equ_description = require("app.scenes.Layer_equ_description")
 require("app.Data.sceneData")
Layer_Gater = require("app.scenes.Layer_Gate")
HRocker = require("app.Hero.HRocker")
HeroNode = require("app.Hero.HeroNode")
Player = require("app.Hero.Player")
require("app.Data.SkillData")
require("app.Data.ModifyData")
require("app.Data.CSData")
require("app.Data.HeroData")
require("app.hxy.ShopData")

OneMonster = require("app.Moster.OneMoster")      --状态机 --小兵
OneMonsterNode = require("app.Moster.OneMosterNode")      --小兵
-- OneMonsterNode = require("app.Moster.OneMosterNode") 
require("app.Moster.EnemyGoonMudo")

Flylabel = require("app.Moster.Flylabel") --飘血 Node
require("app.Data.MonsterData") 
Layer_Slider = require("app.scenes.Layer_Slider")  ---  选择关卡

Loselayer =require("app.ny.Loserlayer")    --- 组员ny失败界面

losewujing =require("app.ny.losewujing")     --- 

WinLayer  =require("app.ny.WinLayer")    
check =require("app.ny.check")                            
SetLayer  =require("app.ny.SetLayer")   

Hechenglayer = require("app.fxy.Hechenglayer")   ---  fxy 合成  
packagelayer =require("app.fxy.packagelayer")   ---   fxy  背包   
Reward =require("app.fxy.Reward")     --  FXY   抽奖    
Layer_hechengsucc=require("app.fxy.Layer_hechengsucc")
Layer_Hechengfail=require("app.fxy.Layer_Hechengfail")

 Scene_Battle = require("app.scenes.Scene_Battle")   -- 战斗  

Scenes_Shop = require("app.hxy.Scenes_Shop")    --- 组员 hxy    商店 
  Layer_Active = require("app.hxy.Layer_Active")  --- 组员 hxy    活动界面 
Layer_Equip =require( "app.hxy.Layer_Equip") --- 组员 hxy    商店 - 买装备 界面  



Layer_GoldAndDiamond=require( "app.hxy.Layer_GoldAndDiamond")   --- 兑换金币  ， 元宝 

Layer_leveup =require("app.scenes.Layer_leveup")
Reward_get = require("app.fxy.Reward_get")
ResourceLoadScene= require("app.scenes.ResourceLoadScene")
MainScene= require("app.scenes.MainScene")
Scene_Boss= require("app.scenes.Scene_Boss")

local MyApp = class("MyApp", cc.mvc.AppBase)
local WebSockets = require("app/WebSockets")

function MyApp:ctor()
    MyApp.super.ctor(self)
     if not app.websocket then
    	app.websocket = WebSockets.new("ws://172.16.10.2:9501")
    	app.websocket:addEventListener(WebSockets.OPEN_EVENT, handler(self, self.onOpen))
    	app.websocket:addEventListener(WebSockets.MESSAGE_EVENT, handler(self, self.onMessage))
        app.websocket:addEventListener(WebSockets.CLOSE_EVENT, handler(self, self.onClose))
        app.websocket:addEventListener(WebSockets.ERROR_EVENT, handler(self, self.onError))
    end

    self.callback = {}
end

function MyApp:run()
        cc.FileUtils:getInstance():addSearchPath("res/")
        cc.FileUtils:getInstance():addSearchPath("res/RotateionView")
        cc.FileUtils:getInstance():addSearchPath("res/show")
        cc.FileUtils:getInstance():addSearchPath("res/picture")
        cc.FileUtils:getInstance():addSearchPath("res/chapter") 
        cc.FileUtils:getInstance():addSearchPath("res/chapter1") 
        cc.FileUtils:getInstance():addSearchPath("res/ui") 
        cc.FileUtils:getInstance():addSearchPath("res/player") 
        cc.FileUtils:getInstance():addSearchPath("res/player1") 
        cc.FileUtils:getInstance():addSearchPath("res/Boom")  --怪物 路径  
        cc.FileUtils:getInstance():addSearchPath("res/Boom/Check") 
        cc.FileUtils:getInstance():addSearchPath("res/fxy") 
        cc.FileUtils:getInstance():addSearchPath("res/hxy") 
        cc.FileUtils:getInstance():addSearchPath("res/mp3") 
         --  Layer_Slider     ---  是  scences
    -- self:enterScene("MainScene")
    
       self:enterScene("ResourceLoadScene")
end
function MyApp:onOpen(event)
    print("connected")
end

function MyApp:onMessage(event)
	printf("receive text msg: %s", event.message)

    local message = json.decode(event.message)
    if message ==nil then
        return
    end
    if message["message"] then
        --login
        if message["message"]["type"]==2 then
            print("login")
            if self.callback["login"] then
                self.callback["login"](message)
             end
        elseif message["message"]["type"]==1 then
            if self.callback["reg"] then
                self.callback["reg"](message)
             end
        elseif message["message"]["type"]==4 then

             if self.callback["update"] then
                self.callback["update"](message)
             end
        
        elseif message["message"]["type"]==5 then
            if self.callback["find"] then
                self.callback["find"](message)
             end
     elseif message["message"]["type"]==7 then   ---查询 
              if self.callback["equip"] then
                self.callback["equip"](message)
             end
     elseif message["message"]["type"]==8 then    --- 删除 
              if self.callback["remove"] then
                self.callback["remove"](message)
             end  
        end

    end
end

function MyApp:onClose(event)
    print("sever is close")
    app.websocket = nil
end

function MyApp:onError(event)
    printf("error %s", event.error)
    app.websocket = nil
end




return MyApp
