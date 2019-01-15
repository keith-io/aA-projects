// function allTodos(state) {
//   const result = [];
//   Object.values(state.todos).map( el => result.push(el) );
//   return result;
// }

// this is better
const allTodos = state => Object.values(state.todos);
export default allTodos; 