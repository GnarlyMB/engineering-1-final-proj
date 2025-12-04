function [i, j] = questionActivateFunction(i, j, qPosI, qPosJ)
game = mathGame;
%questionActivateFunction - checks whether the player's position is in the
%same position of one of the question
    if ismember(i, qPosI) % checks if the row position is in the vector of question positions
        index = find(qPosI == i); %finds index of row position if true
        if ismember(j, qPosJ) % checks if col position is in the vector
            index2 = find(qPosJ == j); %finds index of col position if true
            if index == index2 %checks if the two indexes are equal
                %activate question and call script.
                game.play();
                close Figure 2
            end
        end
    end
end