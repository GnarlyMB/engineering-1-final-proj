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


        answers
        correctIndex
    end

    methods
        function obj = mathGame()
            %MATHGAME Construct an instance of this class
            %   Detailed explanation goes here
            spriteH = 16;
            spriteW = 16;
            zoom = 4;
            bgColor = [0 0 0];
            obj@simpleGameEngine("retro_pack.png", spriteH, spriteW, zoom, bgColor);

            obj.spriteDigit0 = 948;
            obj.spritePlus = 825;
            obj.spriteEquals = 958;
            obj.spriteAnswerBase = 520;
            obj.problems = obj.generateProblems(5);
        end

        function problems = generateProblems(obj, n)
            problems = zeros(n, 5);
            for k = 1:n
                problems(k,:) = createProblems.buildOutput();
            end
        end

        function id = digitToSprite(obj, d)
            id = obj.spriteDigit0 + d;
        end
        
        function [tens, onesDigit] = splitNumber(~, n)
            n = max(0, min(n, 99));
            tens = floor(n/10);
            onesDigit = mod(n, 10);
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

            bg = ones(5, 5);

            scoreStr = sprintf("%d/%d", obj.score, obj.total);
            scoreCol = 1;

            for j = 1:length(scoreStr)
                charVal = scoreStr(j);
                if charVal >= '0' && charVal <= '9'
                    digit = str2double(charVal);
                    bg(1, scoreCol) = obj.digitToSprite(digit);
                    scoreCol = scoreCol + 1; 
                elseif strcmp(charVal, '/')
                    bg(1, scoreCol) = 1;
                    scoreCol = scoreCol + 1;
                end
            end

            [n1t, n1o] = obj.splitNumber(n1);
            bg(1,1) = obj.digitToSprite(n1t);
            bg(1,2) = obj.digitToSprite(n1o);
            bg(2, 1) = obj.spriteEquals;
            bg(1,3) = obj.spritePlus;

            [n2t, n2o] = obj.splitNumber(n2);
            bg(1,4) = obj.digitToSprite(n2t);
            bg(1,5) = obj.digitToSprite(n2o);

            for i = 1:3
                bg(2 + i, 2) = obj.spriteAnswerBase + (i - 1);
            end
            
            for i = 1:3
                val = answers(i);
                [tens, onesDigit] = obj.splitNumber(val);

                r = 2 + i;
                c0 = 3;
                if val < 10
                    bg(r, c0) = obj.digitToSprite(onesDigit);
                    bg(r, c0-1) = 1;
                else
                    bg(r, c0-1) = obj.digitToSprite(tens);
                    bg(r, c0) = obj.digitToSprite(onesDigit);
                end
            end

            fprintf("Building...\n %d sprites\n", numel(obj.sprites))
            obj.drawScene(bg);
            fprintf("\nScene Drawn\n")

            obj.answers = answers;
            obj.correctIndex = correctIndex;
        end

        function play(obj)
            obj.drawCurrentProblem();
            
            while obj.currentProblem <= size(obj.problems, 1)
                
                [row, col, ~] = obj.getMouseInput();

                if row == 3 && col >= 2 && col <= 4
                    chosenIdx = row - 2;
                    answers = obj.answers;
                    correctIx = obj.correctIndex;
                    chosenVal = answers(chosenIdx);

                    if chosenIdx == correctIx
                        obj.score = obj.score + 1;
                        fprintf("Correct! %d\n", chosenVal);
                    else
                        fprintf("Incorrect. The answer was %d\n", answers(correctIx))
                    end
                    
                    obj.currentProblem = obj.currentProblem + 1;

                    if obj.currentProblem <= size(obj.problems, 1)
                        obj.drawCurrentProblem();
                    else
                        break;
                    end

                else
                    obj.drawCurrentProblem();
                    
                end
            
            
            end
            fprintf("Final score: %d / %d\n", obj.score, size(obj.problems,1));
        end
        
    end
end