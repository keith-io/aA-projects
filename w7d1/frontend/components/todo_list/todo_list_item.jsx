import React from 'react';

function ToDoListItem (prop) {
  return <li key={prop.id}>{prop.title}</li>
}

export default ToDoListItem;