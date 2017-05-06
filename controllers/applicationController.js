var bcrypt = require('bcryptjs');
var express = require('express');
var router  = express.Router();
var mysql = require('mysql')
var connection = require('../config/connection.js')


//this is the users_controller.js file
router.get('/', function(req,res) {
  res.render('index');
});

router.get('/api/kids', function(req,res) {
  // console.log("Parents");
  query = "SELECT u.id AS kids_id, u.username, u.email FROM users AS u RIGHT JOIN parent_students AS ps ON u.id = ps.student_id WHERE ps.parent_id = ?";
    connection.query(query, [ req.session.user_id ], function(err, kids){
      console.log(kids);
      var allKidsIds = "";
      if ( kids != ""){
        for (var k = 0; k < kids.length; k++) {
          if (k == 0) {allKidsIds += kids[k].kids_id;
          }else {allKidsIds += ", " + kids[k].kids_id;
          };
        };

      }
      query="SELECT ub.user_id, ub.book_id, b.title FROM user_books AS ub INNER JOIN BOOKS AS b ON ub.book_id = b.id WHERE ub.user_id = ?";
      connection.query(query, [ allKidsIds ], function(err, kidbooks){
        
        console.log(kidbooks);

        kidbooks = JSON.stringify(kidbooks);
        kidbooks = kidbooks.replace(/&quot;/g,"\"");
        console.log(kidbooks);

        res.json(kidbooks);
  });
  })
});

module.exports = router;
