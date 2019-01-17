import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import { merge } from "lodash";

export const pokemonReducer = (state = {}, action) => {
  const newState = {};
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      // Object.keys(action.pokemon).forEach(poke_id => {
      //   newState[poke_id] = action.pokemon[poke_id];
      // });
      return merge({}, state, action.pokemon);
    
    case RECEIVE_SINGLE_POKEMON:
      newState[action.pokemon.id] = action.pokemon;
      return merge({}, state, newState);
      
    default:
      return state;
  }
};

