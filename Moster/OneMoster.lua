--
-- Author: student
-- Date: 2015-09-23 17:59:52
--
local OneMoster=class("OneMoster", function (  )

    if   CSData.currentMonster_Index ==1 then 
	   return display.newSprite("#attack6.png")  
    elseif   CSData.currentMonster_Index ==2 then
       return display.newSprite("#a1.png")
    elseif   CSData.currentMonster_Index ==3 then
       return display.newSprite("#stay1.png")
    end 
end)
function OneMoster:ctor( )
	 self.MsAc=false
     local StateMachine = require("framework.cc.components.behavior.StateMachine")
     self.fsm=StateMachine.new()
     self.fsm:setupState({
             events={
             {name="noneAction",from={"attackA"},to="noneSp"},
             {name="stopAction",from={"walk","noneSp","hurt"},to="stop"},                --站立
             {name="walkAction",from={"none","attackA","stop"},to="walk"},        --行走
              {name="hurtAction", from ={"none","walk","attackA","stop"},to = "hurt"},     
             {name="deadAction",from={"hurt"},to="dead"},  --死亡
             {name="attackAAction",from={"walk","noneSp","stop"},to="attackA"}, --攻击   
         },
         callbacks={
          --空
            onbeforenoneAction = function(event) self:stopAllActions(); end,
            onnoneAction = function(event)  end,
            onleavenoneAction = function(event)  end,
            --站立
            onbeforestopAction = function(event) self:stopAllActions(); end,
            onstopAction = function(event) self:stop() end,
            onleavestopAction = function(event)  end,
           
           --行走
           onbeforewalkAction = function(event) self:stopAllActions(); end,
            onwalkAction = function(event) self:walk() end,
            onleavewalkAction = function(event) end,
            --受伤
            onbeforehurtAction = function(event) self:stopAllActions(); end,
            onhurtAction = function(event)    self:hurt()         
            self:performWithDelay(function()                
                print("怪物受伤")
                 self.fsm:doEvent("stopAction") 
            end, 1)
            end,
            onleavehurtAction =  function(event)  end,
        
            --死亡
            onbeforedeadAction = function(event) self:stopAllActions(); end,
            ondeadAction = function(event) self:dead() end,
            onleavedeadAction = function(event) end,
            --攻击
            onbeforeattackAAction = function(event) self:stopAllActions(); end,
            onattackAAction = function(event)
            self:stop()
            self:performWithDelay(function() self:stopAllActions()  self:attackA() 
                  self.MsAc = true
            self:performWithDelay(function() self.fsm:doEvent("noneAction") end, 1.0); --延迟函数
            end, 0.6); --延迟函数
            end,

            onleaveattackAAction = function(event) end,
	},
     	})

end
function OneMoster:hurt ( )
    -- local index =  CSData.currentMonster_Index
    local index =  self.kind
    print("怪物受伤动画")
    print("self.kind" .. self.kind)
        print( "CSData.Monster[index].hurt_newFames  "..CSData.Monster[index].hurt_newFames)
    print( "CSData.Monster[index].hurt_n1  "..CSData.Monster[index].hurt_n1)
    print( "CSData.Monster[index].hurt_n2  "..CSData.Monster[index].hurt_n2)
    print( "CSData.Monster[index].hurt_timer  "..CSData.Monster[index].hurt_timer)
   
    audio.playSound ("mp3/JianHurt.mp3",false)
     
     print("index" ..index)
      local frames=display.newFrames(CSData.Monster[index].hurt_newFames,CSData.Monster[index].hurt_n1,CSData.Monster[index].hurt_n2)
     local animation=display.newAnimation(frames,CSData.Monster[index].hurt_timer)
     self:playAnimationOnce(animation)

end

function OneMoster:stop (  )
	-- local frames=display.newFrames("walk%d.png",1,6)
	-- local animation=display.newAnimation(frames)
	-- self:playAnimationForever(animation)
    -- print("停止状态")
    --    -- local index =  CSData.currentMonster_Index
       local index =  self.kind
    --     print( "CSData.Monster[index].hurt_newFames  "..CSData.Monster[index].walk_newFrames)
    -- print( "CSData.Monster[index].walk_n1  "..CSData.Monster[index].walk_n1)
    -- print( "CSData.Monster[index].walk_n2  "..CSData.Monster[index].walk_n2)
    -- print( "CSData.Monster[index].walk_timer  "..CSData.Monster[index].walk_timer)

 
     local frames=display.newFrames(CSData.Monster[index].walk_newFrames,CSData.Monster[index].walk_n1,CSData.Monster[index].walk_n2)
     local animation=display.newAnimation(frames , CSData.Monster[index].walk_timer)
     self:playAnimationOnce(animation)
end

function OneMoster:walk(  )
    local index =  self.kind
  -- local index =  CSData.currentMonster_Index
    -- print( "index"..index)
    -- dump(CSData.Monster[index])

    -- print( "CSData.Monster[index].walk_newFrames  "..CSData.Monster[index].walk_newFrames)
    -- print( "CSData.Monster[index].walk_n1  "..CSData.Monster[index].walk_n1)
    -- print( "CSData.Monster[index].walk_n2  "..CSData.Monster[index].walk_n2)
    -- print( "CSData.Monster[index].walk_timer  "..CSData.Monster[index].walk_timer)
     local frames=display.newFrames(CSData.Monster[index].walk_newFrames,CSData.Monster[index].walk_n1,CSData.Monster[index].walk_n2)
     local animation=display.newAnimation(frames , CSData.Monster[index].walk_timer)
     self:playAnimationForever(animation)
   
end

function OneMoster:dead(  )
      audio.playSound("mp3/blood.mp3", false)
    local index =  self.kind
    -- local index =  CSData.currentMonster_Index
	 local frames=display.newFrames(CSData.Monster[index].dead_newFrames,CSData.Monster[index].dead_n1,CSData.Monster[index].dead_n2)
	 local animation=display.newAnimation(frames)
	 self:playAnimationOnce(animation)
end
function OneMoster:attackA( )
     audio.playSound("mp3/JianAttack.mp3", false)
    print("怪物的攻击")
    local index =  self.kind
    -- local index =  CSData.currentMonster_Index
    local frames=display.newFrames(CSData.Monster[index].attackA_newFrames,CSData.Monster[index].attackA_n1,CSData.Monster[index].attackA_n2)
    local animation=display.newAnimation(frames)
    self:playAnimationForever(animation)
end


return OneMoster