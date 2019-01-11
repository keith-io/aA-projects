import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';


// / function Root() {
//   return (
//     <div>
//       <Clock />
//       {/* <Weather />
//       <div className='interactive'>
//         <Tabs panes={panes} />
//         <AutoComplete names={names} />
//       </div> */}
//     </div>
//   );
// }/

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  // ReactDOM.render(<component_name>, root);
  // ReactDOM.render(<component_name>, root);
  ReactDOM.render(<Clock />, root);
});

