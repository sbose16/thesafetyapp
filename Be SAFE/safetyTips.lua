print("Made it to safetyTips.lua")

local composer = require ("composer")
local scene = composer.newScene()
local background
local homeGroup
local slideViewText
local slideViewBackground
local pinchnZoomText
local pinchnZoomBackground
--local homeBkg
local homeBtn
local img
 
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
		 display.setStatusBar( display.HiddenStatusBar )  
		 homeGroup =  display.newGroup()
		 background = display.newImage("homepage.png")
		 homeGroup:insert(background)
		 
		 img = display.newImage("tips.png", 280 , 205 )
		 
		 slideViewBackground = display.newRect(W/2, H-165, 445, 35)
		 slideViewBackground.alpha = 0.5
		 
		 pinchnZoomBackground = display.newRect(W/2, H-120, 445, 35)
		 pinchnZoomBackground.alpha = 0.5
		 
		 pinchnZoomText = display.newText("More tips ", pinchnZoomBackground.x, pinchnZoomBackground.y, "Helvetica Neue", 40)
		 pinchnZoomText:setFillColor(0,0,1)	
		 
		 slideViewText = display.newText("Prime safety tips", slideViewBackground.x, slideViewBackground.y, "Helvetica Neue", 40)
		 slideViewText:setFillColor(0,0,1)		 
		
		 homeGroup:insert(slideViewBackground)
		 homeGroup:insert(slideViewText)
		 homeGroup:insert(pinchnZoomBackground)
		 homeGroup:insert(pinchnZoomText)
		 
		function pinchnZoomBackground:touch(e)		
			if ( e.phase == "ended" ) then
					print("Going to More Tips.")
					composer.gotoScene("moreTips")
					return true
				end
			end
			pinchnZoomBackground:addEventListener("touch")
			
		 function slideViewBackground:touch(e)		
			if ( e.phase == "ended" ) then
					print("Going to Slide View.")
					composer.gotoScene("preSlideView")
					return true
				end
			end
			slideViewBackground:addEventListener("touch")
			
		--homeBkg = display.newCircle( 50, 50, 40 )
		--homeBkg.alpha = 0.1

		homeBtn = display.newImage("home.png", 40 , 40 )
		homeBtn.alpha = 0.4

		homeGroup:insert(img)
		--homeGroup:insert(homeBkg)
		homeGroup:insert(homeBtn)

		function homeBtn:touch(event)
    		if event.phase == "ended" then
    			composer.gotoScene( "home" )
    			print("Going home")
    			return true
    		end
 		end 
		homeBtn:addEventListener("touch")
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
	 	display.remove(slideViewBackground)
	 	display.remove(homeGroup)
		display.remove(pinchnZoomText)
		display.remove(pinchnZoomBackground)
		display.remove(slideViewText)
		--display.remove(homeBkg)
		display.remove(homeBtn)
		--homeBkg.alpha = 0
		homeBtn.alpha = 0
	 	pinchnZoomBackground.alpha = 0
	 	slideViewBackground.alpha = 0           
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