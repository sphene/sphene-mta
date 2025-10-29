-----------------------------------
-- * Variables
-----------------------------------

MatrixClass = {}
MatrixClass.__index = MatrixClass

-----------------------------------
-- * Functions
-----------------------------------

function MatrixClass.create(runtime, position, rotation)
    local mt = setmetatable({}, MatrixClass)

    mt.runtime = runtime

    mt.matrix = Matrix(position.vector, rotation.vector)

    mt.properties = {
        position = 'getPosition',
        rotation = 'getRotation',
        forward = 'getForward',
        right = 'getRight',
        up = 'getUp'
    }

    return mt.runtime:returnObject(mt)
end

function MatrixClass:setPosition(_, position)
    self.matrix = Matrix(Vector3(position:getX().value, position:getY().value, position:getZ().value), self.matrix.rotation)
end

function MatrixClass:setRotation(_, rotation)
    self.matrix = Matrix(self.matrix.position, Vector3(rotation:getX().value, rotation:getY().value, rotation:getZ().value))
end

function MatrixClass:transformPosition(runtime, x, y, z)
    local matrix = self.matrix.transformPosition(Vector3(x, y, z))

    return Vector3Class.create(runtime, matrix.position)
end

function MatrixClass:transformForward(runtime, units)
    return Vector3Class.create(runtime, self.matrix.position + self.matrix.forward * units)
end

function MatrixClass:transformRight(runtime, units)
    return Vector3Class.create(runtime, self.matrix.position + self.matrix.right * units)
end

function MatrixClass:transformUp(runtime, units)
    return Vector3Class.create(runtime, self.matrix.position + self.matrix.up * units)
end

function MatrixClass:getPosition(runtime)
    return Vector3Class.create(runtime, self.matrix:getPosition())
end

function MatrixClass:getRotation(runtime)
    return Vector3Class.create(runtime, self.matrix:getRotation())
end

function MatrixClass:getForward(runtime)
    return Vector3Class.create(runtime, self.matrix:getForward())
end

function MatrixClass:getRight(runtime)
    return Vector3Class.create(runtime, self.matrix:getRight())
end

function MatrixClass:getUp(runtime)
    return Vector3Class.create(runtime, self.matrix:getUp())
end

function MatrixClass:__tostring()
    return "Matrix<"..self:getPosition(self.runtime):getObject():__tostring(self.runtime)..", "..self:getRotation(self.runtime):getObject():__tostring(self.runtime)..">"
end

Core.mergeInto(MatrixClass, AbstractClass)