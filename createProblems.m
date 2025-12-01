classdef createProblems
    %CREATEPROBLEMS Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Property1
    end

    methods
        function [num1, num2] = createNumbers()
            num1 = randi(10)
            num2 = randi(10)
        end

        function output = buildProblem(num1, num2)
            %build the numbers + answer
        end
    end
end