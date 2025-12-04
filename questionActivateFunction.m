function [i, j] = questionActivateFunction(i, j, qPosI, qPosJ)
game = mathGame;
%questionActivateFunction - checks whether the 
%   Detailed explanation goes here
    if ismember(i, qPosI)
        index = find(qPosI == i);
        if ismember(j, qPosJ)
            index2 = find(qPosJ == j);
            if index == index2
                %activate question and call script.
                game.play();
                close Figure 2
                
            end
        end
    end
end