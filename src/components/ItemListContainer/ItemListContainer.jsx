import { useState, useEffect } from "react";
import { getProductos, getUnaCategoria } from "../../asyncmock";
import ItemList from "../ItemList/ItemList";
import { useParams } from "react-router-dom";
import './ItemListContainer.css'

const ItemListContainer = () => {
    const [productos, setProductos] = useState([]);

    const {idCategoria} = useParams();

    useEffect(() => {
        const funcionProductos = idCategoria ? getUnaCategoria : getProductos;

        funcionProductos(idCategoria)
            .then(res => setProductos(res))
            .catch(error => console.log(error));
    }, [idCategoria])

    return (
        <>
            <h2 className="h2-destacados">Productos destacados</h2>
            <ItemList productos={productos} />
        </>
    )
}

export default ItemListContainer