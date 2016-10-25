import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';

// const addLoggingToDispatch = store => next => action => {
//   let local = store.dispatch;
//   console.log("Old state: ", store.getState());
//   console.log("Action: ", action);
//   let returnVal = local(action);
//   console.log("New state: ", store.getState());
//   return returnVal;
// };
//
// function applyMiddlewares (store, ...middlewares) {
//   let dispatch = store.dispatch;
//   middlewares.forEach ( middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, {dispatch});
// }

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // const newStore = applyMiddlewares(store, addLoggingToDispatch);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
