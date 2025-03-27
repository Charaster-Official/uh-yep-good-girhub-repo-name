int[][] board = new int[3][3]; // 0 = empty, 1 = X, 2 = O
int player = 1; 
boolean gameOver = false; //winin boolean, we willen ofc niet dat je instantly wint
int winner = 0; // niemand wint

//window stuff
void setup() {
  size(300, 300);
}

// grid (lijntjes) en bg
void draw() {
  background(255);
  drawGrid(); 
  drawMarks(); 
  
  if (gameOver) { 
    displayWinner();
  }
}

// checkt voor mouse presses
void mousePressed() {
  if (gameOver) return; // Stopt input op game over
  int x = mouseX / 100, y = mouseY / 100; //muis locatie on the board 
  if (board[y][x] == 0) {
    board[y][x] = player;
    if (checkWin(player)) {
      gameOver = true;
      winner = player;
    } else {
      player = 3 - player; // Switch turns
    }
  }
}

// grid stuff
void drawGrid() {
  stroke(0);
  for (int i = 1; i < 3; i++) {
    line(i * 100, 0, i * 100, height);
    line(0, i * 100, width, i * 100);
  }
}


// X en/of O drawing
void drawMarks() {
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(0);
  
  for (int y = 0; y < 3; y++) {
    for (int x = 0; x < 3; x++) {
      if (board[y][x] == 1) text("X", x * 100 + 50, y * 100 + 50);
      if (board[y][x] == 2) text("O", x * 100 + 50, y * 100 + 50);
    }
  }
}


// checkt voor of je 3 in a row hebt
boolean checkWin(int p) {
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == p && board[i][1] == p && board[i][2] == p) return true; // Rows
    if (board[0][i] == p && board[1][i] == p && board[2][i] == p) return true; // Columns
  }
  if (board[0][0] == p && board[1][1] == p && board[2][2] == p) return true; // Main diagonal (links boven, middle, rechts onderaan)
  if (board[0][2] == p && board[1][1] == p && board[2][0] == p) return true; // Other diagonal (rechts boven, middle, links onderaan)
  return false;
}

// laat de winner zien
void displayWinner() {
  fill(255, 0, 0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Player " + winner + " Wins!", width / 2, height / 2);
}
