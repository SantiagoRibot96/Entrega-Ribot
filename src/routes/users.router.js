import express from "express";
import passport from "passport";
import multer from "multer";

import UserController from "../controllers/users.controller.js";

const router = express.Router();
const userController = new UserController();
const storage = multer.diskStorage({
    destination: function(req,file,cb){
        if(file.fieldname === 'profile'){
            cb(null,'src/public/profiles')
            console.log('uploaded to profiles')
        } else if(file.fieldname === 'product'){
            cb(null,'src/public/products')
            console.log('uploaded to products')
        } else if(file.fieldname === 'document'){
            cb(null,'src/public/documents')
            console.log('uploaded to documents')
        }
    },
    filename: (req,file,cb) =>{
        cb(null,file.originalname)
    }
});

const upload = multer({storage:storage});

router.post("/", userController.registerUser);
router.post("/login", userController.validateUser);
router.get("/logout", userController.logout);

router.get("/current", passport.authenticate("current", {session: false, failureRedirect: "/login"}), (req, res) => {
    res.send(req.user);
});

router.get("/github", passport.authenticate("github", {
    scope: ["user: email"]
}), async (req, res) => {});

router.get("/githubcallback", passport.authenticate("github", {
    failureRedirect: "/login"
}), userController.githubToken);

router.post("/requestPasswordReset", userController.requestPasswordReset);
router.post("/reset-password", userController.resetPassword);
router.get("/premium/:umail", userController.changeRol);
router.post("/:umail/documents", upload.fields([{name: 'document'}, {name: 'product'}, {name: 'profile'}]), userController.uploadDocuments);

export default router;