# 2026-01-20-angular-21-upgrade-03: Angular ESLint and TypeScript ESLint Upgrade

## Parent Specification

This is sub-task 03 of the parent specification: `.specs\2026-01-20-angular-21-upgrade.md`.
The sub-tasks are coordinated by `.specs\2026-01-20-angular-21-upgrade-00-coordinator.md`

## Objective

Upgrade Angular ESLint from 18.3.1 to 21.x and TypeScript ESLint to v8 for TypeScript 5.9 compatibility.

**Development Environment**: Windows 11 with PowerShell (all commands use PowerShell syntax)

## Dependencies

**Prerequisites** (must be completed before this task):

- Task 01: Preparation and Core Angular/TypeScript Upgrade (requires Angular 21 and TypeScript 5.9 to be installed)

**Blocks** (tasks that depend on this one):

- None - This task is independent of other tasks

**Parallel Opportunities**:

- Can run in parallel with Task 02 (NgRx Upgrade) - different package sets
- Can run in parallel with Task 04 (Vitest Migration) - different concerns
- Should complete before Task 05 (CI/CD Updates) to ensure lint step works correctly

## Scope

Upgrade all ESLint-related packages to support Angular 21 and TypeScript 5.9, ensuring code quality checks continue to work.

### In Scope

- Update Angular ESLint packages from 18.3.1 to 21.x
- Update TypeScript ESLint packages to v8 for TypeScript 5.9 support
- Review and update `.eslintrc.json` if needed
- Fix any new linting errors introduced by updated rules
- Verify `npm run lint` works correctly

### Out of Scope

- Angular package updates (completed in Task 01)
- NgRx ESLint plugin (handled in Task 02)
- Code refactoring beyond fixing lint errors
- Prettier or other formatting tool updates

## Implementation Requirements

### Technical Requirements

1. **Angular ESLint**: Upgrade to v21 using `ng update` schematic
2. **TypeScript ESLint**: Upgrade to v8 for TypeScript 5.9 compatibility
3. **Configuration**: Review `.eslintrc.json` for deprecated rules
4. **Auto-fix**: Use `npm run lint:fix` for automatically fixable issues

### Commands to Execute

```powershell
# Phase 1: Angular ESLint Upgrade
ng update @angular-eslint/schematics@21

# Phase 2: TypeScript ESLint Upgrade
npm install --save-dev @typescript-eslint/eslint-plugin@^8.0.0 @typescript-eslint/parser@^8.0.0

# Phase 3: Verify Versions
npm list @angular-eslint/eslint-plugin
npm list @angular-eslint/eslint-plugin-template
npm list @angular-eslint/template-parser
npm list @typescript-eslint/eslint-plugin
npm list @typescript-eslint/parser

# Phase 4: Lint Check
npm run lint
npm run lint:fix  # If auto-fixable errors exist
```

## Files to Create/Modify

- `package.json` - ESLint package version updates
- `package-lock.json` - Dependency tree updates
- `.eslintrc.json` - Potentially updated by migration schematics
- Source files - May need changes to fix new lint errors

## Testing Requirements

### Linting Verification

**Run Lint Check**:

```powershell
npm run lint
```

**Expected Results**:

- No lint errors
- If errors exist, use `npm run lint:fix` to auto-fix
- Manually fix any errors that can't be auto-fixed

### Common New Lint Errors

With TypeScript ESLint v8 and Angular ESLint v21, watch for:

- Stricter type checking rules
- New Angular template rules
- Deprecated rule warnings
- Unused variable/import detection improvements

### Files to Pay Special Attention To

- `src/app/store/effects/**/*.ts` - Effects files
- `src/app/store/reducers/**/*.ts` - Reducer files
- `src/app/store/selectors/**/*.ts` - Selector files
- Component files with complex templates

## Success Criteria

- [ ] `@angular-eslint/eslint-plugin` upgraded to 21.x
- [ ] `@angular-eslint/eslint-plugin-template` upgraded to 21.x
- [ ] `@angular-eslint/template-parser` upgraded to 21.x
- [ ] `@angular-eslint/builder` upgraded to 21.x (if present)
- [ ] `@typescript-eslint/eslint-plugin` upgraded to ^8.0.0
- [ ] `@typescript-eslint/parser` upgraded to ^8.0.0
- [ ] `npm run lint` completes with no errors
- [ ] `.eslintrc.json` updated if needed by migrations
- [ ] All auto-fixable lint errors fixed
- [ ] All manual lint errors fixed
- [ ] No deprecated rule warnings in lint output

## Notes

### Angular ESLint 21 Changes

- Aligns with Angular 21 best practices
- May introduce new template rules
- Migration schematic should handle most configuration changes automatically

### TypeScript ESLint v8 Changes

- **Required for TypeScript 5.9 support**
- Stricter type-aware rules
- Better performance
- Some rules may have stricter defaults

### Configuration Review

After running the migration, review `.eslintrc.json` for:

- Deprecated rules (will show warnings)
- New recommended rules to enable
- Rules that may conflict with project style

### Auto-fix Strategy

1. Run `npm run lint` to see all errors
2. Run `npm run lint:fix` to auto-fix what's possible
3. Review auto-fixed changes (they should be safe)
4. Manually fix remaining errors
5. Run `npm run lint` again to verify

### Rollback Strategy

If ESLint upgrade causes issues:

1. Can rollback ESLint packages independently
2. Restore `.eslintrc.json` from git history if needed
3. ESLint issues shouldn't affect runtime behavior

### Time Estimate

- Package upgrades: 15 minutes
- Lint error fixes: 30-45 minutes (depends on number of errors)
- Testing and verification: 15 minutes
- **Total**: ~1-1.5 hours
