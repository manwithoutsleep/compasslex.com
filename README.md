# Compasslex.Com

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 14.2.0.

## ~~Server-Side PHP~~ (Decommissioned)

The site no longer depends upon a database and its supporting API. All data has been moved to JSON files in the `/assets/data/` folder. This folder is included in the build process and must be deployed with the rest of the site.

~~Press Ctrl-F5 to launch IIS Express~~
~~Press Ctrl-Shit-P to bring up the Command Palette~~

~~Locally, you can then navigate to this URL to test it:~~

~~http://localhost:13995/api/public/counselor~~

## Development server

1. Open a terminal window
2. Navigate to D:\Users\manwi\Documents\Websites\compasslex.com
3. Run `ng serve` for a dev server
4. Navigate to `http://localhost:4200/`.

The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/browser/` folder.

## Testing

This project supports three levels of testing:

### Automated Angular Tests

Run `ng test` to execute the Angular spec tests via [Karma](https://karma-runner.github.io).

### Manual local testing

Use the instruction in the Development Server section above to run the site locally. Manually test all functionality and visually inspect the site for anomalies.

### Manual server testing

> :warning: **Warning:** Due to the manual deployment process, you must be careful **NOT** to deploy the `.htaccess` file as the server version is different from the local version.

This project is deployed manually to a GoDaddy Web Hosting Plus server at https://test.compasslex.com

1. Build the project for production using the `ng build` command.
2. Use an FTP client to copy the contents of the `dist/browser/` folder to `ftp://198.12.213.112:21/public_html/test.compasslex.com`
3. Open the site at https://test.compasslex.com
4. Manually test all functionality and visually inspect the site for anomalies.

## Deployment

> :warning: **Warning:** Due to the manual deployment process, you must be careful **NOT** to deploy the `.htaccess` file as the server version is different from the local version.

This project is deployed manually to a GoDaddy Web Hosting Plus server at https://compasslex.com

1. Build the project for production using the `ng build` command.
2. Use an FTP client to copy the contents of the `dist/browser/` folder to `ftp://198.12.213.112:21/public_html/compasslex.com`
3. Open the site at https://compasslex.com
3. Manually test all functionality and visually inspect the site for anomalies.

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
