const allTodos = (state) => {
  const ids = Object.keys(state.todos);
  return ids.map(id => {
    return state.todos[id];
  });
};

export default allTodos;