clc 
clear 
close all

retro = simpleGameEngine('retro_pack.png', 16,16,4, [6, 64, 43]);
%letters
m = 992;
u = 1019;
l = 991;
t = 1018;
i = 988;
p = 1014;
y = 1023;
colon = 958;
%numbers
nine = 957;
eight= 956;
seven = 955;
six = 954;
five = 953;
four = 952;
three = 951;
two = 950;
one = 949;
%symbols
multiply = 825;
problem = [m,u,l,t,i, p, l, y, colon; 1, 1, 1, nine,multiply,four, 1, 1, 1; 1, three, six, 1, 1, 1, 1, 1, 1; 1, four, two, 1, 1, 1, 1, 1, 1; 1, six, four, 1, 1, 1, 1, 1, 1;1, 1, 1, 1, 1, 1, 1, 1, 1];
sprite = [1, 1, 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1 , 1, 1, 1, 1; 243, 1, 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1, 1, 1; 1, 1, 1, 1, 1, 1, 1, 1, 1];



drawScene(retro, problem, sprite)