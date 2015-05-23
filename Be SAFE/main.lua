print("Made it to main.lua")

W, H= display.contentWidth, display.contentHeight
display.setStatusBar( display.HiddenStatusBar )

print("width"..W)
print("height"..H)

local composer = require ("composer")
local scene = composer.newScene()

local function onKeyEvent( event ) --eventually add a history table so that it can take the user to an actual back

   local phase = event.phase
   local keyName = event.keyName
   print( event.phase, event.keyName )

   if ( ("Delete" == keyName or "back" == keyName or "deleteBack" == keyName) and phase == "up" ) then
   print("Current Scene :: "..composer.getSceneName("current"))
      if composer.getSceneName("current") == "sosHelplines" then
      	 print("sosHelplines to home")
        composer.gotoScene("home")
      elseif composer.getSceneName("current") == "distressMessage" then
      	 print("distressMessage to home")
        composer.gotoScene("home")
      elseif composer.getSceneName("current") == "gps" then
      	 print("gps to home")
        composer.gotoScene("home")
      elseif composer.getSceneName("current") == "safetyTips" then
      	 print("safetyTips to home")
        composer.gotoScene("home")
      elseif composer.getSceneName("current") == "preSlideView" then
      	 print("slideView to safetyTips")
        composer.gotoScene("safetyTips")
      elseif composer.getSceneName("current") == "moreTips" then
      	 print("moreTips to safetyTips")
        composer.gotoScene("safetyTips")
      elseif composer.getSceneName("current") == "falseAlarm" then
      	 print("falseAlarm to home")
        composer.gotoScene("home")
      elseif composer.getSceneName("current") == "home" then
        print("Exiting from application.")
        native.requestExit()
      end
      return true
    end
  return false
end
Runtime:addEventListener( "key", onKeyEvent )

composer.gotoScene( "home" )


