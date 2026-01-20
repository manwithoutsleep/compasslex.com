const fs = require('fs');
const path = require('path');
require('dotenv').config();

// Environment file content
const envConfigProd = `export const environment = {
  production: true,
  currentBaseUrl: 'https://' + window.location.host + '/api/public',
  googleMapsApiKey: '${process.env.GOOGLE_MAPS_API_KEY || ''}'
};`;

const envConfigDev = `export const environment = {
  production: false,
  currentBaseUrl: 'https://' + window.location.host + '/api/public',
  googleMapsApiKey: '${process.env.GOOGLE_MAPS_API_KEY || ''}'
};`;

const targetDir = path.join(__dirname, 'src', 'environments');
const targetFileProd = path.join(targetDir, 'environment.prod.ts');
const targetFile = path.join(targetDir, 'environment.ts');

try {
    // 2. Ensure the directory exists (idempotent)
    fs.mkdirSync(targetDir, { recursive: true });

    // 3. Write the files (overwriting if they exist)
    fs.writeFileSync(targetFile, envConfigDev);
    fs.writeFileSync(targetFileProd, envConfigProd);

    console.log(`Successfully created environment file at ${targetFile}`);
} catch (err) {
    console.error('Error writing environment file:', err);
    process.exit(1); // Exit with an error code
}
