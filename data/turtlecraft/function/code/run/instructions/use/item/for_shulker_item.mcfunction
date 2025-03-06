
# This is needed because the structure is different for the item's "container" component and the block's "Items" nbt
# If a future update fixes this issue, then this function won't be necessary

# Item structure:  {item:{count:1,id:"minecraft:air",components:{}},slot:0}
# Block structure: {count:1,id:"minecraft:air",components:{},Slot:0b}

data modify storage turtlecraft:tmp shulker_item set value {count:0,id:"minecraft:air",components:{},Slot:0b}

data modify storage turtlecraft:tmp shulker_item.count set from storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1].item.count
data modify storage turtlecraft:tmp shulker_item.id set from storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1].item.id
data modify storage turtlecraft:tmp shulker_item.components set from storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1].item.components

data modify storage turtlecraft:tmp shulker_item.Slot set from storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1].slot

data modify block ~ ~ ~ Items append from storage turtlecraft:tmp shulker_item

data remove storage turtlecraft:tmp shulker_item


# Next item
data remove storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1]
execute if data storage turtlecraft:tmp llama_items[-1].components."minecraft:container"[-1] run function turtlecraft:code/run/instructions/use/item/for_shulker_item
