import React from 'react';

// import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  render() {
    const { todo, removeTodo } = this.props;
    return (
      <div>
        <p className="todo-body">{todo.body}</p>
        <button
          className="delete-button"
          onClick={removeTodo}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;
// {/* <StepListContainer todo_id={todo.id} /> */}