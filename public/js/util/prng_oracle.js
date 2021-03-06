// Generated by CoffeeScript 1.4.0
(function() {
  var PrngOracle;

  PrngOracle = (function() {

    function PrngOracle() {
      this._state = '0';
      this.seed(String(Math.random()));
    }

    PrngOracle.prototype.seed = function(state) {
      return this._state = sjcl.codec.hex.fromBits(sjcl.hash.sha256.hash(state));
    };

    PrngOracle.prototype.integerRangeInclusive = function(min, max, actionList) {
      var ret;
      this._resolveActionList(actionList);
      ret = min + (parseInt(this._state, 16) % (max - min + 1));
      this._state = sjcl.codec.hex.fromBits(sjcl.hash.sha256.hash(this._state));
      return ret;
    };

    PrngOracle.prototype._resolveActionList = function(actionList) {
      var action, _i, _len, _results;
      if (!(typeof actionList !== 'undefined')) {
        return;
      }
      _results = [];
      for (_i = 0, _len = actionList.length; _i < _len; _i++) {
        action = actionList[_i];
        _results.push(this._perturbState(action));
      }
      return _results;
    };

    PrngOracle.prototype._perturbState = function(action) {
      var gameID, prefix, suffix;
      prefix = this._state.substr(0, 128);
      suffix = this._state.substr(128, 128);
      gameID = 1;
      return this._state = sjcl.codec.hex.fromBits(sjcl.hash.sha256.hash(prefix + gameID + ':' + action['name'] + ':' + action['timestamp'] + suffix));
    };

    return PrngOracle;

  })();

  namespace("App", function(exports) {
    return exports.PrngOracle = new PrngOracle;
  });

}).call(this);
