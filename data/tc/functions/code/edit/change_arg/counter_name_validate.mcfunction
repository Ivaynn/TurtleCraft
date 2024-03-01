# Executed by the player. All turtle components have tag "tc.tmp"


data modify storage tc:tmp book.return set from storage tc:tmp counter_name.name
function tc:code/edit/change_arg/book/validate
data modify storage tc:tmp counter_name.name set from storage tc:tmp book.return
