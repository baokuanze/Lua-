module("ModifyData",package.seeall)
heroPos = {x = 1,y = 1}

scene = 1     --- is best
chapter = 1
star = 0
Mp = 0 
SD = 0
publicdata  ={}      ---  数据存储的标记 


heroarray ={}
heroPos = {x = 1,y = 1}
function getSD()
	return SD
end
function setSD(x)
	SD = x
end

function getMP()
	return MP
end
function setMP(x)
	MP = x
end
function setSceneNum( num )
	scene=num
end
function setChapterNum( num )
	chapter=num
end
function setStarNum( num )
	star=num
end
function getSceneNum( )
	return scene
end
function getChapterNum( ) 
	return chapter
end
function getStarNum( )
	return star
end
		--写入文件
function WriteDataToDoc( t , num ) --传入表
	local str = json.encode(t)
	--str = crypto.encryptXXTEA(t, "123456")
	if num == 1 then    ----  英雄的 元宝   等级  ， 经验  ,强化石的数量 ， 解锁的章数
	     local docpath = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"    
	     local f = assert(io.open(docpath,'w'))
    	 f:write(str)
     	 f:close()

    elseif num == 2  then    ---  关卡  
    	--todo
         local docpath = cc.FileUtils:getInstance():getWritablePath().."sceneData.txt"
	     local f = assert(io.open(docpath,'w'))
    	 f:write(str)
     	 f:close()
    elseif num == 3  then    ---  装备背包   
        local docpath = cc.FileUtils:getInstance():getWritablePath().."pagkeequ.txt"
	    local f = assert(io.open(docpath,'w'))
    	f:write(str)
     	f:close()
   end 





end
		 --读出文件
function ReadDataToDoc( num)  
	if num == 1 then     ----  英雄的 元宝   等级  ， 经验  ,强化石的数量 ， 解锁的章数
	    local path = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"
	    local str = cc.FileUtils:getInstance():getStringFromFile(path)
	    --str = crypto.decryptXXTEA(str, "123456")
	   return json.decode(str) 
	elseif num == 2 then   ---  关卡 
        local path = cc.FileUtils:getInstance():getWritablePath().."sceneData.txt"
	    local str = cc.FileUtils:getInstance():getStringFromFile(path)
	    --str = crypto.decryptXXTEA(str, "123456")
	   return json.decode(str) 

	elseif num == 3 then    ---  装备背包
        local path = cc.FileUtils:getInstance():getWritablePath().."pagkeequ.txt"
	    local str = cc.FileUtils:getInstance():getStringFromFile(path)
	    --str = crypto.decryptXXTEA(str, "123456")
	    return json.decode(str) 
	end   
end

-- function WriteDataToDocHero( t ) --传入表
-- 	local str = json.encode(t)
-- 	--str = crypto.encryptXXTEA(t, "123456")
-- 	local docpath = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"
-- 	local f = assert(io.open(docpath,'w'))
-- 	f:write(str)
-- 	f:close()
-- end
-- 		 --读出文件
-- function ReadDataToDocHero() --传入表
-- 	local path = cc.FileUtils:getInstance():getWritablePath().."herodata.txt"
-- 	local str = cc.FileUtils:getInstance():getStringFromFile(path)
-- 	--str = crypto.decryptXXTEA(str, "123456")
-- 	return json.decode(str) 
-- end