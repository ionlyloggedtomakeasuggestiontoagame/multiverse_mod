function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_omniverse_yan_forest_air")

    --depth thing
    local parent_depth = 0
    local level = get_level()
    if get_input_path_bt(level-1) ~= "block_omniverse_yan_forest_air" then
        if (get_input_path_block_var_exists(level-1, "depth", "i")) then
            parent_depth = get_input_path_block_i(level-1, "depth")
        end
    end
    local depth = parent_depth + 1
    chunk_set_i("depth", depth)

    --floor
    p.floor(depth)

    --trees
    for i = 1,randi(5,9) do
        local x = randi(0,15)
        local z = randi(0,15)
        local orientation = randi(0,1) --0 = x aligned, 1 = z aligned
        local height = randi(7,12)
        local size = randi(1,3)
        local secondheight = randi(1,3)

        -- create_rect("block",x then takes its size, and puts it through the orientation function to know which side its pointing, same with z, then height)

        create_rect("block_yan_tree_2",x,z,height,x,z,15)
        create_rect("block_omniverse_yan_forest",x-(size*(1-orientation)),z-(size*orientation),height-secondheight-1,x+(size*(1-orientation)),z+(size*orientation),height-1)
        create_rect("block_yan_tree_2",x-(size*(1-orientation)),z-(size*orientation),height-secondheight,x+(size*(1-orientation)),z+(size*orientation),height)
        create_rect("block_omniverse_yan_forest_air",x-((size+1)*(1-orientation)),z-((size+1)*orientation),height-secondheight-1,x+((size-1)*(1-orientation)),z+((size-1)*orientation),height-1)
        create_rect("block_omniverse_yan_forest",x-((size+1)*(1-orientation)),z-((size+1)*orientation),height-1,x+((size-1)*(1-orientation)),z+((size-1)*orientation),height-1)

        --checks if there is air above, if so make the tips green
        if get_input_adj_bt(0,0,1) == "block_omniverse_yan_forest_air" then
            set_pos(x,z,15,"XAR_YING_FOREST")
            set_pos(x,z,14,"XAR_SOLID_BORING_DARK_GREEN_BORDER")
            set_pos(x,z,13,"block_green_and_pink")
        end
    end


    --rings
    if(randf() < 0.25) then
        local x = randi(0,15)
        local y = randi(0,15)
        local z = randi(0,15)
        if depth == 0 then
            if not bt_get_is_solid_physically(get_pos(x,y,z)) then
                if(randf() > 0.3) then
                    add_bent(x,y,z,"bent_base_ring_green")
                else
                    add_bent(x,y,z,"bent_base_ring_red")
                end
            end
        end
    end
end

function p.__type_init(id)
    ia_block_new_var_i(id, "depth", 0)
end

function p.floor(depth)
    for floorx = 0,15 do
        for floorz = 0,15 do --not create_rect cuz wanna put stuff later and a floor would fill everything
            if (randf() > 0.995) then
                if (get_pos(floorx,floorz,15) ~= "XAR_SOLID_BORING_CONCRETE_PURPLE_BORDER") then
                    add_bent(floorx,floorz,15,"bent_base_ring_green")
                end
            end
            set_pos(floorx,floorz,15,"block_omniverse_yan_forest")
            if (randf() > 0.99) then
                if (randf() > 0.75) then
                    set_pos(floorx,floorz,15,"block_omniverse_yan_forest_waypoint")
                else
                    set_pos(floorx,floorz,15,"block_omniverse_yan_forest_totem")
                end
            end
            if (randf() > 0.99) and depth > 2 then
                --the flowers
                local flowers = {"block_parkour_flower"}
                if get_input_adj_bt(0,0,1) == "block_omniverse_yan_forest_air" then
                    --add new flower to the table in case it is the floating forests
                    flowers[#flowers+1] = "block_sky_flower"
                end
                if depth > 5-1 then
                    flowers[#flowers+1] = "block_electricity_flower"
                    flowers[#flowers+1] = "block_big_maze_flower"
                    flowers[#flowers+1] = "block_knockback_flower"
                end
                if depth > 7-1 then
                    --its actually a field and not a flower but it uses the same system
                    flowers[#flowers+1] = "block_cow_field_structure"
                end
                if depth > 20-1 then
                    flowers[#flowers+1] = "block_electricity_maze_flower"
                end
                local flowertype = flowers[randi(1,#flowers)]
                set_pos(floorx,floorz,15,flowertype)
            end
        end
    end
end