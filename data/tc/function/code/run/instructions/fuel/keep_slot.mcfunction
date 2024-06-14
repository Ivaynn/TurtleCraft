# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"

# Save items on this slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",Count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp llama_items[0]
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
