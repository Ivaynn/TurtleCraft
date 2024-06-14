# Executed by an item entity. All turtle entities have "tc.tmp"

execute store result score $dropped_count_start tc.tmp run data get entity @s Item.count 1

data modify storage tc:tmp dropped_item set from entity @s Item
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/run/instructions/grab/as_llama
execute store result entity @s Item.count byte 1 run scoreboard players get $dropped_item_count tc.tmp


# Play sound
execute if score $dropped_item_count tc.tmp < $dropped_count_start tc.tmp unless score $sound_played tc.tmp matches 1 run playsound minecraft:entity.item.pickup neutral @a ~ ~ ~ 0.75 1.2
execute if score $dropped_item_count tc.tmp < $dropped_count_start tc.tmp run scoreboard players set $sound_played tc.tmp 1
