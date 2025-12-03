function [i, j] = questionActivateFunction(i, j, qPosI, qPosJ)
%questionActivateFunction - checks whether the 
%   Detailed explanation goes here
arguments (Input)
    i
    j
    qPosI
    qPosJ
end

    if ismember(i, qPosI)
        index = find(i, qPosI);
        if ismember(j, qPosJ)
            index2 = find(j, qPosJ);
            if index == index2
                %activate question and call script.
            end
        end
    end
end