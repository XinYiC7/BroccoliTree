# Team BroccoliTree

Group Members: Xin Yi Chen, Melanie Chow, Gian Tricarico

# PacMan

Our version of Pac-Man is similar to the original game but with little changes to the details. The goal of the game is to get higher scores instead of eating all the dots and getting to higher levels. After the player eats the dots, the dots will reappear after a few seconds. There will be four ghosts that randomly go around the maze. When the ghosts collide with the player, the player will lose a life. Every time the player gets 1000 points, a mini-game (“stack the tower”) will pop up. The points gain from the tower game will be added to the current player’s score, and the player will continue on the game until they have no more lives. 

# How it works

We will use queue to store the dots that were eaten by their x and y position values (enqueue) and make the dots reappear again after few seconds (dequeue their position and make them appear on the 2D matrix maze). 

The mini game “stack the tower” will use stack structure in that the next falling rectangle is the same size as the rectangle on top of the stack. Every time a portion of the tower is missed, part of the rectangle is cut off. Once there is no more portions of the rectangle left to build, the game ends. 

The game then progresses with faster moving ghosts. 
 
A 2D matrix is used to create the maze/board (including all the characters and dots).

*for the future: As of now a csv file will be used to hold the highscores so that these scores can be saved.

# Launch instruction

1. Clone this repo
   $ git clone https://github.com/XinYiC7/BroccoliTree.git
2. Open PacMan.pde in the PacMan directory in processing
3. Click the play button in the top left corner
