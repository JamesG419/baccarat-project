%=======================================================================
% James Glenister
% Baccarat
% This program plays a simple, text based version of Baccarat
%=====================================================================

function money = juniorDesignProject()
    money = 1000;
    %seeds RNG
    stream = RandStream('mt19937ar','seed',sum(100*clock));
    RandStream.setDefaultStream(stream);
    
    fprintf('Welcome. You have $%d to play with.\n',money)
    %play initializer
    play = 1;  
persistent shoe
while play ==1
    willPlay = input('Would you like to play? (y/n): ','s');
    if upper(willPlay) == 'Y'
        needToShuffle = 1;
        begin = 1;
        while begin == 1;
            while money > 0
                if needToShuffle == 1
                    shoe = shoecreate();
                    needToShuffle = 0;
                else
                end
                betVar = 1;
                while betVar == 1
                    bet = input('Please enter your bet: ');
                    if bet <= money
                        hands = {[] ,[]};
                        for n = (1:2)
                            [hands{1}(n),shoe] = drawCard(shoe);
                            [hands{2}(n),shoe] = drawCard(shoe);
                        end
                        if (scoreHand(hands{1}) == 8) || (scoreHand(hands{1}) == 9)
                                elseif (scoreHand(hands{2}) == 8)||(scoreHand(hands{2}) == 9)
                                    % if dealer wins on deal, skip to
                                    % scoring
                                else
                                    phand = handToString(hands{1}); % set variable to shorten next line
                                    fprintf('\nYour hand is %s, which counts as %d.\n', phand, scoreHand(hands{1}));
                                        % displays user's hand and value
                                    willdraw = 0; % loop variable
                                    while willdraw == 0;
                                        draw = input('Would you like to draw? (y/n): ', 's'); % if user wants to draw
                                        if (lower(draw) == 'y')
                                            [hands{1}(end + 1), shoe] = drawCard(shoe); % draw card and add to hand
                                            willdraw = 1; % exit loop
                                        elseif (lower(draw) == 'n')
                                            willdraw = 1; % exit loop
                                        else
                                            fprintf('I''m sorry, I didn''t catch that, please re-enter your choice.\n')
                                                % barrot catcher
                                        end
                                    end
                                end
                                % dealer functions
                                if length(hands{1}) == 3 % if player has drawn a card
                                    playerCard3 = scoreHand(hands{1}(3)); % switch variable
                                    switch playerCard3
                                        case 0  % 3rd card is 10 or Face card
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 3) % dealer 0-3
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 1  % 3rd card is Ace
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 3) % dealer 0-3
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 2  % 3rd card is 2
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 4) % dealer 0-4
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 3
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 4) % dealer 0-4
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 4
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 5) % dealer 0-5
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 5
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 5) % dealer 0-5
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 6
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 6) % dealer 0-6
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 7
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 6) % dealer 0-6
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 8
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 2) % dealer 0-2
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                        case 9
                                            if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <= 3) % dealer 0-2
                                                [hands{2}(3), shoe] = drawCard(shoe);   % draw
                                            else
                                            end
                                    end
                                elseif length(hands{1}) == 2    % if player hasnt drawn
                                    if (scoreHand(hands{2}) >= 0)&&(scoreHand(hands{2}) <=5) % dealer 0-5
                                        [hands{2}(3), shoe] = drawCard(shoe); % draw
                                    else
                                    end
                                else
                                end
                                % display hands
                                yourHand = '\nYour hand is %s, which counts as %d.\n';
                                dealerHand = 'The Dealer''s hand is %s, which counts as %d.\n';
                                fprintf(yourHand, handToString(hands{1}), scoreHand(hands{1}))
                                fprintf(dealerHand, handToString(hands{2}), scoreHand(hands{2}))
                                
                                % determine score and set how much money
                                % for player
                                if scoreHand(hands{1}) > scoreHand(hands{2})
                                    fprintf('\nYou have won!, your earnings for this hand is $%d.\n', bet)
                                    money = money + bet;
                                    fprintf('you have $%d to play.\n', money)
                                elseif scoreHand(hands{2}) > scoreHand(hands{1})
                                    fprintf('\nYou have lost, you lose $%d this round.\n', bet)
                                    money = money - bet;
                                    fprintf('you have $%d to play.\n', money)
                                elseif scoreHand(hands{1}) == scoreHand(hands{2})
                                    fprintf('\nThis hand resulted in a tie, no money has been exchanged.\n')
                                    fprintf('you have $%d to play.\n', money)
                                end
                                betVar = 0; % exits loop asking for bet
                                again = 0;  % loop variable
                            elseif bet > money  % if user tries to bet more than they have
                                fprintf('Sorry, you cannot bet this amount. Please enter a new bet.\n')
                                betVar = 1;    % asks for bet again
                                again = 1;      % loop variable
                            end
                            if length(shoe) <= 52 % if shoe has dropped to 52 cards or lower
                                needToShuffle = 1; % tells to reshuffle
                                fprintf('The shoe has been replaced\n')
                            end
                            while again == 0;
                                playagain = input('Would you like to play again? (y/n): ', 's');
                                if lower(playagain) == 'y'
                                    again = 1;
                                elseif lower(playagain) == 'n' % if user doesn't want to play again, exit all loops
                                    begin = 0;
                                    again = 1;
                                    betVar = 0;
                                    play = 0;
                                    money = 0;

                                else
                                    fprintf('I''m sorry, I didn''t catch that, please re-enter your choice.\n')
                                    % barrot catcher
                                end
                            end
                    end
                end
            end
        elseif Upper(willPlay) == 'N'
            play = 0;
        else
            fprintf('I''m sorry, I didn''t catch that, please re-enter your choice.\n')
        end
        if money <= 0
            fprintf('\nThank you for playing Baccarat today. Good-Bye.')
            % end of displayed program
            play = 0;
        end
