playsound minecraft:item.hoe.till neutral @a ~ ~ ~ 1 1

execute if block ~ ~ ~ minecraft:dirt if block ~ ~1 ~ #tc:air run setblock ~ ~ ~ minecraft:farmland
execute if block ~ ~ ~ minecraft:grass_block if block ~ ~1 ~ #tc:air run setblock ~ ~ ~ minecraft:farmland
execute if block ~ ~ ~ minecraft:dirt_path if block ~ ~1 ~ #tc:air run setblock ~ ~ ~ minecraft:farmland

execute if block ~ ~ ~ minecraft:coarse_dirt if block ~ ~1 ~ #tc:air run setblock ~ ~ ~ minecraft:dirt

execute if block ~ ~ ~ minecraft:rooted_dirt run function tc:code/run/instructions/use/tool/get_roots
execute if block ~ ~ ~ minecraft:rooted_dirt run setblock ~ ~ ~ minecraft:dirt
