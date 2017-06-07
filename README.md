# Team BroccoliTree

Group Members: Xin Yi Chen, Melanie Chow, Gian Tricarico

# PacMan

Our version of Pac-Man is similar to the original game but with little changes to the details. The goal of the game is to get higher scores instead of eating all the dots and getting to higher levels. After the player eats the dots, the dots will reappear after a few seconds. There will be four ghosts that randomly go around the maze. When the ghosts collide with the player, the player will lose a life. The player has three lives, once all 3 lives are gone, the game is officially over and the player is redirected to the highscore tab to see if they made top 10! They can then play again if they like. 

# How it works

We will use queue to store the dots that were eaten by their x and y position values (enqueue) and make the dots reappear again after few seconds (dequeue their position and make them appear on the 2D matrix maze). We will also use a LLqueue to store jailed ghosts so they can be dequeued to become free. 
 
A 2D matrix is used to create the maze/board (including all the characters and dots) and the characters travel within the array, changing the values in these positions to edit the board. The board is redrawn (located in the draw() method) to reflect any changes. This, however, does not edit the actual text file. 

A text file is used to store the top ten high scores so that it does not reset every time. To do this, we used the loadStrings(), split(), and saveStrings() method.

# Launch instruction

1. Download Processing
2. Clone this repo
```
   git clone https://github.com/XinYiC7/BroccoliTree.git
```
3. Open PacMan directory
4. Run the program
```
   processing PacMan.pde
```
