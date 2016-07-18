Paddle = class('Paddle')

function Paddle:initialize(side)
	self.speed = 400
	self.width = 25
	self.height = 125
	self.side = side

	width, height = love.graphics.getDimensions()

	self.y = height / 2 - self.height / 2

	if side == "left" then
		self.x = 40
	elseif side == "right" then
		self.x = width - 40 - self.width
	end
end

function Paddle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(direction, dt)
	width, height = love.graphics.getDimensions()
	if side == "left" then
		self.x = width / 6
	elseif side == "right" then
		self.x = width - (width / 6)
	end

	if direction == "up" and self.y > 0 then
		self.y = self.y - dt * self.speed
	elseif direction == "down" and self.y < height - self.height then
		self.y = self.y + dt * self.speed
	end
end