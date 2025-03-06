# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

execute as @s[tag=turtlecraft.breakpoint] run return run tag @s remove turtlecraft.breakpoint
function turtlecraft:code/pause
scoreboard players set @s turtlecraft.msg 11
scoreboard players set $command turtlecraft.tmp -1
tag @s add turtlecraft.breakpoint
