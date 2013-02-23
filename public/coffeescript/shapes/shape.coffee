class Shape

  constructor: (orientations, color) ->
    @orientations = orientations
    @color = color
    @rotation = 0

    @y = 2
    @x = 4

  render: (canvas) ->
    for position in @current_orientiation()
      canvas.draw_block(@x + position[0], @y + position[1], @color)

  move_left: -> 
    @x-- unless @x == 0

  move_right: -> 
    @x++ unless (@x + @bounds().width) > 9

  move_down: -> 
    unless (@y + @bounds().height) > 21
      @y++ 
      true
    else
      false

  rotate: ->
    if @rotation < 3 then @rotation++ else @rotation=0

  current_orientiation: ->
    @orientations[@rotation]

  bounds: ->
    minX = minY = 999
    maxX = maxY = -999

    for position in @current_orientiation()
      minX = position[0] if position[0] < minX
      maxX = position[0] if position[0] > maxX
      minY = position[1] if position[1] < minY
      maxY = position[1] if position[1] > maxY

    {width: maxX-minX + 1, height: maxY - minY + 1}

namespace "App", (exports) ->
  exports.Shape = Shape
