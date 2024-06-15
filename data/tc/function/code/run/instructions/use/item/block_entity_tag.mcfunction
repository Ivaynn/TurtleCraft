
# Common
execute if data storage tc:tmp llama_items[-1].components."minecraft:custom_name" run data modify block ~ ~ ~ CustomName set from storage tc:tmp llama_items[-1].components."minecraft:custom_name"

# Shulker box items
execute if data storage tc:tmp llama_items[-1].components."minecraft:container" run function tc:code/run/instructions/use/item/for_shulker_item

# Banner patterns
execute if data storage tc:tmp llama_items[-1].components."minecraft:banner_patterns" run data modify block ~ ~ ~ patterns set from storage tc:tmp llama_items[-1].components."minecraft:banner_patterns"

# Beehive bees
execute if data storage tc:tmp llama_items[-1].components."minecraft:bees" run data modify block ~ ~ ~ bees set from storage tc:tmp llama_items[-1].components."minecraft:bees"

# Skull owner
execute if data storage tc:tmp llama_items[-1].components."minecraft:profile" run data modify block ~ ~ ~ profile set from storage tc:tmp llama_items[-1].components."minecraft:profile"
