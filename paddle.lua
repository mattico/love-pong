Paddle = class('Paddle')

function Paddle:initialize(side)
	self.speed = 400
	self.width = 25
	self.height = 125
	self.side = side

	self.y = height / 2 - self.height / 2

	if side == 'left' then
		self.x = 40
        self.downKey = 's'
        self.upKey = 'w'
	elseif side == 'right' then
		self.x = width - 40 - self.width
        self.downKey = 'down'
        self.upKey = 'up'
	end
end

function Paddle:draw()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
	if love.keyboard.isDown(self.upKey) and self.y > 0 then
		self.y = self.y - dt * self.speed
	elseif love.keyboard.isDown(self.downKey) and self.y < height - self.height then
		self.y = self.y + dt * self.speed
	end
end