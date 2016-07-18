Ball = class('Ball')

function Ball:initialize()
    self.speed = 300
    self.velocity = { x = 0, y = 0 }
    self.width = 20
    self.height = self.width

    self.x = width / 2 - self.width / 2
    self.y = height / 2 - self.height / 2
end

function Ball:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Ball:update(dt)
    self.x = self.x + self.velocity.x * dt
    self.y = self.y + self.velocity.y * dt

    local leftScore = entities.leftScore
    local rightScore = entities.rightScore

    if self.x + self.width < 0 or self.x - self.width > width then
        if self.x + self.width < 0 then
            leftScore.score = leftScore.score + 1
        else
            rightScore.score = rightScore.score + 1
        end
        gameState = 'center'
        self:initialize()
        entities.leftPaddle:initialize()
        entities.rightPaddle:initialize()
        return
    end

    if self.y <= self.height / 2 or self.y >= height - self.height / 2 then
        self.velocity.y = -self.velocity.y
        return
    end

    self:hitPaddle(entities.leftPaddle)
    self:hitPaddle(entities.rightPaddle)
end

function Ball:hitPaddle(paddle)
    if not CheckEntityCollision(self, paddle) then
        return
    end

    self.velocity.x = -self.velocity.x
    if love.keyboard.isDown(paddle.upKey) then
        self.velocity.y = -self.speed
    elseif love.keyboard.isDown(paddle.downKey) then
        self.velocity.y = self.speed
    else 
        if math.random(0,1) == 0 then
            self.velocity.y = -self.speed
        else
            self.velocity.y = self.speed
        end
    end
end

function Ball:start()
    if math.random(0,1) == 0 then
        self.velocity.x = self.speed
    else
        self.velocity.x = -self.speed
    end
end