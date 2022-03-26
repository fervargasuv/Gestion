const express = require('express');
const router = express.Router();

const conn = require('../database');

// router.post('/insert/1',(req,res)=> {
//     conn.query('insert into administrador(nombre,Telefono,Email) values ("Celso cisternas","958431293","Celsitodelflow@email.com")',(err,resp,campos)=>{
//         if(!err){
//             res.json({status: "Contenido Insertado" });
//         }else{
//             console.log(err);
//         }
//     });
// });

// router.post('/insert/2',(req,res)=> {
//     conn.query('insert into usuarios(Nombre,Contraseña) values ("uwus","Celsito")',(err,resp,campos)=>{
//         if(!err){
//             res.json({status: "Contenido Insertado" });
//         }else{
//             console.log(err);
//         }
//     });
// });

// router.post('/insert/3',(req,res)=> {
//     conn.query('insert into contenido_pag (Nombre,Director,Genero,Fecha_estreno,Tipo_categoria) values("Infinity war","Joe russo-Anthony Russo","Ciencia Ficcion","2018-04-23",1)',(err,resp,campos)=>{
//         if(!err){
//             res.json({status: "Contenido Insertado" });
//         }else{
//             console.log(err);
//         }
//     });
// });
router.get('/insertar', (req,res) =>{
  res.render('insertar.ejs');
});


router.post('/insertar',(req, res,next) => {
  if(req.isAuthenticated()) return next();
  res.redirect('/login');
},(req,res,err) =>{
    const {Nombre,Director,Genero,Fecha_estreno,Tipo_categoria,Dir_img,Sinopsis,ID_pag}=req.body;
    conn.query('insert into Contenido_pag SET?',{
        Nombre:Nombre,
        Director: Director,
        Genero:Genero,
        Fecha_estreno: Fecha_estreno,
        Tipo_categoria:Tipo_categoria,
        Dir_img:Dir_img,
        Sinopsis:Sinopsis,
        ID_pag:1
    },(err,resp,campos) =>{
        if(!err) {
            res.redirect('/correcto');
          } else {
            console.log(err);
          }
    });
});

module.exports = router;