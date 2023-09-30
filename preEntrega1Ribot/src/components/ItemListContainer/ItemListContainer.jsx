import React from 'react'

const ItemListContainer = (props) => {

  const degrade = {
    background: "linear-gradient(to right, red 25%, yellow, blue, orange)",
    color: "blue",
    border: "solid black",
    padding: "1rem"
  };

  return (
    <h2 style={degrade}> {props.greeting} </h2>
  )
}

export default ItemListContainer