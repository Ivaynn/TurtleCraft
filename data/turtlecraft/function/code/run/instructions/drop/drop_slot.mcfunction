# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"

# Insert items from this slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp llama_items[0]
loot spawn ~ ~ ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Play sound
execute unless score $silent turtlecraft.tmp matches 1 unless score $sound_played turtlecraft.tmp matches 1 run playsound minecraft:block.dispenser.dispense neutral @a ~ ~ ~ 1 1.5
scoreboard players set $sound_played turtlecraft.tmp 1
