require("ul_serial")

function love.load()
	p = io.Serial{port='/dev/ttyACM0', baud=3200, bits=8, stops=1, parity='n'};
	y=300;

	--Calibrage du thérémine (en cours)
	local i = 0;
	calibre = 0;
	while i < 5 do
		local ser = tonumber(p:read());
		if ser ~= nil then
			if ser >= 100 then
				calibre = calibre + ser;
				i = i + 1;
			end
		end
	end
	calibre = (calibre / 5) - love.graphics.getHeight(); --Calibrage terminé.
end

function love.draw()
	love.graphics.setColor(255,255,255);
	love.graphics.circle("fill", 100, y, 50, 50);
end

function love.update(dt)
	local var = tonumber(p:read());
	if var ~= nil then
		local yvar = var - calibre;
		if yvar <= 500 and yvar >= 100 then
			y = yvar;
		end
	end
end	
