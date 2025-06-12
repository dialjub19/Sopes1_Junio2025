import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'


function App() {

  const [data, setData] = useState(null);

  const getMessage = async () => {
    const response = await fetch("http://localhost:5000/hello");
    const dataJson = await response.json();
    setData(dataJson)
  }

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => getMessage()}>
          Presioname
        </button>
        {data ? (<p>
          <code>{data.mensaje}</code>
          <br></br>
          <code>{data.status}</code>
        </p>
        ) : <p>cargando ......</p>}
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
