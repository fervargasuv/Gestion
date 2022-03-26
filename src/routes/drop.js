const express = require('express');
const router = express.Router();

const conn = require('../database');

// router.delete('/drop',(req,res)=> {
//     conn.query(' drop table resena',(err,resp,campos)=>{
//         if(!err){
//             res.json({status: "Contenido Actualizado" });
//         }else{
//             console.log(err);
//         }
//     });
// });



module.exports = router;