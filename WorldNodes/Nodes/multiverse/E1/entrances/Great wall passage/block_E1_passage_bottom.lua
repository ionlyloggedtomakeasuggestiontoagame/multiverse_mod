function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_blue_border"
end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_BLUE_BORDER")
    create_rect("block_E1_mixair",1,1,14,14,14,15)
    create_rect("block_E1_2_air",0,0,0,15,15,13)

    --them beams
    --[[if get_input_adj_bt(0,0,-1) == "block_E1_2_walls" or get_input_adj_bt(0,0,-1) == "block_E1_passage_top" then
        create_rect("block_E1_2_walls",7,7,0,7,7,7)
    end]]--no need to check bottom

    create_rect("block_E1_mixwalls",7,7,7,7,7,15) --will always be there

    if get_input_adj_bt(0,-1,0) == "block_E1_2_walls" or get_input_adj_bt(0,-1,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,0,7,7,7,7)
    end
    if get_input_adj_bt(0,1,0) == "block_E1_2_walls" or get_input_adj_bt(0,1,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,7,7,7,15,7)
    end
    if get_input_adj_bt(-1,0,0) == "block_E1_2_walls" or get_input_adj_bt(-1,0,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",0,7,7,7,7,7)
    end
    if get_input_adj_bt(1,0,0) == "block_E1_2_walls" or get_input_adj_bt(1,0,0) == "block_E1_passage_bottom" then
        create_rect("block_E1_2_walls",7,7,7,15,7,7)
    end
    --[[--rhombus
    local size = 7
    local expo = 1
    local offset = 7
    omniverse.superellipse("block_E1_2_walls",size,expo,offset,offset,offset)
    --structure
    block_E1_2_walls.octahedron()]]
end
