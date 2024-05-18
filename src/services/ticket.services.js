import { TicketModel } from "../models/ticket.model.js";
import { generateCode } from "../utils/functions.js";

class TicketService {
    async deleteTicket(tid) {
        try {
            const deletedTicket = await TicketModel.findByIdAndDelete(tid);

            return deletedTicket;
        } catch (error) {
            throw new Error(`${error}`);
        }
    }

    async generateTicket(cart, purchaser) {
        try {
            console.log(cart.products);
            const amount = cart.products.reduce((total, item) => total + item.product.price*item.quantity, 0);

            let newTicket = new TicketModel ({
                code: generateCode(15),
                purchase_datetime: Date.now(), 
                amount, 
                purchaser
            });

            await newTicket.save();
            return newTicket;
        } catch (error) {
            throw new Error(`${error}`);
        }
    }

    async getTickets() {
        try {
            const tickets = await TicketModel.find();
            
            return tickets;
        } catch (error) {
            throw new Error(`${error}`);
        }
    }
}

export default TicketService;