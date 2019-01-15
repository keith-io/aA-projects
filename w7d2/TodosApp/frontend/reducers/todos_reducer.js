import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';
// import { merge } from 'lodash';


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

export default (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach( el => {
        newState[el.id] = el;
      });
      return newState;
    case RECEIVE_TODO:
      const newTodo = { [action.todo.id]: action.todo };
      return Object.assign({}, state, newTodo);
    default:
      return state;
  }
};