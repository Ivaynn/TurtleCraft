
# Axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:wooden_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:stone_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:iron_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:golden_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:diamond_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:netherite_axe"}}} if block ~ ~ ~ #turtlecraft:use_tool/axe run function turtlecraft:code/run/instructions/use/tool/axe


# Shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:wooden_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:stone_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:iron_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:golden_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:diamond_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:netherite_shovel"}}} if block ~ ~ ~ #turtlecraft:use_tool/shovel run function turtlecraft:code/run/instructions/use/tool/shovel


# Hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:wooden_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:stone_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:iron_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:golden_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:diamond_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:netherite_hoe"}}} if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe

execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:wooden_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:stone_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:iron_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:golden_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:diamond_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe
execute if data storage turtlecraft:tmp {run_line:{A:{item:"minecraft:netherite_hoe"}}} if block ~ ~ ~ #turtlecraft:air positioned ~ ~-1 ~ if block ~ ~ ~ #turtlecraft:use_tool/hoe run function turtlecraft:code/run/instructions/use/tool/hoe


# Any
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=2] run function turtlecraft:code/run/instructions/use/tool/get_sweet_berries
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=3] run function turtlecraft:code/run/instructions/use/tool/get_sweet_berries
execute if block ~ ~ ~ minecraft:cave_vines_plant[berries=true] run function turtlecraft:code/run/instructions/use/tool/get_glow_berries
execute if block ~ ~ ~ minecraft:cave_vines[berries=true] run function turtlecraft:code/run/instructions/use/tool/get_glow_berries
