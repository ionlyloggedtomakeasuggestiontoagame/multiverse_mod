function p.__get_is_solid() return true end
function p.__get_tex() return "block_concrete_checker_blue_red" end

function p.__main()
    local airs = {"block_E1_1_air","block_E1_2_air","block_E1_mixair"}
    for x,y,z in bps(0,0,0,15,15,15) do
        local airtype = airs[randi(1,#airs)] 
        set_pos(x,y,z,airtype)
    end
    
    --them beams
    if get_input_adj_bt(0,0,-1) == "block_E1_2_walls" or get_input_adj_bt(0,0,-1) == "block_E1_1_walls" or get_input_adj_bt(0,0,-1) == "block_E1_mixwalls" then
        create_rect("block_E1_mixwalls",7,7,0,7,7,7)
    end
    if get_input_adj_bt(0,0,1) == "block_E1_2_walls" or get_input_adj_bt(0,0,1) == "block_E1_1_walls" or get_input_adj_bt(0,0,1) == "block_E1_mixwalls" then
        create_rect("block_E1_mixwalls",7,7,7,7,7,15)
    end

    for z = 1,14,2 do
        if randf() > 0.5 then
            set_pos(7,7,z,"block_E1_1_walls")
        else
            set_pos(7,7,z,"block_E1_2_walls")
        end
    end

end
