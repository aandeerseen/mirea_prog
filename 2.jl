
#=
2. ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промаркированы.
=#

using HorizonSideRobots
include("functions.jl")

robot = Robot("situations/1.sit", animate=true)

function perimeter!(robot)
    steps_west= along!(robot, West) #робот идет в левый нижний угол
    steps_sud= along!(robot, Sud)

    for side in [Ost, Nord, West, Sud]
        along_marker!(robot, side)
    end
    
    along!(robot,Nord, steps_sud)  #возращает робота на стартовую позицию
    along!(robot,Ost, steps_west)
end

perimeter!(robot)