# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Angular 20 single-page application for CompassLex.com, a counseling services website. The application has been migrated from a PHP/database backend to a static JSON-based data system stored in `/assets/data/`.

## Environment Setup

Before building or running the project, you MUST configure the environment:

1. Copy `.env.example` to `.env`
2. Add your Google Maps API key to the `.env` file
3. The `set-env.js` script runs automatically before each build to generate environment files in `src/environments/`
4. Environment files (`environment.ts` and `environment.prod.ts`) are git-ignored and auto-generated

## Common Commands

### Development
- `npm start` or `ng serve` - Start dev server at http://localhost:4200/
- `npm run watch` - Build with watch mode enabled

### Building
- `npm run build` - Build for production (runs `set-env.js` then builds)
- `npm run build:prod` - Explicit production build
- Output is in `dist/browser/` directory

### Testing
- `ng test` - Run all Jasmine/Karma unit tests
- Tests use `random-test-values` library for test data generation
- Tests use `rxjs-marbles` for testing RxJS observables

### Code Quality
- `npm run lint` - Run ESLint checks
- `npm run lint:fix` - Auto-fix linting issues
- `npm run format` - Format code with Prettier
- `npm run format:check` - Check formatting without modifying files
- `npm run format:all` - Format all files including markdown

## Architecture

### State Management (NgRx)

The application uses NgRx for state management with a traditional Redux pattern:

- **Store Module**: `src/app/store/app.store.module.ts` - Configures store with counselors and newsletters reducers
- **Actions**: `src/app/store/actions/` - Action creators for counselor and newsletter operations
- **Reducers**: `src/app/store/reducers/` - Pure functions handling state updates
- **Effects**: `src/app/store/effects/` - Side effects (HTTP calls to JSON data)
- **Selectors**: `src/app/store/selectors/` - Memoized state selectors
- **States**: `src/app/store/states/` - State interface definitions
- **Dev Tools**: Uses `ngrx-store-freeze` in development to prevent state mutations

### Data Layer

All application data is stored in static JSON files (no backend API):
- `src/assets/data/counselor.json` - Counselor information
- `src/assets/data/newsletter.json` - Newsletter data

Services load data via HTTP GET requests to these JSON files. The data files are included in the build output and must be deployed.

### Component Structure

Components are organized by feature with a controller/presentation pattern:
- **Controllers** (e.g., `CounselorControllerComponent`) - Connect to NgRx store, handle data flow
- **Presentational** (e.g., `CounselorComponent`) - Receive data via @Input, render UI
- **Shared**: Common components in `src/app/components/shared/`

### Routing

Routes are defined in `src/app/app-routing.module.ts`:
- `/home` - Home page
- `/meet-us` - Team overview
- `/meet-us/:firstname` - Individual counselor detail pages
- `/our-services` - Services page
- `/faq` - Frequently asked questions
- `/getting-started` - Getting started guide
- `/resources` - Resources page
- `/contact-us` - Contact form
- `/newsletters` - Newsletter archive

Default route redirects to `/home`.

### Styling

- Global styles: `src/sass/styles.scss` (not `src/styles.scss`)
- Variables: `src/sass/_variables.scss`
- Component styles: Use SCSS with component-specific files
- Angular component prefix: `app-`
- Style budget: max 8kb per component, 800kb initial bundle

## Deployment

CRITICAL: The deployment process is manual via FTP:

1. Build with `npm run build`
2. DO NOT deploy the `.htaccess` file - the server version differs from local
3. FTP the contents of `dist/browser/` to the appropriate directory:
   - Test: ftp://198.12.213.112:21/public_html/test.compasslex.com
   - Production: ftp://198.12.213.112:21/public_html/compasslex.com
4. Manually verify all functionality after deployment

## Angular Configuration

- Uses Angular's new `application` builder (not `browser`)
- TypeScript 5.8
- Target prefix: `app`
- Selector style: Components use kebab-case, directives use camelCase
- NgModules pattern (not standalone components)

## Testing Utilities

The codebase includes several testing patterns:
- Fake modules for shared components (e.g., `shared.fake.module.ts`) to reduce test complexity
- NgRx testing with `rxjs-marbles` for marble testing observables
- Extensive spec coverage with all components, services, reducers, effects, and selectors tested

## Key Dependencies

- **@ngrx/store** + **@ngrx/effects** - State management
- **@angular/google-maps** - Google Maps integration
- **dotenv** - Environment variable loading for builds
- **Prettier** + **ESLint** - Code formatting and linting with Angular + NgRx rules
