# Executed by turtlecraft.body

function turtlecraft:entity/tag_entities
execute as @s[tag=turtlecraft.body] run function turtlecraft:entity/update
tag @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] remove turtlecraft.tmp
