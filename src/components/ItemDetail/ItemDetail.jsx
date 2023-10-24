import './ItemDetail.css'
import { Link } from 'react-router-dom'

const ItemDetail = ({id, nombre, precio, img, desc}) => {
  return (
    <div className='contenedorItem'>
        <h2>{nombre} </h2>
        <h3>Precio: ${precio}.- </h3>
        <img src={img} alt={nombre} />
        <p>{desc}</p>
        <Link className='btn btn-secondary' to="/"> Volver </Link>
    </div>
  )
}

export default ItemDetail