# Angular 21 & NgRx 21 Upgrade Plan

## Overview

Upgrade Angular from 20.1.0 to 21.x and NgRx from 20.0.0 to 21.x, migrating tests from Karma to Vitest and updating the CI/CD pipeline.

## Granted Permissions

· Bash(prompt: run git commands for branch management and commits)
· Bash(prompt: run Angular CLI update commands to upgrade packages)
· Bash(prompt: run npm install commands to update dependencies)
· Bash(prompt: run Angular CLI generate commands for Vitest migration)
· Bash(prompt: run tests to verify upgrade success)
· Bash(prompt: run build commands to verify compilation)
· Bash(prompt: run linting commands to check code quality)
· Bash(prompt: run Node.js scripts to verify environment setup)
· Bash(prompt: check package versions and Node.js version)

## Current State

-   **Angular**: 20.1.0
-   **NgRx**: 20.0.0
-   **TypeScript**: 5.8.3 (needs upgrade to 5.9+)
-   **Angular ESLint**: 18.3.1 (outdated)
-   **Test Runner**: Karma/Jasmine
-   **Node.js**: 22.21.1 (local) / 20 (CI/CD)

## Known Issues to Fix

1. Inconsistent NgRx effects pattern in `newsletter-service-effects.service.spec.ts` (lines 48, 59)
2. Angular ESLint behind current version

## User Decisions

