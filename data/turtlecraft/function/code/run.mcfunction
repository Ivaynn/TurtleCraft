# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"


# Check for version upgrades
execute unless score @s turtlecraft.version matches 3.. run return 0


# Check forceloaded chunks
execute unless loaded 10028 ~ 10028 run function turtlecraft:forceload
execute unless loaded 10028 ~ 10028 run return 0
execute unless loaded ~ ~ ~ run return 0


# Dismount player riding
execute unless score ride_turtles turtlecraft.options matches 1 on passengers if entity @s[type=minecraft:player] run ride @s dismount


# Create temporary storage
data modify storage turtlecraft:tmp Instructions set from entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions
execute store result score $line_count turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $line_count turtlecraft.tmp 1


# Make a new list with all values from 0 to $index
scoreboard players operation $last_index turtlecraft.tmp = $line_count turtlecraft.tmp
scoreboard players operation $index turtlecraft.tmp = @s turtlecraft.line
data modify storage turtlecraft:tmp list_start set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last


# Get current line
data modify storage turtlecraft:tmp run_line set from storage turtlecraft:tmp list_start[-1]


# Get command and argument
execute store result score $command turtlecraft.tmp run data get storage turtlecraft:tmp run_line.C 1


# Save current line to revert in case something goes wrong
scoreboard players operation $prev_line turtlecraft.tmp = @s turtlecraft.line


# Progress
scoreboard players add @s turtlecraft.line 1


# Get extra parameters
execute store result score $auto_mine turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].AutoMine 1
execute store result score $error_pause turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].PauseOnError 1
execute store result score $auto_fuel turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].AutoFuel 1
execute store result score $safe_mine turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].SafeMine 1
execute store result score $show_text turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].ShowText 1
execute store result score $damage_players turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].DamagePlayers 1
execute store result score $clear_counters turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].ClearCounters 1
execute store result score $silent turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].Silent 1


# Show text
execute if score $show_text turtlecraft.tmp matches 1 run scoreboard players set @s turtlecraft.msg -1
execute if score $show_text turtlecraft.tmp matches 1 run scoreboard players operation $current_line turtlecraft.tmp = @s turtlecraft.line
execute if score $show_text turtlecraft.tmp matches 1 as @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] run function turtlecraft:code/show_text


# Breakpoint
execute if data storage turtlecraft:tmp run_line.bp run function turtlecraft:code/breakpoint


# Consume fuel + AutoFuel
execute if score $command turtlecraft.tmp matches 1..10 if score use_fuel turtlecraft.options matches 1 if score @s turtlecraft.fuel matches 1.. run scoreboard players remove @s turtlecraft.fuel 1
execute if score $auto_fuel turtlecraft.tmp matches 1 if score use_fuel turtlecraft.options matches 1 unless score @s turtlecraft.fuel matches 1.. run function turtlecraft:code/run/instructions/fuel/auto_fuel




## RUN INSTRUCTION
scoreboard players set $chunk_loaded turtlecraft.tmp 1

# move (1)
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s positioned ^ ^ ^1 run function turtlecraft:code/run/instructions/move
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s positioned ^ ^ ^-1 run function turtlecraft:code/run/instructions/move
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s positioned ^1 ^ ^ run function turtlecraft:code/run/instructions/move
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s positioned ^-1 ^ ^ run function turtlecraft:code/run/instructions/move
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s positioned ^ ^1 ^ run function turtlecraft:code/run/instructions/move
execute if score $command turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s positioned ^ ^-1 ^ run function turtlecraft:code/run/instructions/move

# turn (2)
execute if score $command turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} as @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] at @s run tp @s ~ ~ ~ ~-90 ~
execute if score $command turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} as @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] at @s run tp @s ~ ~ ~ ~90 ~
execute if score $command turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} as @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] at @s run tp @s ~ ~ ~ ~180 ~

