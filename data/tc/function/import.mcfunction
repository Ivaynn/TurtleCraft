#   To add a new program to the list, follow the examples below
#
#   Numbers should be positive and greater than 1
#
#   To load the instructions in game, hold a disc and run:
#
#      /trigger tc.trigger set <number>
#
#   Replace <number> with the one you want to load


# Mine a rectangle in a line pattern, with specified length, width and height
execute if score @s tc.trigger matches 1 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 7, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 1"}, C: 90}, {A: {comment: "Digs a rectangular hole with a"}, C: 90}, {A: {comment: "specified size in a line pattern"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "length", type: "value", operation: "=", value: 8}, C: 91}, {A: {name: "width", type: "value", operation: "=", value: 8}, C: 91}, {A: {name: "height", type: "value", operation: "=", value: 64}, C: 91}, {A: {comment: "Program start"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "length", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {condition: "counter", name: "width", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {condition: "counter", name: "height", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "mine 1 or 2 rows"}, C: 90}, {A: {name: "dy", type: "counter", operation: "=", value: "width"}, C: 91}, {A: {comment: ""}, C: 90}, {A: {name: "dx", type: "counter", operation: "=", value: "length"}, C: 91}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "dx", type: "value", operation: "<", value: 1}, C: 92}, {A: {line: 30, operation: "set"}, C: 95}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {direction: "left"}, C: 2}, {A: {name: "dy", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "dy", type: "value", operation: ">", value: 0}, C: 92}, {A: {direction: "forward"}, C: 1}, {A: {direction: "left"}, C: 2}, {A: {name: "dx", type: "value", operation: "+=", value: 1}, C: 91}, {A: {condition: "counter", name: "dx", type: "counter", operation: ">=", value: "length"}, C: 92}, {A: {line: 41, operation: "set"}, C: 95}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: "prepare the next 2 rows"}, C: 90}, {A: {name: "dy", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "dy", type: "value", operation: "<", value: 1}, C: 92}, {A: {line: 51, operation: "set"}, C: 95}, {A: {direction: "right"}, C: 2}, {A: {direction: "forward"}, C: 1}, {A: {direction: "right"}, C: 2}, {A: {line: 23, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "return to starting position"}, C: 90}, {A: {direction: "left"}, C: 2}, {A: {name: "dy", type: "value", operation: "=", value: 0}, C: 91}, {A: {name: "dy", type: "value", operation: "+=", value: 1}, C: 91}, {A: {condition: "counter", name: "dy", type: "counter", operation: ">=", value: "width"}, C: 92}, {A: {line: 61, operation: "set"}, C: 95}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "next layer"}, C: 90}, {A: {direction: "left"}, C: 2}, {A: {name: "height", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "height", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {direction: "down"}, C: 1}, {A: {line: 21, operation: "set"}, C: 95}]

# Plant an oak sapling, wait for oak log, break the logs above until there's none, return to the starting position and restart
execute if score @s tc.trigger matches 2 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 11, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 2"}, C: 90}, {A: {comment: "Plants an oak sapling, waits for"}, C: 90}, {A: {comment: "it to grow and collects its wood"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "plant the sapling and wait..."}, C: 90}, {A: {comment: ""}, C: 90}, {A: {item: "minecraft:oak_sapling"}, C: 8}, {A: {condition: "block", block: "air", direction: "forward"}, C: 92}, {A: {item: "minecraft:oak_sapling", direction: "forward"}, C: 5}, {C: 96}, {A: {condition: "block", block: "minecraft:oak_log", direction: "forward"}, C: 92}, {A: {line: 22, operation: "set"}, C: 95}, {A: {line: 12, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "collect the wood"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {direction: "forward"}, C: 1}, {A: {name: "height", type: "value", operation: "=", value: 0}, C: 91}, {A: {condition: "block", block: "minecraft:oak_log", direction: "up"}, C: 93}, {A: {line: 32, operation: "set"}, C: 95}, {A: {direction: "up"}, C: 1}, {A: {name: "height", type: "value", operation: "+=", value: 1}, C: 91}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "return to starting position and restart"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {direction: "down"}, C: 1}, {A: {name: "height", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "height", type: "value", operation: ">=", value: 1}, C: 92}, {A: {line: 3, operation: "remove"}, C: 95}, {A: {direction: "back"}, C: 1}, {A: {line: 12, operation: "set"}, C: 95}]

