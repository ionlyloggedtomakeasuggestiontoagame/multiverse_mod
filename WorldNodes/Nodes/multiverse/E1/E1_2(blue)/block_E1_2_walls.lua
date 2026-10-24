function p.__get_is_solid() return true end
function p.__get_tex() return "block_light_blue_border" end

function p.__main()
    set_default_block("block_E1_2_air")
    --big wall
        omniverse.wallsauto(0,"block_E1_1_walls","block_E1_2_walls")
    
    --them beams
    if get_input_adj_bt(0,0,-1) == "block_E1_2_walls" or get_input_adj_bt(0,0,-1) == "block_E1_1_walls" or get_input_adj_bt(0,0,-1) == "block_E1_passage_bottom" or get_input_adj_bt(0,0,-1) == "block_E1_mixwalls" then
        create_rect("block_E1_2_walls",7,7,0,7,7,7)
    end
    if get_input_adj_bt(0,0,1) == "block_E1_2_walls" or get_input_adj_bt(0,0,1) == "block_E1_1_walls" or get_input_adj_bt(0,0,1) == "block_E1_passage_bottom" or get_input_adj_bt(0,0,1) == "block_E1_mixwalls" then
        create_rect("block_E1_2_walls",7,7,7,7,7,15)
    end
    if get_input_adj_bt(0,-1,0) == "block_E1_2_walls" or get_input_adj_bt(0,-1,0) == "block_E1_1_walls" or get_input_adj_bt(0,-1,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,0,7,7,7,7)
    end
    if get_input_adj_bt(0,1,0) == "block_E1_2_walls" or get_input_adj_bt(0,1,0) == "block_E1_1_walls" or get_input_adj_bt(0,1,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,7,7,7,15,7)
    end
    if get_input_adj_bt(-1,0,0) == "block_E1_2_walls" or get_input_adj_bt(-1,0,0) == "block_E1_1_walls" or get_input_adj_bt(-1,0,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",0,7,7,7,7,7)
    end
    if get_input_adj_bt(1,0,0) == "block_E1_2_walls" or get_input_adj_bt(1,0,0) == "block_E1_1_walls" or get_input_adj_bt(1,0,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,7,7,15,7,7)
    end
    --rhombus
    local size = 7
    local expo = 1
    local offset = 7
    omniverse.superellipse("block_E1_2_walls",size,expo,offset,offset,offset)
    --structure
    block_E1_2_walls.octahedron()
end

function p.structurething(xc,yc,zc)
    local structures = {"XAR_FANATIC_LATTICE","XAR_MAHOGANY_AMMO","block_duo_maze"}
    local structuretype = structures[randi(1,#structures)]
    set_pos(xc,yc,zc,structuretype)
end

function p.octahedron()
    create_rect("block_E1_2_air",5,5,5,9,9,9)
    if randf() > 0.8 then
        block_E1_2_walls.structurething(7,7,7)
    else
        local structures = {"Crystal","Fanatic","YingYan","Apple"}
        local structuretype = structures[randi(1,#structures)]
        if structuretype == "Crystal" then
            create_rect("block_Crystal_Spines",6,6,8,8,8,9)
            create_rect("block_Crystal_Island_floor_big",6,6,7,8,8,7)
        end
        if structuretype == "Fanatic" then
            create_rect("XAR_FANATIC_ISLAND_ABOVE",6,6,8,8,8,8)
            create_rect("XAR_FANATIC_ISLAND_GROUND",6,6,7,8,8,7)
        end
        if structuretype == "YingYan" then
            create_rect("XAR_YING_FOREST",6,6,8,8,8,8)
            create_rect("block_green_and_pink",6,6,7,8,8,7)
            create_rect("block_omniverse_yan_forest",6,6,6,8,8,6)
        end
        if structuretype == "APPLE" then
            for x,y,z in bps(6,6,8,8,8,8) do
                local appletree = {"XAR_APPLE_TREE_RED","XAR_APPLE_TREE_RED_NO_BOT","XAR_APPLE_TREE_RED_NO_GRASS","XAR_APPLE_TREE_YELLOW","XAR_APPLE_TREE_YELLOW_NO_GRASS","XAR_APPLE_TREE_GREEN","XAR_APPLE_TREE_GREEN_NO_GRASS"}
                local appletreetype = appletree[randi(1,#appletree)]
                set_pos(x,y,z,appletreetype)
            end
            create_rect("XAR_TAU_CAVE_MOSS_TOP",6,6,7,8,8,7)
        end
        if randf() > 0.75 then
            set_pos(7,7,8,"XAR_MAHOGANY_AMMO")
        end
    end
end
