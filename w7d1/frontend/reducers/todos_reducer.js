import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions.js";
import { merge } from 'lodash';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

export default function (state = initialState, action) {
  switch (action.type) {
    case RECEIVE_TODO:
      const newTodo = {
        [action.id]: {
          id: action.id,
          title: action.title,
          body: action.body,
          done: action.done,
        }
      };
      return merge(state, newTodo);
    case RECEIVE_TODOS: 
      const newTodos = {}; 
      //Old code returned a merge of previous todos in addition to new todos
      // const newTodos = merge({}, state);
      action.todos.forEach( el => newTodos[el.id] = el );
      return newTodos;
    default: 
      return state;
  }
}