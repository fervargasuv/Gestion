

const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const path = require('path');
const passport = require('passport');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const conn = require('./database.js');
const PassportLocal = require('passport-local').Strategy;

//config

app.set('port',process.env.PORT || 3000);
app.set('views',path.join(__dirname,'views')); 
app.set('view engine','ejs');
//Middleware
app.use(express.json()); //Transfomar a formato JSON 
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser('el secreto'));
app.use(session({
     secret: 'el secreto',
     resave: true, //la sesión se guardar cada vez
     saveUninitialized: true    //Si inicializamos y no le guardamos nada igual va a guardar
}));
app.use(passport.initialize());
app.use(passport.session());
passport.use(new PassportLocal(function(username,password,done){
    conn.query('select * From usuario Where Correo=? and Contrasena=?',[username,password],(err,user)=>{
        if(err){
            console.log(err);
        }
        else{
            // console.log(user);
            if(user.length == 0){
                done(null, false);
            }
            else if(user[0].Admin == 1){
                // console.log("hola4");
                return done(null, {id: user[0].Correo, admin: user[0].Admin});
            }
            else if(user[0].Admin == 0){
                // console.log("hola5");
                return done(null,{id: user[0].Correo, admin: user[0].Admin});
            }
            else{
                // console.log("hola6");
                done(null, false);
            }  
        }
    });
}));

//Serialización, parar la información para identificar usuario en passport
passport.serializeUser(function(user,done){
    // console.log("hola3")
    // console.log(user);
     done(null,user);
});
//Deserializacion
passport.deserializeUser(function(user,done){
    // console.log("hola1");
    process.nextTick(function() {
        // console.log("hola13");
        // console.log(user);
        return done(null, user);
    });
});

// rutas
app.use(require('./routes/select.js'));


//SOLO USAR DROP AL FINAL O PRODUCIRA PROBLEMAS CON LA TABLA A ELIMINAR POR LOS DATOS


app.listen(app.get('port'),()=> {
    console.log('Servidor en puerto' ,app.get('port'))
});