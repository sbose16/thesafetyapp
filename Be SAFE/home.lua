print("Made it to home.lua")

W, H= display.contentWidth, display.contentHeight
display.setStatusBar( display.DefaultStatusBar )

local composer = require ("composer")
local scene = composer.newScene()
local background
local helpLineTextBackground
local safetyTipsBackground
local distressMessagesBackground
local safetyTipsText
local helpLineText
local distressMessageText
local homeGroup1
local img
local gpsBackground
local gpstext
local falseAlarmBackground
local falseAlarm
local helpText
local rateThisApp
local rateThisAppBackground
local currentLatitude = 0
local currentLongitude = 0
local latitudeText = "NA"
local longitudeText = "NA"
local altitudeText = "NA"


 function scene:createScene( event )
 end
 
 function scene:enterScene( event )
 end
  
 function scene:show( event )
 local phase = event.phase
    -- local group = self.view
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then    		     
		 homeGroup1 =  display.newGroup()
		 background = display.newImage("homepage.png")
		 homeGroup1:insert(background)
		 
		 helpText = display.newText("Please enable location services and\nrelaunch the app for optimum usage!",277, 55, native.systemFontBold, 26)
		 helpText:setFillColor(0,0,1)
		 homeGroup1:insert(helpText)
		 
		 img = display.newImage("helpinghand.png", 283 , 185 )
		
		 helpLineTextBackground = display.newRect(W/2, H-130, 445, 35)
		 helpLineTextBackground.alpha = 0.5
		 
		 safetyTipsBackground = display.newRect(W/2, H-90, 445, 34)
		 safetyTipsBackground.alpha = 0.5
		 
		 distressMessagesBackground = display.newRect(W/2, H-250, 445, 35)
		 distressMessagesBackground.alpha = 0.5
		 
		 gpsBackground = display.newRect(W/2, H-170, 445, 35)
		 gpsBackground.alpha = 0.5
		 
		 falseAlarmBackground = display.newRect(W/2, H-210, 445, 35)
		 falseAlarmBackground.alpha = 0.5

		 rateThisAppBackground = display.newRect(W/2, H-50, 445, 35)
		 rateThisAppBackground.alpha = 0.5
		 
		 safetyTipsText = display.newText("Safety Tips ", safetyTipsBackground.x, safetyTipsBackground.y, "Helvetica Neue", 40)
		 safetyTipsText:setFillColor(0,0,1)	
		 
		 helpLineText = display.newText("SOS Help Lines ", helpLineTextBackground.x, helpLineTextBackground.y, "Helvetica Neue", 40)
		 helpLineText:setFillColor(0,0,1)	
		 
		 distressMessageText = display.newText("Distress Message ", distressMessagesBackground.x, distressMessagesBackground.y, "Helvetica Neue", 40)
		 distressMessageText:setFillColor(0,0,1)
		 
		 gpstext = display.newText("My Present Location", gpsBackground.x, gpsBackground.y, "Helvetica Neue", 40)
		 gpstext:setFillColor(0,0,1)

		 falseAlarm = display.newText("The Panic Button", falseAlarmBackground.x, falseAlarmBackground.y, "Helvetica Neue", 40)
		 falseAlarm:setFillColor(0,0,1)
		 
		 rateThisApp = display.newText("Rate this App", rateThisAppBackground.x, rateThisAppBackground.y, "Helvetica Neue", 40)
		 rateThisApp:setFillColor(0,0,1)
		 
		 homeGroup1:insert(img)
		 homeGroup1:insert(safetyTipsBackground)
		 homeGroup1:insert(safetyTipsText)
		 homeGroup1:insert(helpLineTextBackground)
		 homeGroup1:insert(helpLineText)
		 homeGroup1:insert(distressMessagesBackground)
		 homeGroup1:insert(distressMessageText)
		 homeGroup1:insert(gpsBackground)
		 homeGroup1:insert(gpstext)		 
		 homeGroup1:insert(falseAlarmBackground)
		 homeGroup1:insert(falseAlarm)
		 homeGroup1:insert(rateThisAppBackground)
		 homeGroup1:insert(rateThisApp)
		
		
		function gpsBackground:touch(e)		
			if ( e.phase == "ended" ) then
				print("Going to your GPS location.")
				composer.gotoScene("gps")
				return true
			end
		end
		gpsBackground:addEventListener("touch")
		
		function falseAlarmBackground:touch(e)		
			if ( e.phase == "ended" ) then
				print("Going to false alarm.")
				composer.gotoScene("falseAlarm")
				return true
			end
		end
		falseAlarmBackground:addEventListener("touch")
		 
		function safetyTipsBackground:touch(e)		
			if ( e.phase == "ended" ) then
				print("Going to Safety tips.")
				composer.gotoScene("safetyTips")
				return true
			end
		end
		safetyTipsBackground:addEventListener("touch")
			
		 function distressMessagesBackground:touch(e)		
			if ( e.phase == "ended" ) then
				print("Going to Distress Messages.")
				composer.gotoScene("distressMessage")
				return true
			end
		end
		distressMessagesBackground:addEventListener("touch")
		
		 function helpLineTextBackground:touch(e)		
			if ( e.phase == "ended" ) then
				print("Going to SOS Helplines.")
				composer.gotoScene("sosHelplines")
				return true
			end
		end
		helpLineTextBackground:addEventListener("touch")
		
			local locationHandler = function( event )
				
			-- Check for error (user may have turned off Location Services)
				if event.errorCode then
					native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
					print( "Location error: " .. tostring( event.errorMessage ) )
				else
					print ("Home->GPS")
					latitudeText = string.format( '%.4f', event.latitude )
					currentLatitude = latitudeText
									
					longitudeText = string.format( '%.4f', event.longitude )
					currentLongitude = longitudeText				
					
					altitudeText = string.format( '%.4f', event.altitude )		
					
					globalNearestAddress = {}
					globalNearestAddress["Latitude"] = currentLatitude
					globalNearestAddress["Longitude"] = currentLongitude
					globalNearestAddress["Altitude"] = altitudeText									
									
					globalMapURL = "http://maps.google.com/maps?" .. currentLatitude .. "," .. currentLongitude
					print("Google Map URL below:")
					print(globalMapURL)					
				end
			end	
		-- Activate location listener
		Runtime:addEventListener( "location", locationHandler )
	end		     
 end 
 function scene:hide( event ) 	
 	local sceneGroup = self.view
	--local phase = event.phase
	local phase = event.phase
    -- local group = self.view
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		print("hiding")
		display.remove(background)
	 	display.remove(safetyTipsBackground)
	 	display.remove(homeGroup1)
		display.remove(distressMessagesBackground)
		display.remove(safetyTipsText)
		display.remove(helpLineText)
		display.remove(distressMessageText)
		display.remove(helpLineTextBackground)
		display:remove(gpstext)		 
		display:remove(gpsBackground)		 
		display:remove(falseAlarm)
		display:remove(helpText)
		display:remove(falseAlarmBackground)
		display:remove(rateThisAppBackground)
		display:remove(rateThisApp)
		Runtime:removeEventListener( "location", locationHandler )
		rateThisAppBackground.alpha = 0
		falseAlarmBackground.alpha = 0
		gpsBackground.alpha = 0
	 	helpLineTextBackground.alpha = 0
	 	safetyTipsBackground.alpha = 0
	 	distressMessagesBackground.alpha = 0           
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
 