print("Made it to moreTips.lua")

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local scrollView

 function scene:createScene( event )
 end
 
 function scene:enterScene( event )
 end
 
 function scene:show( event )
	local phase = event.phase
   
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		display.setStatusBar( display.HiddenStatusBar )
		local function scrollListener( event )
			local phase = event.phase
			local direction = event.direction
			
			if "began" == phase then
				--print( "Began" )
			elseif "moved" == phase then
				--print( "Moved" )
			elseif "ended" == phase then
				--print( "Ended" )
			end
			
			-- If the scrollView has reached it's scroll limit
			if event.limitReached then
				if "up" == direction then
					print( "Reached Top Limit" )
				elseif "down" == direction then
					print( "Reached Bottom Limit" )
				elseif "left" == direction then
					print( "Reached Left Limit" )
				elseif "right" == direction then
					print( "Reached Right Limit" )
				end
			end
					
			return true
		end
		
		-- Create a ScrollView
		scrollView = widget.newScrollView
		{
			left = 0,
			top = 0,
			width = display.contentWidth,
			height = display.contentHeight,
			bottomPadding = 50,
			id = "onBottom",
			backgroundColor = { 0,0,1 },
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener,
		}
		
		local txt0 = "You MUST know where you are & what's going on around you. Keep your head up, swing your arms, stand straight up.DON'T walk alone in an alley, or drive in a bad neighborhood at night."
		local txt1 = "Women have a tendency to get into their cars after shopping, eating, working, etc.,and just sit(doing their checkbook, or making a list, etc.)DON'T DO THIS!The predator might be watching you."
		local txt2 = "ALWAYS take the elevator instead of the stairs.Stairwells are the perfect crime spot.Do not stand back in the corners of the elevator.Be near the front, by the doors, ready to get off or on"
		local txt3 = "As women, we are always trying to be sympathetic:STOP IT! It may get you raped, or killed. The predator might walk with a cane and ask for help into his vehicle,which is when he plans to abduct."
		local txt4 = "If the predator abducts you in a parking lot,and is taking you to an abandoned area,DON'T LET HIM GET YOU TO THAT AREA.If you are driving,react immediately and,crash your car."
		local txt5 = "If he's driving, find the right time, and stick your fingers in his eyes. He must watch the road, so choose an unsuspecting time, and gouge him. It is your ONLY defense. While he is in shock, GET OUT."
		local txt6 = "Physical defenses that we can use against the violent predator:The EYES are the most vulnerable part of the body.Poke him HARD.It may be your only window of opportunity."	
		
		local textBkg0 = display.newRect(W/2, H-80, 535, 87)
		textBkg0.alpha = 0.5
		local text0 = display.newText( txt4, textBkg0.x, textBkg0.y, W-70, 70, native.systemFont, 24)
		
		local textBkg1 = display.newRect(W/2, H-180, 535, 87)
		textBkg1.alpha = 0.3		
		local text1 = display.newText( txt3, textBkg1.x, textBkg1.y, W-70, 87, native.systemFont, 24)
		
		local textBkg2 = display.newRect(W/2, H-280, 535, 87)
		textBkg2.alpha = 0.5	
		local text2 = display.newText( txt2, textBkg2.x, textBkg2.y, W-70, 85, native.systemFont, 24)
				
		local textBkg3 = display.newRect(W/2, H-380, 535, 87)
		textBkg3.alpha = 0.3		
		local text3 = display.newText( txt1 , textBkg3.x, textBkg3.y, W-70, 90, native.systemFont, 24)
				
		local textBkg4 = display.newRect(W/2, H-480, 535, 87)
		textBkg4.alpha = 0.5		
		local text4 = display.newText( txt0, textBkg4.x, textBkg4.y, W-70, 80, native.systemFont, 24)
		
		local textBkg5 = display.newRect(W/2, H+20, 535, 87)
		textBkg5.alpha = 0.3		
		local text5 = display.newText( txt5, textBkg5.x, textBkg5.y, W-70, H-485, native.systemFont, 24)
				
		local textBkg6 = display.newRect(W/2, H+120, 535, 87)
		textBkg6.alpha = 0.5		
		local text6 = display.newText( txt6, textBkg6.x, textBkg6.y, W-70, H-495, native.systemFont, 24)
		
		scrollView:insert( textBkg0 )
		scrollView:insert( textBkg1 )
		scrollView:insert( textBkg2 )
		scrollView:insert( textBkg3 )
		scrollView:insert( textBkg4 )
		scrollView:insert( textBkg5 )
		scrollView:insert( textBkg6 )
		scrollView:insert( text0 )
		scrollView:insert( text1 )
		scrollView:insert( text2 )
		scrollView:insert( text3 )
		scrollView:insert( text4 )
		scrollView:insert( text5 )
		scrollView:insert( text6 )			
	end
end


 function scene:hide( event ) 
 	local phase = event.phase
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then	
 		display.remove(textBkg6)
 		display.remove(textBkg5)
 		display.remove(textBkg4)
		display.remove(textBkg3)
		display.remove(textBkg2)
		display.remove(textBkg1)
		display.remove(textBkg0)
		display.remove(text6)
 		display.remove(text5)
 		display.remove(text4)
		display.remove(text3)
		display.remove(text2)
		display.remove(text1)
		display.remove(text0)
		display.remove(txt0)
		display.remove(txt1)
		display.remove(txt2)
		display.remove(txt3)
		display.remove(txt4)
		display.remove(txt5)
		display.remove(txt6)
		display.remove(scrollView) 	
		scrollView = nil
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
 scene:addEventListener( "hide", scene )
 scene:addEventListener( "show", scene )
 return scene
		
		