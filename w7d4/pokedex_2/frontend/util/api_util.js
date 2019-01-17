export const fetchAllPokemon = () => { 
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
    // url: "../../app/assets/views/api/pokemon"
  });
};

export const fetchSinglePokemon = (id) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}`
  });
};