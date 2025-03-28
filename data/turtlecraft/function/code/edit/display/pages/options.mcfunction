# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 4


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n"


# Header
tellraw @s {"text":" Options\n","color":"dark_aqua"}


# Options
execute if score $auto_mine turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Auto Mine ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Automatically mine blocks in the\nturtle's way when moving","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -601"}}]
execute if score $auto_mine turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Auto Mine ","color":"green","hover_event":{action:"show_text",value:[{"text":"Automatically mine blocks in the\nturtle's way when moving","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -601"}}]

execute if score $error_pause turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Pause On Error ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Pause the turtle when there's an error\nwhile running an instruction","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -602"}}]
execute if score $error_pause turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Pause On Error ","color":"green","hover_event":{action:"show_text",value:[{"text":"Pause the turtle when there's an error\nwhile running an instruction","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -602"}}]

execute if score $turtle_lock turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Locked ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Only the turtle's owner can interact\nwith it. This doesn't lock its inventory","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -603"}}]
execute if score $turtle_lock turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Locked ","color":"green","hover_event":{action:"show_text",value:[{"text":"Only the turtle's owner can interact\nwith it. This doesn't lock its inventory","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -603"}}]

execute if score $auto_fuel turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Auto Fuel ","color":"gray","hover_event":{action:"show_text",value:[{"text":"When the fuel level reaches zero,\nconsume the first fuel item","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -604"}}]
execute if score $auto_fuel turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Auto Fuel ","color":"green","hover_event":{action:"show_text",value:[{"text":"When the fuel level reaches zero,\nconsume the first fuel item","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -604"}}]

execute if score $safe_mine turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Safe Mine ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Stop the turtle from mining important\nblocks and containers, like chests","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -605"}}]
execute if score $safe_mine turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Safe Mine ","color":"green","hover_event":{action:"show_text",value:[{"text":"Stop the turtle from mining important\nblocks and containers, like chests","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -605"}}]

execute if score $show_text turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Show Text ","color":"gray","hover_event":{action:"show_text",value:[{"text":"While running an instruction, display the\nname and line number above the turtle","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -606"}}]
execute if score $show_text turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Show Text ","color":"green","hover_event":{action:"show_text",value:[{"text":"While running an instruction, display the\nname and line number above the turtle","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -606"}}]

execute if score $damage_players turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Damage Players ","color":"gray","hover_event":{action:"show_text",value:[{"text":"The attack instruction can\ndamage and kill players","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -607"}}]
execute if score $damage_players turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Damage Players ","color":"green","hover_event":{action:"show_text",value:[{"text":"The attack instruction can\ndamage and kill players","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -607"}}]

execute if score $clear_counters turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Clear Counters ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Counters are cleared on ","color":"gray"},{"text":"START","color":"dark_green"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -608"}}]
execute if score $clear_counters turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Clear Counters ","color":"green","hover_event":{action:"show_text",value:[{"text":"Counters are cleared on ","color":"gray"},{"text":"START","color":"dark_green"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -608"}}]

execute if score $silent turtlecraft.tmp matches 0 run tellraw @s ["",{"text":" Silent ","color":"gray","hover_event":{action:"show_text",value:[{"text":"Stops the turtle's sounds","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -609"}}]
execute if score $silent turtlecraft.tmp matches 1 run tellraw @s ["",{"text":" Silent ","color":"green","hover_event":{action:"show_text",value:[{"text":"Stops the turtle's sounds","color":"gray"}]},"click_event":{action:"run_command",command:"/trigger TurtleCraft set -609"}}]


# Other
tellraw @s ["\n",{"text":" RESET ","color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -699"},"hover_event":{action:"show_text",value:[{"text":"Clear instructions and reset options","color":"gray"}]}},"  ",{"text":" PICK UP ","color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -698"},"hover_event":{action:"show_text",value:[{"text":"Remove this turtle and drop all items","color":"gray"}]}},"  ",{"text":" EXIT ","color":"red","click_event":{action:"run_command",command:"/trigger TurtleCraft set -697"},"hover_event":{action:"show_text",value:[{"text":"Close this menu","color":"gray"}]}}]


# Tabs
tellraw @s ["\n",{"text":"HOME ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -500"},"hover_event":{action:"show_text",value:[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -206"},"hover_event":{action:"show_text",value:[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"dark_aqua"},{"text":" MORE ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -208"},"hover_event":{action:"show_text",value:[{"text":"Credits and Tutorials","color":"gray"}]}}]
