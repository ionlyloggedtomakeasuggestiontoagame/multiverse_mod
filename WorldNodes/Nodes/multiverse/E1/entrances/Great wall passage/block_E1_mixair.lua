function p.__get_is_solid() return false end
function p.__get_tex() return "" end

function p.__main()
    local airs = {"block_E1_1_air","block_E1_2_air","block_E1_mixair"}
    for x,y,z in bps(0,0,0,15,15,15) do
        local airtype = airs[randi(1,#airs)] 
        set_pos(x,y,z,airtype)
    end
    if randf() > 0.5 then
        block_E1_1_air.E1_1_air()
    else
        block_E1_2_air.E1_2_air()
    end
end