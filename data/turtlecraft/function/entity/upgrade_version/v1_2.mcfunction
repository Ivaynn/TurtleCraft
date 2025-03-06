# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"


# Copy data from old format
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Owner set from entity @s ArmorItems[0].components."minecraft:custom_data".Owner
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions set from entity @s ArmorItems[0].components."minecraft:custom_data".Instructions
data modify entity @s ArmorItems[3].components."minecraft:custom_data".turtlecraft.Counters set from entity @s ArmorItems[3].components."minecraft:custom_data".Counters


# Remove data in old format
data remove entity @s ArmorItems[0].components."minecraft:custom_data".Owner
data remove entity @s ArmorItems[0].components."minecraft:custom_data".Instructions
data remove entity @s ArmorItems[3].components."minecraft:custom_data".Counters


# Set new turtle options to their default values
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].ClearCounters set value 1b
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Silent set value 0b
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Version set value 2


# Bug with the scale of the item display with the equipped tool
data merge entity @e[limit=1,type=minecraft:item_display,tag=turtlecraft.tmp,tag=turtlecraft.item] {transformation:{translation:[-0.402f,-0.028f,0.028f],right_rotation:[1f,-1f,-1f,1f],left_rotation:[0f,0f,0f,1f],scale:[0.88f,0.88f,0.88f]}}


# Empty item slot invalid item
execute if data entity @s {HandItems:[{id:"minecraft:red_stained_glass_pane"},{}]} run function turtlecraft:entity/empty_item_slot


# Done!
execute if score show_warnings turtlecraft.options matches 1 run tellraw @a ["",{"text":"WARNING: ","color":"gold"},{"text":"TurtleCraft > ","color":"dark_aqua"},{"selector":"@s","color":"gray"},{"text":" upgraded to the new version!","color":"gray"}]
scoreboard players set @s turtlecraft.version 2
