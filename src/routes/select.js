const express = require('express');
const req = require('express/lib/request');
const passport = require('passport');
const { commit } = require('../database');
const router = express.Router();

const conn = require('../database');


// Login inicial
router.get('/', (req,res) =>{
    req.logout();
    res.render('login.ejs');
});
router.post('/login',passport.authenticate('local',{
    failureRedirect: "/",
}), function(req, res) {
    // console.log("hola2");
    // console.log(req.user);
    if(req.user.admin == 1){
      res.redirect('/logged1');
    }
    else if(req.user.admin == 0){
      res.redirect('/logged');
    }
});





//QUERY informacion proyecto

router.get('/proyecto', (req,res,next) => {
    if(req.isAuthenticated()) return next();
    res.redirect('/');
},(req,res) =>{
    res.render('proyecto.ejs', { data: req.user });
});

router.post('/proyecto', (req,res) => {
    const {Nombre,Area, opinion_expertos, Correo}=req.body;
    conn.query('insert into proyecto SET?',{
        NombreP:Nombre,
        Correo: Correo,
        Area: Area, 
        Opinion: opinion_expertos
    },(err,resp,campos) =>{
        if(!err) {
            res.redirect('/riesgos');
          } else {
            console.log(err);
          }
    });
});


// QUERY informacion de riegos

router.get('/riesgos', (req,res,next) => {
    if(req.isAuthenticated()) return next();
    res.redirect('/');
},(req,res) =>{
    conn.query('SELECT * FROM proyecto ORDER BY ID_P DESC LIMIT 1', (err,resp,campos) => {
        // console.log("hola33");
        // console.log(resp);
        res.render('riesgos.ejs',{ ID : resp});
    });
});

router.post('/riesgos', (req,res) => {
    const {NombreR,Descripcion,Probabilidad,Impacto,Tipo,ID_P,Opinion}=req.body;
    if(Opinion=="Si"){
        conn.query('insert into solicitud SET?',{
            Nombre:NombreR,
            Descripcion:Descripcion,
            Probabilidad:Probabilidad,
            Impacto:Impacto,
            Tipo:Tipo,
            ID_P:ID_P 
        },(err,resp,campos) =>{
            if(!err) {
                res.redirect('/riesgos');
              } else {
                console.log(err);
              }
        });
    }
    else if(Opinion=="No"){
        conn.query('insert into riesgos SET?',{
            Nombre:NombreR,
            Descripcion:Descripcion,
            Probabilidad:Probabilidad,
            Impacto:Impacto,
            Tipo:Tipo,
            ID_P:ID_P 
        },(err,resp,campos) =>{
            if(!err) {
                res.redirect('/riesgos');
              } else {
                console.log(err);
              }
        });
    }
    else{
        console.log("error con Opinion de expertos al subir riesgos, no se reconoce la respuesta");
        res.redirect('/riesgos');
    }
});




// Pantalla Principal

router.get('/logged', (req,res,next) => {
    if(req.isAuthenticated()) return next();
    // console.log("hi1");
    res.redirect('/');
},(req,res) =>{
    //res.render('index.ejs');
    conn.query('Select NombreP,Area,ID_P FROM Proyecto', (err,resp,campos) => {
            // console.log("hi2");
            res.render('logged.ejs',{
            datos : resp
            });

        },(err,resp,campos) =>{
            if(!err) {
                // console.log("hola3");
                res.redirect('/logged');
              } else {
                console.log(err);
              }
        });
    });

router.get('/logged1', (req,res,next) => {
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    // console.log("hi11");
    res.redirect('/');
},(req,res) =>{
    //res.render('index.ejs');
    conn.query('Select NombreP,Area,ID_P FROM Proyecto', (err,resp,campos) => {
            // console.log("hola22");
            res.render('logged1.ejs',{
            datos : resp
            });

        },(err,resp,campos) =>{
            if(!err) {
                // console.log("hola33");
                res.redirect('/logged1');
                } else {
                console.log(err);
                }
        });
    });

router.get('/solicitud', (req,res,next) => {
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    res.redirect('/');
},(req,res) =>{
    //res.render('index.ejs');
    conn.query('Select NombreP,Area,ID_P FROM Proyecto where Opinion = "Si"', (err,resp,campos) => {
        // console.log("hola22");
        res.render('solicitud.ejs',{ datos : resp })},(err,resp,campos) =>{
            if(!err) {
                // console.log("hola33");
                res.redirect('/solicitud');
            } else {
                console.log(err);
            }
    });
});

router.get('/evaluacion/:ID_P',(req,res,next) =>{
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    res.redirect('/');
},(req,res) =>{
    // console.log("hola123");
    const {ID_P} = req.params;
    conn.query('SELECT * FROM solicitud WHERE ID_P=?',[ID_P], (err,resp,campos) => {
        // console.log(resp);
        res.render('analisis1.ejs',{
        datos : resp
        });
    });
});


