print("made it to gps.lua")

local widget = require( "widget" )
local composer = require ("composer")
local scene = composer.newScene()
local homeGroup
local myMap

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
		homeGroup =  display.newGroup()
		
		local background = display.newImage("homepage.png")	
		homeGroup:insert(background)
					
		local homeBtn = display.newImage("home.png", 40, 55 )
		homeBtn.alpha = 0.4
		homeGroup:insert(homeBtn)

		function homeBtn:touch(e)
    		if e.phase == "ended" then
    			composer.gotoScene( "home" )
    			print("Home")
    			return true
    		end
 		end 
		homeBtn:addEventListener("touch")
		
		local helpText = display.newText("Enable location services to \nknow your present location !",300, 55, native.systemFontBold, 26)
		helpText:setFillColor(0,0,1)
		homeGroup:insert(helpText)
		
		local bkg1 = display.newRect(W/1.9, H-420, 440, 120)
		bkg1.alpha = 0.5
		homeGroup:insert(bkg1)

		local bkg2 = display.newRect(W/1.9, H-205, 440, 285)
		bkg2.alpha = 0.5
		homeGroup:insert(bkg2)
		
		myMap = native.newMapView( 0,0,1,1)
				
		local d = 0
		if globalNearestAddress ~= nil then
			for key,value in pairs(globalNearestAddress) do	
				print(key,value)
				local text = display.newText( key.." :: "..value, 300, 115+d, native.systemFontBold, 30 )
				text:setFillColor(0,0,1)
				d=d+35
				homeGroup:insert(text)
			end	
		end	
		
	local function locationHandler( event )		
		if event.isError then
			native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
			print( "Location error: " .. tostring( event.errorMessage ) )
		else
			local x = bkg2.x
			local y = 245
			if event.country ~= nil then
				local country = display.newText( "Country :: "..event.country, x, y, native.systemFontBold, 30 )
				country:setFillColor(0,0,1)
				homeGroup:insert(country)
				y = y+35
			end
			if event.region ~= nil then
				local state = display.newText( "State   :: "..event.region, x, y, native.systemFontBold, 30 )
				state:setFillColor(0,0,1)
				homeGroup:insert(state)
				y = y+35
			end	
			if event.regionDetail ~= nil then
				local stateDetail = display.newText( "Region  :: "..event.regionDetail, x, y, native.systemFontBold, 30 )
				stateDetail:setFillColor(0,0,1)
				homeGroup:insert(stateDetail)
				y = y+35
			end	
			if event.city ~= nil then
				local city = display.newText( "City    :: "..event.city, x, y, native.systemFontBold, 30 )
				city:setFillColor(0,0,1)
				homeGroup:insert(city)
				y = y+35
			end
			if event.cityDetail ~= nil then
				local cityDetail = display.newText( "Area    :: "..event.cityDetail, x, y, native.systemFontBold, 30 )
				cityDetail:setFillColor(0,0,1)
				homeGroup:insert(cityDetail)
				y = y+35
			end
			if event.street ~= nil then
				local street = display.newText( "Street  :: "..event.street, x, y, native.systemFontBold, 30 )
				street:setFillColor(0,0,1)
				homeGroup:insert(street)
				y = y+35
			end
			if event.streetDetail ~= nil then
				local streetDetail = display.newText( "Lane    :: "..event.streetDetail, x, y, native.systemFontBold, 30 )
				streetDetail:setFillColor(0,0,1)
				homeGroup:insert(streetDetail)
				y = y+35
			end
			if event.postalCode ~= nil then
				local postalCode = display.newText("Zip     :: "..event.postalCode, x, y, native.systemFontBold, 30 )
				postalCode:setFillColor(0,0,1)
				homeGroup:insert(postalCode)
				y = y+35
			end
		end
	end	
		
	if(myMap ~= nil and globalNearestAddress["Latitude"] ~= nil and globalNearestAddress["Longitude"]  ~= nil) then
		myMap:nearestAddress( globalNearestAddress["Latitude"], globalNearestAddress["Longitude"], locationHandler )
	end			
	Runtime:addEventListener( "location", locationHandler )	
		
		local buttonBkg = display.newImage("buttonRust.png", 300 , 537 )
		buttonBkg.alpha = 0.9
		homeGroup:insert(buttonBkg)
		
		local buttonText = display.newText("Show on map", buttonBkg.x, buttonBkg.y, "Helvetica Neue", 27)
		homeGroup:insert(buttonText)
		
		function buttonBkg:touch(e)		
			if ( e.phase == "ended" ) then
				if (globalMapURL ~= nil) then
					print("Going to your GPS location in google maps.")
					system.openURL( globalMapURL )
				else
					native.showAlert( "GPS Location Error")
					print( "Location error")
				end
				return true
			end
		end
		buttonBkg:addEventListener("touch")	
end  
end
 
 function scene:hide( event ) 	
 	local sceneGroup = self.view
	--local phase = event.phase
	local phase = event.phase
    -- local group = self.view
    if phase == "will" then
    	if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		print("hiding")
		display:remove(homeBtn)
		display:remove(buttonBkg)
		display:remove(buttonText)
		display:remove(background)
		display:remove(helpText)
		display:remove(text)
		display:remove(postalCode)
		display:remove(city)
		display:remove(state)
		display:remove(country)
		display:remove(region)
		display:remove(area)
		display:remove(lane)
		display:remove(street)
		display:remove(homeGroup)
		if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end
	end
 end
 
 function scene:exitScene( event ) 
 local sceneGroup = self.view
	--local phase = event.phase
	local phase = event.phase
    -- local group = self.view
    if phase == "will" then
    	if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then 
 	if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end   
	end
 end
 
 function scene:destroyScene( event ) 
 local sceneGroup = self.view
	--local phase = event.phase
	local phase = event.phase
    -- local group = self.view
    if phase == "will" then
    	if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then    
 	if myMap ~= nil then
			myMap:removeSelf()
			myMap = nil
		end 
	end                
 end
 
 scene:addEventListener( "createScene", scene )
 scene:addEventListener( "enterScene", scene )
 scene:addEventListener( "exitScene", scene )
 scene:addEventListener( "destroyScene", scene )
 scene:addEventListener( "touch", scene )
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "show", scene )
 return scene
 