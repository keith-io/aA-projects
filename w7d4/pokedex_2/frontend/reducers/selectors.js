export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
};

export const selectPokemonDetails = (state, id) => {
  return state.entities.pokemon[id];
};