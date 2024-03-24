// import React from 'react'

// import Fundo from "./components/img/back_image.png"

// export default function App(){
//   const name = "Luann"


//   return(
//     <>
//       <p>Hello World!</p>
//       <p>Bem vindo!</p>
//       <p>{name}</p>
//       <img src={Fundo}/>
//     </>
//   )
// }

import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Editar <code>src/App.js</code> e salve para recarregar.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Mu Aprenda React
        </a>
      </header>
    </div>
  );
}

export default App;
