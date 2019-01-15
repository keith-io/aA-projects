const fetchTodosAjax = () => {
  $.ajax({
    method: 'GET',
    url: 'api/todos',
  });
};

export default fetchTodosAjax;