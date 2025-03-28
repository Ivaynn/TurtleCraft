execute store result score char turtlecraft.tmp run data get storage turtlecraft:tmp commands[0].id."text"
scoreboard players operation chars turtlecraft.tmp += char turtlecraft.tmp
scoreboard players reset char turtlecraft.tmp

execute if score chars turtlecraft.tmp matches 40.. run data modify storage turtlecraft:tmp torender append value []
execute if score chars turtlecraft.tmp matches 40.. run scoreboard players reset chars turtlecraft.tmp

data modify storage turtlecraft:tmp torender[-1] append from storage turtlecraft:tmp commands[0].id
data remove storage turtlecraft:tmp commands[0]
data remove storage turtlecraft:tmp torender[-1][-1]."clickEvent"

data modify storage turtlecraft:tmp torender[-1] append value {"text":"  "}
scoreboard players add chars turtlecraft.tmp 2

execute if data storage turtlecraft:tmp commands[0] run function turtlecraft:block/message/commands