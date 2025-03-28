# Admin function - executed by player directly at any time

tellraw @s ["",{"text":"\n WARNING: ","color":"red"},{"text":"doing this will stop the data pack and remove every turtle in loaded chunks! Are you sure? ","color":"gray"},{"text":"Yes","color":"red","click_event":{action:"run_command",command:"/function turtlecraft:uninstall"},"hover_event":{action:"show_text",value:[{"text":"Click here to uninstall","color":"gray"}]}},"\n"]
