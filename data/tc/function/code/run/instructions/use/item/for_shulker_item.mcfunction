
# This is needed because the structure is different for the item's "container" component and the block's "Items" nbt
# If a future update fixes this issue, then this function won't be necessary

# Item structure:  {item:{count:1,id:"minecraft:air",components:{}},slot:0}
# Block structure: {count:1,id:"minecraft:air",components:{},Slot:0b}

data modify storage tc:tmp shulker_item set value {count:0,id:"minecraft:air",components:{},Slot:0b}

data modify storage tc:tmp shulker_item.count set from storage tc:tmp llama_items[-1].components."minecraft:container"[-1].item.count
data modify storage tc:tmp shulker_item.id set from storage tc:tmp llama_items[-1].components."minecraft:container"[-1].item.id
data modify storage tc:tmp shulker_item.components set from storage tc:tmp llama_items[-1].components."minecraft:container"[-1].item.components

data modify storage tc:tmp shulker_item.Slot set from storage tc:tmp llama_items[-1].components."minecraft:container"[-1].slot

data modify block ~ ~ ~ Items append from storage tc:tmp shulker_item

data remove storage tc:tmp shulker_item


# Next item
data remove storage tc:tmp llama_items[-1].components."minecraft:container"[-1]
execute if data storage tc:tmp llama_items[-1].components."minecraft:container"[-1] run function tc:code/run/instructions/use/item/for_shulker_item
