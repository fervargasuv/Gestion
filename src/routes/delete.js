const express = require('express');
const router = express.Router();

const conn = require('../database');

// router.delete('/delete/1',(req,res)=> {
//     conn.query('DELETE FROM resena WHERE evaluacion = 1',(err,resp,campos)=>{
//         if(!err){
//             res.json({status: "Borrado exitosamente"});
//         }else{
//             console.log(err);
//         }
//     });
// });
router.get('/delete/:ID',(req,res)=> {
    const { ID } = req.params;
    conn.query('DELETE FROM contenido_pag WHERE ID=?',[ID],(err,resp,campos)=>{
        if(!err){
            res.redirect('/correcto');
        }else{
            console.log(err);
        }
        });
    });





module.exports = router;