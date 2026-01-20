# 2026-01-20-angular-21-upgrade-05: CI/CD Pipeline Updates and Final Verification

## Parent Specification

This is sub-task 05 of the parent specification: `2026-01-20-angular-21-upgrade.md`

## Objective

Update CI/CD pipeline to use Node.js 22, add automated test and lint steps, verify the build system, and complete final integration testing.

## Dependencies

**Prerequisites** (must be completed before this task):
- Task 01: Preparation and Core Angular/TypeScript Upgrade (Angular 21 installed)
- Task 02: NgRx Upgrade (store code stable)
- Task 03: Angular ESLint Upgrade (lint command working)
- Task 04: Vitest Migration (test command working)

**Blocks** (tasks that depend on this one):
- None - This is the final task

**Parallel Opportunities**:
- None - This task requires all previous tasks to be complete

## Scope

Update GitHub Actions workflows for Node.js 22, add test and lint steps, verify build system works correctly, and perform comprehensive final testing before deployment.

### In Scope

- Update `.github/workflows/deploy.yml` Node.js version to 22
- Update `.github/workflows/deploy-test.yml` Node.js version to 22
- Add test step to both workflows
- Add lint step to both workflows
- Verify `set-env.js` works with Angular 21 build system
- Test development and production builds
- Update optional dependencies (tslib, @types/node, Google Maps packages)
- Run comprehensive verification checks
- Document final package versions

### Out of Scope

- Major CI/CD workflow restructuring
- Deployment target changes
- Secret/environment variable changes
- Workflow scheduling changes

## Implementation Requirements

### Technical Requirements

1. **Node.js Version**: Update from 20 to 22 in both workflows
2. **Test Integration**: Add test step that fails the build on test failures
3. **Lint Integration**: Add lint step that fails the build on lint errors
4. **Build Verification**: Ensure build system still works correctly
5. **Optional Updates**: Update supporting libraries for latest compatibility

### Commands to Execute

```bash
# Phase 1: Optional Dependency Updates
npm install tslib@^2.8.0
npm install --save-dev @types/node@^22.0.0
npm update @angular/google-maps @googlemaps/js-api-loader @types/google.maps

# Phase 2: Build System Verification
node set-env.js
ls src/environments/  # Verify environment files created

# Phase 3: Build Testing
npm run build         # Development build
npm run build:prod    # Production build

# Phase 4: Final Comprehensive Tests
npm run lint
npm test
npm run build:prod

# Phase 5: Version Documentation
npm list @angular/core
npm list @ngrx/store
npm list typescript
npx ng version > angular-21-versions.txt
```

## Files to Create/Modify

### CI/CD Files

**File**: `.github/workflows/deploy.yml`

Changes needed:
```yaml
# Line 19: Update Node.js version
- name: Setup Node.js
  uses: actions/setup-node@v3
  with:
    node-version: '22'  # Changed from '20'

# After "Install dependencies" step, add:
- name: Run tests
  run: npm test

- name: Run linting
  run: npm run lint
```

**File**: `.github/workflows/deploy-test.yml`

Same changes as deploy.yml:
1. Update Node.js version to '22'
2. Add test step after dependencies
3. Add lint step after test step

### Documentation Files

- `angular-21-versions.txt` - Final version report for documentation

### Package Files

- `package.json` - Optional dependency updates
- `package-lock.json` - Dependency tree updates

## Testing Requirements

### Build System Verification

**Step 1: Verify set-env.js**
```bash
node set-env.js
```
- Should create environment files in `src/environments/`
- No errors should occur
- Environment variable substitution should work

**Step 2: Development Build**
```bash
npm run build
```
- Should complete without errors
- Check `dist/browser/` directory created
- Verify environment file replacement worked

**Step 3: Production Build**
```bash
npm run build:prod
```
- Should complete without errors
- Check bundle sizes within budget (800KB warning, 1MB error)
- Output in `dist/browser/` directory
- Environment file replacement worked

### Integration Testing

**Code Quality Checks**:
```bash
npm run lint              # Should pass with no errors
npm run lint:fix          # Auto-fix any fixable issues
```

**Test Suite**:
```bash
npm test                  # All tests should pass
```

**Version Verification**:
```bash
npm list @angular/core    # Should show 21.x
npm list @ngrx/store      # Should show 21.x
npm list typescript       # Should show 5.9.x
npx ng version            # Full version report
```

### Application Testing

**Step 1: Run Development Server**
```bash
npm start
```

**Step 2: Manual Checks**
- [ ] Application loads without errors
- [ ] No console warnings/errors in browser
- [ ] NgRx store functions correctly
- [ ] All routes accessible
- [ ] API calls work (counselor/newsletter data loads)
- [ ] Google Maps integration works (if applicable)
- [ ] Forms submit correctly
- [ ] Navigation works as expected

