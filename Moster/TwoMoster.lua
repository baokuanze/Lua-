--
-- Author: student
-- Date: 2015-09-23 10:56:19
--

local TwoMoster=class("TwoMoster",function (  )
	--return display.newSprite("#stay1.png")
      return display.newSprite("#a1.png")
end)

function TwoMoster:ctor(  )
     self.MsAc=false
     local StateMachine = require("framework.cc.components.behavior.StateMachine")
     self.fsm = StateMachine.new()
     self.fsm:setupState({
		events = {
                  {name="noneAction",from={"attackA"},to="noneSp"},
                  {name="stopAction",from={"walk","noneSp","hurt"},to="stop"},                --站立
                  {name="walkAction",from={"none","attackA","stop"},to="walk"},        --行走
                  {name="hurtAction", from ={"none","walk","attackA","stop"},to = "hurt"},     --受伤
                  {name="deadAction",from={"hurt"},to="dead"},  --死亡
                  {name="attackAAction",from={"walk","noneSp","stop"},to="attackA"}, --攻击
	},--[[前缀固定为onbefore on.. onleave 状态转换间隔为3个动作 onbefore on..开启帧动画]]
	callbacks={
            --空
            onbeforenoneAction = function(event) self:stopAllActions(); end,
            onnoneAction = function(event) end,
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
            onhurtAction = function(event) 
            self:performWithDelay(function () self.fsm:doEvent("stopAction") 
            end, 0.5)
            end,
            onleavehurtAction =  function(event)  end,
            --死亡
            onbeforedeadAction = function(event) self:stopAllActions(); end,
            ondeadAction = function(event)self:dead() end,
            onleavedeadAction = function(event) end,
            --攻击
            onbeforeattackAAction = function(event) self:stopAllActions(); end,
            onattackAAction = function(event)
            self:stop()
            self:performWithDelay(function() self:stopAllActions()  self:attackA() 
                  self.MsAc = true
            self:performWithDelay(function() self.fsm:doEvent("noneAction") end, 1.0); --延迟函数
            end, 2.0); --延迟函数
            end,

            onleaveattackAAction = function(event) end,
	},
	})
end

function TwoMoster:stop (  )
   local frames=display.newFrames("a%d.png",1,6)
   local animation=display.newAnimation(frames)
   self:playAnimationForever(animation)
end

function TwoMoster:walk(  )
    local frames=display.newFrames("b%d.png",1,6)
   local animation=display.newAnimation(frames)
   self:playAnimationForever(animation)
end

function TwoMoster:dead(  )
    local frames=display.newFrames("d%d.png",1,6)
    local animation=display.newAnimation(frames)
    self:playAnimationOnce(animation)
end
function TwoMoster:attackA(  )
    local frames=display.newFrames("c%d.png",1,6)
    local animation=display.newAnimation(frames)
    self:playAnimationOnce(animation)
end
-- function TwoMoster:stop (  )
-- 	local frames=display.newFrames("stay%d.png",1,6)
-- 	local animation=display.newAnimation(frames)
-- 	self:playAnimationForever(animation)
-- end

-- function TwoMoster:walk(  )
-- 	 local frames=display.newFrames("stay%d.png",1,6)
-- 	local animation=display.newAnimation(frames)
-- 	self:playAnimationForever(animation)
-- end

-- function TwoMoster:dead(  )
-- 	 local frames=display.newFrames("die%d.png",1,6)
-- 	 local animation=display.newAnimation(frames)
-- 	 self:playAnimationOnce(animation)
-- end
-- function TwoMoster:attackA(  )
-- 	 local frames=display.newFrames("play%d.png",1,9)
-- 	 local animation=display.newAnimation(frames)
-- 	 self:playAnimationOnce(animation)
-- end

return TwoMoster





