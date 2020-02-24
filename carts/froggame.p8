pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
x=8
y=98
spriteflip = false

playerwalk = false
walkloop = false

imagenmb = 0
imagespd = 5
clock = 0
clockframe = clock + imagespd

mapx = 0

function _update()

	mapx -= 0.5

	if (clock>=30) then
		clock = 0
		clockframe = clock + imagespd
	
	else clock += 1 end
	
if (clock==clockframe) then
	if (playerwalk==true) then
			
		if (imagenmb<2) then
			imagenmb += 1
				
		else imagenmb = 1 end
	
	else imagenmb = 0 end
		
	clockframe = clock + imagespd
end

	if (btn(0) or btn(1)) then
		spriteflip = true
		playerwalk = true
		walkloop = true
		if (btn(0)) then 
			x -= 1 
			spriteflip = true
		end
		if (btn(1)) then 
			x += 1
			spriteflip = false
	 end
	
	else playerwalk = false end
end  

function _draw()
	cls(12)
	map(0,5,mapx,98,16,2)
	map(0,5,mapx+128,98,16,2)
	
	if (mapx<=-127) then
		mapx = 0
	end

	for f=0,15,1 do
		spr(32,8*f,114)
		spr(33,8*f,122)
	end 
	
	sspr(0+(16*imagenmb),0,16,16,x,y,16,16,spriteflip) 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000001000100000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000b100b100000000000000000000000000000000000000000000000000000
00000b100b10000000000b100b10000000000b100b100000000000000000000000000bbbbbb00000000000000000000000000000000000000000000000000000
00000b1bbb10000000000b1bbb10000000000b1bbb10000000000b100b1000000000bbbbbbbb0000000000000000000000000000000000000000000000000000
0000bbbbbbbb00000000bbbbbbbb00000000bbbbbbbb000000000b1bbb100000000bbeebbbbee000000000000000000000000000000000000000000000000000
000bbeebbbbee000000bbeebbbbee000000bbeebbbbee0005500bbbbbbbb0000055bbeeb11bee000000000000000000000000000000000000000000000000000
055bbeebbbbee000055bbeebbbbee000055bbeebbbbee000555bbeebbbbee0000553bbbb11bbb000000000000000000000000000000000000000000000000000
0553bbbb11bbb0000553bbbb11bbb0000553bbbb11bbb0000563beebbbbee000005733bbbbbb0000000000000000000000000000000000000000000000000000
005633bbbbbb0000005633bbbbbb0000005633bbbbbb000000633bbb11bbb0000007723333b00000000000000000000000000000000000000000000000000000
000662333bb00000000672333bb00000000672333bb000000006333bbbbb0000000172b8888b0000000000000000000000000000000000000000000000000000
000162888880000000017288888b0000001172b8888000000001223333b000000011228888880000000000000000000000000000000000000000000000000000
001122b8888b00000011228888880000011122888888000000112222222800000011222888880000000000000000000000000000000000000000000000000000
0011222888880000011122b88833000000113328888b0000001122b2888b00000111122288830000000000000000000000000000000000000000000000000000
01111222888000000001322288330000000133228880000001111222288000000111133111330000000000000000000000000000000000000000000000000000
01111331133000000000330000000000000000003300000001111331133000000000033000330000000000000000000000000000000000000000000000000000
33333b33444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3b333333442442440000000000000007777700000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222444444440000000077700077777777777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444424424420000770777777777777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000
44244244444444440007777777777777777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444424444447077777777777666666677777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000
42444424444244447777777777766666666667777666777700000000000000000000000000000000000000000000000000000000000000000000000000000000
44442444444442447777777776666666666666776666677700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc7777677766666666666666766666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc7776677666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700cccccccc7766666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
07777770cccccccc6766666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777cccccccc6666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777cccccccc6666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
07777777cccccccc6666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
00777770cccccccc6666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313131313131313131313131313100222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2223242522232425222324252223242522222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3233343532333435323334353233343522222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2020202020202020202020202020202022002200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2121212121212121212121212121212100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
