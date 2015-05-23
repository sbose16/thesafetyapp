print("Made it to DistressMessage.lua")

local composer = require( "composer" )
local scene = composer.newScene()
local img
local message_bkg
local message
local mail_bkg
local mail
local background
local homeBtn
local mapTextMail = "<html><body><b>Please help.I am in trouble</b></body></html>!"
local mapTextMsg = "Please help.I am in trouble. "

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
		
		if globalMapURL ~= nil then
			mapTextMail = "<html><body><b>Please help.I am in trouble! Please track me <a href="..'"'..globalMapURL..'"'..">here</a></b></body></html>"	
			mapTextMsg = "Please help.I am in trouble!Please track me here. "..globalMapURL
			print (mapTextMail)	
			print("-----------------------")
			print(mapTextMsg)
		end
		
		background = display.newImage("homepage.png")	
		homeGroup:insert(background)
		
		homeBtn = display.newImage("home.png", 40 , 40 )
		homeBtn.alpha = 0.4

		homeGroup:insert(homeBtn)

		img = display.newImage("message.png", 280 , 140 )
		homeGroup:insert(img)
		
		message_bkg = display.newRect(W/2, H/1.5, 445, 35)
		message_bkg.alpha = 0.5
		 
		mail_bkg = display.newRect(W/2, H-145, 445, 35)
		mail_bkg.alpha = 0.5
		 
		message = display.newText("Send a text message", message_bkg.x, message_bkg.y, "Helvetica Neue", 40)
		message:setFillColor(0,0,1)	
		
		mail = display.newText("Send a mail", mail_bkg.x, mail_bkg.y, "Helvetica Neue", 40)
		mail:setFillColor(0,0,1)
		
		homeGroup:insert(mail_bkg)
		homeGroup:insert(mail)
		homeGroup:insert(message_bkg)
		homeGroup:insert(message)		


		
	function mail_bkg:touch(e)    		
    	if e.phase == "ended" then    			
    			print("Mailing")  
    			local options =
				{
				   to = { "bose.sonali.1609@gmail.com", "getBose16@gmail.com" },
				   cc = { "getBose16@gmail.com", "bose.sonali.1609@gmail.com" },
				   subject = "Test - Urgent!",
				   isBodyHtml = true,
				   body = mapTextMail,
				   
				}
				local result = native.showPopup("mail", options)
	
				if not result then
					print( "Mail Not supported/setup on this device" )
					native.showAlert( "Alert!",
					"Mail not supported/setup on this device.", { "OK" }
				);
				end
    	end
 	end 
	mail_bkg:addEventListener("touch")

		function message_bkg:touch(e)
    		if e.phase == "ended" then
    			print("Messaging")
    			local options =
				{
					to = { "2016829255", "2016829255" },
					body = mapTextMsg,
				}
				native.showPopup("sms", options)    			
    			return true
    		end
 		end 
		message_bkg:addEventListener("touch")
		
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
 		--display.remove(homeBkg)
 		display.remove(homeGroup)
 		display.remove(homeBtn)
		display.remove(img)
		display.remove(mail_bkg)
		display.remove(mail)
		display.remove(message_bkg)
 		display.remove(message)
 		--homeBkg.alpha = 0
 		homeBtn.alpha = 0
 		mail_bkg.alpha = 0
 		message_bkg.alpha = 0
 	end
     --local group = self.view         
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