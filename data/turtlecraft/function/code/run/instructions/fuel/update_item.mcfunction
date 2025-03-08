# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

# Save new score
scoreboard players operation @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.fuel = $fuel_level turtlecraft.tmp
scoreboard players set $fuel_success turtlecraft.tmp 1


# Count buckets
scoreboard players set $fuel.bucket.count turtlecraft.tmp 0
execute if data storage turtlecraft:tmp {this_slot:{id:"minecraft:lava_bucket"}} run scoreboard players operation $fuel.bucket.add turtlecraft.tmp = $fuel_consumed turtlecraft.tmp
scoreboard players operation $fuel.bucket.count turtlecraft.tmp += $fuel.bucket.add turtlecraft.tmp


# Update slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp llama_items[0]
execute store result block 10028 0 10028 Items[0].count byte 1 run scoreboard players get $item_count turtlecraft.tmp
execute unless score $item_count turtlecraft.tmp matches 1.. run return run data remove block 10028 0 10028 Items[0]
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
