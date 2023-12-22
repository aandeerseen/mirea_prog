#=
3. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промаркированы.
=#

using HorizonSideRobots
include("functions.jl")

robot = Robot("situations/1.sit", animate=true)

function full_marker!(robot)
    steps_west= along!(robot, West) #робот идет в левый нижний угол
    steps_sud= along!(robot, Sud)
    direction= Ost
    while true
        putmarker!(robot)
        along_marker!(robot, direction)
        if isborder(robot, Nord)
            break
        end

        move!(robot,Nord)
        direction = inverse(direction)
    end
    along!(robot, West) #робот идет в левый нижний угол
    along!(robot, Sud)
    along!(robot, Ost, steps_west)
    along!(robot, Nord, steps_sud)
    
end


full_marker!(robot)