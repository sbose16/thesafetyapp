print("Made it to falseAlarm.lua")

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local img
local background
local homeBtn
local alarmButton
local alarmText
local soundID
local typeofDevice
local count = 0


 function scene:createScene( event )
 end
 
 function scene:enterScene( event )
 end
 
 function scene:show( event )
 	local homeGroup =  display.newGroup()
	local phase = event.phase
   
    if phase == "will" then
	
	elseif phase == "did" then
		display.setStatusBar( display.HiddenStatusBar )
		typeofDevice = system.getInfo("environment")
	
		background = display.newImage("homepage.png")	
		homeGroup:insert(background)

		homeBtn = display.newImage("home.png", 40 , 40 )
		homeBtn.alpha = 0.4
		homeGroup:insert(homeBtn)
		
		if typeofDevice == "simulator" then
			print("MP3")
			soundID = "siren.mp3" 	
		else
			if system.getInfo("platformName") == "Android" then
				print("Android")
				soundID = "siren.mp3"
			elseif system.getInfo("platformName") == "iPhone OS" then
				print("iPhone")
				soundID = "siren_caf.caf" 
			else
				print("Not suppoeted on device")
			end
		end

		local function handleButtonEvent( event )
			if ( "began" == event.phase ) then	
				count = count+1
			end
			print("count = "..count)
		    if ( "began" == event.phase ) then
		        print( "Button was pressed and released" )
		        if(math.mod(count,2) ~= 0) then
		        	print("Play")
		        	media.playSound(soundID)	
		        else
		        	print("Stop")
		        	media.stopSound()	        
		        end
		    end
		end
		
		alarmText = display.newText("Click this button to set off an alarm.\nThis will alert the people around you.",300, 200, native.systemFontBold, 32 )
		alarmText:setFillColor(0,0,1)
		homeGroup:insert(alarmText)
		
		alarmButton = widget.newButton
		{
		    label = "Click me",
		    onEvent = handleButtonEvent,
		    emboss = false,
		   	shape= "circle",
		    radius = 115,
		    fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
		    labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
		    fontSize = 50,
		}		
		alarmButton.x = display.contentCenterX
		alarmButton.y = display.contentCenterY + 100
		homeGroup:insert(alarmButton)
		
		function homeBtn:touch(e)
    		if e.phase == "ended" then
    			composer.gotoScene( "home" )
    			print("Home")
    			return true
    		end
 		end 
		homeBtn:addEventListener("touch")		
	end
end


 function scene:hide( event ) 
 	local phase = event.phase
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then	
 		display.remove(background)
 		display.remove(homeGroup)
 		display.remove(homeBtn)
		display.remove(alarmButton)
		display.remove(alarmText)
		soundID = nil
		display.remove(typeofDevice)
		count = 0
 	end              
 end 
 
 function scene:exitScene( event )
 end
 
 function scene:destroyScene( event )          
 end 
 
 scene:addEventListener( "createScene", scene )
 scene:addEventListener( "enterScene", scene )
 scene:addEventListener( "exitScene", scene )
 scene:addEventListener( "destroyScene", scene )
 scene:addEventListener( "touch", scene )
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "show", scene )
 return scene