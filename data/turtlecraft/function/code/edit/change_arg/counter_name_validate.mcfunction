# Executed by the player. All turtle components have tag "turtlecraft.tmp"


data modify storage turtlecraft:tmp book.return set from storage turtlecraft:tmp counter_name.name
function turtlecraft:code/edit/change_arg/book/validate
data modify storage turtlecraft:tmp counter_name.name set from storage turtlecraft:tmp book.return
