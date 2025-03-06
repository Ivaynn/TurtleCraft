# Executed by turtlecraft.text - all attached entities have "turtlecraft.tmp"


# Setup
data modify entity @s view_range set value 1f
scoreboard players remove $current_line turtlecraft.tmp 1


# Display line
execute if score $command turtlecraft.tmp matches 1 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" move","color":"#00B000"}]'
execute if score $command turtlecraft.tmp matches 2 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" turn","color":"#00B000"}]'
execute if score $command turtlecraft.tmp matches 3 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" mine","color":"#67C967"}]'
execute if score $command turtlecraft.tmp matches 4 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" attack","color":"#67C967"}]'
execute if score $command turtlecraft.tmp matches 5 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" use","color":"#E8D94D"}]'
execute if score $command turtlecraft.tmp matches 6 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" insert","color":"#E8D94D"}]'
execute if score $command turtlecraft.tmp matches 7 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" take","color":"#E8D94D"}]'
execute if score $command turtlecraft.tmp matches 8 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" grab","color":"#E68957"}]'
execute if score $command turtlecraft.tmp matches 9 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" drop","color":"#E68957"}]'
execute if score $command turtlecraft.tmp matches 10 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" harvest","color":"#67C967"}]'

execute if score $command turtlecraft.tmp matches 90 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":"        "}]'
execute if score $command turtlecraft.tmp matches 91 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" counter","color":"#FD93FD"}]'
execute if score $command turtlecraft.tmp matches 92 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" if","color":"#FD93FD"}]'
execute if score $command turtlecraft.tmp matches 93 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" unless","color":"#FD93FD"}]'
execute if score $command turtlecraft.tmp matches 94 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" fuel","color":"#4E8DCC"}]'
execute if score $command turtlecraft.tmp matches 95 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" line","color":"#FD93FD"}]'
execute if score $command turtlecraft.tmp matches 96 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" wait","color":"#A2A2A2"}]'
execute if score $command turtlecraft.tmp matches 97 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" pause","color":"#4E8DCC"}]'
execute if score $command turtlecraft.tmp matches 98 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" stop","color":"#4E8DCC"}]'
execute if score $command turtlecraft.tmp matches 99 run data modify entity @s text set value '["",{"score":{"name":"$current_line","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" remove","color":"#E6553E"}]'
