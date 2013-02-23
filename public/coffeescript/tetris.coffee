class Tetris

  start: ->
    @canvas = new App.Canvas()
    @current_block = App.ShapeFactory.create('t')
    @current_block.render(@canvas)

    @start_animation()

    @bind_keyboard_events()

  bind_keyboard_events: ->
    $(document).keydown (e) =>
      if e.keyCode == 38
        @rotate()
        return false
      if e.keyCode == 37 #left
        @left()
        return false
      if e.keyCode == 39 #right
        @right()
        return false

   rotate: ->
     @current_block.rotate()
     @rerender()

   left: ->
     @current_block.move_left()
     @rerender()

   right: ->
     @current_block.move_right()
     @rerender()

   down: ->
     @current_block.move_down()
     @rerender()

   rerender: ->
     @canvas.clear()
     @current_block.render(@canvas)

   start_animation: ->
     requestAnimFrame(@tick.bind(@))

   tick: (context) ->
     setTimeout (=>
       @down()
       requestAnimFrame(@tick.bind(@))), 700


namespace "App", (exports) ->
  exports.Tetris = Tetris
