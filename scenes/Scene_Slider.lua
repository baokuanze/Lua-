



local Scene_Slider = class(Scene_Slider, function()
    return display.newScene()
end)
  

  function   Scene_Slider:ctor()
    self.items ={}
  self:createListView9()
 
  end


function Scene_Slider:onEnter()
end

function Scene_Slider:onExit()
end

function Scene_Slider:createListView9()
    self.lv = cc.ui.UIListView.new {
        -- bgColor = cc.c4b(200, 200, 200, 120),
       -- bg = "barH.png",
        bgScale9 = true,
        async = true,
        viewRect = cc.rect(360, 40, 400, 80),
        direction = cc.ui.UIScrollView.DIRECTION_HORIZONTAL,
      --  scrollbarImgV = "barH.png"
    }
        :onTouch(handler(self, self.touchListener8))
        :addTo(self)

    self.lv:setDelegate(handler(self, self.sourceDelegate))

    self.lv:reload()
end
function Scene_Slider:touchListener8(event)
    local listView = event.listView
    if "clicked" == event.name then
        print("async list view clicked idx:" .. event.itemPos)

          listView:moveItems(event.itemPos,event.itemPos+1,-100 ,0)
        self.lv:reload()
    end
end


function Scene_Slider:sourceDelegate(listView, tag, idx)
    -- print(string.format("TestUIListViewScene tag:%s, idx:%s", tostring(tag), tostring(idx)))
    if cc.ui.UIListView.COUNT_TAG == tag then
        return 10
    elseif cc.ui.UIListView.CELL_TAG == tag then
        local item
        local content

        item = self.lv:dequeueItem()
        if not item then
            item = self.lv:newItem()
            content = cc.ui.UILabel.new(
                    {text = "item"..idx,
                    size = 20,
                    align = cc.ui.TEXT_ALIGN_CENTER,
                    color = display.COLOR_WHITE})
            item:addContent(content)
        else
            content = item:getContent()
        end
        table.insert(self.items, item)
        content:setString("item:" .. idx)
        item:setItemSize(120, 80)

        return item
    else
    end
end

-- function Scene_Slider:moveItems(beginIdx, endIdx, x, y, bAni)

--     local moveByParams = {x = x, y = y, time = 0.2}
--     transition.moveBy(self.items[i], moveByParams)
      
-- end


return Scene_Slider