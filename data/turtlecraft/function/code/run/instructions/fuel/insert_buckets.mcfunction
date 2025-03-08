# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:bucket",count:1b}]}
execute store result block 10028 0 10028 Items[0].count byte 1 run scoreboard players get $fuel.bucket.count turtlecraft.tmp
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Known issues / edge cases:
# - if the llama's inventory is full, some buckets may be lost
# - even with "max_stack_size" component, the created buckets always stack up to 16
# - "use_remainder" component is ignored
