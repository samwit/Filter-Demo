--
-- Abstract: Fishies sample app
--
-- Date: September 10, 2010
--
-- Version: 1.1
--
-- File name: main.lua
--
-- Author: Corona Labs
--
-- Demonstrates: graphics, orientation, object touch
--
-- File dependencies: none
--
-- Target devices: Currently Simulator Only
--
-- Limitations:
--
-- Comments: 
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
---------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local font = (platform ~= "Android") and "MarkerFelt-Wide" or system.nativeFont;
-- Show entire list of effects
-- local t = graphics.listEffects( "filter" )

-- print( 'listEffects', t, type(t) )
-- for k,v in pairs( t ) do
-- 	print( k, v )
-- end

local group = display.newGroup()
local w,h = 320,320
local x,y = w/2, h/2

local effectNumber = 1

local effects = {
	{	
		filterNumber = 1,
		name = "filter.blur",
		low = -1,
		high = 4,
		increment = 0.05
	},
	{	
		filterNumber = 2,
		name = "filter.brightness",
		params = {
			intensity = 0.0,
		},	
		low = -1,
		high = 1,
		increment = 0.01	 
	},
	{
		filterNumber = 3,
		name = "filter.bulge",
		params = {
			intensity = 0.5,
		},	
		low = -1,
		high = 4,
		increment = 0.02 
	},
	{
		filterNumber = 4,
		name = "filter.chromaKey", 
		params = {
			sensitivity = 0.01,
			smoothing = 0.01,
			color = 1
		},
		low = 0,
		high = 0.5,
		increment = 0.002
	},
	{
		filterNumber = 5,
		name = "filter.contrast", 
		params = {
			contrast = 0.01,
		},
		low = 0,
		high = 1,
		increment = 0.02
	},
	{
		filterNumber = 6,
		name = "filter.dispersion", 
		params = {
			intensity = 0.01,
		},
		low = -1,
		high = 4,
		increment = 0.05
	},
	-- {
	-- 	filterNumber = 7,
	-- 	name = "filter.disolve", 
	-- 	params = {
	-- 		threshold = 0.1,
	-- 	},
	-- 	low = 0,
	-- 	high = 1,
	-- 	increment = 0.01
	-- },
	-- {
	-- 	filterNumber = 8,
	-- 	name = "filter.duotone", 
	-- 	params = {
	-- 		darkColor = 1,
	-- 		lightColor = 1
	-- 	},
	-- 	low = -1,
	-- 	high = 4,
	-- 	increment = 0.05
	-- },
	{
		filterNumber = 9,
		name = "filter.emboss", 
		params = {
			intensity = 1,
		},
		low = 0,
		high = 4,
		increment = 0.05
	},
	{
		filterNumber = 10,
		name = "filter.exposure", 
		params = {
			exsposure = 0.01,
		},
		low = -10,
		high = 10,
		increment = 0.1
	},
	-- {
	-- 	filterNumber = 11,
	-- 	name = "filter.greyscale", 
	-- 	-- params = {},
	-- 	low = -1,
	-- 	high = 4,
	-- 	increment = 0.05
		
	-- },

	{
		filterNumber = 12,
		name = "filter.hue", 
		params = {
			angle = 0,
		},
		low = 0,
		high = 360,
		increment = 1
	},
	{
		filterNumber = 13,
		name = "filter.invert", 
		params = {
		},
		low = -1,
		high = 4,
		increment = 0.05
	},
	{
		filterNumber = 14,
		name = "filter.iris", 
		params = {
			aperture = 0,
			aspectRatio = 0,
			smoothness = 0 
		},
		low = -1,
		high = 4,
		increment = 0.05
	},
	{
		filterNumber = 15,
		name = "filter.linearGradient", 
		params = {
			color1 = 0.01,
			position1 = 0.01,
			color2 = 0.01,
			position2 = 1
		},
		low = -1,
		high = 2,
		increment = 0.05
	},
	{
		filterNumber = 16,
		name = "filter.linearWipe", 
		params = {
			smoothness = 1,
			progress = 1
		},
		low = 0,
		high = 1,
		increment = 0.02
	},
	{
		filterNumber = 17,
		name = "filter.median", 
		params = {},
		low = -1,
		high = 3,
		increment = 0.05
	},
	{
		filterNumber = 18,
		name = "filter.monotone", 
		params = {
			r = 0,
			g = 0,
			b = 1,
			a = 1,
		},
		low = -1,
		high = 2,
		increment = 0.02
	},
	{
		filterNumber = 19,
		name = "filter.pixelate", 
		params = {
			numPixels = 20,
		},
		low = -1,
		high = 50,
		increment = 0.1
	},
	{
		filterNumber = 20,
		name = "filter.radialWipe", 
		params = {
			progress = 0,
		},
		low = -1,
		high = 1,
		increment = 0.01
	},
	{
		filterNumber = 21,
		name = "filter.random", 
		low = -1,
		high = 4,
		increment = 0.05
	},
	{
		filterNumber = 22,
		name = "filter.saturate", 
		params = {
			saturation = 0,
		},
		low = -1,
		high = 4,
		increment = 0.02
	},
	{
		filterNumber = 23,
		name = "filter.saturation", 
		params = {
			saturation = 0,
		},
		low = 0,
		high = 2,
		increment = 0.05
	},
	{
		filterNumber = 24,
		name = "filter.sepia", 
		params = {
			intensity = 0,
		},
		low = -1,
		high = 4,
		increment = 0.02
	},
	{
		filterNumber = 25,
		name = "filter.sharpenLuminance", 
		params = {
			sharpness = 0,
		},
		low = -1,
		high = 3,
		increment = 0.05
	},
	{
		filterNumber = 26,
		name = "filter.sobel", 
		params = {
		},
		low = -1,
		high = 2,
		increment = 0.05
	},
	{
		filterNumber = 27,
		name = "filter.swirl", 
		params = {
			intensity = 1,
		},
		low = -1,
		high = 4,
		increment = 0.05
	},
	{
		filterNumber = 28,
		name = "filter.vignette", 
		params = {
			radius = 0.1,
		},
		low = -1,
		high = 1.5,
		increment = 0.02
	},
	{
		filterNumber = 29,
		name = "filter.wobble", 
		params = {
			amplitude = 10,
		},
		low = -5,
		high = 50,
		increment = 0.2
	},
	{
		filterNumber = 30,
		name = "filter.woodCut", 
		params = {
			intensity = 0,
		},
		low = -1,
		high = 2,
		increment = 0.01
	},
	{
		filterNumber = 31,
		name = "filter.zoomBlur", 
		params = {
			intensity = 0.01,
		},
		low = -1,
		high = 10,
		increment = 0.02
	},
	
	
	
	
	
}

