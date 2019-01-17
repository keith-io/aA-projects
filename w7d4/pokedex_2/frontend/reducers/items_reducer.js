//import items actions at some point
import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import { merge } from "lodash";

export const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:

      return merge({}, state, action.items);
    default:
      return state;
    }
};