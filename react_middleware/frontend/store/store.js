import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const addLoggingToDispatch = store => next => action => {
  let local = store.dispatch;
  console.log("Old state: ", store.getState());
  console.log("Action: ", action);
  let returnVal = local(action);
  console.log("New state: ", store.getState());
  return returnVal;
};

const preloadedState = {
  notes: [],
  tracks: {},
  isRecording:false,
  isPlaying:false
};

const configureStore = (state = preloadedState) => (
  createStore(
    rootReducer,
    state,
    applyMiddleware(addLoggingToDispatch)
  )
);

export default configureStore;
