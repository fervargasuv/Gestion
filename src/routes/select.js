const express = require('express');
const passport = require('passport');
const { commit } = require('../database');
const router = express.Router();

const conn = require('../database');

router.get('/', (req,res) => {
    //res.render('index.ejs');
    conn.query('Select ID, Nombre,Genero FROM Contenido_pag', (err,resp,campos) => {
        console.log(resp);
        res.render('index.ejs',{
            datos: resp
        });
    });
});

router.get('/correcto', (req,res,next) => {
    if(req.isAuthenticated()) return next();
    res.redirect('/login');
},(req,res) =>{
    //res.render('index.ejs');
    conn.query('Select ID, Nombre, Director, Genero, Fecha_estreno, Tipo_categoria,Dir_img,Sinopsis FROM Contenido_pag', (err,resp,campos) => {
            res.render('admin.ejs',{
            datos : resp
            });

        });
    


    });

router.get('/pelicula/:ID', (req,res) => {
    //res.render('index.ejs');
    const { ID } = req.params;
    conn.query('Select ID,Nombre,Director,Fecha_estreno,Genero,Dir_img,Sinopsis,Evaluacion from Contenido_pag natural join resena where resena.ID=contenido_pag.ID and ID = ?', [ID] , (err,resp,campos) => {
        console.log(resp);
        res.render('peliculas.ejs',{
            datos: resp
        });
    });
});

router.get('/modificar/:ID', (req,res) => {
    //res.render('index.ejs');
    const { ID } = req.params;
    conn.query('Select * from Contenido_pag Where ID=?', [ID] , (err,resp,campos) => {
        res.render('modificar.ejs',{
            datos: resp
        });
    });
});

router.get('/top', (req,res) => {
    //res.render('index.ejs');
    conn.query('select ID, Nombre,Genero from Contenido_pag natural join resena where evaluacion >= 4 group by nombre', (err,resp,campos) => {
        console.log(resp);
        res.render('top.ejs',{
            datos: resp
        });
    });
});


// router.get('/Consulta1', (req,res) => {
//     //res.render('index.ejs');
//     conn.query('select Nombre from contenido_pag natural join resena where id_usuario>(select MAX(id_usuario)from resena where evaluacion = 5);', (err,resp,campos) => {
//         console.log(resp);
//         res.render('Consulta1.ejs',{
//             datos: resp
//         });
//     });
// });

// router.get('/Consulta2', (req,res) => {
//     //res.render('index.ejs');
//     conn.query('select * from resena natural join contenido_pag where Genero= "Drama" group by id_usuario', (err,resp,campos) => {
//         console.log(resp);
//         res.render('Consulta2.ejs',{
//             datos: resp
//         });
//     });
// });
// router.get('/select/2',(req,res)=> {
//     conn.query('select  nombre,telefono,email from administrador natural join pagina where tipo_de_contenido = "Reseñas"',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/select/3',(req,res)=> {
//     conn.query('select Nombre from contenido_pag where (Fecha_estreno BETWEEN "1996-01-01" and "2005-01-01") AND TIPO_CATEGORIA = 1',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/2',(req,res)=> {
//     conn.query('select id from resena natural join contenido_pag where Genero in ("Accion");',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/3',(req,res)=> {
//     conn.query('select Nombre from contenido_pag natural join resena where Tipo_categoria in (1) and evaluacion = 5;',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/4',(req,res)=> {
//     conn.query('select * from usuarios natural join resena where (evaluacion = 3) group by Nick;',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/5',(req,res)=> {
//     conn.query('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = "administrador";',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/6',(req,res)=> {
//     conn.query('SELECT column_name,data_type,data_length FROM all_tab_columns  WHERE table_name="usuarios" AND column_name="contrasena";',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });
// router.get('/sdasd/7',(req,res)=> {
//     conn.query('SELECT column_name,data_type,data_length FROM all_tab_columns  WHERE table_name="usuarios" AND column_name="contrasena";',(err,resp,campos)=>{
//         if(!err){
//             res.json(resp);
//         }else{
//             console.log(err);
//         }
//     });
// });



module.exports = router;
