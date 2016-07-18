Score = class('Score')

function Score:initialize(side)
    local numberWidth = 40
    local numberHeight = 60
    local numberSpacing = 15
    self.side = side
    self.score = 0
    self.y = 30
    self.width = numberSpacing + 2 * numberWidth
    self.height = numberHeight
    if side == 'left' then
        self.x = width / 2 - numberSpacing - self.width
    else
        self.x = width / 2 + numberSpacing
    end
    self.leftNumber = Number:new(self.x, self.y, numberWidth, numberHeight, 0)
    self.rightNumber = Number:new(self.x + numberWidth + numberSpacing, self.y, numberWidth, numberHeight, 0)
end

function Score:draw()
    if self.score >= 0 and self.score <= 99 then
        local leftDigit = math.floor(self.score / 10)
        local rightDigit = self.score % 10
        self.leftNumber.number = leftDigit
        self.rightNumber.number = rightDigit
        self.leftNumber:draw()
        self.rightNumber:draw()
    else
        print('Score out of range: '..self.score)
    end
end

function Score:update(dt)
end

Number = class('Number')

function Number:initialize(x, y, width, height, number)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.number = number
end

function Number:draw()
    local rectangle = love.graphics.rectangle

    local widthIncr = self.width / 4
    local heightIncr = self.height / 6

    local numbers = {
        [0] = [[
            ####
            #  #
            #  #
            #  #
            #  #
            ####
        ]],
        [1] = [[
            ##
             #
             #
             #
             #
            ###
        ]],
        [2] = [[
            ###
               #
             ##
            #
            #
            ####       
        ]],
        [3] = [[
            ###
               #
             ##
               #
               #
            ###
        ]],
        [4] = [[
            #  #
            #  #
            ####
               #
               #
               #
        ]],
        [5] = [[
            ####
            #
            ###
               #
               #
            ###   
        ]],
        [6] = [[
             ##
            # 
            ###
            #  #
            #  #
             ## 
        ]],
        [7] = [[
            ####
               #
              #
             #
             #
             #
        ]],
        [8] = [[
             ##
            #  #
             ##
            #  #
            #  #
             ##
        ]],
        [9] = [[
             ##
            #  #
            #  #
             ###
               #
               #
        ]],
    }

    if self.number < 0 or self.number > 9 then
        print('Invalid number for Number: '..self.number)
    else
        local x = 0
        local y = 0
        local str = numbers[self.number]
        for i = 1, #str do
            local c = str:sub(i,i)
            x = x + 1
            if c == '#' then
                rectangle('fill', self.x + x * widthIncr, self.y + y * heightIncr, widthIncr, heightIncr)
            elseif c == '\n' then
                x = 0
                y = y + 1
            end
        end
    end
end

function Number:update(dt)
end
