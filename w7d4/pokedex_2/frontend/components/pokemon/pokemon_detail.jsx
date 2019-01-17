import React from 'react';
import {connect } from 'react-redux';
import { selectPokemonDetails } from '../../reducers/selectors';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

class PokemonDetail extends React.Component {
 //lifecycle method?

 //render method
  render() {
    
  }
}

const mapStateToProps = (state, ownProps) => {
  const pokemon = selectPokemonDetails(state, ownProps.poke_id);
  return { pokemon };
};

const mapDispatchToProps = dispatch => {
  return {
    requestSinglePokemon: (id) => {
      return dispatch(requestSinglePokemon(id));
    }
  };
}; 

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);