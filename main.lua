class = require 'lib/middleclass'
require "lib/lovedebug"

require 'paddle'
require 'score'
require 'ball'

-- _DebugSettings.LiveAuto = true

function love.load(arg)
	math.randomseed(os.time())

	entities = {}
	gameState = 'center'

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