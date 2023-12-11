using HorizonSideRobots

"""
Робот шагает в какую-то сторону, и считает свои шаги, пока не встретит стенку
"""
function along!(robot, side)
    steps=0
    while !isborder(robot, side)
        move!(robot, side)
        steps+=1
    end

    return steps
end

function along!(robot, side, steps)
    for i in 1:steps
        move!(robot, side)
    end
end

"""
Меняет сторону на противоположную
"""
function inverse(side)
    if side == Nord
        return Sud
    elseif side == West
        return Ost
    elseif side == Sud
        return Nord
    elseif side == Ost
        return West
    end
end

"""
Робот шагает в какую-то сторону, и считает свои шаги, пока не встретит стенку, с маркерами
"""
function along_marker!(robot, side)
    steps=0
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        steps+=1
    end

    return steps
end

