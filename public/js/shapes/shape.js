// Generated by CoffeeScript 1.4.0
(function() {
  var Shape;

  Shape = (function() {

    function Shape(orientations, color) {
      this.orientations = orientations;
      this.color = color;
      this.rotation = 0;
      this.y = 2;
      this.x = 4;
    }

    Shape.prototype.render = function(canvas) {
      var position, _i, _len, _ref, _results;
      _ref = this.current_orientiation();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        position = _ref[_i];
        _results.push(canvas.draw_block(this.x + position[0], this.y + position[1], this.color));
      }
      return _results;
    };

    Shape.prototype.move_left = function() {
      if (this.x !== 0) {
        return this.x--;
      }
    };

    Shape.prototype.move_right = function() {
      if (!((this.x + this.bounds().width) > 9)) {
        return this.x++;
      }
    };

    Shape.prototype.move_down = function() {
      if (!((this.y + this.bounds().height) > 21)) {
        this.y++;
        return true;
      } else {
        return false;
      }
    };

    Shape.prototype.rotate = function() {
      if (this.rotation < 3) {
        return this.rotation++;
      } else {
        return this.rotation = 0;
      }
    };

    Shape.prototype.current_orientiation = function() {
      return this.orientations[this.rotation];
    };

    Shape.prototype.bounds = function() {
      var maxX, maxY, minX, minY, position, _i, _len, _ref;
      minX = minY = 999;
      maxX = maxY = -999;
      _ref = this.current_orientiation();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        position = _ref[_i];
        if (position[0] < minX) {
          minX = position[0];
        }
        if (position[0] > maxX) {
          maxX = position[0];
        }
        if (position[1] < minY) {
          minY = position[1];
        }
        if (position[1] > maxY) {
          maxY = position[1];
        }
      }
      return {
        width: maxX - minX + 1,
        height: maxY - minY + 1
      };
    };

    return Shape;

  })();

  namespace("App", function(exports) {
    return exports.Shape = Shape;
  });

}).call(this);