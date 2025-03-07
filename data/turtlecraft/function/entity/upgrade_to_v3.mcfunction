# Executed by tc.turtle -> update to turtlecraft.turtle


# Tags
tag @s add turtlecraft.turtle
tag @s remove tc.turtle
tag @s[tag=tc.body] add turtlecraft.body
tag @s remove tc.body
tag @s[tag=tc.base] add turtlecraft.base
tag @s remove tc.base
tag @s[tag=tc.text] add turtlecraft.text
tag @s remove tc.text
tag @s[tag=tc.item] add turtlecraft.item
tag @s remove tc.item
tag @s[tag=tc.block] add turtlecraft.block
tag @s remove tc.block
tag @s[tag=tc.egg] add turtlecraft.egg
tag @s remove tc.egg


# NBT
data modify entity @s[tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft set from entity @s ArmorItems[0].components."minecraft:custom_data".tc
data remove entity @s[tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".tc

data modify entity @s[tag=turtlecraft.body] ArmorItems[3].components."minecraft:custom_data".turtlecraft set from entity @s ArmorItems[3].components."minecraft:custom_data".tc
data remove entity @s[tag=turtlecraft.body] ArmorItems[3].components."minecraft:custom_data".tc

data modify entity @s[tag=turtlecraft.body] HandItems[0].components."minecraft:custom_data".turtlecraft set from entity @s HandItems[0].components."minecraft:custom_data".tc
data remove entity @s[tag=turtlecraft.body] HandItems[0].components."minecraft:custom_data".tc

data modify entity @s[tag=turtlecraft.item] item.components."minecraft:custom_data".turtlecraft set from entity @s item.components."minecraft:custom_data".tc
data remove entity @s[tag=turtlecraft.item] item.components."minecraft:custom_data".tc

data modify entity @s[tag=turtlecraft.egg] data.turtlecraft set from entity @s data.tc
data remove entity @s[tag=turtlecraft.egg] data.tc


# Scores
scoreboard players operation @s turtlecraft.id = @s tc.id
scoreboard players reset @s tc.id

scoreboard players operation @s turtlecraft.update_id = @s tc.update_id
scoreboard players reset @s tc.update_id

scoreboard players operation @s turtlecraft.line = @s tc.line
scoreboard players reset @s tc.line

scoreboard players operation @s turtlecraft.timer = @s tc.timer
scoreboard players reset @s tc.timer

scoreboard players operation @s turtlecraft.fuel = @s tc.fuel
scoreboard players reset @s tc.fuel

scoreboard players operation @s turtlecraft.msg = @s tc.msg
scoreboard players reset @s tc.msg

scoreboard players set @s turtlecraft.version 3
scoreboard players reset @s tc.version