# mine (3)
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function turtlecraft:code/run/instructions/mine/init
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function turtlecraft:code/run/instructions/mine/init
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function turtlecraft:code/run/instructions/mine/init
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function turtlecraft:code/run/instructions/mine/init
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function turtlecraft:code/run/instructions/mine/init
execute if score $command turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function turtlecraft:code/run/instructions/mine/init

# attack (4)
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init
execute if score $command turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:code/run/instructions/attack/init

# use (5)
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function turtlecraft:code/run/instructions/use/init
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function turtlecraft:code/run/instructions/use/init
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function turtlecraft:code/run/instructions/use/init
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function turtlecraft:code/run/instructions/use/init
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function turtlecraft:code/run/instructions/use/init
execute if score $command turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function turtlecraft:code/run/instructions/use/init

# insert (6)
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init
execute if score $command turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/insert/init

# take (7)
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init
execute if score $command turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ if block ~ ~ ~ #turtlecraft:container run function turtlecraft:code/run/instructions/take/init

# grab (8)
execute if score $command turtlecraft.tmp matches 8 at @s anchored eyes positioned ^ ^ ^ run function turtlecraft:code/run/instructions/grab/init

# drop (9)
execute if score $command turtlecraft.tmp matches 9 at @s anchored eyes positioned ^ ^ ^ run function turtlecraft:code/run/instructions/drop/init

# harvest (10)
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function turtlecraft:code/run/instructions/harvest
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function turtlecraft:code/run/instructions/harvest
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function turtlecraft:code/run/instructions/harvest
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function turtlecraft:code/run/instructions/harvest
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function turtlecraft:code/run/instructions/harvest
execute if score $command turtlecraft.tmp matches 10 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function turtlecraft:code/run/instructions/harvest

# SKIP PURPLE DELAY
execute if score $command turtlecraft.tmp matches 90..93 run function turtlecraft:code/run/skip_purple_delay
execute if score $command turtlecraft.tmp matches 95 run function turtlecraft:code/run/skip_purple_delay

# empty/comment (90)

# counter (91)
execute if score $command turtlecraft.tmp matches 91 run function turtlecraft:code/run/instructions/counter/init

# if (92) / unless (93)
execute if score $command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {run_line:{A:{condition:"item"}}} run function turtlecraft:code/run/instructions/if/item
execute if score $command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {run_line:{A:{condition:"block"}}} run function turtlecraft:code/run/instructions/if/block_direction
execute if score $command turtlecraft.tmp matches 92..93 if data storage turtlecraft:tmp {run_line:{A:{condition:"counter"}}} run function turtlecraft:code/run/instructions/if/counter

execute if score $command turtlecraft.tmp matches 92 if score $if_success turtlecraft.tmp matches 0 run scoreboard players add @s turtlecraft.line 1
execute if score $command turtlecraft.tmp matches 93 if score $if_success turtlecraft.tmp matches 1 run scoreboard players add @s turtlecraft.line 1

# fuel (94)
execute if score $command turtlecraft.tmp matches 94 if score use_fuel turtlecraft.options matches 1 run function turtlecraft:code/run/instructions/fuel/init

# line (95)
execute if score $command turtlecraft.tmp matches 95 store result score $line_arg turtlecraft.tmp run data get storage turtlecraft:tmp run_line.A.line 1
execute if score $command turtlecraft.tmp matches 95 run scoreboard players remove @s turtlecraft.line 1

execute if score $command turtlecraft.tmp matches 95 if data storage turtlecraft:tmp {run_line:{A:{operation:"set"}}} run scoreboard players operation @s turtlecraft.line = $line_arg turtlecraft.tmp
execute if score $command turtlecraft.tmp matches 95 if data storage turtlecraft:tmp {run_line:{A:{operation:"add"}}} run scoreboard players operation @s turtlecraft.line += $line_arg turtlecraft.tmp
execute if score $command turtlecraft.tmp matches 95 if data storage turtlecraft:tmp {run_line:{A:{operation:"remove"}}} run scoreboard players operation @s turtlecraft.line -= $line_arg turtlecraft.tmp


