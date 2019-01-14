import Redux from 'react-redux';

const ADD_TODO = 'ADD_TODO';
const RECEIVE_TODOS = 'RECEIVE_TODOS';
const RECEIVE_TODO = 'RECEIVE_TODO';

// wait do we need this?
// export const addTodo = (title, body) => {
//   return ({
//     type: ADD_TODO,
//     title,
//     body,
//     done: false,
//     id: Math.floor(Math.random() * 1000),
//   });
// };

export const receiveTodos = (todos = []) => {
  return ({
    type: RECEIVE_TODOS,
    todos,
  });
};

export const receiveTodo = (todo) => {
  return ({
    type: RECEIVE_TODO,
    title: todo.title,
    body: todo.body,
    done: todo.done,
    id: Math.floor(Math.random() * 1000),
  });
};

