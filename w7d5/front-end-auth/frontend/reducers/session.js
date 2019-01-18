// now that we have our action type constants exported, we can go head and create our session reducer.
import {
  RECEIVE_CURRENT_USER,
  LOGOUT_CURRENT_USER
} from '../actions/session';
import { merge } from 'lodash';

// for session reducers first we need to setup a default state
// just a pojo incase we don't have a current user
const _nullSession = {
  currentUser: null,
};

// only one reducer in this file, no need to name it we can export default
// now we use our _nullSession as a default value
// reducers always take state and actions as args
export default (state = _nullSession, action) => {
  // make sure you don't accidentally mutate state
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      // return Object.assign({}, { currentUser: action.user });
      // the tutorial suggests using Object.assign but I prefer lodash's merge
      return merge({}, { currentUser: action.user });
    case LOGOUT_CURRENT_USER:
      return _nullSession; // this changes the state of session back to null.
    default:
      return state; // returning state is always the default. AKA change nothing.
  }
};

// don't forget to go back and include this in your root reducer now.