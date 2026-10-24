function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_red_border"
end

function p.__main()
    set_default_block("XAR_SOLID_BORING_CONCRETE_RED_BORDER")
    create_rect("block_E1_mixair",1,1,0,14,14,1)
    create_rect("block_E1_1_air",0,0,2,15,15,15)
    --them beams

    create_rect("block_E1_mixwalls",7,7,0,7,7,7) --will always be there

    --[[if (get_input_adj_bt(0,0,1) == "block_E1_1_walls") or (get_input_adj_bt(0,0,1) == "block_E1_passage_bottom") then
        create_rect("block_E1_1_walls",7,7,7,7,7,15)
    end]]--no need to check top
    if (get_input_adj_bt(0,-1,0) == "block_E1_1_walls") or (get_input_adj_bt(0,-1,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,0,7,7,7,7)
    end
    if (get_input_adj_bt(0,1,0) == "block_E1_1_walls") or (get_input_adj_bt(0,1,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,7,7,7,15,7)
    end
    if (get_input_adj_bt(-1,0,0) == "block_E1_1_walls") or (get_input_adj_bt(-1,0,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",0,7,7,7,7,7)
    end
    if (get_input_adj_bt(1,0,0) == "block_E1_1_walls") or (get_input_adj_bt(1,0,0) == "block_E1_passage_top") then
        create_rect("block_E1_1_walls",7,7,7,15,7,7)
    end
end
