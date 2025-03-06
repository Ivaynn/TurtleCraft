# Executed by an item entity. All turtle entities have "turtlecraft.tmp"

execute store result score $dropped_count_start turtlecraft.tmp run data get entity @s Item.count 1

data modify storage turtlecraft:tmp dropped_item set from entity @s Item
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/run/instructions/grab/as_llama
execute store result entity @s Item.count byte 1 run scoreboard players get $dropped_item_count turtlecraft.tmp
execute unless score $dropped_item_count turtlecraft.tmp matches 1.. run data remove entity @s Item


# Play sound
execute if score $dropped_item_count turtlecraft.tmp < $dropped_count_start turtlecraft.tmp unless score $sound_played turtlecraft.tmp matches 1 unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:entity.item.pickup neutral @a ~ ~ ~ 0.75 1.2
execute if score $dropped_item_count turtlecraft.tmp < $dropped_count_start turtlecraft.tmp run scoreboard players set $sound_played turtlecraft.tmp 1
