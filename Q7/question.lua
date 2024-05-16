button = nil
window = nil
modalDialog = nil

function init()
  button = modules.client_topmenu.addRightToggleButton('button', tr('Question'), 'icon', closing)
  button:setOn(false)

  window = g_ui.displayUI('question')
  window:setVisible(false)

  --get help values
  allTabs = window:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(window:getChildById('optionsTabContent'))
  print("init funtionc")
  local dialog = rootWidget:recursiveGetChildById('questionMain')
  if dialog then
    modalDialog = dialog
  end

  connect(g_game, { onModalDialog = test })

end

function terminate()
  button:destroy()
  window:destroy()
  test()
end

function closing()
  if button:isOn() then
    window:setVisible(false)
    button:setOn(false)
  else
    window:setVisible(true)
    button:setOn(true)
  end
  
end
function wbutton()
--this function is the one in charge of positioning the button, however, I was not able to find a callback that would get called every
--update, so this only moves the button by certain offset
  local button = window:getChildById('questionButton')
  print(button:getX())
  button:move(button:getX() + 25, button:getY() + 25)
  print(button:getX())
end

function test(id, title, message, buttons, enterButton, escapeButton, choices, priority)
  print("Test function")
end
