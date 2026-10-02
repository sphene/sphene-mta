-----------------------------------
-- * Functions
-----------------------------------

-- Cubic Bezier curve interpolation
-- P(t) = (1-t)^3*p0 + 3*(1-t)^2*t*c1 + 3*(1-t)*t^2*c2 + t^3*p3
function getCubicBezier(t, p0, c1, c2, p3)
    local mt = 1 - t
    return (mt * mt * mt * p0) + (3 * mt * mt * t * c1) + (3 * mt * t * t * c2) + (t * t * t * p3)
end

function clamp(value, min, max)
    return math.max(min, math.min(max, value))
end
