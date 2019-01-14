import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions.js";
import { merge } from 'lodash';

export default function (state = {}, action) {
  switch (action.type) {
    case RECEIVE_TODO:
      return {
        [action.id]: {
          id: action.id,
          title: action.title,
          body: action.body,
          done: action.done,
        }
      };
    case RECEIVE_TODOS: 
      const newTodos = merge({}, state);
      newTodos[action.id] = {
        id: action.id,
        title: action.title,
        body: action.body,
        done: action.done,
      };
      return newTodos;
    default:
      return state;
  }
}