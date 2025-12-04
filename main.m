clc 
close all
clear 

%initializing the starting screen
startingScreen = simpleGameEngine('retro_pack.png', 16, 16, 3, [0, 0, 0]);
displayBox = ones(18, 32);
%creating the letters for the starting screen
c = 982;
l = 991;
i = 988;
k = 990;
s = 1017;
p = 1014;
a = 980;
e = 984;
t = 1018;
o = 1013;
r = 1016;

%displaying the sentence "Click space to start"
displayBox(5, 7) = c;
displayBox(5, 8) = l;
displayBox(5, 9) = i;
displayBox(5, 10) = c;
displayBox(5, 11) = k;
%space
displayBox(5, 13) = s;
displayBox(5, 14) = p;
displayBox(5, 15) = a;
displayBox(5, 16) = c;
displayBox(5, 17) = e;
%space
displayBox(5, 19) = t;
displayBox(5, 20) = o;
%space
displayBox(5, 22) = s;
displayBox(5, 23) = t;
displayBox(5, 24) = a;
displayBox(5, 25) = r;
displayBox(5, 26) = t;

drawScene(startingScreen, displayBox)
%Main loop, waits until the player starts the game and then runs the
%openworld script
while true
    input = startingScreen.getKeyboardInput();
    if strcmp(input, 'space')
        %We start the game
        run('world.m');
    end
end


