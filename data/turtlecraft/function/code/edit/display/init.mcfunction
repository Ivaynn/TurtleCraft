# Executed by the player. All turtle components have tag "turtlecraft.tmp"



# Create temporary storage + get line count
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions
execute store result score $line_count turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $line_count turtlecraft.tmp 1


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select last line
execute unless score @s turtlecraft.line matches 1.. run scoreboard players set @s turtlecraft.line 1
execute if score @s turtlecraft.line > $line_count turtlecraft.tmp run scoreboard players operation @s turtlecraft.line = $line_count turtlecraft.tmp


# Get options
execute store result score $auto_mine turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].AutoMine 1
execute store result score $error_pause turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].PauseOnError 1
execute store result score $turtle_lock turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].Locked 1
execute store result score $auto_fuel turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].AutoFuel 1
execute store result score $safe_mine turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].SafeMine 1
execute store result score $show_text turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].ShowText 1
execute store result score $damage_players turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].DamagePlayers 1
execute store result score $clear_counters turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].ClearCounters 1
execute store result score $silent turtlecraft.tmp run data get storage turtlecraft:tmp Instructions[0].Silent 1


# Display selected page
execute unless score $display_page turtlecraft.tmp matches 0.. run scoreboard players set $display_page turtlecraft.tmp 1
execute if score $display_page turtlecraft.tmp matches 1 run function turtlecraft:code/edit/display/pages/home
execute if score $display_page turtlecraft.tmp matches 2 run function turtlecraft:code/edit/display/pages/edit
# execute if score $display_page turtlecraft.tmp matches 3 run say <placeholder>
execute if score $display_page turtlecraft.tmp matches 4 run function turtlecraft:code/edit/display/pages/counters
execute if score $display_page turtlecraft.tmp matches 5 run function turtlecraft:code/edit/display/pages/options
execute if score $display_page turtlecraft.tmp matches 6 run function turtlecraft:code/edit/display/pages/help


# Clear tmp
data remove storage turtlecraft:tmp Instructions
scoreboard players reset $line_count turtlecraft.tmp
scoreboard players reset $display_page turtlecraft.tmp
scoreboard players reset $auto_mine turtlecraft.tmp
scoreboard players reset $error_pause turtlecraft.tmp
scoreboard players reset $turtle_lock turtlecraft.tmp
scoreboard players reset $auto_fuel turtlecraft.tmp
scoreboard players reset $safe_mine turtlecraft.tmp
scoreboard players reset $show_text turtlecraft.tmp
scoreboard players reset $damage_players turtlecraft.tmp
scoreboard players reset $clear_counters turtlecraft.tmp
scoreboard players reset $silent turtlecraft.tmp
