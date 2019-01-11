import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs'

const panes = [
  { title: "first", content: "i am a pane" }, 
  { title: "second", content: "woop woop woop" }, 
  { title: "3", content: "something" }
];

function Root() {
  return (
    <div>
      <Clock />
      {/* <Weather /> */}
      <div className='interactive'>
        <Tabs panes={panes} />
        {/* <AutoComplete names={names} /> */}
      </div>
    </div>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  // ReactDOM.render(<component_name>, root);
  ReactDOM.render(<Root />, root);
  // only root
  // ReactDOM.render(<Tabs panes={panes} />, root);
});