import React from 'react';

class ToDoForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = { title: "" , body: "", done: false };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(e) {
    debugger
    e.preventDefault();
    this.props.receiveTodo(this.state);
  }

  update(field) {
    return e => {
      this.setState({ [field]: e.target.value });
    };
  }

  render () {
    return (
      <form className="add-todo" onSubmit={this.handleSubmit}>

        Title: <input type="text" onChange={this.update("title")} value={this.state.name}/>
        Body: <input type="text" onChange={this.update("body")} value={this.state.name}/>
        <input type="submit" value="Add new todo"/>
      </form>
    )
  }
}

function uniqueId() {
  return new Date().getTime();
}

export default ToDoForm;