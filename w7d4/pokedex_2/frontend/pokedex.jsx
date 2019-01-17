import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from './actions/pokemon_actions';
import fetchAllPokemon from './util/api_util';
import { requestAllPokemon } from './actions/pokemon_actions';
import { configureStore } from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import { Provider } from 'react-redux';
// import App from './components/App';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>Hello, world!</div>
  </Provider>
);


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
 
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});

export default Root;
