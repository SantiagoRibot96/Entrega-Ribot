import './Item.css';
import { Link } from 'react-router-dom';

const Item = ({id, nombre, precio, img}) => {
  return (
    <div className='cardProducto'>
        <img src={img} alt={nombre} />
        <h3>{nombre} </h3>
        <p>Precio: ${precio}.- </p>
        <Link className='btn btn-primary' to={`/item/${nombre}`}> Ver Detalles </Link>
    </div>
  )
}

export default Item