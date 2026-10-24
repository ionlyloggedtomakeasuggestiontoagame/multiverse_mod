function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_E1_2_air")
    p.E1_2_air()
end

function p.E1_2_air()
    local dungeon = {"block_E1_2_rhombus","block_Jade_Maze_Outside","block_Pyrite_Outside"}
    if randf() < 1/2 then
        dungeon[#dungeon+1] = "block_Jade_Maze_Outside"
    end
    if randf() < 1/4 then
        dungeon[#dungeon+1] = "block_Pyrite_Outside"
    end
    if randf() < 1/64 then
        dungeon[#dungeon+1] = "block_ametrine_sponge"
    end
    local dungeontype = dungeon[randi(1,#dungeon)]
    set_pos(5,5,5,dungeontype)

    --monsters
    if(randf() < 0.125) then
        local x = randi(0,15)
        local y = randi(0,15)
        local z = randi(0,15)
        local monsters = {"ment_monster_mad_goblin",
                            "ment_monster_goblin",
                            "ment_monster_gnoll",
                            "ment_monster_imp",
                            "ment_monster_demon",
                            "ment_monster_orc",
                            "ment_monster_overseer",
                            "ment_monster_overlord",
                            "ment_monster_gremlin_minor",
                            "ment_monster_ogre",
                            "ment_monster_troll",
                            "ment_monster_hobgoblin",
                            "ment_monster_troll_recreated",
                            "ment_monster_marine",
                            "ment_monster_marine_light"}
        local monstertype = monsters[randi(1,#monsters)]
        ment_start(x,y,z,monstertype)
        if randf() > 0.75 then
            ment_set_f("__radius",randf()*4+0.5)
        end
        ment_end()
    end

    --rings
    omniverse.rings()
end