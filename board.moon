class Board
  new: =>
    @board = {}
    for i = 1, ROWS
      row = {}
      for j = 1, COLS
        row[j] = 0
      @board[i] = row

  clean: =>
    newBoard = {}
    for i = 1, ROWS
      row = {}
      for j = 1, COLS
        row[j] = 0
      newBoard[i] = row
    i1 = 1
    for i = 1, ROWS
      cleanRow = true
      for j = 1, COLS
        newBoard[i1][j] = @board[i][j]
        if @board[i][j] == 0 then cleanRow = false
      if not cleanRow then i1 += 1
    @board = newBoard

  draw: =>
    love.graphics.setColor 1, 1, 1
    love.graphics.rectangle 'line', OFFSET_X, OFFSET_Y, COLS * BLOCK_DIM, ROWS * BLOCK_DIM
    for row = ROWS, 1, -1
      for col = 1, COLS
        if @board[row][col] ~= 0
          x = (col - 1) * BLOCK_DIM
          y = (ROWS - row) * BLOCK_DIM
          love.graphics.rectangle 'fill', OFFSET_X + x + 1, OFFSET_Y + y + 1, BLOCK_DIM - 2, BLOCK_DIM - 2

{ :Board }
