execute unless score $silent tc.tmp matches 1 run playsound minecraft:item.axe.scrape neutral @a ~ ~ ~ 1 1

execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~0.55 ~ ~ 0 0.25 0.25 0.1 5 normal @a
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~-0.55 ~ ~ 0 0.25 0.25 0.1 5 normal @a
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~ ~0.55 ~ 0.25 0 0.25 0.1 5 normal @a
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~ ~-0.55 ~ 0.25 0 0.25 0.1 5 normal @a
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~ ~ ~0.55 0.25 0.25 0 0.1 5 normal @a
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:scrape ~ ~ ~-0.55 0.25 0.25 0 0.1 5 normal @a

execute if block ~ ~ ~ minecraft:exposed_copper run setblock ~ ~ ~ minecraft:copper_block
execute if block ~ ~ ~ minecraft:weathered_copper run setblock ~ ~ ~ minecraft:exposed_copper
execute if block ~ ~ ~ minecraft:oxidized_copper run setblock ~ ~ ~ minecraft:weathered_copper

execute if block ~ ~ ~ minecraft:exposed_cut_copper run setblock ~ ~ ~ minecraft:cut_copper
execute if block ~ ~ ~ minecraft:weathered_cut_copper run setblock ~ ~ ~ minecraft:exposed_cut_copper
execute if block ~ ~ ~ minecraft:oxidized_cut_copper run setblock ~ ~ ~ minecraft:weathered_cut_copper

execute if block ~ ~ ~ minecraft:exposed_chiseled_copper run setblock ~ ~ ~ minecraft:chiseled_copper
execute if block ~ ~ ~ minecraft:weathered_chiseled_copper run setblock ~ ~ ~ minecraft:exposed_chiseled_copper
execute if block ~ ~ ~ minecraft:oxidized_chiseled_copper run setblock ~ ~ ~ minecraft:weathered_chiseled_copper

execute if block ~ ~ ~ minecraft:exposed_copper_bulb run setblock ~ ~ ~ minecraft:copper_bulb
execute if block ~ ~ ~ minecraft:weathered_copper_bulb run setblock ~ ~ ~ minecraft:exposed_copper_bulb
execute if block ~ ~ ~ minecraft:oxidized_copper_bulb run setblock ~ ~ ~ minecraft:weathered_copper_bulb

execute if block ~ ~ ~ minecraft:exposed_copper_grate run setblock ~ ~ ~ minecraft:copper_grate
execute if block ~ ~ ~ minecraft:weathered_copper_grate run setblock ~ ~ ~ minecraft:exposed_copper_grate
execute if block ~ ~ ~ minecraft:oxidized_copper_grate run setblock ~ ~ ~ minecraft:weathered_copper_grate

execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=bottom,waterlogged=false] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=bottom,waterlogged=false]
execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=top,waterlogged=false] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=top,waterlogged=false]
execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=double,waterlogged=false] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=double,waterlogged=false]
execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=bottom,waterlogged=true] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=bottom,waterlogged=true]
execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=top,waterlogged=true] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=top,waterlogged=true]
execute if block ~ ~ ~ minecraft:exposed_cut_copper_slab[type=double,waterlogged=true] run setblock ~ ~ ~ minecraft:cut_copper_slab[type=double,waterlogged=true]

execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=bottom,waterlogged=false] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=bottom,waterlogged=false]
execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=top,waterlogged=false] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=top,waterlogged=false]
execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=double,waterlogged=false] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=double,waterlogged=false]
execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=bottom,waterlogged=true] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=bottom,waterlogged=true]
execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=top,waterlogged=true] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=top,waterlogged=true]
execute if block ~ ~ ~ minecraft:weathered_cut_copper_slab[type=double,waterlogged=true] run setblock ~ ~ ~ minecraft:exposed_cut_copper_slab[type=double,waterlogged=true]

execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=bottom,waterlogged=false] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=bottom,waterlogged=false]
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=top,waterlogged=false] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=top,waterlogged=false]
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=double,waterlogged=false] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=double,waterlogged=false]
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=bottom,waterlogged=true] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=bottom,waterlogged=true]
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=top,waterlogged=true] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=top,waterlogged=true]
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_slab[type=double,waterlogged=true] run setblock ~ ~ ~ minecraft:weathered_cut_copper_slab[type=double,waterlogged=true]

execute if block ~ ~ ~ minecraft:exposed_cut_copper_stairs run function tc:code/run/instructions/use/tool/replace_copper/scrape_stairs_exposed
execute if block ~ ~ ~ minecraft:weathered_cut_copper_stairs run function tc:code/run/instructions/use/tool/replace_copper/scrape_stairs_weathered
execute if block ~ ~ ~ minecraft:oxidized_cut_copper_stairs run function tc:code/run/instructions/use/tool/replace_copper/scrape_stairs_oxidized
