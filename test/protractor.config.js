require('coffee-script/register');

exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  baseUrl: 'http://localhost:9001',
  rootElement: 'ws-slideshow'
}