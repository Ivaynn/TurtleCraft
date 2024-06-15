# Executed by the player. All turtle components have tag "tc.tmp"



# Create temporary storage + get line count
data modify storage tc:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions
execute store result score $line_count tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $line_count tc.tmp 1


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select last line
execute unless score @s tc.line matches 1.. run scoreboard players operation @s tc.line = $line_count tc.tmp
execute if score @s tc.line > $line_count tc.tmp run scoreboard players operation @s tc.line = $line_count tc.tmp


# Get options
execute store result score $auto_mine tc.tmp run data get storage tc:tmp Instructions[0].AutoMine 1
execute store result score $error_pause tc.tmp run data get storage tc:tmp Instructions[0].PauseOnError 1
execute store result score $turtle_lock tc.tmp run data get storage tc:tmp Instructions[0].Locked 1
execute store result score $auto_fuel tc.tmp run data get storage tc:tmp Instructions[0].AutoFuel 1
execute store result score $safe_mine tc.tmp run data get storage tc:tmp Instructions[0].SafeMine 1
execute store result score $show_text tc.tmp run data get storage tc:tmp Instructions[0].ShowText 1
execute store result score $damage_players tc.tmp run data get storage tc:tmp Instructions[0].DamagePlayers 1


# Display selected page
execute unless score $display_page tc.tmp matches 0.. run scoreboard players set $display_page tc.tmp 1
execute if score $display_page tc.tmp matches 1 run function tc:code/edit/display/pages/home
execute if score $display_page tc.tmp matches 2 run function tc:code/edit/display/pages/edit
# execute if score $display_page tc.tmp matches 3 run say <placeholder>
execute if score $display_page tc.tmp matches 4 run function tc:code/edit/display/pages/counters
execute if score $display_page tc.tmp matches 5 run function tc:code/edit/display/pages/options
execute if score $display_page tc.tmp matches 6 run function tc:code/edit/display/pages/help


# Clear tmp
data remove storage tc:tmp Instructions
scoreboard players reset $line_count tc.tmp
scoreboard players reset $display_page tc.tmp
scoreboard players reset $auto_mine tc.tmp
scoreboard players reset $error_pause tc.tmp
scoreboard players reset $turtle_lock tc.tmp
scoreboard players reset $auto_fuel tc.tmp
scoreboard players reset $safe_mine tc.tmp
scoreboard players reset $show_text tc.tmp
scoreboard players reset $damage_players tc.tmp
