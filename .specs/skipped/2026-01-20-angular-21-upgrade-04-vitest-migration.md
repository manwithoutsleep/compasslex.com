# 2026-01-20-angular-21-upgrade-04: Vitest Migration and Test Verification

## Parent Specification

This is sub-task 04 of the parent specification: `.specs\2026-01-20-angular-21-upgrade.md`.
The sub-tasks are coordinated by `.specs\2026-01-20-angular-21-upgrade-00-coordinator.md`

## Objective

Migrate from Karma/Jasmine to Vitest (Angular's recommended test runner) and ensure all tests pass.

**Development Environment**: Windows 11 with PowerShell (all commands use PowerShell syntax)

## Dependencies

**Prerequisites** (must be completed before this task):

- Task 01: Preparation and Core Angular/TypeScript Upgrade (requires Angular 21 CLI)
- Task 02: NgRx Upgrade (effects test fixes must be in place)

**Blocks** (tasks that depend on this one):

- Task 05: CI/CD Pipeline Updates (needs test command to be working)

**Parallel Opportunities**:

- Cannot run in parallel - depends on Tasks 01 and 02 being complete
- Task 03 (ESLint) can run in parallel with this task (different concerns)

## Scope

Migrate the test infrastructure from Karma/Jasmine to Vitest using Angular's automated migration schematic, then fix any test failures.

### In Scope

- Run Angular's `karma-to-vitest` migration schematic
- Remove Karma and Jasmine packages
- Install Vitest and related packages
- Review and adjust `vitest.config.ts`
- Update test scripts in `package.json`
- Fix test failures caused by migration
- Ensure 100% test pass rate
- Verify all NgRx tests work with Vitest

### Out of Scope

- Writing new tests (unless absolutely necessary for migration)
- Major test refactoring (keep changes minimal)
- Performance optimization of tests
- Coverage threshold changes

## Implementation Requirements

### Technical Requirements

1. **Angular CLI Schematic**: Use `ng generate @angular/core:karma-to-vitest` for automatic migration
2. **Test Runner**: Vitest will replace Karma
3. **Assertion Library**: Vitest includes its own assertion library (similar to Jasmine)
4. **NgRx Testing**: Ensure `@ngrx/store/testing` works with Vitest
5. **RxJS Testing**: Verify rxjs-marbles or similar utilities work

### Commands to Execute

```powershell
# Phase 1: Run Migration Schematic
ng generate @angular/core:karma-to-vitest

# Phase 2: Install Dependencies (if not done automatically)
# The schematic should handle this, but verify in package.json

# Phase 3: Verify Configuration
# Review the generated vitest.config.ts

# Phase 4: Update package.json scripts (if needed)
# Ensure "test" script uses Vitest

# Phase 5: Run Tests
npm test

# Phase 6: Fix Failures and Re-run
npm test
```

## Files to Create/Modify

### Files Created by Migration

- `vitest.config.ts` - Vitest configuration file

### Files Modified by Migration

- `package.json` - Test script updates, dependency changes
- `package-lock.json` - Dependency tree updates
- `angular.json` - Remove Karma test configuration

### Files to Remove

- `karma.conf.js` - Karma configuration (if exists)
- Test files may need adjustments (rare, but possible)

### Test Files to Verify

- `src/app/store/effects/counselor-service-effects.service.spec.ts`
- `src/app/store/effects/newsletter-service-effects.service.spec.ts`
- `src/app/store/reducers/counselor-reducer.spec.ts`
- `src/app/store/reducers/newsletter-reducer.spec.ts`
- `src/app/store/selectors/counselor-selector.spec.ts`
- `src/app/store/selectors/newsletter-selector.spec.ts`
- All component spec files

## Testing Requirements

### Migration Verification

**Step 1: Run Tests**

```powershell
npm test
```

**Expected Results**:

- All tests should run with Vitest
- Output format will be different from Karma
- Should see Vitest's modern test UI

### Common Migration Issues

1. **NgRx Testing Utilities**:
    - `TestBed` should work the same
    - `provideMockStore` should work the same
    - Effects testing with `provideMockActions` should work

2. **RxJS Marbles**:
    - If using `rxjs-marbles`, may need adjustments
    - Vitest has built-in async testing support

3. **Jasmine to Vitest Syntax**:
    - Most Jasmine syntax is compatible
    - `describe`, `it`, `expect` work the same
    - Spy syntax may need minor adjustments

4. **Browser APIs**:
    - Vitest uses jsdom or happy-dom
    - Most browser APIs should work
    - Some may need polyfills

### Test Failure Strategy

If tests fail after migration:

1. **Identify Pattern**: Are failures concentrated in one area?
2. **Check NgRx Tests**: Effects, reducers, selectors working?
3. **Check Component Tests**: TestBed setup correct?
4. **Review Vitest Docs**: Check for known migration issues
5. **Fix Incrementally**: Fix one test file at a time

### Performance Comparison

Vitest should be significantly faster than Karma:

- Karma: ~30-60 seconds for full suite
- Vitest: ~5-15 seconds for full suite (expected)

## Success Criteria

- [ ] `ng generate @angular/core:karma-to-vitest` executed successfully
- [ ] `vitest.config.ts` created and reviewed
- [ ] `package.json` test script uses Vitest
- [ ] Karma packages removed from `package.json`
- [ ] Vitest and related packages installed
- [ ] `karma.conf.js` removed (if it existed)
- [ ] `npm test` runs successfully
- [ ] All tests passing (100% pass rate)
- [ ] All NgRx effects tests passing
- [ ] All NgRx reducer tests passing
- [ ] All NgRx selector tests passing
- [ ] All component tests passing
- [ ] Test execution is faster than with Karma
- [ ] No test-related warnings in output

## Notes

### Why Vitest?

From Angular 21 release notes:

- **Karma is deprecated and removed** from Angular CLI
- **Vitest is the recommended test runner**
- Better performance (native ESM, parallel execution)
- Modern developer experience
- Better TypeScript support

### Migration Schematic Features

The Angular schematic should:

- Remove Karma and Jasmine packages
- Install Vitest and dependencies
- Generate `vitest.config.ts`
- Update `angular.json` test configuration
- Update `package.json` scripts
- Most test files should work without changes

### Known Compatibility Issues

1. **Browser-specific APIs**: May need jsdom configuration
2. **Global test utilities**: May need to be imported differently
3. **Custom Jasmine matchers**: Need to be converted to Vitest matchers

### Vitest Configuration

Review `vitest.config.ts` for:

- Test environment (jsdom/happy-dom)
- Coverage configuration
- Test include/exclude patterns
- Setup files
- Global test timeout

### Rollback Strategy

If Vitest migration fails critically:

1. Can revert the migration commits
2. Would need to restore Karma configuration
3. This is why we have the backup and feature branch
4. However, this is unlikely - the schematic is well-tested

### Time Estimate

- Run migration schematic: 10 minutes
- Review configuration: 15 minutes
- Initial test run: 5 minutes
- Fix test failures: 1-2 hours (variable, depends on issues)
- Verification: 15 minutes
- **Total**: ~2-3 hours
