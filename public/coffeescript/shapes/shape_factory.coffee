class ShapeFactory

  create: (shape_abbrev) ->
    switch shape_abbrev
      when "t"
        @_create_t_block()

  _create_t_block: ->
    color = 'green'
    orientations = [ [[0, -1], [1, -1], [2, -1], [1, -2]],
                     [[1, -2], [1, -1], [1, 0], [2, -1]],
                     [[0, -1], [1, -1], [2, -1], [1, 0]],
                     [[0, -1], [1, -1], [1, -2], [1, 0]] ]
    new App.Shape(orientations, 'purple')

namespace "App", (exports) ->
  exports.ShapeFactory = new ShapeFactory
