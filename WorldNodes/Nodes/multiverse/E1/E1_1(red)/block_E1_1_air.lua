function p.__get_is_solid()
    return false
end

function p.__get_tex()
    return ""
end

function p.__main()
    set_default_block("block_E1_1_air")
    p.E1_1_air()
end

function p.E1_1_air()
    
    --beams
    if get_input_adj_bt(0,0,1) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",1,1,1,1,1,15)
    end
    if get_input_adj_bt(0,1,0) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",1,1,1,1,15,1)
    end
    if get_input_adj_bt(1,0,0) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",1,1,1,15,1,1)
    end
    if get_input_adj_bt(0,0,-1) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",1,1,0,1,1,1)
    end
    if get_input_adj_bt(0,-1,0) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",1,0,1,1,1,1)
    end
    if get_input_adj_bt(-1,0,0) == "block_E1_1_air" then
        create_rect("block_E1_1_walls",0,1,1,1,1,1)
    end
    --monsters
    if(randf() < 0.075) then
         local x = randi(0,15)
         local y = randi(0,15)
         local z = randi(0,15)
            if randf() > 0.5 then
                add_ment(x,y,z,"ment_monster_twisted_fanatic")
            else
                add_ment(x,y,z,"ment_monster_fanatic")
            end
    end

    --rings
    if(randf() < 0.25) then
        local x = randi(0,15)
        local y = randi(0,15)
        local z = randi(0,15)
        if(randf() > 0.3) then
            add_bent(x,y,z,"bent_base_ring_green")
        else
            add_bent(x,y,z,"bent_base_ring_red")
        end
    end
    --structures
    block_E1_1_walls.structurething(0,0,0,2,2,2,1,1,1)
    block_E1_1_air.abstract()
end

function p.abstract()
    local parent = get_input_path_bt(get_level()-1)
    if(get_input_path_block_var_exists(get_level()-1, "isabstract", "b") ) then
        parentvar = get_input_path_block_b(get_level()-1, "isabstract")
    else
        parentvar = false
    end
    if (parent == "block_abstract_field_air") or (parent == "block_abstract_field_porous_walls") or (parent == "block_abstract_field_amalgamation") or (parentvar == true) then
        block_abstract_field_air.air()
        chunk_set_b("isabstract", true )
        --honestly could check the path to see if its inside an abstract chunk instead but chose not cuz
        --i want it so that u could find non-abstract blocks even inside abstract chunks on specific cases
        --rather than every block inside one automatically cuz its inside one even on nonsensical zones
    end
end

function p.__type_init(id)
ia_block_new_var_b(id, "isabstract", false)
end
