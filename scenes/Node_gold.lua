
local Node_gold = class(" Node_gold", function()
    return display.newNode(" Node_gold")
end)


function Node_gold:ctor()
 self. node = cc.uiloader:load("res/RotateionView/Node_gold.csb"):addTo(self,2) 
   self.Text_diamond= self.node:getChildByName("Text_diamond")

  self.Button_add= self.node:getChildByName("Button_add")
  self.Button_add:addTouchEventListener(function (sender,state )
   if(state ==2)then
     print("Button_add")
    local num =   self.Text_diamond:getString()+100
   self.Text_diamond :setString(tostring(num))
   
        local Layer_Activ  = Layer_Active.new()
        self:getParent():addChild(Layer_Activ,5)
   end
  end) 

end 

function Node_gold:onEnter()
end

function Node_gold:onExit()
end

return Node_gold