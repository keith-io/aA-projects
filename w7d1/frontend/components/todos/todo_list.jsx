// actual view
import React from 'react';
import toDoListItem from '../todo_list/todo_list_item.jsx';
import ToDoForm from '../todo_list/todo_form.jsx';

const todo = (props) => {
  const todoItems = props.todos.map( todo => (
    toDoListItem(todo)
  ));

  return (
      <>
        <h2> Todo List </h2>
        <ul>{todoItems}</ul>
        <ToDoForm receiveTodo={receiveTodo} />
      </>
    );
}

export default todo;