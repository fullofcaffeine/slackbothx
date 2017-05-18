const localtunnel = require('localtunnel')
const port = 3333
const subdomain = 'avengersbot'

localtunnel(port, {subdomain}, onTunnel).on('close', onClose)

function onTunnel (err, tunnel) {
  if (err || tunnel.url.indexOf(subdomain) === -1) {
    console.warn(`Failed to open tunnel with ${subdomain} subdomain.`)
  }
  console.info(`Tunnel is open.`)
}

function onClose () {
  console.info('Localtunnel is closed.')
}
