clc 
close all
clear 

startingScreen = simpleGameEngine('retro_pack.png', 16, 16, 3, [0, 0, 0]);
input = [1000, 1000];
while input(x) == 1000 & input(y) == 1000
    input = getMouseInput(startingScreen);
end


