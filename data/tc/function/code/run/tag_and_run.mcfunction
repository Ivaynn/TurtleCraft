# Executed by tc.body when its timer hits the threshold, if action limit wasn't reached

scoreboard players add $action_count tc.tmp 1
scoreboard players set @s tc.timer 0

# Tag attached entities and run
function tc:entity/tag_entities
function tc:code/run
tag @e[type=#tc:turtle_parts,tag=tc.turtle] remove tc.tmp
