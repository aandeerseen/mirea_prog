#=

1. ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
=#
using HorizonSideRobots
include("functions.jl")

robot = Robot("situations/1.sit", animate=true)

function cross!(robot)
    putmarker!(robot)
    for side in [Nord, Ost, West, Sud]
        steps = along_marker!(robot,side) #возращает посчитанные шаги
        along!(robot,inverse(side), steps) #робот движется в обратную сторону на стартовую позицию
    end
end

cross!(robot)

