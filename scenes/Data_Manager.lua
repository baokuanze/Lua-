local Data_Manager = {}
function Data_Manager:new()
	local DMG = {}
	setmetatable(DMG, self)
	self.__index = self.id

	DMG.data = {}
	DMG.data["_table"] = {}
	DMG.data["_value"] = {}

	--table action
	function DMG:setTableforKey(_key,_table)
		if _key == nil then
			print("_key is nil")
			return
		end
		if not type(_table) == "table" then
			print("The _table is not a table")
			return
		end
		DMG.data["_table"][_key] = clone(_table)
	end

	function DMG:getTableforKey(_key)
		if _key == nil then
			print("_key is nil")
			return nil
		end
		local _table = DMG.data["_table"][_key] or nil
		if _table and type(_table) == "table" then
			return _table
		end
		return nil
	end

	--value action
	function DMG:setValueforKey(_key,_value)
		if _key == nil then
			print("the key is nil")
			return 
		end
		DMG.data["_value"][_key] = _value
	end

	function DMG:getValueforKey(_key)
		if _key == nil then
			print("_key id nil")
			return nil
		end
		local value = DMG.data["_value"][_key] or nil
		return value
	end

	--clear action
	function DMG:cleanValueforKey(_key)
		if DMG.data["_value"][_key] then
			DMG.data["_value"][_key] = nil
		end
	end

	function DMG:cleanTableforKey(_key)
		if DMG.data["_table"][_key] then
			DMG.data["_table"][_key] = {}
		end
	end

	--clear all the data
	function DMG:clear()
		DMG.data = {}
		DMG.data["_table"] = {}
		DMG.data["_value"] = {}
	end

	return DMG
end

function Data_Manager:getInstance()
	if self.instance == nil then
		self.instance = Data_Manager:new()
	end

	return self.instance
end

return Data_Manager