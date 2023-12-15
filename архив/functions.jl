using  HorizonSideRobots

function along!(robot, side)
    steps = 0
    while !isborder(robot, side)
        move!(robot, side)
        steps += 1 #steps = steps + 1
    end
    
    return steps
end


function border_perimetrs(robot, side)
    if !isborder(robot, West)
        move!(robot, West)
    elseif isborder(robot, West) & !isborder(robot, Sud)
        move!(robot, Sud)
    else 
        border!(robot)
    end
end