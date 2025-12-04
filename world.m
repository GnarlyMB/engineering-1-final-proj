clc
close all
clear 

%initialize the scene
scene = simpleGameEngine('retro_pack.png', 16, 16, 4, [6, 64, 43]);
%define background + foreground box to display sprites
displayBox = ones(18, 32);
foregroundBox = ones(18, 32);
%define indexes 
spriteIndex = 243;
trees = 34;
questionIndex = 24;
houses = 340;
bones = 785;


i = 15;
j = 17;
questionPosI = [10, 3, 6, 2, 13, 16, 15];
questionPosJ = [18, 20, 7, 25, 2, 30, 7];

%drawing trees + character
displayBox(i, j) = spriteIndex;
foregroundBox(16, 18) = trees;
foregroundBox(15, 15) = trees;
foregroundBox(9, 20) = trees;
foregroundBox(10, 26) = trees;
%drawing questions
foregroundBox(10, 18) = questionIndex;
foregroundBox(3, 20) = questionIndex;
foregroundBox(6, 7) = questionIndex;
foregroundBox(2, 25) = questionIndex;
foregroundBox(13, 2) = questionIndex;
foregroundBox(16, 30) = questionIndex;
foregroundBox(15, 7) = questionIndex;
%drawing houses
foregroundBox(17, 10) = houses;
foregroundBox(12, 14) = houses;
foregroundBox(7, 19) = houses;
foregroundBox(5, 21) = houses;
foregroundBox(3, 31) = houses;
foregroundBox(14, 22) = houses;
%drawing bones 
foregroundBox(8, 29) = bones;
foregroundBox(10, 3) = bones;
foregroundBox(9, 6) = bones;
foregroundBox(3, 12) = bones;

%displaying the walls with loops
for c = 1:32
    foregroundBox(1, c) = 434; % top
    foregroundBox(18, c) = 498; % bottom
end
for q = 1:18
    foregroundBox(q, 1) = 465; % left
    foregroundBox(q, 32) = 467; % right
end
%displaying the walls(corners)
foregroundBox(1, 1) = 433; %top left
foregroundBox(1, 32) = 435; %top right
foregroundBox(18, 1) = 497; %bottom left
foregroundBox(18, 32) = 499; %bottom right

drawScene(scene, displayBox, foregroundBox)

%Main loop for movement, checks for keyboard input and redraws the sprite
%if needed. S will stop the game and close everything.
while true
    input = scene.getKeyboardInput();
    if strcmp(input, 'uparrow') & i - 1 > 1
        displayBox(i, j) = 1;
        drawScene(scene, displayBox, foregroundBox);
        i = i - 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, foregroundBox);
    elseif strcmp(input, 'downarrow') & i + 1 < 18
        displayBox(i, j) = 1;
        drawScene(scene, displayBox, foregroundBox);
        i = i + 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, foregroundBox);
    elseif strcmp(input, 'rightarrow') & j + 1 < 32
        displayBox(i, j) = 1;
        drawScene(scene, displayBox, foregroundBox);
        j = j + 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, foregroundBox);
    elseif strcmp(input, 'leftarrow') & j - 1 > 1
        displayBox(i, j) = 1;
        drawScene(scene, displayBox, foregroundBox);
        j = j - 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, foregroundBox);
    elseif strcmp(input, 's')
        disp("Game stopped.");
        close all
        break;
    elseif strcmp(input, 'space')
        questionActivateFunction(i, j, questionPosI, questionPosJ);
    else
        drawScene(scene, displayBox, foregroundBox);
    end
end