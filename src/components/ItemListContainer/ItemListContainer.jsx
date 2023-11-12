import { useState, useEffect } from "react";
import ItemList from "../ItemList/ItemList";
import { useParams } from "react-router-dom";
import { db } from "../../services/config";
import { collection, getDocs, query, where } from "firebase/firestore";
import "./ItemListContainer.css";

const ItemListContainer = () => {
    const [productos, setProductos] = useState([]);

    const { idCategoria } = useParams();

    useEffect(() => {
        const misProductos = idCategoria
            ? query(collection(db, "Productos"), where("idCat", "==", idCategoria))
            : collection(db, "Productos");

        getDocs(misProductos)
            .then((res) => {
                const nuevosProductos = res.docs.map((doc) => {
                    const data = doc.data();
                    return { id: doc.id, ...data };
                });
                setProductos(nuevosProductos);
            })
            .catch((error) => console.log(error));
    }, [idCategoria]);

    const titulo = idCategoria ? idCategoria : "Productos destacados";

    return (
        <>
            <h2 className="h2-destacados">{titulo}</h2>
            <ItemList productos={productos} />
        </>
    );
};

export default ItemListContainer;
