function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    set_default_block("block_E1_2_air")
    fractals.sponge("block_E1_2_air","block_Citrine_City")
    create_rect("block_E1_2_air",0,0,1,15,15,15)
    for x = 1,4 do
    for y = 1,4 do
        local posx = x*4-1
        local posy = y*4-1
        local posx2 = (x-1)*4
        local posy2 = (y-1)*4
        local height = randi(5,12)
        create_rect("block_Citrine_City_building",posx2,posy2,0, posx2,posy2,height)
        create_rect("block_Citrine_City_building",posx,posy2,0, posx,posy2,height)
        create_rect("block_Citrine_City_building",posx2,posy,0, posx2,posy,height)
        create_rect("block_Citrine_City_building",posx,posy,0, posx,posy,height)
        set_pos(posx,posy,0,"block_Citrine_City_building_bottom")
        set_pos(posx2,posy,0,"block_Citrine_City_building_bottom")
        set_pos(posx,posy2,0,"block_Citrine_City_building_bottom")
        set_pos(posx2,posy2,0,"block_Citrine_City_building_bottom")
        set_pos(posx,posy,height+1,"block_Citrine_City_building_top")
        set_pos(posx2,posy,height+1,"block_Citrine_City_building_top")
        set_pos(posx,posy2,height+1,"block_Citrine_City_building_top")
        set_pos(posx2,posy2,height+1,"block_Citrine_City_building_top")
        --object over building
        local buildingtop = randbuilding()
        set_pos(posx,posy,height+2,buildingtop)
        local buildingtop = randbuilding()
        set_pos(posx2,posy,height+2,buildingtop)
        local buildingtop = randbuilding()
        set_pos(posx,posy2,height+2,buildingtop)
        local buildingtop = randbuilding()
        set_pos(posx2,posy2,height+2,buildingtop)
    end
    end
    create_rect("block_E1_2_air",4,4,0,11,11,15)
    --monsters
    if(randf() < 0.125) then
         local x = randi(0,15)
         local y = randi(0,15)
         local z = randi(0,15)
            if not bt_get_is_solid_physically(get_pos(x,y,z)) then
                add_ment(x,y,z,"ment_monster_mad_goblin")
            end
    end

    --rings
    if(randf() < 0.25) then
         local x = randi(0,15)
         local y = randi(0,15)
         local z = randi(0,15)
         if not bt_get_is_solid_physically(get_pos(x,y,z)) then
            if(randf() > 0.3) then
                add_bent(x,y,z,"bent_base_ring_green")
            else
                add_bent(x,y,z,"bent_base_ring_red")
            end
        end
    end
end

function randbuilding()
    if (randf() > 1/16) then
        return "block_E1_2_rhombus"
    else
        local buildings = {"block_Citrine_City_building_waypoint","block_Bismuth_Outside","block_Ruby_Sponge","block_Onyx_Maze_Outside","XAR_BURLINGTON_CITY_BUILDING_ROOM_STORE"}
        local randbuild = buildings[randi(1,#buildings)]
        return randbuild
    end
end
