# Handle potion controls
execute if entity @e[type=potion,nbt={Item:{tag:{EpiPause:1b}}}] run function epi_draw:toggle_running
execute if entity @e[type=potion,nbt={Item:{tag:{EpiClear:1b}}}] run kill @e[tag=epi_drawpoint]
execute if entity @e[type=potion,nbt={Item:{tag:{EpiKill:1b}}}] run function epi_draw:kill_tracer

kill @e[type=potion,nbt={Item:{tag:{EpiPause:1b}}}]
kill @e[type=potion,nbt={Item:{tag:{EpiClear:1b}}}]
kill @e[type=potion,nbt={Item:{tag:{EpiKill:1b}}}]


execute as @e[type=marker,tag=epi_marker,tag=newest] at @s run function epi_draw:init_enter
execute if data storage minecraft:epicycle controls.running run function epi_draw:step_all
execute as @e[tag=epi_endpoint] at @s if data storage minecraft:epicycle controls.marking unless entity @e[tag=epi_drawpoint,distance=0...1] run summon marker ~ ~ ~ {Tags:["epi_drawpoint"]}
effect give @e[tag=invisible] minecraft:invisibility 1 0 true

execute at @e[tag=epi_endpoint] run particle minecraft:dust 0 1 1 1 ~ ~ ~ 0 0 0 1 10 force
execute at @e[tag=epi_drawpoint] run particle minecraft:dust 0 1 0 1 ~ ~ ~ 0 0 0 1 1 force

kill @e[type=item,nbt={Item:{id:"minecraft:lead"}}]