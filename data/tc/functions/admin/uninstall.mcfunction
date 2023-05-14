# Admin function - executed by player directly at any time

tellraw @s ["",{"text":"\n WARNING: ","color":"red"},{"text":"doing this will stop the data pack and remove every turtle in loaded chunks! Are you sure? ","color":"gray"},{"text":"Yes","color":"red","clickEvent":{"action":"run_command","value":"/function tc:uninstall"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click here to uninstall","color":"gray"}]}},"\n"]
