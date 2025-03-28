# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 5


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n"

tellraw @s ["\n                ",{"text":"TurtleCraft","color":"dark_aqua"}]
tellraw @s ["\n       ",{"text":"Data pack made by ","color":"gray"},{"text":"Ivaynn","color":"dark_aqua","hover_event":{action:"show_text",value:[{"text":"Check the links below\nfor contact information","color":"gray"}]}}]

tellraw @s {"text":"\n\n           Links and Tutorials","color":"dark_aqua"}
tellraw @s ["\n  ",{"text":"Source","color":"gray","underlined": true,"click_event":{action:"open_url","url":"https://github.com/Ivaynn/TurtleCraft"},"hover_event":{action:"show_text",value:[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"Documentation","color":"gray","underlined": true,"click_event":{action:"open_url","url":"https://github.com/Ivaynn/TurtleCraft/wiki"},"hover_event":{action:"show_text",value:[{"text":"Click to open link","color":"gray"}]}},{"text":" - ","color":"dark_gray"},{"text":"Discord","color":"gray","underlined": true,"click_event":{action:"open_url","url":"https://discord.gg/QAtc7ZgPxS"},"hover_event":{action:"show_text",value:[{"text":"Click to open link","color":"gray"}]}}]


# Tabs
tellraw @s ["\n\n",{"text":"HOME ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -100"},"hover_event":{action:"show_text",value:[{"text":"Home Page","color":"gray"}]}},{"text":" EDIT ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -500"},"hover_event":{action:"show_text",value:[{"text":"Edit Saved Instructions","color":"gray"}]}},{"text":" COUNTERS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -206"},"hover_event":{action:"show_text",value:[{"text":"Show List of Counters","color":"gray"}]}},{"text":" OPTIONS ","color":"aqua","click_event":{action:"run_command",command:"/trigger TurtleCraft set -207"},"hover_event":{action:"show_text",value:[{"text":"Other Options","color":"gray"}]}},{"text":" MORE ","color":"dark_aqua"}]
