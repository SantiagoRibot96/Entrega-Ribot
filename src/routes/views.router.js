import express from "express";
import { newProductList } from "../app.js";

const router = express.Router();

router.get("/", (req, res) => {
    res.redirect("/products");
});

router.get("/products", async (req, res) => {
    try {
        const { limit = 8, page = 1, sort, query } = req.query;
        let firstPage = false;

        const products = await newProductList.getProducts({
            limit: parseInt(limit),
            page: parseInt(page),
            sort,
            query
        });

        if(!products.hasPrevPage){
            firstPage = true;
        }
        
        res.render("home", {
            status: "success",
            payload: products.docs,
            hasPrevPage: products.hasPrevPage,
            hasNextPage: products.hasNextPage,
            prevPage: products.prevPage,
            nextPage: products.nextPage,
            currentPage: products.page,
            totalPages: products.totalPages,
            nextLink: products.hasNextPage ? products.nextPage : null,
            prevLink: products.hasPrevPage ? products.prevPage : null,
            firstPage,
            limit
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({
            status: "error",
            error: "Error interno del servidor"
        });
    }
});

router.get("/chat", (req, res) => {
    res.render("chat");
});

export default router;