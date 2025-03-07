#tellraw @a {"text":"> Reloaded!"}
gamerule maxCommandChainLength 1000000000


# Reset advancement triggers
advancement revoke @a only turtlecraft:hurt_turtle


# Do this for every dimension - Blocks at [10028 0 10028] and [10028 1 10028] will be replaced with bedrock
function turtlecraft:forceload


# Scores
scoreboard objectives add turtlecraft.id dummy
scoreboard objectives add turtlecraft.update_id dummy
scoreboard objectives add turtlecraft.line dummy
scoreboard objectives add turtlecraft.timer dummy
scoreboard objectives add turtlecraft.fuel dummy
scoreboard objectives add TurtleCraft trigger {"text":"Turtle Trigger"}
scoreboard objectives add turtlecraft.tmp dummy
scoreboard objectives add turtlecraft.relog minecraft.custom:minecraft.leave_game
scoreboard objectives add turtlecraft.msg dummy
scoreboard objectives add turtlecraft.page dummy
scoreboard objectives add turtlecraft.numpad dummy
scoreboard objectives add turtlecraft.version dummy
execute unless score $invalid_count turtlecraft.id matches 0.. run scoreboard players set $invalid_count turtlecraft.id 0


# Math
scoreboard objectives add turtlecraft.math dummy
scoreboard players set #_1 turtlecraft.math -1
scoreboard players set #2 turtlecraft.math 2
scoreboard players set #5 turtlecraft.math 5
scoreboard players set #10 turtlecraft.math 10
scoreboard players set #20 turtlecraft.math 20
scoreboard players set #25 turtlecraft.math 25
scoreboard players set #80 turtlecraft.math 80
scoreboard players set #90 turtlecraft.math 90
scoreboard players set #100 turtlecraft.math 100
scoreboard players set #10000 turtlecraft.math 10000
scoreboard players set #1000000 turtlecraft.math 1000000


# Options
scoreboard objectives add turtlecraft.options dummy {"text":"Options"}
execute unless score #run turtlecraft.options matches 1 run tellraw @a ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"TurtleCraft data pack installed!\n","color":"gray"}]
scoreboard players set #run turtlecraft.options 1
function turtlecraft:options/pages/update
