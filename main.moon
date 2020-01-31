export ROWS, COLS = 20, 10
export OFFSET_X, OFFSET_Y, BLOCK_DIM
export DROP_INTERVAL = 1

import Board from require 'board'
import BlockI, BlockO, BlockT, BlockS, BlockZ, BlockJ, BlockL from require 'block'

local board, block, elapsed

newBlock = ->
  blocks = { BlockI, BlockO, BlockT, BlockS, BlockZ, BlockJ, BlockL }
  n = love.math.random #blocks
  block = blocks[n] board

love.load = (arg) ->
  w, h = love.graphics.getDimensions!
  BLOCK_DIM = math.floor(h / ROWS)
  w1 = COLS * BLOCK_DIM
  h1 = ROWS * BLOCK_DIM
  OFFSET_X = math.floor((w - w1) / 2)
  OFFSET_Y = math.floor((h - h1) / 2)

  board = Board!
  newBlock!

  elapsed = 0
  print 'loaded'

love.keypressed = (key, scancode, isrepeat) ->
  if key == 'escape' then love.event.quit!

  if key == 'left'
    block\left!

  if key == 'right'
    block\right!

  if key == 'up' or key == 'j'
    block\changeShape!

love.update = (dt) ->
  elapsed += dt
  if elapsed >= DROP_INTERVAL or love.keyboard.isDown 'down'
    if elapsed >= DROP_INTERVAL then elapsed -= DROP_INTERVAL

    if not block\down!
      block\settle!
      newBlock!

  board\clean!

love.draw = ->
  board\draw!
  block\draw!
