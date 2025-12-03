clear
close
clear all


scene = simpleGameEngine('retro_pack.png', 16, 16, 4, [6, 64, 43]);
displayBox = ones(18, 32);
treeBox = ones(18, 32);
spriteIndex = 243;
trees = 34;
i = 15;
j = 17;


displayBox(i, j) = spriteIndex;
treeBox(16, 18) = trees;
treeBox(15, 15) = trees;
treeBox(9, 20) = trees;
treeBox(10, 26) = trees;
treeBox(10, 18) = trees;
treeBox(1, 1) = trees;

drawScene(scene, displayBox, treeBox)
while true
    input = scene.getKeyboardInput();
    if strcmp(input, 'uparrow') 
        i = i - 1;
        displayBox(i, j) = 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, treeBox);
    elseif strcmp(input, 'downarrow')
        i = i + 1;
        displayBox(i, j) = 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, treeBox);
    elseif strcmp(input, 'rightarrow')
        j = j + 1;
        displayBox(i, j) = 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, treeBox);
    elseif strcmp(input, 'leftarrow') 
        j = j - 1;
        displayBox(i, j) = 1;
        displayBox(i, j) = spriteIndex;
        drawScene(scene, displayBox, treeBox);
    elseif strcmp(input, 's')
        disp("Game stopped.");
        break;
    else
        drawScene(scene, displayBox, treeBox);
    end
end