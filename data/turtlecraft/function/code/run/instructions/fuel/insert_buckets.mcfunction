# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"


# Create temporary shulker box
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:bucket",count:1b}]}


# Get current stack size, limit it to 16
scoreboard players operation $fuel.bucket.diff turtlecraft.tmp = $fuel.bucket.count turtlecraft.tmp
execute if score $fuel.bucket.diff turtlecraft.tmp matches 17.. run scoreboard players set $fuel.bucket.diff turtlecraft.tmp 16


# Add contents of this temporary shulker box to the shulker box containing the turtle's inventory
execute store result block 10028 0 10028 Items[0].count byte 1 run scoreboard players get $fuel.bucket.diff turtlecraft.tmp
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Recursive -> continue until there are no more buckets in the queue
scoreboard players operation $fuel.bucket.count turtlecraft.tmp -= $fuel.bucket.diff turtlecraft.tmp
execute if score $fuel.bucket.count turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/insert_buckets


# Known issues / edge cases:
# - if the llama's inventory is full, some buckets may be lost
# - even with "max_stack_size" component, the created buckets always stack up to 16
# - "use_remainder" component is ignored
