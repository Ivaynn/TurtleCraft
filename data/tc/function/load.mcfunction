#tellraw @a {"text":"> Reloaded!"}
gamerule maxCommandChainLength 1000000000


# Reset advancement triggers
advancement revoke @a only tc:hurt_turtle


# Do this for every dimension - Blocks at [10028 0 10028] and [10028 1 10028] will be replaced with bedrock
function tc:forceload


# Scores
scoreboard objectives add tc.id dummy
scoreboard objectives add tc.update_id dummy
scoreboard objectives add tc.line dummy
scoreboard objectives add tc.timer dummy
scoreboard objectives add tc.fuel dummy
scoreboard objectives add tc.trigger trigger {"text":"Turtle Trigger"}
scoreboard objectives add tc.tmp dummy
scoreboard objectives add tc.relog minecraft.custom:minecraft.leave_game
scoreboard objectives add tc.msg dummy
scoreboard objectives add tc.page dummy
scoreboard objectives add tc.numpad dummy
scoreboard objectives add tc.version dummy
execute unless score $invalid_count tc.id matches 0.. run scoreboard players set $invalid_count tc.id 0


# Math
scoreboard objectives add tc.math dummy
scoreboard players set #_1 tc.math -1
scoreboard players set #2 tc.math 2
scoreboard players set #5 tc.math 5
scoreboard players set #10 tc.math 10
scoreboard players set #20 tc.math 20
scoreboard players set #25 tc.math 25
scoreboard players set #80 tc.math 80
scoreboard players set #90 tc.math 90
scoreboard players set #100 tc.math 100
scoreboard players set #10000 tc.math 10000
scoreboard players set #1000000 tc.math 1000000


# Options
scoreboard objectives add tc.options dummy {"text":"Options"}
execute unless score #run tc.options matches 1 run tellraw @a ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"TurtleCraft data pack installed!\n","color":"gray"}]
scoreboard players set #run tc.options 1
function tc:options/pages/update
