# Executed by tc.body. All turtle entities have "tc.tmp"

# Save new score
scoreboard players operation @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.fuel = $fuel_level tc.tmp
scoreboard players set $fuel_success tc.tmp 1


# Update slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",Count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp llama_items[0]
execute store result block 10028 0 10028 Items[0].Count byte 1 run scoreboard players get $item_count tc.tmp
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
