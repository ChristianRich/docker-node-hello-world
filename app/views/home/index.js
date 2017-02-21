module.exports = function(req, res){
    res.render('home/index', {
        env: JSON.stringify(process.env, null, 4)
    });
};
