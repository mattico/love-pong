class = require 'lib/middleclass'
require "lib/lovedebug"

require 'paddle'
require 'score'
require 'ball'
require 'util'

-- _DebugSettings.LiveAuto = true

entities = {}
gameState = 'center'

function love.load(arg)
  	--if arg[#arg] == "-debug" then require("mobdebug").start() end
  
	math.randomseed(os.time())

	width, height = love.graphics.getDimensions()

	entities.leftPaddle = Paddle:new('left')
	entities.rightPaddle = Paddle:new('right')
	entities.leftScore = Score:new('left')
	entities.rightScore = Score:new('right')
	entities.ball = Ball:new()
end

function love.update(dt)
	if gameState == 'center' and love.keyboard.isDown('return') then
		gameState = 'moving'
		entities.ball:start()
	end

	for _,v in pairs(entities) do
		v:update(dt)
	end
end

function love.draw()
	for _,v in pairs(entities) do
		v:draw()
	end
end