const fetchAllPokemon = () => { 
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
    // url: "../../app/assets/views/api/pokemon"
  });
}

export default fetchAllPokemon;