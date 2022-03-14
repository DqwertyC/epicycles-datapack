data modify storage epicycle configs.working set from entity @s data.epi_config

#summon marker ~ ~ ~ {Tags:["epi_marker","newest"]}
scoreboard players operation @e[tag=epi_marker,tag=newest] epi_id = EpiGen epi_id
scoreboard players set EpiGen epi_index 0

function epi_draw:init_loop_a

#armor_stand ~ ~ ~ {NoAI:1b,Size:0b,Invulnerable:1b,Silent:1b,Small:1b,Invisible:1b,Tags:["epi_point","newest"]}
summon armor_stand ~ ~ ~ {NoAI:1b,Size:0b,Invulnerable:1b,Silent:1b,Small:1b,Invisible:1b,Tags:["epi_point","epi_endpoint","newest"]}
summon slime ~ ~ ~ {NoAI:1b,NoGravity:1b,Silent:1b,Size:0b,Invulnerable:1b,Tags:["epi_mob","invisible","newest"]}

execute if data entity @s data.epi_config.show_heads run function epi_draw:add_heads

# Set id/index for the endpoint marker
scoreboard players operation @e[tag=epi_point,tag=newest] epi_id = EpiGen epi_id
scoreboard players operation @e[tag=epi_point,tag=newest] epi_index = EpiGen epi_index
scoreboard players operation @e[tag=epi_point,tag=newest] epi_target = EpiGen epi_index
scoreboard players remove @e[tag=epi_point,tag=newest] epi_target 1

# Set id/index for the mob that follows the endpoint marker
scoreboard players operation @e[tag=epi_mob,tag=newest] epi_id = EpiGen epi_id
scoreboard players operation @e[tag=epi_mob,tag=newest] epi_index = EpiGen epi_index

execute as @e[tag=epi_marker,tag=newest] run function epi_draw:position_enter

tag @e[tag=newest] remove newest
scoreboard players add EpiGen epi_id 1