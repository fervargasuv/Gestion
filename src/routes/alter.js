const express = require('express');
const router = express.Router();

const conn = require('../database');

router.put('/alter/1',(req,res)=> {
    conn.query(' alter table administrador modify nombre varchar(46) NOT NULL',(err,resp,campos)=>{
        if(!err){
            res.json({status: "Contenido Actualizado" });
        }else{
            console.log(err);
        }
    });
});
router.put('/alter/2',(req,res)=> {
    conn.query('ALTER TABLE usuarios change Nick Nombre varchar (20)',(err,resp,campos)=>{
        if(!err){
            res.json({status: "Contenido Actualizado" });
        }else{
            console.log(err);
        }
    });
});


module.exports = router;