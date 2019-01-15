import React from 'react';

class ToDoForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = { title: "" , body: "", done: false };
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.update = this.update.bind(this);
  }


  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }


  update(field) {
    return e => {
      this.setState({ [field]: e.target.value });
    };
  }

  render () {
    return (
      <form className="add-todo" onSubmit={this.handleSubmit}>

        Title: <input type="text" onChange={this.update("title")} value={this.state.title}/>
        Body: <input type="text" onChange={this.update("body")} value={this.state.body}/>
        <input type="submit" value="Add new todo"/>
      </form>
    )
  }
}

function uniqueId() {
  return new Date().getTime();
}

export default ToDoForm;