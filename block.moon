class Block
  new: (board) =>
    @board = board
    @shapeIdx = 1

  changeShape: =>
    oldIdx = @shapeIdx
    @shapeIdx = @shapeIdx % #@shapes + 1
    if @collides!
      @shapeIdx = oldIdx
      return false
    return true

  down: =>
    @row -= 1
    if @collides!
      @row += 1
      return false
    return true

  left: =>
    @col -= 1
    if @collides!
      @col += 1
      return false
    return true

  right: =>
    @col += 1
    if @collides!
      @col -= 1
      return false
    return true

  collides: =>
    shape = @shapes[@shapeIdx]
    for row = 1, #shape
      for col = 1, #shape[row]
        if shape[row][col] == 0 then continue
        r = @row + row - 1
        if r > ROWS then continue
        if r < 1 then return true
        c = @col + col - 1
        if c < 1 or c > COLS then return true
        if @board.board[r][c] ~= 0 then return true
    return false

  settle: =>
    shape = @shapes[@shapeIdx]
    for row = 1, #shape
      for col = 1, #shape[row]
        if shape[row][col] == 0 then continue
        r = @row + row - 1
        if r > ROWS then continue
        c = @col + col - 1
        @board.board[r][c] = 1

  draw: =>
    shape = @shapes[@shapeIdx]
    love.graphics.setColor @color
    for row = 1, #shape
      for col = 1, #shape[row]
        if shape[row][col] ~= 0
          x = (@col + col - 2) * BLOCK_DIM
          y = (ROWS - (@row + row - 1)) * BLOCK_DIM
          love.graphics.rectangle 'fill', OFFSET_X + x + 1, OFFSET_Y + y + 1, BLOCK_DIM - 2, BLOCK_DIM - 2

class BlockI extends Block
  new: (board) =>
    super board
    @color = { 0, 1, 1 }
    @shapes = {
      {
        { 0, 1, 0, 0 }
        { 0, 1, 0, 0 }
        { 0, 1, 0, 0 }
        { 0, 1, 0, 0 }
      }
      {
        { 0, 0, 0, 0 }
        { 1, 1, 1, 1 }
        { 0, 0, 0, 0 }
        { 0, 0, 0, 0 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 4) / 2) + 1

class BlockO extends Block
  new: (board) =>
    super board
    @color = { 1, 1, 0 }
    @shapes = {
      {
        { 1, 1 }
        { 1, 1 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 2) / 2) + 1

class BlockT extends Block
  new: (board) =>
    super board
    @color = { 1, 0, 1 }
    @shapes = {
      {
        { 0, 1, 0 }
        { 1, 1, 1 }
        { 0, 0, 0 }
      }
      {
        { 0, 1, 0 }
        { 0, 1, 1 }
        { 0, 1, 0 }
      }
      {
        { 0, 0, 0 }
        { 1, 1, 1 }
        { 0, 1, 0 }
      }
      {
        { 0, 1, 0 }
        { 1, 1, 0 }
        { 0, 1, 0 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 3) / 2) + 1

class BlockS extends Block
  new: (board) =>
    super board
    @color = { 0, 1, 0 }
    @shapes = {
      {
        { 0, 1, 0 }
        { 1, 1, 0 }
        { 1, 0, 0 }
      }
      {
        { 0, 0, 0 }
        { 1, 1, 0 }
        { 0, 1, 1 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 3) / 2) + 1

class BlockZ extends Block
  new: (board) =>
    super board
    @color = { 1, 0, 0 }
    @shapes = {
      {
        { 0, 1, 0 }
        { 0, 1, 1 }
        { 0, 0, 1 }
      }
      {
        { 0, 0, 0 }
        { 0, 1, 1 }
        { 1, 1, 0 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 3) / 2) + 1

class BlockJ extends Block
  new: (board) =>
    super board
    @color = { 0, 0, 1 }
    @shapes = {
      {
        { 0, 1, 0 }
        { 0, 1, 0 }
        { 0, 1, 1 }
      }
      {
        { 0, 0, 1 }
        { 1, 1, 1 }
        { 0, 0, 0 }
      }
      {
        { 1, 1, 0 }
        { 0, 1, 0 }
        { 0, 1, 0 }
      }
      {
        { 0, 0, 0 }
        { 1, 1, 1 }
        { 1, 0, 0 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 3) / 2) + 1

class BlockL extends Block
  new: (board) =>
    super board
    @color = { 1, 0.5, 0 }
    @shapes = {
      {
        { 0, 1, 0 }
        { 0, 1, 0 }
        { 1, 1, 0 }
      }
      {
        { 1, 0, 0 }
        { 1, 1, 1 }
        { 0, 0, 0 }
      }
      {
        { 0, 1, 1 }
        { 0, 1, 0 }
        { 0, 1, 0 }
      }
      {
        { 0, 0, 0 }
        { 1, 1, 1 }
        { 0, 0, 1 }
      }
    }
    @row = ROWS + 1
    @col = math.floor((COLS - 3) / 2) + 1

{ :BlockI, :BlockO, :BlockT, :BlockS, :BlockZ, :BlockJ, :BlockL }
