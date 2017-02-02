module.exports = {
    health: function(payload, db, cb){
        return cb(null, payload);
    }
};