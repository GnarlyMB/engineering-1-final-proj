clc
clear
close all

retro = simpleGameEngine('retro_pack.png', 16, 16, 4, [6, 64, 43]);
displayBox = ones(18, 32);
treeBox = ones(18, 32);
initialSprite = 243;
trees = 34;
i = 15;
j = 17;


displayBox(i, j) = initialSprite;
treeBox(16, 18) = trees;
treeBox(15, 15) = trees;
treeBox(9, 20) = trees;
treeBox(10, 26) = trees;
treeBox(10, 18) = trees;
treeBox(1, 1) = trees;

drawScene(retro, displayBox, treeBox)