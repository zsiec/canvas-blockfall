class ShapeFactory

  create: (shape_abbrev) ->
    @["_create_#{shape_abbrev}_block"]()

  create_random_shape: ->
    shapes = ['l', 'i', 'o', 'z', 'j', 't', 's']
    index = App.PrngOracle.integerRangeInclusive(0, shapes.length-1)
    @create shapes[index]

  _create_t_block: ->
    color = 'purple'
    orientations = [ [[0, -1], [1, -1], [2, -1], [1, -2]],
                     [[1, -2], [1, -1], [1, 0], [2, -1]],
                     [[0, -1], [1, -1], [2, -1], [1, 0]],
                     [[0, -1], [1, -1], [1, -2], [1, 0]] ]
    new App.Shape(orientations, color)


  _create_i_block: ->
    color = 'cyan'
    vertical =   [[0, -1], [0, -2], [0, -3], [0, -4]]
    horizontal = [[-1, -2], [0, -2], [1, -2], [2, -2]]
    orientations = [ horizontal, vertical, horizontal, vertical ]
    new App.Shape(orientations, color)

  _create_o_block: ->
    color = '#FCDC3B'
    o = [[0, 0], [1, 0], [1, 1], [0, 1]]
    orientations = [ o, o, o, o ]
    new App.Shape(orientations, color)

  _create_s_block: ->
    color = 'green'
    vertical =   [[0, -2], [0, -1], [1, -1], [1, 0]]
    horizontal = [[0, 0], [1, 0], [1, -1], [2, -1]]
    orientations = [ horizontal, vertical, horizontal, vertical ]
    new App.Shape(orientations, color)

  _create_z_block: ->
    color = 'red'
    vertical   = [[0, 0], [0, -1], [1, -1], [1, -2]]
    horizontal = [[0, -1], [1, -1], [1, 0], [2, 0]]
    orientations = [ horizontal, vertical, horizontal, vertical ]
    new App.Shape(orientations, color)

  _create_l_block: ->
    color = 'orange'
    orientations = [ [[0, 0], [0, -1], [1, -1], [2, -1]],
                     [[0, -2], [1, 0], [1, -1], [1, -2]],
                     [[0, -1], [1, -1], [2, -1], [2, -2]],
                     [[0, -2], [0, -1], [0, 0], [1, 0]] ]
    new App.Shape(orientations, color)

  _create_j_block: ->
    color = 'blue'
    orientations = [ [[2, 0], [0, -1], [1, -1], [2, -1]],
                     [[0, 0], [1, 0], [1, -1], [1, -2]],
                     [[0, -2], [0, -1], [1, -1], [2, -1]],
                     [[0, 0], [0, -1], [0, -2], [1, -2]] ]
    new App.Shape(orientations, color)




namespace "App", (exports) ->
  exports.ShapeFactory = new ShapeFactory
