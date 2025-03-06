# Executed by the player. All turtle components have tag "turtlecraft.tmp"

scoreboard players set $pause turtlecraft.tmp 1
scoreboard players set $display_page turtlecraft.tmp 2


# Remove line
execute if score $argument turtlecraft.tmp matches 14 run function turtlecraft:code/edit/remove

# Cut + copy + paste
execute if score $argument turtlecraft.tmp matches 15 run function turtlecraft:code/edit/copy
execute if score $argument turtlecraft.tmp matches 15 run function turtlecraft:code/edit/remove

execute if score $argument turtlecraft.tmp matches 16 run function turtlecraft:code/edit/copy
execute if score $argument turtlecraft.tmp matches 17 run function turtlecraft:code/edit/paste

# Switch lines
execute if score $argument turtlecraft.tmp matches 18 run function turtlecraft:code/edit/switch_up
execute if score $argument turtlecraft.tmp matches 19 run function turtlecraft:code/edit/switch_down

# Toggle Numpad
execute if score $argument turtlecraft.tmp matches 20 run scoreboard players add @s turtlecraft.numpad 1
execute unless score @s turtlecraft.numpad matches 0..1 run scoreboard players set @s turtlecraft.numpad 0
