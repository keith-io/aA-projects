export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';
export const TODO_ERROR = 'TODO_ERROR';
import fetchTodosAjax from '../../util/todo_api_util';

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos,
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo,
  };
};

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo,
});

export const todoError = error => ({
  type: TODO_ERROR,
  error,
});

export const fetchTodos = () => {
  return (dispatch) => {
    return fetchTodosAjax().then(todos => {
      return dispatch(receiveTodos(todos));
    });
  };
};
