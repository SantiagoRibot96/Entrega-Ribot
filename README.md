# Entregas de Ribot Santiago

ProductManager es una clase que cuenta con tres metodos:
    -getProducts(): Obtiene los productos existentes;
    -addProduct(titulo, descripcion, precio, url, codigo, stock): Agrega un nuevo producto con los parametros pasados. En caso de que falte alguno, arroja error. En caso que el codigo se repita con otro producto, tambien arroja error. A cada producto le asigna un Id correlativo. Los errores son retornados, deben ser mostrados por linea de consola si asi lo desea;
    -getProducts(id): Busca dentro de los productos existentes uno con el Id solicitado. En caso de encontrarlo retorna el producto, en caso contrario retorna un error.

Al utilizar el constructor de ProductManager se crea un array vacio de productos.