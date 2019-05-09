require "class"


base_type=class()       -- 定义一个基类 base_type

function base_type:ctor(x)  -- 定义 base_type 的构造函数
    print("base_type ctor")
    self.x=x
end

function base_type:print_x()    -- 定义一个成员函数 base_type:print_x
    print(self.x)
end

function base_type:hello()  -- 定义另一个成员函数 base_type:hello
    print("hello base_type")
end
--以上是基本的 class 定义的语法，完全兼容 lua 的编程习惯。我增加了一个叫做 ctor 的词，作为构造函数的名字。
--下面看看怎样继承： test=class(basetype) -- 定义一个类 test 继承于 basetype

test=class(base_type)

function test:ctor(x, y, z)    -- 定义 test 的构造函数
    print("test ctor",y.." "..z)
    self.z = z;
    self.y = y
end

function test:hello()   -- 重载 base_type:hello 为 test:hello
    print("hello test")
end

--现在可以试一下了：
a=test.new(1, 2, 3)   -- 输出两行，base_type ctor 和 test ctor 。这个对象被正确的构造了。
a:print_x() -- 输出 1 ，这个是基类 base_type 中的成员函数。
a:hello()   -- 输出 hello test ，这个函数被重载了。