# wait (96) / pause (97) / stop (98) / remove (99)
execute if score $command turtlecraft.tmp matches 97 run scoreboard players set @s turtlecraft.msg 7
execute if score $command turtlecraft.tmp matches 97 run function turtlecraft:code/pause
execute if score $command turtlecraft.tmp matches 98 run scoreboard players set @s turtlecraft.msg 8
execute if score $command turtlecraft.tmp matches 98 run function turtlecraft:code/stop
execute if score $command turtlecraft.tmp matches 99 at @s run function turtlecraft:entity/remove/init



## AFTER RUNNING

# If chunks aren't loaded, retry
execute if score $chunk_loaded turtlecraft.tmp matches 0 run scoreboard players operation @s turtlecraft.line = $prev_line turtlecraft.tmp
execute if score $chunk_loaded turtlecraft.tmp matches 0 if score use_fuel turtlecraft.options matches 1 if score $command turtlecraft.tmp matches 1..10 run scoreboard players add @s turtlecraft.fuel 1
execute if score $chunk_loaded turtlecraft.tmp matches 0 run scoreboard players reset @s turtlecraft.msg


# If something went wrong, pause and revert to previous line (next action turtle will try this again)
execute if score $error_pause turtlecraft.tmp matches 1 if score @s turtlecraft.msg matches 1.. unless score @s turtlecraft.msg matches 7..8 run function turtlecraft:code/pause
execute if score $error_pause turtlecraft.tmp matches 1 unless score $command turtlecraft.tmp matches 97 if score @s turtlecraft.msg matches 1.. run scoreboard players operation @s turtlecraft.line = $prev_line turtlecraft.tmp
execute if score $error_pause turtlecraft.tmp matches 1 if score @s turtlecraft.msg matches 1.. if score @s turtlecraft.fuel matches 1.. if score use_fuel turtlecraft.options matches 1 if score $command turtlecraft.tmp matches 1..10 run scoreboard players add @s turtlecraft.fuel 1


# Stop conditions
execute unless score @s turtlecraft.msg matches 1.. if score @s turtlecraft.timer matches 0.. if score @s turtlecraft.line > $line_count turtlecraft.tmp run scoreboard players set @s turtlecraft.msg 9
execute unless score @s turtlecraft.msg matches 1.. if score @s turtlecraft.timer matches 0.. unless score @s turtlecraft.line matches 1.. run scoreboard players set @s turtlecraft.msg 8
execute if score @s turtlecraft.timer matches 0.. if score @s turtlecraft.line > $line_count turtlecraft.tmp run function turtlecraft:code/stop


# Update
function turtlecraft:entity/update


# Auto refresh
execute if score auto_refresh turtlecraft.options matches 1 as @a[distance=..10,scores={turtlecraft.id=1..,turtlecraft.page=1}] if score @s turtlecraft.id = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.id run function turtlecraft:code/edit/display/pages/home


# Clear tmp
data remove storage turtlecraft:tmp Instructions
data remove storage turtlecraft:tmp run_line
data remove storage turtlecraft:tmp list_start
scoreboard players reset $index turtlecraft.tmp
scoreboard players reset $last_index turtlecraft.tmp
scoreboard players reset $command turtlecraft.tmp
scoreboard players reset $line_count turtlecraft.tmp

scoreboard players reset $auto_mine turtlecraft.tmp
scoreboard players reset $error_pause turtlecraft.tmp
scoreboard players reset $auto_fuel turtlecraft.tmp
scoreboard players reset $safe_mine turtlecraft.tmp
scoreboard players reset $show_text turtlecraft.tmp
scoreboard players reset $damage_players turtlecraft.tmp
scoreboard players reset $clear_counters turtlecraft.tmp
scoreboard players reset $silent turtlecraft.tmp

scoreboard players reset $prev_line turtlecraft.tmp
scoreboard players reset $line_arg turtlecraft.tmp
scoreboard players reset $if_success turtlecraft.tmp
scoreboard players reset $current_line turtlecraft.tmp

scoreboard players reset $chunk_loaded turtlecraft.tmp
