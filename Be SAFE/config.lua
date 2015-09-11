-- config.lua

application =
{
	content =
	{
		width = 570 ,
		height = 570,
		scale = "adaptive",
		xAlign = "center",
        yAlign = "center",
        fps = 100,

        
        imageSuffix =
        {
           -- ["@2x"] = 3
            --high-resolution devices (Retina iPad, Kindle Fire HD 9", Nexus 10, etc.) will use @2x-suffixed images
            --devices less than 1200 pixels in width (iPhone 5, iPad 2, Kindle Fire 7", etc.) will use non-suffixed images
        }
	}
}