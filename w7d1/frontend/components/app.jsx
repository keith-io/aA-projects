import React from 'react';
import TodoListContainer from './todos/todo_list_container.jsx';
// const App = {{ store }}

const App = () => {
  return ( 
    <> 
      <h1>Todos App! Yay!</h1> <TodoListContainer />
    </>
  );
}

export default App;