# Build a carrot farm and maintain it. Requires an equipped hoe, carrots and dirt. Water must be placed manually around it
execute if score @s tc.trigger matches 3 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 8, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 3"}, C: 90}, {A: {comment: "Build and maintain a carrot farm"}, C: 90}, {A: {comment: "with a specified size"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "length", type: "value", operation: "=", value: 2}, C: 91}, {A: {name: "width", type: "value", operation: "=", value: 4}, C: 91}, {A: {condition: "counter", name: "length", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {condition: "counter", name: "width", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {direction: "up"}, C: 1}, {A: {name: "x", type: "value", operation: "=", value: 1}, C: 91}, {A: {name: "y", type: "value", operation: "=", value: 1}, C: 91}, {A: {condition: "block", block: "minecraft:carrot", direction: "down"}, C: 92}, {A: {line: 31, operation: "set"}, C: 95}, {A: {line: 21, operation: "set"}, C: 95}, {A: {comment: "Fix broken farm block"}, C: 90}, {A: {direction: "down"}, C: 1}, {A: {direction: "down"}, C: 3}, {A: {item: "minecraft:dirt", direction: "down"}, C: 5}, {A: {item: "tool", direction: "down"}, C: 5}, {A: {direction: "up"}, C: 1}, {A: {item: "minecraft:carrot", direction: "down"}, C: 5}, {A: {line: 33, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Move x"}, C: 90}, {A: {direction: "down"}, C: 10}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "x", type: "counter", operation: ">=", value: "length"}, C: 92}, {A: {line: 41, operation: "set"}, C: 95}, {A: {name: "x", type: "value", operation: "+=", value: 1}, C: 91}, {A: {direction: "forward"}, C: 1}, {A: {line: 17, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Return x"}, C: 90}, {A: {condition: "counter", name: "x", type: "value", operation: "<=", value: 1}, C: 92}, {A: {line: 51, operation: "set"}, C: 95}, {A: {name: "x", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "back"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Move y"}, C: 90}, {A: {condition: "counter", name: "y", type: "counter", operation: ">=", value: "width"}, C: 92}, {A: {line: 61, operation: "set"}, C: 95}, {A: {name: "y", type: "value", operation: "+=", value: 1}, C: 91}, {A: {direction: "left"}, C: 2}, {A: {direction: "forward"}, C: 1}, {A: {direction: "right"}, C: 2}, {A: {line: 17, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Return y"}, C: 90}, {A: {direction: "right"}, C: 2}, {A: {condition: "counter", name: "y", type: "value", operation: "<=", value: 1}, C: 92}, {A: {line: 5, operation: "add"}, C: 95}, {A: {name: "y", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {direction: "left"}, C: 2}, {A: {line: 17, operation: "set"}, C: 95}]

# Dance! - Generate a random number between 1 and 6 and choose a move/turn direction based on the result
execute if score @s tc.trigger matches 4 run data modify storage tc:tmp import set value [{PauseOnError: 0b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 0b, DamagePlayers: 0b}, {A: {line: 10, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 4"}, C: 90}, {A: {comment: "Dance!"}, C: 90}, {A: {comment: "Move in random directions"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "direction", type: "random", operation: "=", value: 6}, C: 91}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 1}, C: 92}, {A: {direction: "forward"}, C: 1}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 2}, C: 92}, {A: {direction: "back"}, C: 1}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 3}, C: 92}, {A: {direction: "left"}, C: 1}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 4}, C: 92}, {A: {direction: "right"}, C: 1}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 5}, C: 92}, {A: {direction: "left"}, C: 2}, {A: {condition: "counter", name: "direction", type: "value", operation: "=", value: 6}, C: 92}, {A: {direction: "right"}, C: 2}, {A: {line: 10, operation: "set"}, C: 95}]

# Travel to a defined position Y > Z > X
execute if score @s tc.trigger matches 5 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 7, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 5"}, C: 90}, {A: {comment: "Moves to a set position X/Y/Z"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "x", type: "value", operation: "=", value: 0}, C: 91}, {A: {name: "y", type: "value", operation: "=", value: 0}, C: 91}, {A: {name: "z", type: "value", operation: "=", value: 0}, C: 91}, {A: {comment: "Find distance to target position"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "dx", type: "pos", operation: "=", value: "x"}, C: 91}, {A: {name: "dy", type: "pos", operation: "=", value: "y"}, C: 91}, {A: {name: "dz", type: "pos", operation: "=", value: "z"}, C: 91}, {A: {name: "dx", type: "counter", operation: "-=", value: "x"}, C: 91}, {A: {name: "dy", type: "counter", operation: "-=", value: "y"}, C: 91}, {A: {name: "dz", type: "counter", operation: "-=", value: "z"}, C: 91}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Face south, r = 2"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "r", type: "pos", operation: "=", value: "r"}, C: 91}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "r", type: "value", operation: "=", value: 0}, C: 92}, {A: {direction: "back"}, C: 2}, {A: {condition: "counter", name: "r", type: "value", operation: "=", value: 1}, C: 92}, {A: {direction: "right"}, C: 2}, {A: {condition: "counter", name: "r", type: "value", operation: "=", value: 3}, C: 92}, {A: {direction: "left"}, C: 2}, {A: {comment: "Move Y: up/down"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dy", type: "value", operation: "<", value: 0}, C: 92}, {A: {line: 40, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dy", type: "value", operation: ">", value: 0}, C: 92}, {A: {line: 45, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {line: 50, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dy", type: "value", operation: "=", value: 0}, C: 92}, {A: {line: 50, operation: "set"}, C: 95}, {A: {name: "dy", type: "value", operation: "+=", value: 1}, C: 91}, {A: {direction: "up"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {condition: "counter", name: "dy", type: "value", operation: "=", value: 0}, C: 92}, {A: {line: 50, operation: "set"}, C: 95}, {A: {name: "dy", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "down"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: "Move Z: south/north"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dz", type: "value", operation: "<", value: 0}, C: 92}, {A: {line: 60, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dz", type: "value", operation: ">", value: 0}, C: 92}, {A: {line: 65, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {line: 70, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dz", type: "value", operation: "=", value: 0}, C: 92}, {A: {line: 70, operation: "set"}, C: 95}, {A: {name: "dz", type: "value", operation: "+=", value: 1}, C: 91}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {condition: "counter", name: "dz", type: "value", operation: "=", value: 0}, C: 92}, {A: {line: 70, operation: "set"}, C: 95}, {A: {name: "dz", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "back"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: "Move X: east/west"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dx", type: "value", operation: "<", value: 0}, C: 92}, {A: {line: 80, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dx", type: "value", operation: ">", value: 0}, C: 92}, {A: {line: 85, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {C: 98}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "dx", type: "value", operation: "=", value: 0}, C: 92}, {C: 98}, {A: {name: "dx", type: "value", operation: "+=", value: 1}, C: 91}, {A: {direction: "left"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {condition: "counter", name: "dx", type: "value", operation: "=", value: 0}, C: 92}, {C: 98}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "right"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}]

