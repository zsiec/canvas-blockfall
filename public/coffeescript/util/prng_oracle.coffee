class PrngOracle

  constructor: ->
    @_state = '0'
    @seed String Math.random()

  seed: (state) ->
    @_state = sjcl.codec.hex.fromBits(sjcl.hash.sha256.hash(state))

  integerRangeInclusive: (min, max, actionList) ->
    @_resolveActionList actionList
    ret = min + (parseInt(@_state, 16) % (max-min+1))
    @_state = sjcl.codec.hex.fromBits sjcl.hash.sha256.hash(@_state)
    return ret
 
  _resolveActionList: (actionList) ->
    return unless(typeof actionList != 'undefined')
    @_perturbState(action) for action in actionList
 
  _perturbState: (action) ->
    prefix = @_state.substr(0, 128)
    suffix = @_state.substr(128, 128)
    gameID = 1
    @_state = sjcl.codec.hex.fromBits(sjcl.hash.sha256.hash(prefix + gameID + ':' + action['name'] + ':' + action['timestamp'] + suffix))
  
namespace "App", (exports) ->
  exports.PrngOracle = new PrngOracle
