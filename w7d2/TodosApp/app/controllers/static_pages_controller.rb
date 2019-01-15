class StaticPagesController < ApplicationController
  def root
    
  end
end



$.ajax({
  method: 'POST',
  url: '/api/todos',
  data: { title: "Whatevaarrr", body: "Why is a title not enough?", done: false }
}).then(
  todos => console.log(todos),
  error => console.log(error)
);