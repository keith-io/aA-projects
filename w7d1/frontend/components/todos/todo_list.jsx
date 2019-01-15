// actual view
import React from 'react';
import TodoListItem from '../todo_list/todo_list_item.jsx';
import TodoForm from '../todo_list/todo_form.jsx';

// class Todo extends React.Component {
//   render() {
//     const todo = (props) => {
//       const todoItems = this.props.todos.map( todo => (
//         toDoListItem(todo)
//     ));
//     }
//     return (
//         <>
//           <h2> Todo List </h2>
//           <ul>{todoItems}</ul>
//           <ToDoForm receiveTodo={receiveTodo} />
//         </>
//       );
//     }
//   }


// export default Todo;

class TodoList extends React.Component {

  render() {
    // debugger
    const { todos, receiveTodo } = this.props;
    // debugger
    const todoItems = todos.map(todo => (
        <TodoListItem
          key={`todo-list-item${todo.id}`}
          todo={todo}
          receiveTodo={receiveTodo} />
      )
    );

    return (
      <div>
        <ul className="todo_list">
          {todoItems}
        </ul>
        <TodoForm receiveTodo={receiveTodo} />
      </div>
    );
  }
}

export default TodoList;