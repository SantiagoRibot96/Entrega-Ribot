import express from "express";
import { newProductList } from "../app.js";

const router = express.Router();

router.get("/", async (req, res) => {
    res.render("home", {products: await newProductList.getProducts(), title: "Productos sin Websocket"});
});

router.get("/realtimeproducts", async (req, res) => {
    res.render("realTimeProducts", {products: await newProductList.getProducts(), title: "Productos con Websocket"});
});

export default router;