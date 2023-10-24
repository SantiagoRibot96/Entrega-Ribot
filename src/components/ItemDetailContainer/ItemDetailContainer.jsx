import { useState, useEffect } from "react";
import { getUnProducto } from "../../asyncmock";
import ItemDetail from "../ItemDetail/ItemDetail";
import { useParams } from "react-router-dom";
import './ItemDetailContainer.css'

const ItemDetailContainer = () => {
    const [producto, setProducto] = useState(null);

    const {nombreItem} = useParams();

    useEffect(()=> {
        getUnProducto(nombreItem)
            .then(respuesta => setProducto(respuesta))
    }, [nombreItem])
    
  return (
    <div className="itemDetailContainer">
        <ItemDetail {...producto} />
    </div>
  )
}

export default ItemDetailContainer