router.get('/riesgos_editar/:ID_R',(req,res,next) =>{
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    res.redirect('/');
},(req,res) =>{
    const {ID_R} = req.params;
    conn.query('SELECT * FROM solicitud WHERE ID_R = ?',[ID_R], (err,resp,campos) => {
        res.render('riesgos_editar.ejs',{
        datos : resp
        });
    });
});

router.post('/riesgos_editar/save/:ID_R',(req,res,next) =>{
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    res.redirect('/');
},(req,res) =>{
    const {ID_R} = req.params;
    const {Nombre,Descripcion,Probabilidad,Impacto,Tipo,Comentario} = req.body;
    conn.query('SELECT ID_P FROM solicitud WHERE ID_R = ?',[ID_R], (err,resp,campos) => {
        ID_Proyecto = resp[0].ID_P;
        conn.query('INSERT INTO riesgos SET ?',{
            Nombre:Nombre,
            Descripcion:Descripcion,
            Probabilidad:Probabilidad,
            Impacto:Impacto,
            Tipo:Tipo,
            Comentario:Comentario,
            ID_P:ID_Proyecto

        },(err,resp2) => {
            if(!err){
                conn.query('DELETE FROM solicitud WHERE ID_R = ?',[ID_R], (err,resp3) =>{
                    if(!err){
                        conn.query('SELECT * FROM solicitud WHERE ID_P = ?',[ID_Proyecto], (err,resp4) =>{
                            if(resp4.length === 0){
                                conn.query('UPDATE proyecto SET ? WHERE ID_P=?',[{
                                    Opinion:"No"},
                                    ID_Proyecto
                                ]);
                            }
                            res.redirect('/solicitud');
                        });
                        
                    }else{
                        console.log(err);
                    }
                });
            }else{
                console.log(err);
            }
        });
    });
});

router.get('/riesgos_agregar/:ID_P',(req,res,next) =>{
    if(req.isAuthenticated()) return next();
    res.redirect('/');
},(req,res) =>{
    const {ID_P} = req.params;
    conn.query('SELECT * FROM proyecto WHERE ID_P = ?',[ID_P], (err,resp,campos) => {
        res.render('riesgos_agregar.ejs',{
        datos : resp
        });
    });
});

router.post('/riesgos_agregar/save/:ID_P',(req,res,next) =>{
    if(req.isAuthenticated()) return next();
    res.redirect('/');
},(req,res) =>{
    const {ID_P} = req.params;
    const {Nombre,Descripcion,Probabilidad,Impacto,Tipo,Comentario} = req.body;
    conn.query('INSERT INTO riesgos SET ?',{
        Nombre:Nombre,
        Descripcion:Descripcion,
        Probabilidad:Probabilidad,
        Impacto:Impacto,
        Tipo:Tipo,
        Comentario:Comentario,
        ID_P:ID_P

    },(err,resp2) => {
        if(!err){
            res.redirect('/riesgos_agregar/'+ID_P);
        }else{
            console.log(err);
        }
    });
});



router.get('/delete/:ID_P',(req,res)=> {
        const { ID_P } = req.params;
        conn.query('DELETE FROM solicitud WHERE ID_P=?',[ID_P]);
        conn.query('DELETE FROM proyecto WHERE ID_P=?',[ID_P],(err,resp,campos)=>{
            if(!err){
                res.redirect('/logged');
            }else{
                console.log(err);
            }
            });
        });

router.get('/delete2/:ID_P',(req,res, next)=> {
        if(req.isAuthenticated() && req.user.admin == 1) return next();
        res.redirect('/');
    },(req,res) =>{
        const { ID_P } = req.params;
        conn.query('DELETE FROM solicitud WHERE ID_P=?',[ID_P]);
        conn.query('DELETE FROM proyecto WHERE ID_P=?',[ID_P],(err,resp,campos)=>{
            if(!err){
                res.redirect('/logged1');
            }else{
                console.log(err);
            }
            });
        });
// Pantalla del analisis
router.get('/analisis/:ID_P',(req,res,next) =>{
    if(req.isAuthenticated()) return next();
    res.redirect('/');
},(req,res) =>{
    // console.log("hola112");
    const {ID_P} = req.params;
    conn.query('SELECT * FROM riesgos WHERE ID_P=?',[ID_P], (err,resp,campos) => {
        res.render('analisis.ejs',{
        datos : resp
        });
    });
});

router.get('/analisis2/:ID_P',(req,res,next) =>{
    if(req.isAuthenticated() && req.user.admin == 1) return next();
    res.redirect('/');
},(req,res) =>{
    // console.log("hola112");
    const {ID_P} = req.params;
    conn.query('SELECT * FROM riesgos WHERE ID_P=?',[ID_P], (err,resp,campos) => {
        //console.log(resp);
        res.render('analisis2.ejs',{
        datos : resp
        });
    });
});






module.exports = router;
