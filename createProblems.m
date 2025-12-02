classdef createProblems
    %CREATEPROBLEMS Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Property1
    end

    methods
        function [num1] = createNumbers()
            num1 = randi(10);
        end

        function [correct] = buildCorrect(num1, num2)
            %build the numbers + answer
            correct = num1 * num2
        end

        function [wrong] = buildWrong(correct)
            possible = randi(100)
            if possible == correct
                buildWrong(correct)
            else
                wrong = possible
            end
        end

        function output = buildOutput()
            number1 = createNumbers();
            number2 = createNumbers();
            correct = buildCorrect(number1, number2)
            wrong1 = buildWrong(correct)
            wrong2 = buildWrong(correct)
            output = [correct, wrong1, wrong2]
        end
    end
end