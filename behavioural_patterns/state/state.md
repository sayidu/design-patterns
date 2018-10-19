# State Pattern

  __Intent__
  Allow an object to alter its behavior when its internal state changes.
  The object will appear to change its class. The object will appear to change
  its class.

  __Problem__
  A Object has different states and has to repond differently based on its
  current state.

  __Solution__
  Have a seperate abstract class for State, derive concrete class for each
  state and do the operation as required in overridden methods.
