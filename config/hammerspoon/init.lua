local spaces = require("hs.spaces")
-- Switch ghostty
hs.hotkey.bind({ 'option', 'shift' }, 'space', function()
  local APP_NAME = 'Ghostty'
  function moveWindow(ghostty, space, mainScreen)
    -- move to main space
    local win = nil
    while win == nil do
      win = ghostty:mainWindow()
    end
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, ghostty)
    end
    winFrame = win:frame()
    scrFrame = mainScreen:frame()
    winFrame.w = scrFrame.w - 300
    winFrame.h = scrFrame.h
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x + (300/2)
    print('Before',winFrame)
    win:setFrame(winFrame, 0)
    print('After',win:frame())
    print('window was moved',spaces.moveWindowToSpace(win, space))
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, ghostty)
    end
  end
  local ghostty = hs.application.get(APP_NAME)
  if ghostty ~= nil and ghostty:isFrontmost() then
    ghostty:hide()
  else
    local mainScreen = hs.screen.mainScreen()
    local space = hs.spaces.activeSpaceOnScreen(mainScreen)
    print('Active Space', space)
    if ghostty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print(name)
        print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          moveWindow(app, space, mainScreen)
          app:activate()
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if ghostty ~= nil then
      moveWindow(ghostty, space, mainScreen)
      ghostty:activate()
    end
  end
end)
