pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
	x=8
	y=98
	xspd = 0
	yspd = 0
	yprev = -50
	spriteflip = false
	
	playerwalk = false
	walkloop = false
	
	statetimer = 0
	playercrouch = false
	playerjump = false
	playerair = false
	playerdrop = false
	
	jumpforce = 3.5
	gravityforce = 2
	jumpclock = 0
	
	clock = 30
	clockframe = 0
	animplay = true
	
	mapx = 0
end

function _anim(timer,timerobj,framespd,frameamnt,spriteframe) 	
		if (timer==30) then
			timer = 0
			timerobj = timer + framespd
		else timer += 1 end
	
		if (timer>=30 or timer==timerobj) then
			spriteframe += 1
			if (spriteframe>frameamnt) then
				spriteframe = 1
			end
			timerobj = timer + framespd
		end

		clock = timer
		clockframe = timerobj
		imagenmb = spriteframe
end

function _state(stateclock)
	stateclock += 1
	return stateclock
end

function _update()
	mapx -= 0.5
	
	-- state machine
	if (playerwalk==true and playerjump==false) then
		_anim(clock,clockframe,5,2,imagenmb)	
	
	elseif(playerwalk==false) then imagenmb = 0 end
	
	--[[if (playercrouch==true) then
		imagenmb = 3
		statetimer = _state(statetimer)
		if (statetimer>=5) then
			playerjump = true
			playercrouch = false
			statetimer = 0
		end
	end]]--
	
	if (playercrouch==true) then
		y-= jumpforce - gravityforce
		jumpforce-=0.05
		printh(jumpforce)
		if (jumpforce<gravityforce) then imagenmb = 5
		elseif (jumpforce>gravityforce) then imagenmb = 4 end
		if (y >=yprev) then
				jumpforce = 3.5
				jumpclock = 0
				playercrouch = false
			end
	end

	-- assigns commands to buttons
	if (btn(2) and playerdrop==false) then 
		playercrouch = true
		if(yprev==-50) then yprev = y end
	end
	
	x += xspd
	if (btn(0) or btn(1)) then
		spriteflip = true
		playerwalk = true
		walkloop = true
		if (btn(0)) then 
			if(xspd>-1) then xspd -= 0.1 end
			x += xspd
			spriteflip = true
		end
		if (btn(1)) then 
			if(xspd<1) then xspd += 0.1 end
			x += xspd
			spriteflip = false
		end
	
	else 
		if (xspd>0) then xspd -= 0.1 end
		if (xspd<0) then xspd += 0.1 end
		playerwalk = false 
	end
end  

function _draw()
	cls(12)
	
	-- draws looping clouds
	map(0,5,mapx,98,16,2)
	map(0,5,mapx+128,98,16,2)
	if (mapx<=-127) then mapx = 0 end

	-- draws floor in a loop
	for f=0,15,1 do
		spr(32,8*f,114)
		spr(33,8*f,122)
	end 
	
	-- draws player sprite
	sspr(0+(16*imagenmb),0,16,16,x,y,16,16,spriteflip) 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000b100b100000000000000000000000000000000000000000000000000000
00000b100b10000000000b100b10000000000b100b100000000000000000000000000b1bbb10000000000b100b10000000000000000000000000000000000000
00000b1bbb10000000000b1bbb10000000000b1bbb10000000000b100b1000000000bbbbbbbb000000000b1bbb10000000000b100b1000000000000000000000
0000bbbbbbbb00000000bbbbbbbb00000000bbbbbbbb000000000b1bbb100000000bbeebbbbee0000000bbbbbbbb000000000b1bbb1000000000000000000000
000bbeebbbbee000000bbeebbbbee000000bbeebbbbee0005500bbbbbbbb0000055bbeeb11bee000000bbeebbbbee0005b00bbbbbbbb00000000000000000000
055bbeebbbbee000055bbeebbbbee000055bbeebbbbee000555bbeebbbbee0000553bbbb11bbb000055bbeeb11bee000555bbeebbbbee0000000000000000000
0553bbbbb1bbb0000553bbbbb1bbb0000553bbbbb1bbb0000563beebbbbee000005733bbbbbb00000553bbbb11bbb0000563beebbbbee0000000000000000000
005733bbbbbb0000005733bbbbbb0000005733bbbbbb000000633bbbb1bbb0000007623333b00000015733bbbbbb000000633bbb11bbb0000000000000000000
000762333bb00000000762333bb00000000762333bb000000006333bbbbb000000016288888000000117623333b000000006333bbbbb00000000000000000000
00016288888000000001628888830000001162b8888000000001223333b000000011228888880000001162b8888b00000001223333b000000000000000000000
001122b8888b0000001122888888000001112288888800000011222222280000001122b8888b0000000122888888000000112222222800000000000000000000
0011222888880000011122b8883300000011332888830000001122b2888b00000111122288810000000022288888000000112222888b00000000000000000000
01111222888000000001322288330000000133228880000001111222288000000111133113310000000003328330000001111222288000000000000000000000
01111331133000000000330000000000000000003300000011111331133000000000033003300000000003300330000011111331133000000000000000000000
33333b33444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3b333333442442440000000000000007777700000077770000000000000000000000000000000000000000077777000000000000000000000000000000000000
22222222444444440000000077700077777777777777777000000000000000000000000000000000000000006666700000000000000000000000000000000000
4444444442442442000077077777777777777777777777770000000000000000000000000000000000000b100b10670000000b100b1067000000000000000000
44244244444444440007777777777777777777777777777700000b100b100000000007700770000000000b1bbb10067000000b1bbb1006700000000000000000
44444444424444447077777777777666666677777777777700000b1bbb10000000000777777000000000bbbbbbbb06700000bbbbbbbb06700000000000000000
4244442444424444777777777776666666666777766677775b00bbbbbbbb00007700777777770000000bbeebbbbee670000bbeebbbbee0670000000000000000
444424444444424477777777766666666666667766666777555bbeebbbbee0007777777777777000000bbeeb11bee670000bbeeb11bee0670000000000000000
00000000cccccccc777767776666666666666676666666660563beebbbbee00007777777777770000003bbbb11bbb7700003bbbb11bbb0670000000000000000
00000000cccccccc7776677666666666666666666666666600633bbbb1bbb0000077777777777000000033bbbbbb7770000033bbbbbb00670000000000000000
00777700cccccccc776666666666666666666666666666660006333bbbbb00000007777777770000000012333bb57700000012333bb000670000000000000000
07777770cccccccc676666666666666666666666666666660001223333b00000000777777770000000012288885b500000012288888005670000000000000000
77777777cccccccc666666666666666666666666666666660011222222280000007777777777000000112b888855000000112b88888b57770000000000000000
77777777cccccccc6666666666666666666666666666666600112222888b00000077777777770000001122288888000000112228888805000000000000000000
07777777cccccccc6666666666666666666666666666666601111222288000000777777777700000011132228883300001113222888330000000000000000000
00777770cccccccc6666666666666666666666666666666611111331133000007777777777700000011133111103300001113311110330000000000000000000
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
