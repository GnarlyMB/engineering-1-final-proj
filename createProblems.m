classdef createProblems
    %CREATEPROBLEMS mathematical backend for the math problems
    methods(Static)

        function output = buildOutput()
            %Create a random problem
            number1 = randi(10);
            number2 = randi(10);
            correct = number1 * number2;
            wrong1 = createProblems.buildWrong(correct);
            wrong2 = createProblems.buildWrong(correct);
            output = [number1, number2, correct, wrong1, wrong2];
        end

        
        function wrong = buildWrong(correct)
            %No shot recursion worked for this lmao
            possible = randi(101);
            if possible == correct
                buildWrong(correct)
            else
                wrong = possible;
            end
        end



    end
end