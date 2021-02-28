% clear workspace
clear, clc

%Loads the start menu


%assigns starting values
playerNum=1;
otherPlayerNum=2;
player1Chips=20;
player2Chips=20;
player1Bet=0;
player2Bet=0;
newGame='5';

if playerNum==1
    while player1Chips>0 
        player1Bet=input('\nPlease enter bet amount');
        
        %checks if player 1 enter correct bet amount
        while player1Bet==0 | player1Bet> player1Chips | player1Bet<0
            if player1Bet>player1Chips
                fprintf('\n Your bet is greater than your chips!');
                player1Bet=input('\n Please enter bet amount');
            elseif player1Bet==0
                fprintf('\n Your bet is must be greater than 0 chips!');
                player1Bet=input('\n Please enter bet amount');
            elseif player1Bet<0
                fprintf('\n Your bet must be a positive number!');
                player1Bet=input('\n Please enter bet amount'); 
            end
        end
        
        %randomly assign two cards to player and dealer
   player1Hand=randsample(10,2)
   dealerHand=randsample(10,2);
        
        %show total of player and dealer's hand
   player1Total=sum(player1Hand)
   dealerTotal=sum(dealerHand);
   
        %Player 1 chooses to hit or stay
   player1Choice=input('Hit(2) or Stay(3)');
   
        %See if player 1 busts and adds to hand
        hit=0;
        while (player1Total<=21) & (player1Choice==2)
            player1Hand=[player1Hand; randsample(10,1)];
            player1Total=sum(player1Hand)
            hit=hit+1;
            if player1Total>=21
                break
            end
            player1Choice=input('Hit(2) or Stay(3)');
        end
        if player1Choice==3
            player1Hand=player1Hand;
        end
        while dealerTotal<17
            dealerHand=[dealerHand; randsample(10,1)];
            dealerTotal=sum(dealerHand)
            if dealerTotal>=21
                break
            end
        end
        
        %Shows who wins
        if player1Total>21
            msgbox('You Lost:(');
            player1Chips=player1Chips-player1Bet;
        elseif (player1Total<=21) & (dealerTotal>21)
            msgbox('You win:)');
            player1Chips=player1Chips+player1Bet;
        elseif (player1Total<=21) & (player1Total>dealerTotal)
            msgbox('You win:)');
            player1Chips=player1Chips+player1Bet;
        elseif dealerTotal>player1Total
            msgbox('You Lost:(');
            player1Chips=player1Chips-player1Bet;
        elseif dealerTotal==player1Total
            msgbox('Draw!')
            player1Chips;
        end
        fprintf('\nYou currently have %i. Chips\n', player1Chips)
        if player1Chips>0
            newGame=input('\nPlay Again(5/6)?');
        end
    end
end

            
           
            
      
            
            



