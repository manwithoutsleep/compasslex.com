# 2026-01-20-angular-21-upgrade-01: Preparation and Core Angular/TypeScript Upgrade

## Parent Specification

This is sub-task 01 of the parent specification: `.specs\2026-01-20-angular-21-upgrade.md`.
The sub-tasks are coordinated by `.specs\2026-01-20-angular-21-upgrade-00-coordinator.md`

## Objective

Set up the upgrade environment and complete the core Angular and TypeScript upgrades to version 21.x and 5.9.x respectively.

**Development Environment**: Windows 11 with PowerShell (all commands use PowerShell syntax)

## Dependencies

**Prerequisites** (must be completed before this task):

- None - This is the first task in the sequence

**Blocks** (tasks that depend on this one):

- Task 02: NgRx Upgrade (requires Angular 21 to be installed)
- Task 03: Angular ESLint Upgrade (requires Angular 21 to be installed)
- Task 04: Vitest Migration (requires Angular 21 CLI)

**Parallel Opportunities**:

- None - This is the foundation task that all others depend on

## Scope

Upgrade Angular from 20.1.0 to 21.x and TypeScript from 5.8.3 to 5.9.x, establishing the baseline for all subsequent upgrades.

### In Scope

- Create feature branch `upgrade/angular-21-ngrx-21`
- Run baseline tests to capture current state
- Backup `package-lock.json`
- Execute Angular CLI update command for core and CLI packages
- Update TypeScript to 5.9.x
- Verify all `@angular/*` packages are at 21.x
- Run tests to identify breaking changes
- Run builds to verify compilation

### Out of Scope

- NgRx package upgrades (Task 02)
- ESLint/linting upgrades (Task 03)
- Test runner migration (Task 04)
- CI/CD pipeline updates (Task 05)
- Optional dependency updates

## Implementation Requirements

### Technical Requirements

1. **Node.js Version**: Verify Node.js 22.21.1 is active
2. **Git Branch**: Create and checkout `upgrade/angular-21-ngrx-21` branch
3. **Baseline Capture**: Run tests before making changes to document current state
4. **Package Updates**: Use `ng update` for Angular packages to apply migrations automatically
5. **TypeScript Compatibility**: Ensure TypeScript 5.9.x is compatible with Angular 21

### Commands to Execute

```powershell
# Phase 1: Preparation
git checkout development
git pull origin development
git checkout -b upgrade/angular-21-ngrx-21
npm test > baseline-tests.txt
Copy-Item package-lock.json package-lock.json.backup

# Phase 2: Core Angular Upgrade
ng update @angular/core@21 @angular/cli@21

# Phase 3: TypeScript Upgrade
npm install --save-dev typescript@~5.9.0

# Phase 4: Verification
npm list @angular/core
npm list typescript
npx ng version

# Phase 5: Test and Build
npm test
npm run build
npm run build:prod
```

## Files to Create/Modify

- `.git/refs/heads/upgrade/angular-21-ngrx-21` - New feature branch
- `package.json` - Angular and TypeScript version updates
- `package-lock.json` - Dependency tree updates
- `baseline-tests.txt` - Baseline test results (for reference)
- `package-lock.json.backup` - Backup of original lock file

## Testing Requirements

### Baseline Testing

- Capture current test results before any changes
- Document any existing test failures

### Post-Upgrade Testing

- Run full test suite: `npm test`
- Expected: Some tests may fail due to TypeScript strictness or Angular changes
- Document any new test failures for resolution in Task 02

### Build Verification

- Development build: `npm run build`
- Production build: `npm run build:prod`
- Verify no compilation errors
- Check bundle sizes are within budget (800KB warning, 1MB error)

## Success Criteria

- [ ] Feature branch `upgrade/angular-21-ngrx-21` created successfully
- [ ] Baseline test results captured in `baseline-tests.txt`
- [ ] `package-lock.json.backup` created
- [ ] `@angular/core` upgraded to 21.x (verified with `npm list @angular/core`)
- [ ] `@angular/cli` upgraded to 21.x
- [ ] All `@angular/*` packages at version 21.x
- [ ] TypeScript upgraded to ~5.9.0 (verified with `npm list typescript`)
- [ ] `npx ng version` shows Angular 21.x
- [ ] Development build completes without compilation errors
- [ ] Production build completes without compilation errors
- [ ] Bundle sizes within acceptable limits
- [ ] Test suite runs (pass/fail status documented for next task)

## Notes

### Important Considerations

1. **Breaking Changes**: Angular 21 removes Karma test runner support, but this is handled in Task 04
2. **TypeScript Strictness**: TypeScript 5.9 has stricter type checking; some compilation errors may appear
3. **Node.js Requirement**: Angular 21 requires Node.js 20.19+, we have 22.21.1
4. **Migration Schematics**: The `ng update` command will automatically apply migrations for breaking changes

### Known Issues to Watch For

- `set-env.js` compatibility with new build system (will verify in final phase)
- Environment file generation still working correctly
- Any custom build configurations may need adjustment

### Rollback Strategy

If critical issues occur:

1. Delete feature branch
2. Restore from `package-lock.json.backup`
3. Run `npm ci` to restore original dependencies
4. Git checkout development branch

### Time Estimate

- Branch setup and baseline: 15 minutes
- Angular upgrade: 30 minutes
- TypeScript upgrade: 15 minutes
- Testing and verification: 30 minutes
- **Total**: ~1.5 hours
