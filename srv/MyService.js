module.exports = (srv) => {
    srv.on('spiderman', req => `Hello ${req.data.name}`);
}