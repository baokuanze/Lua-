




local HeroRole = class("HeroRole", function()
  if HeroData.currentHero_Index  ==1 then 
    ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("zuozhu.pvr.ccz","zuozhu.plist","zuozhu.xml")
    return  ccs.Armature:create("zuozhu")
 end 

end)


function HeroRole:ctor( )
    self.kind =  HeroData.currentHero_Index
    local name = "components.behavior.StateMachine"

    cc.GameObject.extend(self)

        :addComponent(name)
        :exportMethods()

    local component = self:getComponent(name)
    print(tolua.type(component))
    print("HeroData.Hero[1].stand2 :" .. HeroData.Hero[1].stand2)
    local eventss = {
        --- HeroData.Hero[1].stand2 "stand2 "    战力
        ----  HeroData.Hero[1].attack1   "attack-1"  攻击一 
         --------HeroData.Hero[1].attack2 "attack-2"
          -----HeroData.Hero[1].beaten  "beaten"    -- 受伤
       ----------  HeroData.Hero[1]. fall"death"   -- 死亡
        ---- HeroData.Hero[1].walk   ----   跑动
        {name = "start", from = {"none", HeroData.Hero[ self.kind].walk ,HeroData.Hero[self.kind].stand2 ,HeroData.Hero[self.kind].attack1, HeroData.Hero[self.kind].attack2  , HeroData.Hero[self.kind].xuzuostand1
        ,HeroData.Hero[self.kind].skill,HeroData.Hero[  self.kind].change3,HeroData.Hero[  self.kind].penhuo} ,  to = HeroData.Hero[  self.kind].stand2
         }       --- 站立
        ,
         {name = "run",  from ={ HeroData.Hero[  self.kind].stand2 },  to = HeroData.Hero[  self.kind].walk
           }    --  跑动
        ,

          {name = "attackPAction",  from ={ HeroData.Hero[  self.kind].stand2  ,  HeroData.Hero[  self.kind].walk  },  to = HeroData.Hero[  self.kind].attack1
           }   --- 攻击1 
        , 
         {name="attackAAction",from={HeroData.Hero[  self.kind].stand2, HeroData.Hero[  self.kind].walk },to=  HeroData.Hero[  self.kind].xuzuostand1}
         ,

         {name="attackBAction",from={ HeroData.Hero[  self.kind].walk,HeroData.Hero[  self.kind].stand2},to=HeroData.Hero[  self.kind].skill}
         ,
            {name="attackCAction",from={HeroData.Hero[  self.kind].walk,HeroData.Hero[  self.kind].stand2},to=HeroData.Hero[  self.kind].change3}
            ,

            {name="attackDAction",from={HeroData.Hero[  self.kind].walk,HeroData.Hero[  self.kind].stand2},to=HeroData.Hero[  self.kind].penhuo}
            ,
            {name="deadAction",from={"none",HeroData.Hero[  self.kind].penhuo,HeroData.Hero[  self.kind].change3,HeroData.Hero[  self.kind].skill,HeroData.Hero[  self.kind].xuzuostand1,HeroData.Hero[  self.kind].attack1,HeroData.Hero[  self.kind].walk , HeroData.Hero[  self.kind].stand2}
            ,to=HeroData.Hero[  self.kind].fall},

        -- {name = "attack1",  from ="stand",  to = "attack-1"},
        -- {name = "attack2",  from = "stand","attack1",  to = "attack-2"},
        -- {name = "bk",  from = "stand",  to = "block"},
        -- {name = "b",  from = "stand",  to = "beaten"},
        -- {name = "f",  from = "stand",  to = "fall"},
        -- {name = "dead",  from ="stand",  to = "death"},
        -- {name = "lp",  from = "stand",  to = "leipi"},
        -- {name = "rs",  from = "stand",  to = "ranshao"},
        -- {name = "jf",  from = "stand",  to = "jifei"},        
    }
    self:setupState({
        events = eventss,
        callbacks = {
            --onbeforestart = function(event) self:stopAllActions() end,

            onstart = function(event) 
            -- print(event.name)
                audio.stopAllSounds()
                self:getAnimation():play(event.to) --current_
            end,

            ---onbeforerun  = function(event) self:stopAllActions() end,
            onrun        = function(event)
              audio.playSound("mp3/run.mp3",true) 
                self:getAnimation():play(event.to):setSpeedScale(0.2)
            end,

            -- onbeforeattack = function(event) print(event.name) end,
            onattackPAction       = function(event) 
            audio.playSound("mp3/A1.mp3",true)
                    self:getAnimation():play(event.to)            
            end,
            --onleaveattack  = function(event) self:stopAllActions() end,
            onattackAAction       = function(event) 
               
                 audio.playSound("mp3/jiguangfeiniao.mp3",false)
                    self:getAnimation():play(event.to)            
            end,

            onattackBAction       = function(event) 
             audio.playSound("mp3/zuozhu_skill2.mp3",false)
                    self:getAnimation():play(event.to)            
            end,

            onattackCAction      = function(event) 
          
             audio.playSound("mp3/zuozhu_skill3.mp3",false)
                    self:getAnimation():play(event.to)            
            end,

            onattackDAction       = function(event) 
              audio.playSound("mp3/zuozhu_skill1.mp3",false)
                    self:getAnimation():play(event.to)            
            end,

           -- onbeforedead = function(event) self:stopAllActions() end,
            ondeadAction = function(event) 
            -- print(event.name) 
                  audio.playSound("mp3/herodie.mp3",false)
                    self:getAnimation():play(event.to)
            end,

            -- onchangestate = function(event) print("[FSM] CHANGED STATE: " .. event.from .. " to " .. event.to) end}

            onlp       = function(event) 
            print("lp")
                    self:getAnimation():play(event.to)            
            end,

            onrs       = function(event) 
                    self:getAnimation():play(event.to)            
            end,

            onjf      = function(event) 
                    self:getAnimation():play(event.to)            
            end,
        }

    })
    -- -- dump(component.map_)
    -- if self:canDoEvent("start") then
    --     self:doEvent("start") --current_
    -- end
    
    -- self:getAnimation():setMovementEventCallFunc(function(ref, moventType, moventID)
    --     -- 
    --     self.moventType = moventType
    --     if moventType == 1  then
    --         if self:getState() == "attack-2" then
    --             self:doEvent("attack")
    --             return
    --         end
    --         if self.longPress or self.timer <= 60 then
    --             if self:canDoEvent("attack") then
    --                 self:doEvent("attack")
    --             end
    --         else
    --             if self:canDoEvent("stop") then
    --                 self:doEvent("stop")
    --             end
    --         end
    --     end

    -- end)

    

    -- local e = {
    --     "run",
    --     "stop",
    --     "attack1",
    --     "attack2",
    --     "attack3",
    --     "attack4",
    --     "stop"
    -- }

end



return HeroRole