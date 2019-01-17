import React, { Component } from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends Component {

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    const pokemonItems = this.props.pokemon.map((poke) => <PokemonIndexItem key={poke.id} pokemon={poke} /> );
    
    return (
      <main className="poke-index">
        <h3>Pokemon!</h3>
        <ul className="poke-list">
          <section className="pokedex">
            <ul>
              {pokemonItems}
            </ul>
          </section>
        </ul>
      </main>
    )
  }
}

export default PokemonIndex;