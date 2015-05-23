print("Made it to sosHelplines.lua")
 
local composer = require( "composer" )
local scene = composer.newScene()
local sosPhn_bkg
local hospitalPhn_bkg
local universityHelpLine_bkg
local womenHelpline_bkg
local sosPhn
local hospitalPhn
local universityHelpLine
local womenHelpline
local img


function scene:createScene( event )
 end
 
function scene:enterScene( event ) 
 end
 
 function scene:show( event )
 	local homeGroup =  display.newGroup()
	local phase = event.phase
   
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then		
 		display.setStatusBar( display.HiddenStatusBar ) 
		local background = display.newImage("homepage.png")
		homeGroup:insert(background)

		local homeBtn = display.newImage("home.png", 40 , 40 )
		homeBtn.alpha = 0.4
		
		img = display.newImage("call.png", 280 , 140 )

		homeGroup:insert(homeBtn)
		homeGroup:insert(img)
		
		womenHelpline_bkg = display.newRect(W/2, H-230, 445, 35)
		womenHelpline_bkg.alpha = 0.5
		
		sosPhn_bkg = display.newRect(W/2, H/1.5, 445, 35)
		sosPhn_bkg.alpha = 0.5
		 
		hospitalPhn_bkg = display.newRect(W/2, H-150, 445, 35)
		hospitalPhn_bkg.alpha = 0.5
		 
		womenHelpline = display.newText("Women Helpline", womenHelpline_bkg.x, womenHelpline_bkg.y, "Helvetica Neue", 40)
		womenHelpline:setFillColor(0,0,1)	
		
		sosPhn = display.newText("Emergency (911)", sosPhn_bkg.x, sosPhn_bkg.y, "Helvetica Neue", 40)
		sosPhn:setFillColor(0,0,1)
		
		hospitalPhn = display.newText("My Emergency Contact", hospitalPhn_bkg.x, hospitalPhn_bkg.y, "Helvetica Neue", 40)
		hospitalPhn:setFillColor(0,0,1)

		homeGroup:insert(womenHelpline_bkg)
		homeGroup:insert(womenHelpline)
		homeGroup:insert(sosPhn_bkg)
		homeGroup:insert(sosPhn)		
		homeGroup:insert(hospitalPhn_bkg)
		homeGroup:insert(hospitalPhn)				

		function womenHelpline_bkg:touch(e)
    		if e.phase == "ended" then
    			system.openURL( "tel:2016829255" )
    			print("Women Helpline")
    		end
 		end 
		womenHelpline_bkg:addEventListener("touch")
		
		function sosPhn_bkg:touch(e)
    		if e.phase == "ended" then
    			system.openURL( "tel:911" )
    			print("sos")
    			return true
    		end
 		end 
		sosPhn_bkg:addEventListener("touch")
		
		function hospitalPhn_bkg:touch(e)
    		if e.phase == "ended" then
    			system.openURL( "tel:2016829255" )
    			print("Hospital")
    			return true
    		end
 		end 
		hospitalPhn_bkg:addEventListener("touch")
		
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
 	
 	local sceneGroup = self.view
	--local phase = event.phase
	local phase = event.phase
    -- local group = self.view
    if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		print("hiding")
		display.remove(background)
	 	display.remove(homeGroup)	 	
		--display.remove(homeBkg)
		display.remove(homeBtn)
		display.remove(img)
		display.remove(hospitalPhn_bkg)
		display.remove(hospitalPhn)
		display.remove(sosPhn_bkg)
		display.remove(sosPhn)
		display.remove(womenHelpline_bkg)
		display.remove(womenHelpline)
	 	womenHelpline_bkg.alpha = 0
	 	hospitalPhn_bkg.alpha = 0   
	 	sosPhn_bkg.alpha = 0        
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