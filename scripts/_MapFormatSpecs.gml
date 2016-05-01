/*

Map Format Ver 1.0.0.0
Map code = 1000

[str] "Header - GunFireMapFile"
[s32]  code

[s32]5 - map properties 
[str]5 - map properties

[u32] total objects

for (var i=0;i<total objects; i++)
{
[u16] object type
[s32] x
[s32] y
[s32] depth
[s32] angle
[s32] empty 
[s32] empty
[s32] empty
[s32] empty
[s32] empty

[str] empty
[str] empty
[str] empty
[str] empty
[str] empty
}

[s32] total tiles


for (var i = 0; i<total tiles;i++)
{
[s32]  number;
[s32] left
[s32] top
[s32] width
[s32] height
[s32] x
[s32] y
[s32] depth
[s32] blend
[s32] scalex
[s32] scaley
[s32] empty
[s32] empty
}

end.
