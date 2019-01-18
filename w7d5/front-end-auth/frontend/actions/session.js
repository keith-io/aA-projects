import {
  postUser,
  postSession,
  deleteSession
} from '../utils/session';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER, // watch out here, this is a hash, we want commas not semicolons
  user,
});

// this one doesn't take any arguments so we use empty parens ()
const logoutCurrentUser = () => ({
  type: RECEIVE_CURRENT_USER,
  // no object passed in, no object to return.
});

// for our thunk action we want to take in User data from our form (formUser)
// then we need to take in dispatch, so we can dispatch after successfully posting the new User
export const createNewUser = formUser => dispatch => postUser(formUser)
  // we take the user object from the ajax callback and dispatch it to reducer with our action pojo
  .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

// for logging out we don't need any user data, we just need to destroy the current session.
export const logout = () => dispatch => deleteSession()
  .then(() => dispatch(logoutCurrentUser()));