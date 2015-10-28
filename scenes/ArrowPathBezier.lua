
local  scheduler = require("framework.scheduler")
local  ArrowPathBezier    =    class("ArrowPathBezier", function()
  return cc.Sprite:create()
  end)
local  t = {}
function ArrowPathBezier:ctor(filename)
  self.perPointX = 0
  self.perPointY = 0
  self.curPointX = 0
  self.curPointY = 0
self:setSpriteFrame(filename)
self.handle = scheduler.scheduleUpdateGlobal(handler(self, self.update)) 
end

function ArrowPathBezier:update() 
   
  self.perPointX = self.curPointX
  self.perPointY = self.curPointY
  self.curPointX = self:getPositionX()
  self.curPointY = self:getPositionY()
  local x = self.curPointX - self.perPointX
  local y = self.curPointY - self.perPointY
  local angle = math.atan2(y, x)
  
  local angle_roate = angle*180/3.14
  -- print(angle_roate)
  self:setRotation(-angle_roate)



end
  

-- function ArrowPathBezier:bezierat(a ,b,c,d,t )

--  return  (math.pow(1 -t ,3)*a +3.0f* t*(math.pow(1-t, 2))*b +3.0f *math.pow(t, 2)*(1-t)*c+
--             math.pow(t,3)*d )
-- end

-- function ArrowPathBezier:bezierat1 (a ,b,c,d,t )
-- 	return (math.pow(1-t,2) * a + 2.0f*t*(1-t)*b +math.pow(t,2)*d)
-- end 


  -- function ArrowPathBezier:create(t  ,c)
  --   pBezierBy =    ArrowPathBezier :new()
  --   pBezierBy:initWithDuration(t, c)
  --   return pBezierBy
  -- end 


-- function  ArrowPathBezier:initWithDuration(t ,c)
-- bRet = false;
-- if (cc.CCActionInterval:initWithDuration(t))then 
--    _config = c;
--    return true;
-- end 

-- return bRet

-- end

--   function ArrowPathBezier:create(t  ,c)
--    pBezierBy =   ArrowPathBezier:new()
--     pBezierBy:initWithDuration(t,c)

    
--  -- Node*getTarget() 
--    _target= self:getTarget()
--  if  self:getTarget()then 
--     local   xa = 0;
--     local  xb = _config.controlPoint.x;
--     local  xd = _config.endPosition.x;

--     local ya = 0;
--     local yb = _config.controlPoint.y;
--     local yd = _config.endPosition.y;
--     local currentPos ={}


--     currentPos.x ,currentPos.y= _target->getPosition()
--     local diff =   currentPos  - _previousPosition
--     _startPosition = _startPosition + diff;
--     local newPos = _startPosition + Vec2(x,y);
--       _target->setPosition(newPos);
--     _previousPosition = newPos;  
--     if (0 ~= time) then 
--     lcoal  vector = currentPos - newPos;
--     local radians = vector.getAngle();
--     end 
--  end 
-- end 



return ArrowPathBezier


