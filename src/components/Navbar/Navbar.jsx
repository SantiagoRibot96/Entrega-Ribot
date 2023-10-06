import React from 'react'
import CartWidget from '../CartWidget/CartWidget'
import './Navbar.css';

const Navbar = () => {
  return (
    <header>
        <nav className="navbar navbar-expand-lg bg-body-tertiary">
            <div className="container-fluid">
                <button className="nav-link navbar-brand" href="#">TodoParrillas</button>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse centrado" id="navbarNav">
                    <ul className="navbar-nav">
                        <li className="nav-item">
                        <button className="nav-link">Inicio</button>
                        </li>
                        <li className="nav-item">
                        <button className="nav-link">Parrillas</button>
                        </li>
                        <li className="nav-item">
                        <button className="nav-link">Contacto</button>
                        </li>
                        <li className="nav-item">
                        <button className="nav-link">Donde nos ubicamos?</button>
                        </li>
                        <li className="nav-item">
                        <button className="nav-link"><CartWidget/></button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
  )
}

export default Navbar