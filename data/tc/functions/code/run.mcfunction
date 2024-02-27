# Executed by tc.body - all attached entities have "tc.tmp"


# Check forceloaded chunks
execute unless loaded 10028 ~ 10028 run function tc:forceload
execute unless loaded 10028 ~ 10028 run return 0
execute unless loaded ~ ~ ~ run return 0


# Dismount player riding
execute unless score ride_turtles tc.options matches 1 on passengers if entity @s[type=minecraft:player] run ride @s dismount


# Create temporary storage
data modify storage tc:tmp Instructions set from entity @s ArmorItems[0].tag.Instructions
execute store result score $line_count tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $line_count tc.tmp 1


# Make a new list with all values from 0 to $index
scoreboard players operation $last_index tc.tmp = $line_count tc.tmp
scoreboard players operation $index tc.tmp = @s tc.line
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last


# Get current line
data modify storage tc:tmp run_line set from storage tc:tmp list_start[-1]


# Get command and argument
execute store result score $command tc.tmp run data get storage tc:tmp run_line.C 1


# Save current line to revert in case something goes wrong
scoreboard players operation $prev_line tc.tmp = @s tc.line


# Progress
scoreboard players add @s tc.line 1


# Get extra parameters
execute store result score $auto_mine tc.tmp run data get storage tc:tmp Instructions[0].AutoMine 1
execute store result score $error_pause tc.tmp run data get storage tc:tmp Instructions[0].PauseOnError 1
execute store result score $auto_fuel tc.tmp run data get storage tc:tmp Instructions[0].AutoFuel 1
execute store result score $safe_mine tc.tmp run data get storage tc:tmp Instructions[0].SafeMine 1
execute store result score $show_text tc.tmp run data get storage tc:tmp Instructions[0].ShowText 1
execute store result score $damage_players tc.tmp run data get storage tc:tmp Instructions[0].DamagePlayers 1


# Show text
execute if score $show_text tc.tmp matches 1 run scoreboard players set @s tc.msg -1
execute if score $show_text tc.tmp matches 1 run scoreboard players operation $current_line tc.tmp = @s tc.line
execute if score $show_text tc.tmp matches 1 as @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] run function tc:code/show_text


# Consume fuel + AutoFuel
execute if score $command tc.tmp matches 1..10 if score use_fuel tc.options matches 1 if score @s tc.fuel matches 1.. run scoreboard players remove @s tc.fuel 1
execute if score $auto_fuel tc.tmp matches 1 if score use_fuel tc.options matches 1 unless score @s tc.fuel matches 1.. run function tc:code/run/instructions/fuel/auto_fuel




## RUN INSTRUCTION
scoreboard players set $chunk_loaded tc.tmp 1

# move (1)
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s positioned ^ ^ ^1 run function tc:code/run/instructions/move
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s positioned ^ ^ ^-1 run function tc:code/run/instructions/move
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s positioned ^1 ^ ^ run function tc:code/run/instructions/move
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s positioned ^-1 ^ ^ run function tc:code/run/instructions/move
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s positioned ^ ^1 ^ run function tc:code/run/instructions/move
execute if score $command tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s positioned ^ ^-1 ^ run function tc:code/run/instructions/move

# turn (2)
execute if score $command tc.tmp matches 2 if data storage tc:tmp {run_line:{A:{direction:"left"}}} as @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] at @s run tp @s ~ ~ ~ ~-90 ~
execute if score $command tc.tmp matches 2 if data storage tc:tmp {run_line:{A:{direction:"right"}}} as @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] at @s run tp @s ~ ~ ~ ~90 ~
execute if score $command tc.tmp matches 2 if data storage tc:tmp {run_line:{A:{direction:"back"}}} as @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] at @s run tp @s ~ ~ ~ ~180 ~

# mine (3)
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function tc:code/run/instructions/mine/init
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function tc:code/run/instructions/mine/init
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function tc:code/run/instructions/mine/init
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function tc:code/run/instructions/mine/init
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function tc:code/run/instructions/mine/init
execute if score $command tc.tmp matches 3 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function tc:code/run/instructions/mine/init

# attack (4)
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init
execute if score $command tc.tmp matches 4 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ align xyz positioned ~0.5 ~ ~0.5 run function tc:code/run/instructions/attack/init

# use (5)
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function tc:code/run/instructions/use/init
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function tc:code/run/instructions/use/init
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function tc:code/run/instructions/use/init
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function tc:code/run/instructions/use/init
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function tc:code/run/instructions/use/init
execute if score $command tc.tmp matches 5 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function tc:code/run/instructions/use/init

# insert (6)
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init
execute if score $command tc.tmp matches 6 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/insert/init

# take (7)
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init
execute if score $command tc.tmp matches 7 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ if block ~ ~ ~ #tc:container run function tc:code/run/instructions/take/init

# grab (8)
execute if score $command tc.tmp matches 8 at @s anchored eyes positioned ^ ^ ^ run function tc:code/run/instructions/grab/init

# drop (9)
execute if score $command tc.tmp matches 9 at @s anchored eyes positioned ^ ^ ^ run function tc:code/run/instructions/drop/init

# harvest (10)
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function tc:code/run/instructions/harvest
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function tc:code/run/instructions/harvest
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function tc:code/run/instructions/harvest
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function tc:code/run/instructions/harvest
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function tc:code/run/instructions/harvest
execute if score $command tc.tmp matches 10 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function tc:code/run/instructions/harvest

