# Executed by the player. All turtle components have tag "turtlecraft.tmp"
tag @s add turtlecraft.this_player

# Clear msg
scoreboard players reset @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.msg


## Decode input
# score = " Operation*100 + Argument "
scoreboard players operation $operation turtlecraft.tmp = @s turtlecraft.trigger
scoreboard players operation $operation turtlecraft.tmp /= #100 turtlecraft.math

scoreboard players operation $argument turtlecraft.tmp = @s turtlecraft.trigger
scoreboard players operation $argument turtlecraft.tmp %= #100 turtlecraft.math


## Actions
# Home page
execute if score $operation turtlecraft.tmp matches 1 run scoreboard players set $display_page turtlecraft.tmp 1

# Start / Stop / Pause / Unpause
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 1..4 run scoreboard players set $display_page turtlecraft.tmp 1
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 1 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/start
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 2 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/stop
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 3 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/pause
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 4 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run scoreboard players set @s turtlecraft.timer 0
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 9 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/step

# Change pages
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 5 run scoreboard players set $display_page turtlecraft.tmp 0
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 6 run scoreboard players set $display_page turtlecraft.tmp 4
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 7 run scoreboard players set $display_page turtlecraft.tmp 5
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 8 run scoreboard players set $display_page turtlecraft.tmp 6
execute if score $operation turtlecraft.tmp matches 2 if score $argument turtlecraft.tmp matches 9 run scoreboard players set $display_page turtlecraft.tmp 1

# Select page / Line
execute if score $operation turtlecraft.tmp matches 3 run scoreboard players set $display_page turtlecraft.tmp 2
execute if score $operation turtlecraft.tmp matches 3 if score $argument turtlecraft.tmp matches 0..13 run function turtlecraft:code/edit/select_line

# Edit line
execute if score $operation turtlecraft.tmp matches 3 if score $argument turtlecraft.tmp matches 14..20 run function turtlecraft:code/edit/edit_line

# Turtle Disc
execute if score $operation turtlecraft.tmp matches 3 if score $argument turtlecraft.tmp matches 97..99 run function turtlecraft:code/edit/use_disc

# Show options to edit selected argument
execute if score $operation turtlecraft.tmp matches 4 run scoreboard players set $display_page turtlecraft.tmp 2
execute if score $operation turtlecraft.tmp matches 4 run scoreboard players set $pause turtlecraft.tmp 1
execute if score $operation turtlecraft.tmp matches 4 if score $argument turtlecraft.tmp matches 1..86 run function turtlecraft:code/edit/change_arg/init
execute if score $operation turtlecraft.tmp matches 4 if score $argument turtlecraft.tmp matches 87 run function turtlecraft:code/edit/toggle_breakpoint
execute if score $operation turtlecraft.tmp matches 4 if score $argument turtlecraft.tmp matches 88..99 run function turtlecraft:code/edit/change_arg/numpad/init

# Change page to edit / add line
execute if score $operation turtlecraft.tmp matches 5 run scoreboard players set $display_page turtlecraft.tmp 2
execute if score $operation turtlecraft.tmp matches 5 if score $argument turtlecraft.tmp matches 1.. run scoreboard players set $pause turtlecraft.tmp 1
execute if score $operation turtlecraft.tmp matches 5 if score $argument turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/add

# Change option
execute if score $operation turtlecraft.tmp matches 6 if score $argument turtlecraft.tmp matches 1.. as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/edit/change_option

# Manual instructions
execute if score $operation turtlecraft.tmp matches 7 if score $argument turtlecraft.tmp matches 1.. run scoreboard players set $pause turtlecraft.tmp 1
execute if score $operation turtlecraft.tmp matches 7 if score $argument turtlecraft.tmp matches 1.. run scoreboard players set $display_page turtlecraft.tmp 1
execute if score $operation turtlecraft.tmp matches 7 if score $argument turtlecraft.tmp matches 1.. as @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] at @s run function turtlecraft:code/edit/manual_instructions


# Clear text
data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] view_range set value 0f


## Pause on instruction edit
execute if score $pause turtlecraft.tmp matches 1 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/pause


## Clear tmp
tag @s remove turtlecraft.this_player
scoreboard players reset $operation turtlecraft.tmp
scoreboard players reset $argument turtlecraft.tmp
scoreboard players reset $pause turtlecraft.tmp


## Display
execute if score $display_page turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/display/init
scoreboard players reset $display_page turtlecraft.tmp