local function setEffect( effect, filter, t )
	local params = filter.params
	if params then
		for k,v in pairs( filter.params ) do
			effect[k] = t --v * t
			-- print(t)
		end
	end
end

-- Some filter effects are time based (e.g. swirl),
-- so force Corona to re-blit them.
display.setDrawMode( "forceUpdate" )

local amount = 0.00
local goingUp = true

local image = display.newImageRect( "aquariumbackgroundIPhone.jpg", w, h )
image.x = 150
image.y = 150
group:insert( image )
-- image:translate( x + w*(1), y + h*(1) )



local filterText = display.newText("Filter Name", 100, 350, font, 24)


local function changeIntensity()
	if amount < effects[effectNumber].high and goingUp == true then
	amount = amount + effects[effectNumber].increment
		print(amount)
	elseif amount >= effects[effectNumber].high then goingUp = false amount = (effects[effectNumber].high-0.01)
	elseif amount < effects[effectNumber].low then goingUp = true amount = (effects[effectNumber].low+0.01) print('filter changed to '..effects[effectNumber].name) effectNumber = effectNumber +1 if effectNumber>#effects then effectNumber =1 end 
	else
	amount = amount - effects[effectNumber].increment
	print(amount)
	end
	local filter = effects[effectNumber]
	image.fill.effect = filter.name
	filterText.text = effects[effectNumber].filterNumber.." "..filter.name
	filterText.x = halfW
	setEffect( image.fill.effect, filter, amount )
end
Runtime:addEventListener("enterFrame", changeIntensity)
