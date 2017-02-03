module.exports = {
    create: function(payload, db, cb){
        return cb(null, payload);
    },
    read: function(payload, db, cb){
        return cb(null, payload);
    },
    list: function(payload, db, cb){
        db.query('CALL property_list(1,1)', function (error, results, fields) {
          if (error) return cb(error, null);
          return cb(null, results[0][0]);
        });
    },
    update: function(payload, db, cb){
        return cb(null, payload);
    },
    delete: function(payload, db, cb){
        return cb(null, payload);
    }
};