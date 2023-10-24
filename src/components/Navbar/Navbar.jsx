import CartWidget from '../CartWidget/CartWidget';
import './Navbar.css';
import { Link, NavLink } from 'react-router-dom';

const Navbar = () => {
  return (
    <header>
        <nav className="navbar navbar-expand-lg bg-body-tertiary">
            <div className="container-fluid">
                <Link className="nav-link navbar-brand fuenteGrande" to="/">Todo Parrillas</Link>
                <div className="centrado" id="navbarNav">
                    <ul className="navbar-nav">
                        <li className="nav-item">
                            <NavLink className="nav-link navbar-brand" to="categoria/carbon">Carbon</NavLink>
                        </li>
                        <li className="nav-item">
                            <NavLink className="nav-link navbar-brand" to="categoria/gas">Gas</NavLink>
                        </li>
                        <li className="nav-item">
                            <NavLink className="nav-link"> <CartWidget/> </NavLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
  )
}

export default Navbar