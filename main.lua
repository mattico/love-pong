class = require 'lib/middleclass'

require 'paddle'

function love.load(arg)
	leftPaddle = Paddle:new("left")
	rightPaddle = Paddle:new("right")
end

function love.update(dt)
	if love.keyboard.isDown("down") then
		rightPaddle:update("down", dt)
	elseif love.keyboard.isDown("up") then
		rightPaddle:update("up", dt)
	end

	if love.keyboard.isDown("w") then
		leftPaddle:update("up", dt)
	elseif love.keyboard.isDown("s") then
		leftPaddle:update("down", dt)
	end
end

function love.draw()
    rightPaddle:draw()
    leftPaddle:draw()
end