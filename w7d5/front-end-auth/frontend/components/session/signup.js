// presentational components always import react, and are almost always class functions
import React, { Component } from 'react';

class Signup extends Component {
  // first we wanna create local state to keep track of all of the
  // fields for our forms that we will be creating, so we need a constructor
  constructor(props) {
    // pass props up to React.Component, which we are inheriting
    super(props);
    this.state = {
      username: '',
      email: '',
      password: '',
    };
    // we also need to bind our handleSubmit to this component otherwise it will be out of scope
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  // so before we build the forms, let's build the actions that the forms will use
  // this means we need event handlers
  handleInput(type) {
    return (e) => { // we pass in 'e', an event object from our event handler
      // pass in a pojo that will change our state
      // we want the key to match the type we pass in, so we use [] to make
      // sure that it is evaluated before setting the key
      this.setState({ [type]: e.target.value })
    };
  }

  handleSubmit(e) {
    // the default action of a submit button is a POST request, which will cause everything
    // to re-render... so we wanna prevent that.
    e.preventDefault();
    // now we want to use the method that we receive through our container
    // props are coming from our form
    // we want to pass in this.state, which looks like the constructor pojo
    // which is everything we need to create a new user
    this.props.createNewUser(this.state)
      // if success, then redirect to chirps, which we can access from 'history'
      .then( () => this.props.history.push('/chirps'));
  }

  render () {
    return (
      <div className="session-form">
        <h2>Sign Up!</h2>
        <form>
            <label>Username:
              <input
                type="text"
                value={this.state.username}
                onChange={this.handleInput('username')}
              />
            </label>
            <label>Email:
              <input
                type="text"
                value={this.state.email}
                onChange={this.handleInput('email')}
              />
            </label>
            <label>Password:
              <input
                type="password"
                value={this.state.password}
                onChange={this.handleInput('password')}
              />
            </label>
            <button onClick={this.handleSubmit}>Sign Up</button>
        </form>
      </div>
    );
  }
};

export default Signup;