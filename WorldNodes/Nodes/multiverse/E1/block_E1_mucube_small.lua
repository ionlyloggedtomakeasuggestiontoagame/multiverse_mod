function p.__get_is_solid()
    return true
end

function p.__get_tex()
    return "block_concrete_checker_blue_red"
end

function p.__main()
    set_default_block("block_E1_1_walls")
    create_rect("block_E1_2_walls",0,0,0,7,7,15)
    create_rect("block_E1_2_walls",0,0,0,7,15,7)
    create_rect("block_E1_2_walls",0,0,0,15,7,7)
    create_rect("block_E1_2_air",1,1,0,6,6,15)
    create_rect("block_E1_2_air",1,0,1,6,15,6)
    create_rect("block_E1_2_air",0,1,1,15,6,6)
    create_rect("block_E1_1_air",9,9,0,14,14,15)
    create_rect("block_E1_1_air",9,0,9,14,15,14)
    create_rect("block_E1_1_air",0,9,9,15,14,14)
    add_bent(4,4,4,"bent_base_ring_green")
    add_bent(11,11,11,"bent_base_ring_green")
    --usually 0.75, tho for debug purposes can be set to 0
    if randf() > 0.75 then
        for i = 1,randi(1,5) do
            local x = randi(9,14)
            local y = randi(1,6)
            set_pos(x,y,8,"block_E1_passage_top")
            set_pos(x,y,7,"block_E1_passage_bottom")
        end
    end
    if randf() > 0.75 then
        for i = 1,randi(1,5) do
            local x = randi(1,6)
            local y = randi(9,14)
            set_pos(x,y,8,"block_E1_passage_top")
            set_pos(x,y,7,"block_E1_passage_bottom")
        end
    end
end
