# Executed by turtlecraft.body when its timer hits the threshold, if action limit wasn't reached

scoreboard players add $action_count turtlecraft.tmp 1
scoreboard players set @s turtlecraft.timer 0

# Tag attached entities and run
function turtlecraft:entity/tag_entities
function turtlecraft:code/run
tag @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] remove turtlecraft.tmp
