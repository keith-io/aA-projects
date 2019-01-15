import { connect } from "react-redux";
import TodoList from "./todo_list";
import allTodos from "../../reducers/selectors";
import {receiveTodo} from "../../actions/todo_actions";

const mapStateToProps = (state) => {
  const list = allTodos(state);
  return {
    todos: list,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo))
  };
};


export default connect(mapStateToProps, mapDispatchToProps)(TodoList);

// const containerFunc =  connect(mapStateToProps, mapDispatchToProps);
// const connectedComponent = containerFunc(TodoList);
// export default connectedComponent;