
execute if data storage turtlecraft:tmp {run_line:{A:{value:"x"}}} store result score $counter_operator turtlecraft.tmp run data get entity @s Pos[0] 1
execute if data storage turtlecraft:tmp {run_line:{A:{value:"y"}}} store result score $counter_operator turtlecraft.tmp run data get entity @s Pos[1] 1
execute if data storage turtlecraft:tmp {run_line:{A:{value:"y"}}} run scoreboard players add $counter_operator turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {run_line:{A:{value:"z"}}} store result score $counter_operator turtlecraft.tmp run data get entity @s Pos[2] 1
execute if data storage turtlecraft:tmp {run_line:{A:{value:"r"}}} run function turtlecraft:code/run/instructions/counter/get_rotation
