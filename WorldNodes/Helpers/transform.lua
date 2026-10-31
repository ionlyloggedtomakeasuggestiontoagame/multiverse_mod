function p.chunk(transform)
    local blockpos = {}
    local blocktype = {}
    for x,y,z in bps(0,0,0,15,15,15) do
        blockpos[#blockpos+1] = std.vec(x,y,z)
        blocktype[#blocktype+1] = get_pos(x,y,z)
    end
    blockpos = transform(blocktype)
    clear_all("block_e")
    for i = 1,16*16*16 do
        set_pos(math.floor(blockpos[i].x+0.5),math.floor(blockpos[i].y+0.5),math.floor(blockpos[i].z+0.5),blocktype[i])
    end
    --add_bent_s(7, 7, 7, "bent_base_txt",math.floor(blockpos[1].x+0.5)..","..math.floor(blockpos[1].y+0.5)..","..math.floor(blockpos[1].z+0.5).."\n\nBlocktype:"..blocktype[1])
end
--i really wanna credit ezno on this, without him my sanity would be gone by now, i'd be stuck in the fbw myself

function Rotate2D(x,y,angle)
    local temp = nil
    temp = math.atan2(y,x)
    local pos_x = math.sqrt(x*x+y*y)*math.cos(temp+angle)
    local pos_y = math.sqrt(x*x+y*y)*math.sin(temp+angle)
    return {x=pos_x, y=pos_y}
end

function RotateTransform(dir,angle) --angle in degrees
    return function(blockpos)
    if (dir == "xy") or (dir == "z") then
        for i = 1,16*16*16 do
            local pos = Rotate2D(blockpos[i].x-7.5,blockpos[i].y-7.5,math.rad(angle))
            blockpos[i].x = pos.x+7.5
            blockpos[i].y = pos.y+7.5
            
        end
    end
    if (dir == "xz") or (dir == "y") then
        for i = 1,16*16*16 do
            local pos = Rotate2D(blockpos[i].x-7.5,blockpos[i].z-7.5,math.rad(angle))
            blockpos[i].x = pos.x+7.5
            blockpos[i].z = pos.y+7.5
        end
    end
    if (dir == "yz") or (dir == "x") then
        for i = 1,16*16*16 do
            local pos = Rotate2D(blockpos[i].y-7.5,blockpos[i].z-7.5,math.rad(angle))
            blockpos[i].y = pos.x+7.5
            blockpos[i].z = pos.y+7.5
        end
    end
    return blockpos end
end