
execute if block ~ ~ ~ #tc:use_tool/make_path run playsound minecraft:item.shovel.flatten neutral @a ~ ~ ~ 1 1
execute if block ~ ~ ~ #tc:use_tool/make_path run setblock ~ ~ ~ minecraft:dirt_path

execute if block ~ ~ ~ minecraft:campfire[lit=true] run playsound minecraft:block.fire.extinguish neutral @a ~ ~ ~ 1 1
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true] run playsound minecraft:block.fire.extinguish neutral @a ~ ~ ~ 1 1
execute if block ~ ~ ~ minecraft:campfire[lit=true] align xyz run particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.15 0 0.15 0.02 10 normal @a
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true] align xyz run particle minecraft:smoke ~0.5 ~0.5 ~0.5 0.15 0 0.15 0.02 10 normal @a

execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=east,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=east,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=east,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=east,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=north,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=north,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=north,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=north,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=south,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=south,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=south,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=south,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=west,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=west,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=west,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:campfire[lit=true,facing=west,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=false,waterlogged=false]

execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=east,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=east,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=east,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=east,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=east,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=north,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=north,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=north,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=north,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=north,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=south,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=south,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=south,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=south,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=south,signal_fire=false,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=west,signal_fire=true,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=true,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=west,signal_fire=false,waterlogged=true] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=false,waterlogged=true]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=west,signal_fire=true,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=true,waterlogged=false]
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true,facing=west,signal_fire=false,waterlogged=false] run setblock ~ ~ ~ minecraft:campfire[lit=false,facing=west,signal_fire=false,waterlogged=false]
