classdef createProblems
    %CREATEPROBLEMS Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Property1 = []
    end

    methods(Static)

        function wrong = buildWrong(correct)
            possible = randi(100);
            if possible == correct
                buildWrong(correct)
            else
                wrong = possible;
            end
        end



            function output = buildOutput()
                number1 = randi(10);
                number2 = randi(10);
                correct = number1 * number2;
                wrong1 = createProblems.buildWrong(correct);
                wrong2 = createProblems.buildWrong(correct);
                output = [correct, wrong1, wrong2];
            end
    end
end