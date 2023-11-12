import { useState, useEffect } from "react";
import { CarritoContext } from "../../context/CarritoContext";
import { db } from "../../services/config";
import { collection, addDoc, updateDoc, doc, getDoc } from "firebase/firestore";
import { useContext } from "react";
import { Link } from 'react-router-dom';

const Checkout = () => {
  const [nombre, setNombre] = useState("");
  const [apellido, setApellido] = useState("");
  const [telefono, setTelefono] = useState("");
  const [email, setEmail] = useState("");
  const [emailConfirmacion, setEmailConfirmacion] = useState("");
  const [error, setError] = useState("");
  const [orderId, setOrderId] = useState("");

  const { carrito, vaciarCarrito, total, cantidadTotal } = useContext(CarritoContext);

  const manejadorFormulario = (e) => {
    e.preventDefault();

    if (!nombre || !apellido || !telefono || !email || !emailConfirmacion) {
      setError("Por favor completa todos los campos");
      return;
    }

    if (email !== emailConfirmacion) {
      setError("Los campos del email no coinciden");
      return;
    }

    const orden = {
      items: carrito.map(producto => ({
        id: producto.item.id,
        nombre: producto.item.nombre,
        cantidad: producto.cantidad
      })),
      total: total,
      fecha: new Date(),
      nombre,
      apellido,
      telefono,
      email
    };

    Promise.all(
      orden.items.map( async (productoOrden) => {
        const productoRef = doc(db, "Productos", productoOrden.id);
        const productoDoc = await getDoc(productoRef);
        const stockActual = productoDoc.data().stock;

        await updateDoc( productoRef, {
          stock: stockActual - productoOrden.cantidad
        })
      })
    )
      .then(() => {
        addDoc(collection(db, "Ordenes"), orden)
          .then(docRef => {
            setOrderId(docRef.id);
            vaciarCarrito();
            setError("");
          })
          .catch(error => {
            setError("Error al crear la orden ", error);
          });
      })
      .catch(error => {
        setError("No se pudo actualizar el stock ", error);
      });
  }

  return (
    <div>
      <h2>Checkout</h2>

      <form onSubmit={manejadorFormulario}>
        {
          carrito.map(producto => (
            <div key={producto.item.id}>
              <p> {producto.item.nombre} X {producto.cantidad}</p>
              <p> {producto.item.precio} </p>
              <hr />
            </div>
          ))
        }
        <div>
          <label>Nombre</label>
          <input type="text" onChange={(e) => setNombre(e.target.value)} />
        </div>
        <div>
          <label>Apellido</label>
          <input type="text" onChange={(e) => setApellido(e.target.value)} />
        </div>
        <div>
          <label>Telefono</label>
          <input type="text" onChange={(e) => setTelefono(e.target.value)} />
        </div>
        <div>
          <label>Email</label>
          <input type="email" onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div>
          <label>Confirmacion de Email</label>
          <input type="email" onChange={(e) => setEmailConfirmacion(e.target.value)} />
        </div>

        {
          error && <p style={{ color: "red" }}> {error} </p>
        }

        {
          orderId ? <strong>Gracias por tu compra! Tu numero de orden es: {orderId} <Link className='btn btn-secondary' to="/"> Volver </Link></strong> : <button type="submit">Finalizar Compra</button>
        }

      </form>
    </div>
  )
}

export default Checkout