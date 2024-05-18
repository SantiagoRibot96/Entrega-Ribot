import TicketService from "../services/ticket.services.js";
import CartService from "../services/carts.services.js";
import ProductService from "../services/products.services.js";

const ticketService = new TicketService();
const cartService = new CartService();
const productService = new ProductService();

class TicketController {
    async deleteTicket(req, res) {
        try {
            const tid = req.params.tid;
            const deletedTicket = await cartService.deleteCart(tid);

            res.status(200).send(`El ticket ha sido eliminado: ${deletedTicket}`);
        } catch (error) {
            res.status(500).send(`No se pudo eliminar el Ticket: ${error}`);
        }
    }

    async generateTicket(req, res) {
        try {
            const cid = req.params.cid;
            const cartSource = await cartService.getCartById(cid);
            const cart = await cartService.getCartById(cid);
            let index = 0;

            for (const item of cartSource.products) {
                const product = await productService.getProductById(item.product._id);

                if (product.stock < item.quantity) {
                    cart.products.splice(index, 1);
                    if(index != 0) index++;
                }else{
                    product.stock -= item.quantity;
                    await productService.updateProduct(item.product._id, product);
                    index++;
                }
            }

            const ticket = await ticketService.generateTicket(cart)
            res.status(200).send(`Ticket creado codigo: ${ticket.code}`);
            return ticket;
            
        } catch (error) {
            res.status(500).send(`Error al generar los Tickets: ${error}`);
        }
    }

    async getTickets(req, res) {
        try {
            const tickets = await ticketService.getTickets();

            res.status(200).send(`Ticket creado: ${tickets}`);
        } catch (error) {
            res.status(500).send(`Error al obtener los Tickets: ${error}`);
        }
    }
}

export default TicketController;