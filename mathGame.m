classdef mathGame < simpleGameEngine
    %MATHGAME Summary of this class goes here
    %   Detailed explanation goes here

    properties
        problems
        currentProblem = 1
        score = 0
        total = 0

        spriteDigit0
        spritePlus
        spriteEquals
        spriteAnswerBase
    end

    methods
        function obj = mathGame()
            %MATHGAME Construct an instance of this class
            %   Detailed explanation goes here
            spriteH = 16;
            spriteW = 16;
            zoom = 4;
            bgColor = [240 240 240];
            obj@simpleGameEngine("retro_pack.png", spriteH, spriteW, zoom, bgColor);

            obj.spriteDigit0 = 500;
            obj.spritePlus = 510;
            obj.spriteEquals = 511;
            obj.spriteAnswerBase = 520;
            obj.problems = obj.generateProblems(5);
        end

        function problems = generateProblems(obj, n)
            problems = zeros(n, 5);
            for k = 1:n
                problems(k,:) = createProblems.buildOutput()
            end
        end

        function id = digitToSprite(obj, d)
            id = obj.spriteDigit0 + d;
        end
        
        function [tens, ones] = splitNumber(~, n)
            n = max(0, min(99));
            tens = floor(n/10);
            ones = mod(n, 10);
        end
        function drawCurrentProblem(obj)
        
            prob = obj.problems(obj.currentProblem, :);
            n1 = prob(1);
            n2 = prob(2);
            correct = prob(3);
            wrong1 = prob(4);
            wrong2 = prob(5);

            answers = [correct, wrong1, wrong2];
            order = randperm(3);
            answers = answers(order);
            correctIndex = find(answers == correct, 1);

            obj.total = max(obj.total, obj.currentProblem);

            bg = zeros(3, 6);

            [n1t, n1o] = obj.splitNumber(n1);
            bg(1,1) = obj.digitToSprite(n1t);
            bg(1,2) = obj.digitToSprite(n1o);
            bg(1,3) = obj.spritePlus;

            [n2t, n2o] = obj.splitNumber(n2);
            bg(1,4) = obj.digitToSprite(n2t);
            bg(1,5) = obj.digitToSprite(n2o);

            for i = 1:3
                bg(2, 1+i) = obj.spriteAnswerBase + (i - 1);
            end

            obj.drawScene(bg);

            obj.UserData.answers = answers;
            obj.UserData.correctIndex = correctIndex;
        end

        function play(obj)
            while obj.currentProblem <= size(obj.problems, 1)
                obj.drawCurrentProblem();
                [row, col, ~] = obj.getMouseInput();

                if row == 2 && col >= 2 && col <= 4
                    chosenIdx = col - 1;
                    pass
            end
            
            
        end
    end
end