# SKIP PURPLE DELAY
execute if score $command tc.tmp matches 90..93 run function tc:code/run/skip_purple_delay
execute if score $command tc.tmp matches 95 run function tc:code/run/skip_purple_delay

# empty (90)

# counter (91)
execute if score $command tc.tmp matches 91 run function tc:code/run/instructions/counter/init

# if (92) / unless (93)
execute if score $command tc.tmp matches 92..93 if data storage tc:tmp {run_line:{A:{condition:"item"}}} run function tc:code/run/instructions/if/item
execute if score $command tc.tmp matches 92..93 if data storage tc:tmp {run_line:{A:{condition:"block"}}} run function tc:code/run/instructions/if/block_direction
execute if score $command tc.tmp matches 92..93 if data storage tc:tmp {run_line:{A:{condition:"counter"}}} run function tc:code/run/instructions/if/counter

execute if score $command tc.tmp matches 92 if score $if_success tc.tmp matches 0 run scoreboard players add @s tc.line 1
execute if score $command tc.tmp matches 93 if score $if_success tc.tmp matches 1 run scoreboard players add @s tc.line 1

# fuel (94)
execute if score $command tc.tmp matches 94 if score use_fuel tc.options matches 1 run function tc:code/run/instructions/fuel/init

# line (95)
execute if score $command tc.tmp matches 95 store result score $line_arg tc.tmp run data get storage tc:tmp run_line.A.line 1
execute if score $command tc.tmp matches 95 run scoreboard players remove @s tc.line 1

execute if score $command tc.tmp matches 95 if data storage tc:tmp {run_line:{A:{operation:"set"}}} run scoreboard players operation @s tc.line = $line_arg tc.tmp
execute if score $command tc.tmp matches 95 if data storage tc:tmp {run_line:{A:{operation:"add"}}} run scoreboard players operation @s tc.line += $line_arg tc.tmp
execute if score $command tc.tmp matches 95 if data storage tc:tmp {run_line:{A:{operation:"remove"}}} run scoreboard players operation @s tc.line -= $line_arg tc.tmp


# wait (96) / pause (97) / stop (98) / remove (99)
execute if score $command tc.tmp matches 97 run scoreboard players set @s tc.msg 7
execute if score $command tc.tmp matches 97 run function tc:code/pause
execute if score $command tc.tmp matches 98 run scoreboard players set @s tc.msg 8
execute if score $command tc.tmp matches 98 run function tc:code/stop
execute if score $command tc.tmp matches 99 at @s run function tc:entity/remove/init



## AFTER RUNNING

# If chunks aren't loaded, retry
execute if score $chunk_loaded tc.tmp matches 0 run scoreboard players operation @s tc.line = $prev_line tc.tmp
execute if score $chunk_loaded tc.tmp matches 0 if score use_fuel tc.options matches 1 if score $command tc.tmp matches 1..10 run scoreboard players add @s tc.fuel 1
execute if score $chunk_loaded tc.tmp matches 0 run scoreboard players reset @s tc.msg


# If something went wrong, pause and revert to previous line (next action turtle will try this again)
execute if score $error_pause tc.tmp matches 1 if score @s tc.msg matches 1.. unless score @s tc.msg matches 7..8 run function tc:code/pause
execute if score $error_pause tc.tmp matches 1 unless score $command tc.tmp matches 97 if score @s tc.msg matches 1.. run scoreboard players operation @s tc.line = $prev_line tc.tmp
execute if score $error_pause tc.tmp matches 1 if score @s tc.msg matches 1.. if score @s tc.fuel matches 1.. if score use_fuel tc.options matches 1 if score $command tc.tmp matches 1..10 run scoreboard players add @s tc.fuel 1


# Stop conditions
execute unless score @s tc.msg matches 1.. if score @s tc.timer matches 0.. if score @s tc.line > $line_count tc.tmp run scoreboard players set @s tc.msg 9
execute unless score @s tc.msg matches 1.. if score @s tc.timer matches 0.. unless score @s tc.line matches 1.. run scoreboard players set @s tc.msg 8
execute if score @s tc.timer matches 0.. if score @s tc.line > $line_count tc.tmp run function tc:code/stop


# Update
function tc:entity/update


# Auto refresh
execute if score auto_refresh tc.options matches 1 as @a[distance=..10,scores={tc.id=1..,tc.page=1}] if score @s tc.id = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.id run function tc:code/edit/display/pages/home


# Clear tmp
data remove storage tc:tmp Instructions
data remove storage tc:tmp run_line
data remove storage tc:tmp list_start
scoreboard players reset $index tc.tmp
scoreboard players reset $last_index tc.tmp
scoreboard players reset $command tc.tmp
scoreboard players reset $line_count tc.tmp

scoreboard players reset $auto_mine tc.tmp
scoreboard players reset $error_pause tc.tmp
scoreboard players reset $auto_fuel tc.tmp
scoreboard players reset $safe_mine tc.tmp
scoreboard players reset $show_text tc.tmp
scoreboard players reset $damage_players tc.tmp

scoreboard players reset $prev_line tc.tmp
scoreboard players reset $line_arg tc.tmp
scoreboard players reset $if_success tc.tmp
scoreboard players reset $current_line tc.tmp

scoreboard players reset $chunk_loaded tc.tmp
