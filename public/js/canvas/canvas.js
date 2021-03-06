// Generated by CoffeeScript 1.4.0
(function() {
  var Canvas;

  Canvas = (function() {

    Canvas.prototype.block_size = 30;

    Canvas.prototype.bevel_size = 1;

    Canvas.prototype.width = 10;

    Canvas.prototype.height = 20;

    function Canvas() {
      this.wrapper_el = $('.canvas');
      this.build_canvas();
    }

    Canvas.prototype.build_canvas = function() {
      var true_height, true_width;
      true_width = this.width * this.block_size;
      true_height = this.height * this.block_size;
      return this.wrapper_el.html("<canvas id='canvas' width='" + true_width + "' height='" + true_height + "'></canvas>");
    };

    Canvas.prototype.canvas_context = function() {
      return $('canvas')[0].getContext('2d');
    };

    Canvas.prototype.draw_block = function(x, y, color) {
      var ctx;
      ctx = this.canvas_context();
      x = x * this.block_size;
      y = y * this.block_size;
      ctx.fillStyle = color;
      ctx.globalAlpha = .5;
      ctx.fillRect(x, y, this.block_size, this.block_size);
      ctx.globalAlpha = .5;
      ctx.fillRect(x + this.bevel_size, y + this.bevel_size, this.block_size - 2 * this.bevel_size, this.block_size - 2 * this.bevel_size);
      return ctx.globalAlpha = 1;
    };

    Canvas.prototype.clear = function() {
      this.canvas_context().clearRect(0, 0, 500, 900);
      this.canvas_context().fillStyle = 'black';
      return this.canvas_context().fillRect(0, 0, 500, 900);
    };

    return Canvas;

  })();

  namespace("App", function(exports) {
    return exports.Canvas = Canvas;
  });

}).call(this);
