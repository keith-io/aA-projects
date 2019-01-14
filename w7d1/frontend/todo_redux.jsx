import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js';
import { receiveTodo, receiveTodos } from './actions/todo_actions.js';
import App from './components/app.jsx';

document.addEventListener('DOMContentLoaded', () => {
  window.store = store; 
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  ReactDOM.render(<App />, document.getElementById('root'));
});