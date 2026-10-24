function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_dark_concrete_red_border"
end

function p.__main()
    set_default_block("block_E1_1_air")
    --big wall
    omniverse.wallsauto(0,"block_E1_2_walls","block_E1_1_walls")
    
    --them beams
    if (get_input_adj_bt(0,0,-1) == "block_E1_1_walls") or (get_input_adj_bt(0,0,-1) == "block_E1_2_walls") or (get_input_adj_bt(0,0,-1) == "block_E1_1_walls_transparent") or (get_input_adj_bt(0,0,-1) == "block_abstract_amalgamation") or (get_input_adj_bt(0,0,-1) == "block_E1_passage_top") or get_input_adj_bt(0,0,-1) == "block_E1_mixwalls" then
        create_rect("block_E1_1_walls",7,7,0,7,7,7)
    end
    if (get_input_adj_bt(0,0,1) == "block_E1_1_walls") or (get_input_adj_bt(0,0,1) == "block_E1_2_walls") or (get_input_adj_bt(0,0,1) == "block_E1_1_walls_transparent") or (get_input_adj_bt(0,0,1) == "block_abstract_amalgamation") or (get_input_adj_bt(0,0,1) == "block_E1_passage_top") or get_input_adj_bt(0,0,1) == "block_E1_mixwalls" then
        create_rect("block_E1_1_walls",7,7,7,7,7,15)
    end
    if (get_input_adj_bt(0,-1,0) == "block_E1_1_walls") or (get_input_adj_bt(0,-1,0) == "block_E1_2_walls") or (get_input_adj_bt(0,-1,0) == "block_E1_1_walls_transparent") or (get_input_adj_bt(0,-1,0) == "block_abstract_amalgamation") or (get_input_adj_bt(0,-1,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,0,7,7,7,7)
    end
    if (get_input_adj_bt(0,1,0) == "block_E1_1_walls") or (get_input_adj_bt(0,1,0) == "block_E1_2_walls") or (get_input_adj_bt(0,1,0) == "block_E1_1_walls_transparent") or (get_input_adj_bt(0,1,0) == "block_abstract_amalgamation") or (get_input_adj_bt(0,1,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,7,7,7,15,7)
    end
    if (get_input_adj_bt(-1,0,0) == "block_E1_1_walls") or (get_input_adj_bt(-1,0,0) == "block_E1_2_walls") or (get_input_adj_bt(-1,0,0) == "block_E1_1_walls_transparent") or (get_input_adj_bt(-1,0,0) == "block_abstract_amalgamation") or (get_input_adj_bt(-1,0,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",0,7,7,7,7,7)
    end
    if (get_input_adj_bt(1,0,0) == "block_E1_1_walls") or (get_input_adj_bt(1,0,0) == "block_E1_2_walls") or (get_input_adj_bt(1,0,0) == "block_E1_1_walls_transparent") or (get_input_adj_bt(1,0,0) == "block_abstract_amalgamation") or (get_input_adj_bt(1,0,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,7,7,15,7,7)
    end
    --structures
    block_E1_1_walls.structurething(6,6,6,8,8,8,7,7,7)
    block_E1_1_air.abstract()
end

function p.structurething(x1,y1,z1,x2,y2,z2,xc,yc,zc)
    if randf() > 0.8 then
        local structures = {"block_forest_bubble","XAR_FANATIC_LATTICE","XAR_MAHOGANY_AMMO","block_bubblegum_ball","block_odd_maze1","block_tick_dungeon_main","block_duo_maze","block_void_growth_dungeon","block_abstract_field"}
        local structuretype = structures[randi(1,#structures)]
        create_rect("block_E1_1_walls_transparent",x1,y1,z1,x2,y2,z2)
        set_pos(xc,yc,zc,structuretype)
        if (structuretype == "block_abstract_field") then
            create_rect("block_E1_1_walls_transparent",x1-1,y1-1,z1-1,x2+1,y2+1,z2+1)
            if get_input_path_bt(get_level()) == "block_E1_1_air" then
                create_rect("block_abstract_field",x1+1,y1+1,z1+1,x2,y2,z2)
            else
                create_rect("block_abstract_field",x1,y1,z1,x2,y2,z2)
            end
        end
    end
end

function p.__type_init(id)
    ia_block_new_var_b(id, "isabstract", false)
end