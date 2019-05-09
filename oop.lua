
--[[person = {name = "siki", age = 99}

 function person:eat()
    print(self.name.."eat")
    print(self.age.." ".."eat")
end

function person.eat()
    print("eat")
end  


--当通过：调用的时候，系统会自动传递当前的table给self
--当通过.调用方法的时候，self不会自动赋值，必须通过一个参数来传递当前的表
person:eat()

function person:new()
    t = {}
    setmetatable(t, {__index = self}) --调用一个属性的时候，如果t中不存在，那么会在__index所指定的table中查找

    return t
end
]]


Rectangle = {area = 0, length = 0, breadth = 0}

-- Derived class method new

function Rectangle:new (o,length,breadth)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   self.length = length or 0
   self.breadth = breadth or 0
   self.area = length*breadth;
   return o
end

-- Derived class method printArea

function Rectangle:printArea ()
   print("The area of Rectangle is ",self.area)
end

r = Rectangle:new(nil, 4, 5)
print(r.length,r.breadth)
r:printArea()
