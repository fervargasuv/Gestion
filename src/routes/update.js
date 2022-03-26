const express = require('express');
const router = express.Router();

const conn = require('../database');

// router.get('/modificar/:ID', (req,res) => {
//     //res.render('index.ejs');
//     const { ID } = req.params;
//     conn.query('Select Nombre from Contenido_pag', [ID] , (err,resp,campos) => {
//         console.log(resp);
//         res.render('modificar.ejs',{
//             datos: resp
//         });
//     });
// });

router.post('/modificar/:ID',(req, res,next) => {
    if(req.isAuthenticated()) return next();
    res.redirect('/login');
},(req,res,err) =>{
    const {Nombre,Director,Genero,Fecha_estreno,Tipo_categoria,Dir_img,Sinopsis}=datitos=req.body;
    const {ID} = req.params;
    conn.query('UPDATE Contenido_pag SET? WHERE ID=?',[datitos,req.params.ID],(err,resp,campos) =>{
        if(!err) {
            res.redirect('/correcto');
          } else {
            console.log(err);
          }
    });
});

router.put('/update/1',(req,res)=> {
    conn.query('UPDATE contenido_pag SET genero = "Ciencia Ficcion" WHERE nombre= "Stars wars" ',(err,resp,campos)=>{
        if(!err){
            res.json({status: "Contenido Actualizado" });
        }else{
            console.log(err);
        }
    });
});
router.put('/update/2',(req,res)=> {
    conn.query('UPDATE contenido_pag SET genero = "Infantil" WHERE genero="Animacion" and genero = "animacion"',(err,resp,campos)=>{
        if(!err){
            res.json({status: "Contenido Actualizado" });
        }else{
            console.log(err);
        }
    });
});


module.exports = router;
