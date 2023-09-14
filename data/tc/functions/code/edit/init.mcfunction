# Executed by the player. All turtle components have tag "tc.tmp"
tag @s add tc.this_player

# Clear msg
scoreboard players reset @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.msg


## Decode input
# score = " Operation*100 + Argument "
scoreboard players operation $operation tc.tmp = @s tc.trigger
scoreboard players operation $operation tc.tmp /= #100 tc.math

scoreboard players operation $argument tc.tmp = @s tc.trigger
scoreboard players operation $argument tc.tmp %= #100 tc.math


## Actions
# Home page
execute if score $operation tc.tmp matches 1 run scoreboard players set $display_page tc.tmp 1

# Start / Stop / Pause / Unpause
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 1..4 run scoreboard players set $display_page tc.tmp 1
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 1 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/start
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 2 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/stop
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 3 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/pause
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 4 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run scoreboard players set @s tc.timer 0
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 9 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/step

# Change pages
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 5 run scoreboard players set $display_page tc.tmp 0
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 6 run scoreboard players set $display_page tc.tmp 4
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 7 run scoreboard players set $display_page tc.tmp 5
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 8 run scoreboard players set $display_page tc.tmp 6
execute if score $operation tc.tmp matches 2 if score $argument tc.tmp matches 9 run scoreboard players set $display_page tc.tmp 1

# Select page / Line
execute if score $operation tc.tmp matches 3 run scoreboard players set $display_page tc.tmp 2
execute if score $operation tc.tmp matches 3 if score $argument tc.tmp matches 0..13 run function tc:code/edit/select_line

# Edit line
execute if score $operation tc.tmp matches 3 if score $argument tc.tmp matches 14..20 run function tc:code/edit/edit_line

# Turtle Disc
execute if score $operation tc.tmp matches 3 if score $argument tc.tmp matches 97..99 run function tc:code/edit/use_disc

# Show options to edit selected argument
execute if score $operation tc.tmp matches 4 run scoreboard players set $display_page tc.tmp 2
execute if score $operation tc.tmp matches 4 run scoreboard players set $pause tc.tmp 1
execute if score $operation tc.tmp matches 4 if score $argument tc.tmp matches 1..87 run function tc:code/edit/change_arg/init
execute if score $operation tc.tmp matches 4 if score $argument tc.tmp matches 88..99 run function tc:code/edit/change_arg/numpad/init

# Change page to edit / add line
execute if score $operation tc.tmp matches 5 run scoreboard players set $display_page tc.tmp 2
execute if score $operation tc.tmp matches 5 if score $argument tc.tmp matches 1.. run scoreboard players set $pause tc.tmp 1
execute if score $operation tc.tmp matches 5 if score $argument tc.tmp matches 1.. run function tc:code/edit/add

# Change option
execute if score $operation tc.tmp matches 6 if score $argument tc.tmp matches 1.. as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/edit/change_option

# Manual instructions
execute if score $operation tc.tmp matches 7 if score $argument tc.tmp matches 1.. run scoreboard players set $pause tc.tmp 1
execute if score $operation tc.tmp matches 7 if score $argument tc.tmp matches 1.. run scoreboard players set $display_page tc.tmp 1
execute if score $operation tc.tmp matches 7 if score $argument tc.tmp matches 1.. as @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] at @s run function tc:code/edit/manual_instructions


# Clear text
data modify entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] view_range set value 0f


## Pause on instruction edit
execute if score $pause tc.tmp matches 1 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/pause


## Clear tmp
tag @s remove tc.this_player
scoreboard players reset $operation tc.tmp
scoreboard players reset $argument tc.tmp
scoreboard players reset $pause tc.tmp


## Display
execute if score $display_page tc.tmp matches 1.. run function tc:code/edit/display/init
scoreboard players reset $display_page tc.tmp
