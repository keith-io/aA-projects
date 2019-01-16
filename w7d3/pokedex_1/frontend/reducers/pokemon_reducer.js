import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      const newState = {};
      Object.keys(action.pokemon).forEach(poke_id => {
        newState[poke_id] = action.pokemon[poke_id];
      });
      return newState;

    default:
      return state;
  }
};

