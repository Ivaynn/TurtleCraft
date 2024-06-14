# Executed by tc.body

function tc:entity/tag_entities
execute as @s[tag=tc.body] run function tc:entity/update
tag @e[type=#tc:turtle_parts,tag=tc.turtle] remove tc.tmp