# Mine a rectangle in a spiral pattern, with specified length, width and height. Due to its complexity, it's slightly slower than tc.trigger 1
execute if score @s tc.trigger matches 6 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 7, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 6"}, C: 90}, {A: {comment: "Digs a rectangular hole with a"}, C: 90}, {A: {comment: "specified size in a spiral pattern"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "length", type: "value", operation: "=", value: 16}, C: 91}, {A: {name: "width", type: "value", operation: "=", value: 16}, C: 91}, {A: {name: "height", type: "value", operation: "=", value: 400}, C: 91}, {A: {comment: "Program start"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "length", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {condition: "counter", name: "width", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {condition: "counter", name: "height", type: "value", operation: "<", value: 1}, C: 92}, {C: 98}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "x", type: "counter", operation: "=", value: "length"}, C: 91}, {A: {name: "y", type: "counter", operation: "=", value: "width"}, C: 91}, {A: {name: "r", type: "value", operation: "=", value: 1}, C: 91}, {A: {name: "y", type: "value", operation: "-=", value: 1}, C: 91}, {A: {comment: ""}, C: 90}, {A: {name: "dx", type: "counter", operation: "=", value: "x"}, C: 91}, {A: {condition: "counter", name: "r", type: "value", operation: "=", value: 1}, C: 92}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "r", type: "value", operation: "=", value: -1}, C: 92}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "r", type: "value", operation: ">", value: 0}, C: 92}, {A: {name: "x", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "r", type: "value", operation: "<", value: 0}, C: 92}, {A: {name: "x", type: "value", operation: "+=", value: 1}, C: 91}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "x", type: "value", operation: "<", value: 0}, C: 92}, {A: {line: 91, operation: "set"}, C: 95}, {A: {condition: "counter", name: "x", type: "counter", operation: ">", value: "length"}, C: 92}, {A: {line: 107, operation: "set"}, C: 95}, {A: {comment: "move x"}, C: 90}, {A: {condition: "counter", name: "dx", type: "value", operation: "<", value: 1}, C: 92}, {A: {line: 51, operation: "set"}, C: 95}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "turn x"}, C: 90}, {A: {condition: "counter", name: "r", type: "value", operation: ">", value: 0}, C: 92}, {A: {direction: "left"}, C: 2}, {A: {condition: "counter", name: "r", type: "value", operation: "<", value: 0}, C: 92}, {A: {direction: "right"}, C: 2}, {A: {line: 60, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "dy", type: "counter", operation: "=", value: "y"}, C: 91}, {A: {condition: "counter", name: "r", type: "value", operation: ">", value: 0}, C: 92}, {A: {name: "y", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "r", type: "value", operation: "<", value: 0}, C: 92}, {A: {name: "y", type: "value", operation: "+=", value: 1}, C: 91}, {A: {comment: ""}, C: 90}, {A: {condition: "counter", name: "y", type: "value", operation: "<", value: 0}, C: 92}, {A: {line: 91, operation: "set"}, C: 95}, {A: {condition: "counter", name: "y", type: "counter", operation: ">", value: "width"}, C: 92}, {A: {line: 107, operation: "set"}, C: 95}, {A: {comment: "move y"}, C: 90}, {A: {condition: "counter", name: "dy", type: "value", operation: "<", value: 1}, C: 92}, {A: {line: 81, operation: "set"}, C: 95}, {A: {name: "dy", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "forward"}, C: 1}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "turn y"}, C: 90}, {A: {condition: "counter", name: "r", type: "value", operation: ">", value: 0}, C: 92}, {A: {direction: "left"}, C: 2}, {A: {condition: "counter", name: "r", type: "value", operation: "<", value: 0}, C: 92}, {A: {direction: "right"}, C: 2}, {A: {name: "r", type: "value", operation: "+=", value: 1}, C: 91}, {A: {comment: ""}, C: 90}, {A: {line: 25, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "in -> out"}, C: 90}, {A: {direction: "left"}, C: 2}, {A: {name: "height", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "height", type: "value", operation: "<=", value: 0}, C: 92}, {C: 98}, {A: {comment: ""}, C: 90}, {A: {direction: "down"}, C: 1}, {A: {name: "odd", type: "counter", operation: "=", value: "r"}, C: 91}, {A: {name: "odd", type: "value", operation: "%=", value: 2}, C: 91}, {A: {name: "r", type: "value", operation: "*=", value: -1}, C: 91}, {A: {name: "x", type: "value", operation: "+=", value: 1}, C: 91}, {A: {name: "y", type: "value", operation: "+=", value: 2}, C: 91}, {A: {condition: "counter", name: "odd", type: "value", operation: "=", value: 0}, C: 92}, {A: {line: 25, operation: "set"}, C: 95}, {A: {line: 60, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "out -> in"}, C: 90}, {A: {name: "dx", type: "counter", operation: "=", value: "length"}, C: 91}, {A: {condition: "counter", name: "dx", type: "value", operation: "<", value: 2}, C: 92}, {A: {line: 4, operation: "add"}, C: 95}, {A: {direction: "forward"}, C: 1}, {A: {name: "dx", type: "value", operation: "-=", value: 1}, C: 91}, {A: {line: 4, operation: "remove"}, C: 95}, {A: {name: "height", type: "value", operation: "-=", value: 1}, C: 91}, {A: {direction: "right"}, C: 2}, {A: {direction: "right"}, C: 2}, {A: {condition: "counter", name: "height", type: "value", operation: "<=", value: 0}, C: 92}, {C: 98}, {A: {direction: "down"}, C: 1}, {A: {line: 20, operation: "set"}, C: 95}]