end
    
    

    


% This function creates a shoe of 6 deck of 52 numbered from 0-51
function  [shoe] = shoecreate()
    a = randperm(52)-1;
    b = randperm(52)-1;
    c = randperm(52)-1;
    d = randperm(52)-1;
    e = randperm(52)-1;
    f = randperm(52)-1;
    deck = vertcat(a,b,c,d,e,f);
    shoe = reshape(deck,1,[]);


    function [card,outshoe] = drawCard(shoeA)
        card = shoeA(1);
        outshoe = shoeA(2:end);
    


    %this function takes a card and  gives it a suit and a card name
function [cardString] = cardToString(card)
       
    %cards are sorted into suits based on the number value. 
    if card >=0 && card <= 12
        suitString = 'H';
    elseif card >= 13 && card <= 25
        suitString = 'S';
    elseif card >= 16 && card <= 38
        suitString = 'C';
    elseif card >= 39 && card <= 51
        suitString = 'D';
    end
    
    %the cards will be given a card name based on the remainder after
    %dividing by 13. 
    num = mod(card,13);   
    switch num
        case 0
            numString = '2';
        case 1
            numString = '3';
        case 2
            numString = '4';
        case 3
            numString = '5';
        case 4
            numString = '6';
        case 5
            numString = '7';
        case 6
            numString = '8';
        case 7
            numString = '9';
        case 8
            numString = '10';
        case 9
            numString = 'J';
        case 10
            numString = 'Q';
        case 11
            numString = 'K';
        case 12
            numString = 'A';
    end

    %Takes the two strings created by the function and creates one card
    %vector
    cardString = [numString,suitString];

    
   %function creates the string that displays the current hand
    function [handString] = handToString(hand)
        handString = '';
        for n = 1:length(hand)
            currentCard = cardToString(hand(n));
            handString = [handString,' ',currentCard];
        end
    
    
    %scoring function
    function [val] = scoreHand(hand)
        %gives every card a number between 0-12
        cardDigits = mod(hand,13);
       
        %score for number cards. If greater than 10, the array
        %multiplication is zero
        numbers = (cardDigits + 2).*(cardDigits < 9);
        
        %score multiplication for face cards. Equals zero
        faces = 0.*((cardDigits < 9) & (cardDigits ~=12));
        
        %Points for aces.
        aces = (cardDigits == 12);
        
        %Sums the total for the vector
        handValue = sum(numbers)+sum(faces)+sum(aces);
        
        %Baccarat rules say that the points must be between 0-10. The mod
        %takes care of that.
        val = mod(handValue,10); 
    