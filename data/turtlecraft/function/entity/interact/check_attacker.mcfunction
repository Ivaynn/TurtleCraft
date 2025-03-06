# This function is triggered by an advancement


execute on attacker if entity @s[tag=turtlecraft.player] run scoreboard players set $this_player turtlecraft.tmp 1
execute if score $this_player turtlecraft.tmp matches 1 unless data entity @s {HurtTime:0s} run function turtlecraft:entity/interact/init
scoreboard players reset $this_player turtlecraft.tmp
