import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import {receiveTodo, receiveTodos, fetchTodos} from "./actions/todo_actions";
import Root from './components/root';
import allTodos from "./reducers/selectors";
import TodoListContainer from "./components/todos/todo_list_container";
import TodoList from './components/todos/todo_list';

// function Root() {
//   return (
//   <h1>Hello</h1> 
//   );
// }
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('content');
  const store = configureStore();
  window.store = store;
  window.fetchTodos = fetchTodos();
  window.allTodos = allTodos;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  ReactDOM.render(<Root store={store} />, root);
});