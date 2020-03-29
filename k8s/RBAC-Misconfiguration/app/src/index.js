const express = require('express')
const execute = require('./execute')
const app = express()
const port = 3000

const NEW_LINE = '\r\n'
const errorMessage = 'Usage curl <THIS SERVER>/?cmd=<YOUR BASH HERE>'.toLowerCase();

const prepResponse = (cmd, response) => {
    return `commandsss: ${cmd}${NEW_LINE}=========${NEW_LINE}${response}`;
}

app.get('/', (req, res) => {
    const {cmd = ''} = req.query;
    if (!cmd.length) {
        return res.send(errorMessage + NEW_LINE);
    }
    return execute(cmd)
        .then((response) => res.send(prepResponse(cmd, response) + NEW_LINE))
        .catch(e => res.status(500).send(prepResponse(cmd, e.message) + NEW_LINE));
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