# Dig a 3x3 tunnel with a specified length
execute if score @s tc.trigger matches 7 run data modify storage tc:tmp import set value [{PauseOnError: 1b, AutoFuel: 0b, SafeMine: 1b, Locked: 1b, ShowText: 0b, ClearCounters: 1b, Silent: 0b, AutoMine: 1b, DamagePlayers: 0b}, {A: {line: 9, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: "> EXAMPLE PROGRAM 7"}, C: 90}, {A: {comment: "Mines a 3x3 tunnel with"}, C: 90}, {A: {comment: "a specified length"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "length", type: "value", operation: "=", value: 10}, C: 91}, {A: {comment: "Check length"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {name: "length", type: "value", operation: "-=", value: 1}, C: 91}, {A: {condition: "counter", name: "length", type: "value", operation: "<", value: 0}, C: 92}, {C: 98}, {A: {line: 22, operation: "set"}, C: 95}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: ""}, C: 90}, {A: {comment: "Mine 3x3 area"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {direction: "left"}, C: 3}, {A: {direction: "right"}, C: 3}, {A: {direction: "up"}, C: 1}, {A: {direction: "left"}, C: 3}, {A: {direction: "right"}, C: 3}, {A: {direction: "up"}, C: 1}, {A: {direction: "left"}, C: 3}, {A: {direction: "right"}, C: 3}, {A: {comment: "Next layer"}, C: 90}, {A: {comment: ""}, C: 90}, {A: {direction: "down"}, C: 1}, {A: {direction: "down"}, C: 1}, {A: {condition: "counter", name: "length", type: "value", operation: ">", value: 0}, C: 92}, {A: {direction: "forward"}, C: 1}, {A: {line: 12, operation: "set"}, C: 95}]


#> ADD YOUR OWN PROGRAMS BELOW, FOLLOWING THE EXAMPLES ABOVE
# execute if score @s tc.trigger matches <number> run data modify storage tc:tmp import set value [<program>]
