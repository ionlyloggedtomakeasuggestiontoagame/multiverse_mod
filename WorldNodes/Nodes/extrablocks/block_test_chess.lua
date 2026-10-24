function p.__get_is_solid() return true end
function p.__get_tex() return "block_belle_rosette" end

function p.__main()
    set_default_block("block_E1_2_air")
    set_default_block("block_air")

    for x,y,z in bps(0,0,0,15,15,15) do
        if math.fmod(x+y+z,2) == 0 then
            set_pos(x,y,z,"block_test_chess")
        end
    end

    
    omniverse.rings()
end