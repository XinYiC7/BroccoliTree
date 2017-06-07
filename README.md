# Team BroccoliTree

Group Members: Xin Yi Chen, Melanie Chow, Gian Tricarico

# PacMan

Our version of Pac-Man is similar to the original game but with some
modifications. The goal of the game is to get higher scores instead of eating
all the dots and getting to higher levels. Each dot reappears a few seconds
after the player eats it so that the player may continue eating dots until he
or she runs out of lives. The player uses the arrow keys to move around the
maze, and there are four ghosts that move around the maze randomly. When the
ghosts collide with the player, the player will lose a life. A few of the dots
will be large dots called power pellets, and after eating one the player will
temporarily be able to eat a ghost. After the player eats one ghost, the ghosts
will return to normal and be able to eat the player again. The player must be
careful if there are multiple ghosts around, because once Pac-Man eats one
ghost, another ghost can eat him right afterward.

# How it works

We use a queue to store the dots that Pac-Man eats. These Dots have attributes
for their x and y coordinates so that they can return to the same position as
they were initially once they leave the queue.

The maze is based on a 2D array of Strings and uses the Processing display
window to create blocks that represent spaces in the 2D array.

The player can input a name and, if the score is high enough when all of the
lives run out, the game stores the name and score on the high scores list, which
is in a text file.

# Launch instructions

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
