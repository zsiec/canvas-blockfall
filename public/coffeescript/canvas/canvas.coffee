class Canvas

  block_size: 30
  bevel_size: 1

  width: 10
  height: 20

  constructor: ->
    @wrapper_el = $('.canvas')
    @build_canvas()

  build_canvas: ->
    true_width = @width * @block_size
    true_height = @height * @block_size
    @wrapper_el.html("<canvas id='canvas' width='#{true_width}' height='#{true_height}'></canvas>")

  canvas_context: ->
    $('canvas')[0].getContext('2d')

  draw_block: (x, y, color) ->
    ctx = @canvas_context()
    x = x * @block_size
    y = y * @block_size
    ctx.fillStyle = color
    ctx.globalAlpha = .5
    ctx.fillRect(x, y, @block_size, @block_size)
    ctx.globalAlpha = .5
    ctx.fillRect(x + @bevel_size, y + @bevel_size, @block_size - 2*@bevel_size, @block_size - 2*@bevel_size)
    ctx.globalAlpha = 1

  clear: ->
    @canvas_context().clearRect(0, 0, 500, 900);
   
namespace "App", (exports) ->
  exports.Canvas = Canvas
