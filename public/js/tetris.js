// Generated by CoffeeScript 1.4.0
(function() {
  var Tetris;

  Tetris = (function() {

    function Tetris() {}

    Tetris.prototype.start = function() {
      this.canvas = new App.Canvas();
      this.current_block = App.ShapeFactory.create_random_shape();
      this.current_block.render(this.canvas);
      this.start_animation();
      return this.bind_keyboard_events();
    };

    Tetris.prototype.bind_keyboard_events = function() {
      var _this = this;
      return $(document).keydown(function(e) {
        if (e.keyCode === 38) {
          _this.rotate();
          return false;
        }
        if (e.keyCode === 37) {
          _this.left();
          return false;
        }
        if (e.keyCode === 39) {
          _this.right();
          return false;
        }
        if (e.keyCode === 40) {
          _this.force_down();
          return false;
        }
      });
    };

    Tetris.prototype.rotate = function() {
      this.current_block.rotate();
      return this.rerender();
    };

    Tetris.prototype.left = function() {
      this.current_block.move_left();
      return this.rerender();
    };

    Tetris.prototype.right = function() {
      this.current_block.move_right();
      return this.rerender();
    };

    Tetris.prototype.down = function() {
      if (this.current_block.move_down()) {
        this.rerender();
        return true;
      } else {
        return false;
      }
    };

    Tetris.prototype.force_down = function() {
      this.current_block.force_down();
      return this.rerender();
    };

    Tetris.prototype.rerender = function() {
      this.canvas.clear();
      return this.current_block.render(this.canvas);
    };

    Tetris.prototype.start_animation = function() {
      return requestAnimFrame(this.tick.bind(this));
    };

    Tetris.prototype.tick = function(context) {
      if (!this.down()) {
        this.render_next_block();
      }
      return requestAnimFrame(this.tick.bind(this));
    };

    Tetris.prototype.render_next_block = function() {
      this.current_block = App.ShapeFactory.create_random_shape();
      return this.current_block.render(this.canvas);
    };

    return Tetris;

  })();

  namespace("App", function(exports) {
    return exports.Tetris = Tetris;
  });

}).call(this);
