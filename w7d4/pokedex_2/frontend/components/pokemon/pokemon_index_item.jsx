import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = (props) => {
  const { id, name, image_url } = props.pokemon;
  return <li key={id}><Link to={`/pokemon/${id}`}>{name}<img src={image_url}></img></Link></li>;
}

export default PokemonIndexItem;