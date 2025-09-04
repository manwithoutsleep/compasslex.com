const fs = require('fs');
require('dotenv').config();

// Environment file content
const envConfig = `export const environment = {
  production: true,
  currentBaseUrl: 'https://' + window.location.host + '/api/public',
  googleMapsApiKey: '${process.env.GOOGLE_MAPS_API_KEY || ''}'
};`;

// Write the environment file
fs.writeFileSync('./src/environments/environment.prod.ts', envConfig);

console.log('Environment variables injected into environment.prod.ts');