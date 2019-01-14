// actual view
import React from 'react';
// module.exports = () => <h3>Todo List goes here!</h3>;

const todo = (props) => {
  const todoItems = props.todos.map( todo => (
    <li key={todo.id}>
      {todo.title}: {todo.body}
    </li>
  ))

  return (
    <>
     <h2> Todo List </h2>
     <ul>{todoItems}</ul>
    </>);
}

export default todo;