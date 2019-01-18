// this method is called postUser, so naturally it will route to /api/users
export const postUser = user => (
  $.ajax({
    method: 'POST',
    url: '/api/users',
    data: { user },
  })
  );

  // this method is called postSession, so naturally it will route to /api/session
export const postSession = user => (
  $.ajax({
    method: 'POST',
    url: `/api/session`,
    data: { user },
  })
);

export const deleteSession = user => (
  $.ajax({
    method: 'DELETE',
    url: `/api/session`,
  })
);