// we need to import everything we need to create an actual connected container
import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';

// signup components don't need to rely on any part of our state so we can skip MSP
const mapDispatchToProps = dispatch => ({
  // this is going to give us a function called createNewUser
  // inside of our props which we can pass to our component
  createNewUser: formUser => dispatch(createNewUser(formUser)),
});

export default connect(null, mapDispatchToProps)(Signup);