### CI/CD Pipeline Testing

After pushing to feature branch:
1. Monitor GitHub Actions workflow execution
2. Verify Node.js 22 is used
3. Verify test step runs and passes
4. Verify lint step runs and passes
5. Verify build step succeeds
6. Verify deployment succeeds (if auto-deploying to test environment)

## Success Criteria

- [ ] `.github/workflows/deploy.yml` updated with Node.js 22
- [ ] `.github/workflows/deploy.yml` includes test step
- [ ] `.github/workflows/deploy.yml` includes lint step
- [ ] `.github/workflows/deploy-test.yml` updated with Node.js 22
- [ ] `.github/workflows/deploy-test.yml` includes test step
- [ ] `.github/workflows/deploy-test.yml` includes lint step
- [ ] `set-env.js` executes successfully
- [ ] Environment files created correctly
- [ ] `npm run build` completes successfully
- [ ] `npm run build:prod` completes successfully
- [ ] Bundle sizes within budget
- [ ] `npm run lint` passes with no errors
- [ ] `npm test` passes with all tests green
- [ ] Application runs correctly in development mode
- [ ] No console errors when running the app
- [ ] All manual testing checks pass
- [ ] Optional dependencies updated successfully
- [ ] `angular-21-versions.txt` created with final versions
- [ ] CI/CD pipeline executes successfully with all new steps

## Notes

### CI/CD Workflow Changes

**Current State** (deploy.yml and deploy-test.yml):
- Uses Node.js 20
- Runs install, build, deploy
- No test or lint steps

**New State**:
- Uses Node.js 22 (required for Angular 21)
- Runs install, **test**, **lint**, build, deploy
- Build fails if tests or lint fail

### Benefits of CI/CD Changes

1. **Quality Gates**: Tests and lint must pass before deployment
2. **Early Detection**: Catch issues before they reach production
3. **Confidence**: Know that deployed code is tested and linted
4. **Modern Node.js**: Node.js 22 has better performance and security

### Optional Dependency Updates

These are safe to update but not required:

- **tslib@^2.8.0**: Latest TypeScript runtime library
- **@types/node@^22.0.0**: Node.js 22 type definitions
- **@angular/google-maps**: Latest Google Maps integration (if used)
- **@googlemaps/js-api-loader**: Latest Google Maps loader
- **@types/google.maps**: Latest Google Maps types

### Expected Final Versions

After all tasks complete:

**Runtime Dependencies**:
- `@angular/*`: 21.x
- `@ngrx/*`: 21.x
- `typescript`: ~5.9.0
- `rxjs`: ~7.8.0 (compatible, no update needed)
- `zone.js`: ~0.15.1 (compatible, no update needed)

**Dev Dependencies**:
- `@angular/cli`: 21.x
- `@angular-devkit/build-angular`: 21.x
- `@angular-eslint/*`: 21.x
- `@ngrx/eslint-plugin`: 21.x
- `@typescript-eslint/*`: ^8.0.0
- `@types/node`: ^22.0.0
- `tslib`: ^2.8.0
- `vitest`: (version installed by migration)

**Removed**:
- `karma`: All Karma packages removed
- `jasmine`: Karma-specific Jasmine packages removed

### Deployment Strategy

**Stage 1: Feature Branch Testing**
1. Commit all changes to `upgrade/angular-21-ngrx-21`
2. Push to GitHub
3. CI/CD runs with new Node.js 22 and test/lint steps
4. Verify workflow succeeds

**Stage 2: UAT Environment**
1. Create pull request to `development` branch
2. Merge after review
3. CI/CD auto-deploys to UAT
4. Manual QA testing on UAT

**Stage 3: Production**
1. After successful UAT validation
2. Create PR to `main` branch
3. Merge after final review
4. CI/CD auto-deploys to production
5. Monitor for issues

### Rollback Plan

If issues occur in production:
- GitHub Actions has automatic backup mechanism
- `Secrets.DEPLOY_FOLDER_PROD_BACKUP` contains previous version
- Can manually revert commits and redeploy
- Can rollback entire feature branch if needed

### Post-Deployment Monitoring

**First 24 Hours**:
- Check production application for errors
- Monitor browser console on live site
- Verify all features working
- Check CI/CD build times

**Week 1**:
- Compare bundle sizes (Angular 20 vs 21)
- Monitor CI/CD build times (should be faster with Vitest)
- Check for any user-reported issues
- Verify Node.js 22 performing well

### Time Estimate

- CI/CD workflow updates: 20 minutes
- Optional dependency updates: 15 minutes
- Build system verification: 20 minutes
- Comprehensive testing: 1 hour
- Application manual testing: 30 minutes
- Documentation: 15 minutes
- **Total**: ~2.5 hours
