import React from 'react'
import Navbar from './components/Navbar/Navbar'
import ItemListContainer from './components/ItemListContainer/ItemListContainer'

const App = () => {

  return (
    <>
      <Navbar/>
      <ItemListContainer greeting="Hola, bienvenido a mi primer pagina de React!"/>
    </>
  )
}

export default App