-   ✅ Migrate to Vitest (Angular's recommended test runner)
-   ✅ Use Node.js 22 in CI/CD pipeline
-   ✅ Add automated test and lint steps to CI/CD

## Critical Files

### Configuration Files

-   `package.json` - All dependency versions
-   `angular.json` - Build/test configuration
-   `tsconfig.json` - TypeScript configuration
-   `.eslintrc.json` - Linting rules

### Store Files (NgRx Pattern Fixes)

-   `src/app/store/effects/newsletter-service-effects.service.spec.ts` - Fix action creator usage (lines 48, 59)

### CI/CD Files

-   `.github/workflows/deploy.yml` - Update Node.js version, add test/lint steps
-   `.github/workflows/deploy-test.yml` - Update Node.js version, add test/lint steps

### Build Script

-   `set-env.js` - Verify compatibility with Angular 21 build system

## Implementation Steps

### Phase 1: Preparation

1. Create feature branch: `upgrade/angular-21-ngrx-21`
2. Run baseline tests to establish current state
3. Backup `package-lock.json`

### Phase 2: Core Angular & TypeScript Upgrade

1. Run Angular update command:
    ```bash
    ng update @angular/core@21 @angular/cli@21
    ```
2. Update TypeScript to 5.9+ (required by Angular 21):
    ```bash
    npm install --save-dev typescript@~5.9.0
    ```
3. Verify all `@angular/*` packages are at 21.x

### Phase 3: NgRx Upgrade

1. Update NgRx packages:
    ```bash
    ng update @ngrx/store@21
    ```
2. Manually update NgRx ESLint plugin:
    ```bash
    npm install --save-dev @ngrx/eslint-plugin@21
    ```
3. Fix NgRx effects test pattern:
    - File: `src/app/store/effects/newsletter-service-effects.service.spec.ts`
    - Line 48: Change `const initialAction = getNewsletterListAction;` → `getNewsletterListAction();`
    - Line 59: Same fix needed

### Phase 4: Angular ESLint Upgrade

1. Update Angular ESLint to v21:
    ```bash
    ng update @angular-eslint/schematics@21
    ```
2. Update TypeScript ESLint to v8 (for TypeScript 5.9 support):
    ```bash
    npm install --save-dev @typescript-eslint/eslint-plugin@^8.0.0 @typescript-eslint/parser@^8.0.0
    ```

### Phase 5: Migrate to Vitest

1. Run Angular's migration schematic:
    ```bash
    ng generate @angular/core:karma-to-vitest
    ```
2. Review generated `vitest.config.ts`
3. Verify test scripts updated in `package.json`
4. Test the migration with:
    ```bash
    npm test
    ```
5. Fix any test failures (common areas: NgRx testing utilities, rxjs-marbles)

### Phase 6: Update CI/CD Pipeline

#### Update deploy.yml

File: `.github/workflows/deploy.yml`

Changes needed:

1. Line 19: Update Node.js version from `'20'` to `'22'`
2. After "Install dependencies" step, add:

    ```yaml
    - name: Run tests
      run: npm test

    - name: Run linting
      run: npm run lint
    ```

#### Update deploy-test.yml

File: `.github/workflows/deploy-test.yml`

Same changes as deploy.yml:

1. Update Node.js version to `'22'`
2. Add test and lint steps before build

### Phase 7: Optional Dependency Updates

1. Update supporting libraries:
    ```bash
    npm install tslib@^2.8.0
    npm install --save-dev @types/node@^22.0.0
    npm update @angular/google-maps @googlemaps/js-api-loader @types/google.maps
    ```

### Phase 8: Build System Verification

1. Verify `set-env.js` still works:
    ```bash
    node set-env.js
    ```
2. Check that environment files are created in `src/environments/`
3. Test development build:
    ```bash
    npm run build
    ```
4. Test production build:
    ```bash
    npm run build:prod
    ```

## Verification Steps

### Code Quality Checks

```bash
npm run lint              # Should pass with no errors
npm run lint:fix          # Auto-fix any fixable issues
```

### Testing

```bash
npm test                  # All tests should pass
```

Focus on these test files:

-   `counselor-service-effects.service.spec.ts`
-   `newsletter-service-effects.service.spec.ts`
-   `counselor-reducer.spec.ts`
-   `newsletter-reducer.spec.ts`
-   `counselor-selector.spec.ts`
-   `newsletter-selector.spec.ts`

### Build Verification

```bash
npm run build             # Development build
npm run build:prod        # Production build
```

Verify:

-   ✅ No compilation errors
-   ✅ Bundle sizes within budget (800KB warning, 1MB error)
-   ✅ Output in `dist/browser/` directory
-   ✅ Environment file replacement worked

### Version Verification

```bash
npm list @angular/core    # Should show 21.x
npm list @ngrx/store      # Should show 21.x
npm list typescript       # Should show 5.9.x
npx ng version            # Full version report
```

### Application Testing

1. Run development server:
    ```bash
    npm start
    ```
2. Manual checks:
    - ✅ Application loads without errors
    - ✅ No console warnings/errors
    - ✅ NgRx store functions correctly
    - ✅ All routes accessible
    - ✅ API calls work (counselor/newsletter data loads)

## Deployment Strategy

### Stage 1: Test Environment

1. Commit all changes to feature branch
2. Create pull request with detailed description
3. Merge to `development` branch
4. CI/CD auto-deploys to UAT environment
5. Manual QA testing on UAT

### Stage 2: Production

1. After successful UAT validation
2. Merge PR to `main` branch
3. CI/CD auto-deploys to production
4. Monitor for issues

### Rollback Plan

If issues occur:

-   GitHub Actions has automatic backup mechanism
-   Secrets.DEPLOY_FOLDER_PROD_BACKUP contains previous version
-   Can manually revert commits and redeploy

## Expected Package Versions After Upgrade

### Runtime Dependencies

-   `@angular/*`: 21.x
-   `@ngrx/*`: 21.x
-   `typescript`: ~5.9.0
-   `rxjs`: ~7.8.0 (compatible)
-   `zone.js`: ~0.15.1 (compatible)

### Dev Dependencies

-   `@angular/cli`: 21.x
-   `@angular-devkit/build-angular`: 21.x
-   `@angular-eslint/*`: 21.x
-   `@ngrx/eslint-plugin`: 21.x
-   `@typescript-eslint/*`: ^8.0.0
-   `@types/node`: ^22.0.0
-   `tslib`: ^2.8.0

### Test Dependencies (New)

-   Vitest will be added by migration schematic
-   Karma packages will be removed

## Breaking Changes to Handle

### Angular 21

1. **Karma Removed** → Migrating to Vitest (automated)
2. **TypeScript 5.9+ Required** → Updating in Phase 2
3. **Node.js 20.19+ Required** → Already met (using 22)

### NgRx 21

-   No breaking changes for traditional effects/store usage
-   Signal-based APIs are new additions (optional)

### TypeScript 5.9

-   Stricter type checking (already have strict mode enabled)
-   Should be minimal impact due to existing strict configuration

## Risk Mitigation

### High-Risk Areas

1. **Vitest Migration**: Tests may need adjustments

    - Mitigation: Angular's schematic handles most cases; fix failures incrementally

2. **NgRx Effects Tests**: Pattern changes

    - Mitigation: Specific files identified; simple fixes

3. **CI/CD Changes**: Node.js version update
    - Mitigation: Test in development environment first; have rollback ready

### Low-Risk Areas

-   Build system (already using modern `application` builder)
-   Store implementation (traditional patterns fully supported)
-   HTTP configuration (already using functional providers)

## Success Criteria

Before considering upgrade complete:

-   ✅ All packages at target versions (Angular 21.x, NgRx 21.x, TypeScript 5.9.x)
-   ✅ No lint errors
-   ✅ All tests passing (100% pass rate)
-   ✅ Development and production builds succeed
-   ✅ CI/CD pipeline updated and working
-   ✅ Application functions correctly in all environments
-   ✅ No console errors in browser

## Post-Upgrade Monitoring

### First 24 Hours

-   Check production application for errors
-   Monitor browser console on live site
-   Verify all features working

### Week 1

-   Compare bundle sizes (Angular 20 vs 21)
-   Monitor CI/CD build times
-   Check for any user-reported issues

## Timeline Estimate

-   **Upgrade execution**: 4-6 hours
-   **Testing & fixes**: 2-3 hours
-   **CI/CD updates**: 1 hour
-   **UAT validation**: 2-3 hours
-   **Total**: 9-13 hours (spread over 2-3 days)

_Note: Includes buffer time for unexpected issues_
