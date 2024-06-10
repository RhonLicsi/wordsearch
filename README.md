# Word-search Puzzle
It is a fun and interactive word search game where players find words hidden within the 10x10 grid of letters. You'll be searching for various words listed below:

# Description
This is a Lisp package for generating word search puzzles.
This package provides functions to generate a word search puzzle grid, place words in different directions (horizontal, vertical, diagonal), and search for specific words within the grid.

## How it works
1. Clone or download this repository to your local machine.
2. To use this package, load it into your Lisp environment and call the provided functions.
  - (place-words) It puts the words into the grid
  - (print-grid)  It prints the grid
  - (search-word "WORD") Search for the word "WORD" in the grid


Here are the functions used and its description.
 - random-letter 
    - Generates a random uppercase letter.
	
 - checker
    - Checks if a word can be placed in the grid starting from the specified row and column in the given direction (horizontal, vertical, or diagonal).

 - horizontal
    - Places the word horizontally in the grid.
	
 - vertical
    - Places the word vertically in the grid.

 - diagonal
    - Places the word diagonally in the grid.
	
 - place-words
    - Generates the word search grid by placing words in different directions.

 - clear-grid:
    - Clears the word search grid.

 - print-grid:
    - Prints the word search grid.

 - search-word:
    - Searches for a specific word in the grid and returns its coordinates if found.

# Word List (Changable)
- ISO
- RAZE
- YORU
- JETT
- REYNA

## Additional Notes
You can add/remove words in the *word-set* for your preference.
