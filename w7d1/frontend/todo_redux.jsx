import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js';
import { receiveTodo, receiveTodos } from './actions/todo_actions.js';
// import App from './components/app.jsx';
import selector from './reducers/selectors.js';
import Root from './components/root.jsx';

document.addEventListener('DOMContentLoaded', () => {
  window.store = store; 
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.selector = selector;
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});