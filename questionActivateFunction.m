function [i, j] = questionActivateFunction(i, j, qPosI, qPosJ)
%questionActivateFunction - checks whether the player's position matches
%any question position
    if ismember(i, qPosI)
        index = find(qPosI == i);
        if ismember(j, qPosJ)
            index2 = find(qPosJ == j);
            if index == index2
                %activate question and call script.
                disp("question activated.");
            end
        end
    end
end