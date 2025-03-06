# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

execute if score skip_purple_delay turtlecraft.options matches 1 if score @s turtlecraft.fuel matches 1.. if score use_fuel turtlecraft.options matches 1 run scoreboard players operation @s turtlecraft.timer = delay_fueled turtlecraft.options 
execute if score skip_purple_delay turtlecraft.options matches 1 if score @s turtlecraft.fuel matches 1.. unless score use_fuel turtlecraft.options matches 1 run scoreboard players operation @s turtlecraft.timer = delay_normal turtlecraft.options 
execute if score skip_purple_delay turtlecraft.options matches 1 unless score @s turtlecraft.fuel matches 1.. run scoreboard players operation @s turtlecraft.timer = delay_normal turtlecraft.options 
