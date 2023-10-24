const misProductos = [
    {id: "1" , nombre: "Barbacoa Argentina", precio: 10000, img: "https://www.todoparrillas.com.ar/img/labarba-big.png", desc: "Parrilla Barbacoa Argentina la mezcla justa entre calidad y precio", idCat: "carbon"},
    {id: "2" , nombre: "Portatil", precio: 8000, img: "https://www.todoparrillas.com.ar/img/portatil-hero.png", desc: "Parrilla economica Portatil, duradera como ninguna",  idCat: "carbon"},
    {id: "3" , nombre: "QBO", precio: 15000, img: "https://www.todoparrillas.com.ar/img/hero-bbq.png", desc: "Parrilla premium QBO, con terminaciones especiales", idCat: "carbon"},
    {id: "4" , nombre: "Flama", precio: 20000, img: "https://www.todoparrillas.com.ar/img/product-2-1.jpg", desc: "Parrilla a gas Flama Asador", idCat: "gas"}
];

export const getProductos = () => {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(misProductos);
        }, 500)
    })
}

export const getUnProducto = (nombre) => {
    return new Promise(resolve => {
        setTimeout(()=> {
            const producto = misProductos.find(item => item.nombre === nombre);
            resolve(producto);
        }, 500)
    })
}

export const getUnaCategoria = (idCategoria) => {
    return new Promise(resolve => {
        setTimeout(() => {
            const productosCategoria = misProductos.filter(item => item.idCat === idCategoria);
            resolve(productosCategoria);
        }, 500)
    })
}