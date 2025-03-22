data modify storage turtlecraft:tmp torender append from storage turtlecraft:tmp commands[0].id
data remove storage turtlecraft:tmp commands[0]
data remove storage turtlecraft:tmp torender[-1]."hoverEvent"

data modify storage turtlecraft:tmp torender append value {"text":" "}

execute if data storage turtlecraft:tmp commands[0] run function turtlecraft:block/message/commands