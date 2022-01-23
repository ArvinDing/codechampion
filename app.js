/* Express */
const Express = require('express');
const cors = require('cors');
const path = require('path');

const port =8888;
const App = Express();

App.disable("x-powered-by");
/* EXTERNAL MODULES */

App.use(cors());
App.use(Express.json({limit: "1mb"}));

/* FRONTEND */
App.use(Express.static(path.join(__dirname, '/pages')));

/* CATCH-ALL FRONTEND */
App.get('/*', (req, res) => {
    res.sendFile(path.join(__dirname + '/pages/home.html'));
});


App.listen(process.env.PORT || 8888, () => console.log(`App listening on port ${port}`));
