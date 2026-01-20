# 2026-01-20-angular-21-upgrade-02: NgRx Upgrade and Effects Pattern Fixes

## Parent Specification

This is sub-task 02 of the parent specification: `2026-01-20-angular-21-upgrade.md`

## Objective

Upgrade NgRx from 20.0.0 to 21.x and fix known test pattern issues in effects files.

## Dependencies

**Prerequisites** (must be completed before this task):
- Task 01: Preparation and Core Angular/TypeScript Upgrade (requires Angular 21 to be installed)

**Blocks** (tasks that depend on this one):
- None - This task is independent of Tasks 03, 04, and 05

**Parallel Opportunities**:
- Can run in parallel with Task 03 (Angular ESLint Upgrade) - different package sets
- Must complete before Task 04 (Vitest Migration) to ensure test fixes are in place
- Must complete before Task 05 (CI/CD Updates) to ensure all code is stable

## Scope

Upgrade all NgRx packages to version 21.x and fix the known inconsistent effects pattern in test files.

### In Scope

- Update `@ngrx/store` and related NgRx packages to 21.x
- Update `@ngrx/eslint-plugin` to 21.x
- Fix action creator usage in `newsletter-service-effects.service.spec.ts` (lines 48, 59)
- Verify NgRx store functionality after upgrade
- Run tests to ensure effects work correctly

### Out of Scope

- Angular package updates (completed in Task 01)
- ESLint package updates (handled in Task 03)
- Vitest migration (handled in Task 04)
- Signal-based NgRx APIs (optional features, not required for upgrade)

## Implementation Requirements

### Technical Requirements

1. **NgRx Version**: Upgrade to 21.x using `ng update` for automatic migrations
2. **Manual Updates**: ESLint plugin requires manual npm install
3. **Test Pattern Fix**: Update action creator usage from variable assignment to function call
4. **Backward Compatibility**: Verify traditional effects/store patterns still work

### Commands to Execute

```bash
# Phase 1: NgRx Core Upgrade
ng update @ngrx/store@21

# Phase 2: NgRx ESLint Plugin Manual Update
npm install --save-dev @ngrx/eslint-plugin@21

# Phase 3: Verify Versions
npm list @ngrx/store
npm list @ngrx/effects
npm list @ngrx/entity
npm list @ngrx/eslint-plugin

# Phase 4: Test
npm test
npm run lint
```

## Files to Create/Modify

- `package.json` - NgRx version updates
- `package-lock.json` - Dependency tree updates
- `src/app/store/effects/newsletter-service-effects.service.spec.ts` - Fix action creator usage pattern

### Specific Code Changes

**File**: `src/app/store/effects/newsletter-service-effects.service.spec.ts`

**Line 48** - Change from:
```typescript
const initialAction = getNewsletterListAction;
```
To:
```typescript
const initialAction = getNewsletterListAction();
```

**Line 59** - Same fix needed:
```typescript
const initialAction = getNewsletterListAction();
```

## Testing Requirements

### NgRx Store Testing
- Run full test suite: `npm test`
- Focus on NgRx-related test files:
  - `counselor-service-effects.service.spec.ts`
  - `newsletter-service-effects.service.spec.ts`
  - `counselor-reducer.spec.ts`
  - `newsletter-reducer.spec.ts`
  - `counselor-selector.spec.ts`
  - `newsletter-selector.spec.ts`

### Expected Results
- All effects tests should pass after action creator fix
- Reducers should continue working with no changes needed
- Selectors should continue working with no changes needed

### Linting
- Run `npm run lint` to ensure no NgRx ESLint errors
- NgRx ESLint plugin v21 may have new rules; fix any violations

## Success Criteria

- [ ] `@ngrx/store` upgraded to 21.x (verified with `npm list @ngrx/store`)
- [ ] `@ngrx/effects` upgraded to 21.x
- [ ] `@ngrx/entity` upgraded to 21.x
- [ ] `@ngrx/eslint-plugin` upgraded to 21.x
- [ ] Action creator fix applied in `newsletter-service-effects.service.spec.ts` line 48
- [ ] Action creator fix applied in `newsletter-service-effects.service.spec.ts` line 59
- [ ] All NgRx effects tests passing
- [ ] All NgRx reducer tests passing
- [ ] All NgRx selector tests passing
- [ ] No NgRx-related lint errors
- [ ] Store functionality verified in running application

## Notes

### NgRx 21 Breaking Changes

According to the parent specification:
- **No breaking changes for traditional effects/store usage**
- Signal-based APIs are new additions (optional)
- This means the upgrade should be straightforward

### Known Issues Being Fixed

**Issue**: Inconsistent NgRx effects pattern in test file
- **Root Cause**: Action creators should be invoked as functions, not assigned as variables
- **Impact**: Tests may fail or not properly test the effect
- **Solution**: Change `const initialAction = getNewsletterListAction;` to `getNewsletterListAction();`

### Testing Strategy

1. **Unit Tests**: Focus on the 6 NgRx test files listed above
2. **Integration**: Verify store works in running application
3. **Regression**: Ensure no existing functionality broken

### Rollback Strategy

If critical issues occur with NgRx:
1. Identify if issue is with NgRx packages or code changes
2. Can selectively revert code changes while keeping NgRx 21
3. If NgRx 21 is incompatible, would need to rollback Task 01 as well (unlikely)

### Time Estimate

- NgRx package upgrade: 20 minutes
- Code fixes in test files: 15 minutes
- Testing and verification: 45 minutes
- **Total**: ~1.5 hours
