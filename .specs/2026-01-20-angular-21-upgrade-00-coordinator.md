# 2026-01-20-angular-21-upgrade - Coordinator Plan

## Overview

This coordinator plan manages the execution of sub-tasks for the parent specification: `2026-01-20-angular-21-upgrade.md`

**Total Sub-Tasks**: 5
**Estimated Total Effort**: 9-11 hours
**Parallelization Potential**: Medium (some tasks can run in parallel, but core dependencies exist)

## Sub-Task Index

| Task | File                         | Status  | Dependencies   | Can Run In Parallel With |
| ---- | ---------------------------- | ------- | -------------- | ------------------------ |
| 01   | preparation-and-core-upgrade | Pending | None           | None (foundation task)   |
| 02   | ngrx-upgrade                 | Pending | 01             | 03                       |
| 03   | eslint-upgrade               | Pending | 01             | 02                       |
| 04   | vitest-migration             | Pending | 01, 02         | 03 (partial)             |
| 05   | cicd-and-verification        | Pending | 01, 02, 03, 04 | None (integration task)  |

## Execution Strategy

### Phase 1: Foundation (Sequential)

**Execute Task 01 first** - This is the foundation that all other tasks depend on:

-   Task 01: Preparation and Core Angular/TypeScript Upgrade

**Deliverables**:

-   Angular 21.x installed
-   TypeScript 5.9.x installed
-   Feature branch created
-   Baseline tests captured

**Duration**: ~1.5 hours

**Proceed to Phase 2 only after Phase 1 completes successfully**

---

### Phase 2: Parallel Package Upgrades (Parallel)

After Phase 1 completes, execute these tasks **simultaneously**:

-   Task 02: NgRx Upgrade and Effects Pattern Fixes
-   Task 03: Angular ESLint and TypeScript ESLint Upgrade

**Why these can run in parallel**:

-   They update different package sets (NgRx vs ESLint)
-   They don't modify the same files (except package.json, which git can merge)
-   No logical dependencies between them
-   Both depend only on Angular 21 being installed (done in Phase 1)

**Deliverables**:

-   NgRx 21.x installed with test fixes
-   Angular ESLint 21.x and TypeScript ESLint v8 installed
-   All lint checks passing
-   All NgRx tests passing

**Duration**: ~1.5 hours each (parallel execution = ~1.5 hours total)

**Proceed to Phase 3 only after both Task 02 and Task 03 complete successfully**

---

### Phase 3: Test Infrastructure Migration (Sequential)

Execute Task 04 after Phase 2 completes:

-   Task 04: Vitest Migration and Test Verification

**Why this can't run in parallel**:

-   Depends on Task 02 (NgRx test fixes must be in place)
-   Could technically start while Task 03 is running, but safer to wait
-   Major infrastructure change that should be isolated

**Deliverables**:

-   Karma/Jasmine removed
-   Vitest installed and configured
-   All tests passing with Vitest
-   Test command working

**Duration**: ~2-3 hours

**Proceed to Phase 4 only after Phase 3 completes successfully**

---

### Phase 4: Integration and Deployment (Sequential)

Execute Task 05 after all previous tasks complete:

-   Task 05: CI/CD Pipeline Updates and Final Verification

**Why this must be last**:

-   Requires all previous work to be complete
-   Validates the entire upgrade works together
-   Updates CI/CD to use all new tooling (Node.js 22, Vitest, ESLint)
-   Final integration testing

**Deliverables**:

-   CI/CD workflows updated
-   Build system verified
-   Optional dependencies updated
-   Comprehensive testing complete
-   Ready for deployment

**Duration**: ~2.5 hours

---

## Dependency Graph

```
                    START
                      |
                      v
        ┌─────────────────────────────┐
        │  Task 01: Core Upgrade      │
        │  (Angular 21 + TypeScript)  │
        └─────────────┬───────────────┘
                      |
          ┌───────────┴───────────┐
          |                       |
          v                       v
  ┌───────────────┐       ┌──────────────┐
  │ Task 02:      │       │ Task 03:     │
  │ NgRx Upgrade  │       │ ESLint       │
  │               │       │ Upgrade      │
  └───────┬───────┘       └──────┬───────┘
          |                      |
          └──────────┬───────────┘
                     |
                     v
          ┌──────────────────────┐
          │ Task 04: Vitest      │
          │ Migration            │
          └──────────┬───────────┘
                     |
                     v
          ┌──────────────────────┐
          │ Task 05: CI/CD &     │
          │ Final Verification   │
          └──────────┬───────────┘
                     |
                     v
                    END
```

## Critical Path

The longest sequence of dependent tasks (determines minimum completion time):

**Task 01 → Task 02 → Task 04 → Task 05**

-   Task 01: 1.5 hours
-   Task 02: 1.5 hours
-   Task 04: 2.5 hours (average)
-   Task 05: 2.5 hours
-   **Critical Path Total**: ~8 hours

Task 03 runs in parallel with Task 02, so it doesn't add to the critical path (assuming Task 03 finishes before or around the same time as Task 02).

## Coordination Notes

### Conflict Prevention

**File Conflicts**:

-   Tasks 02 and 03 both modify `package.json` and `package-lock.json`
-   **Mitigation**: If running truly in parallel, the second task to commit will need to merge changes
-   **Recommendation**: If unfamiliar with git merge, run Task 02 first, then Task 03

**Dependency Conflicts**:

-   No package dependency conflicts expected between NgRx and ESLint upgrades
-   Both are independent package ecosystems

**Test Conflicts**:

-   Task 02 fixes test files that Task 04 will migrate
-   **Critical**: Task 02 must complete before Task 04 starts

### Recommended Execution Order

**If not comfortable with parallel execution**, follow this sequential order:

1. **Task 01** - Foundation (required first)
2. **Task 02** - NgRx Upgrade (required before Vitest)
3. **Task 03** - ESLint Upgrade (can be anytime after Task 01, before Task 05)
4. **Task 04** - Vitest Migration (requires Task 02 complete)
5. **Task 05** - CI/CD & Verification (must be last)

This sequential approach adds ~1.5 hours to the total time but eliminates any parallel execution complexity.

### Branch Strategy

**Option A: Single Feature Branch** (Recommended)

-   Create one branch: `upgrade/angular-21-ngrx-21`
-   Complete all tasks on this branch sequentially or in parallel
-   Single PR to `development` at the end
-   **Pros**: Simple, clean git history
-   **Cons**: Large PR to review

**Option B: Stacked Branches**

-   Create branch for each task
-   Merge each task to feature branch as completed
-   Final PR from feature branch to `development`
-   **Pros**: Incremental review, can pause between tasks
-   **Cons**: More complex git management

**Recommendation**: Use Option A (single branch) unless the team prefers smaller incremental reviews.

### Checkpoint Strategy

After each phase, verify:

**After Phase 1**:

-   [ ] Angular 21.x installed (`npm list @angular/core`)
-   [ ] TypeScript 5.9.x installed (`npm list typescript`)
-   [ ] Project compiles (`npm run build`)

**After Phase 2**:

-   [ ] NgRx 21.x installed (`npm list @ngrx/store`)
-   [ ] ESLint packages at correct versions
-   [ ] `npm run lint` passes
-   [ ] NgRx tests pass

**After Phase 3**:

-   [ ] Vitest installed
-   [ ] Karma removed
-   [ ] `npm test` runs with Vitest
-   [ ] All tests pass

**After Phase 4**:

-   [ ] CI/CD workflows updated
-   [ ] All builds succeed
-   [ ] Application runs correctly
-   [ ] Ready for deployment

## Progress Tracking

### Completion Checklist

-   [ ] **Task 01**: Preparation and Core Angular/TypeScript Upgrade

    -   Angular 21.x, TypeScript 5.9.x installed
    -   Feature branch created
    -   Baseline captured

-   [ ] **Task 02**: NgRx Upgrade and Effects Pattern Fixes

    -   NgRx 21.x installed
    -   Test pattern fixes applied
    -   NgRx tests passing

-   [ ] **Task 03**: Angular ESLint and TypeScript ESLint Upgrade

    -   ESLint packages upgraded
    -   Lint checks passing
    -   No deprecated rule warnings

-   [ ] **Task 04**: Vitest Migration and Test Verification

    -   Karma removed, Vitest installed
    -   All tests passing
    -   Test command working

-   [ ] **Task 05**: CI/CD Pipeline Updates and Final Verification

    -   CI/CD workflows updated
    -   Build system verified
    -   Comprehensive testing complete

-   [ ] **All sub-tasks completed**
-   [ ] **Integration testing passed**
-   [ ] **Parent specification objectives achieved**

## Integration Verification

After all sub-tasks are complete, verify the complete system:

### Package Version Verification

```bash
npm list @angular/core    # Should show 21.x
npm list @ngrx/store      # Should show 21.x
npm list typescript       # Should show 5.9.x
npx ng version            # Full version report
```

### Code Quality Verification

```bash
npm run lint              # Should pass with no errors
npm test                  # All tests should pass (100%)
```

### Build Verification

```bash
npm run build             # Development build
npm run build:prod        # Production build
```

Verify:

-   [ ] No compilation errors
-   [ ] Bundle sizes within budget (800KB warning, 1MB error)
-   [ ] Output in `dist/browser/` directory
-   [ ] Environment file replacement worked

### Application Verification

Run the application and manually verify:

-   [ ] Application loads without errors
-   [ ] No console warnings/errors
-   [ ] NgRx store functions correctly
-   [ ] All routes accessible
-   [ ] API calls work (counselor/newsletter data loads)
-   [ ] Forms work correctly
-   [ ] Navigation works as expected

### CI/CD Verification

Push to feature branch and verify:

-   [ ] GitHub Actions workflow runs successfully
-   [ ] Uses Node.js 22
-   [ ] Test step passes
-   [ ] Lint step passes
-   [ ] Build step passes
-   [ ] Deployment succeeds (if applicable)

### Final Success Criteria

Before considering the entire upgrade complete:

-   [ ] All 5 sub-tasks completed successfully
-   [ ] All packages at target versions
-   [ ] No lint errors
-   [ ] All tests passing (100% pass rate)
-   [ ] Development and production builds succeed
-   [ ] CI/CD pipeline updated and working
-   [ ] Application functions correctly in all environments
-   [ ] No console errors in browser
-   [ ] Documentation updated with final versions

## Rollback Strategy

If critical issues are discovered at any phase:

### During Development (Feature Branch)

1. **Identify the problematic task**
2. **Revert the specific commits** for that task
3. **Re-run verification** to confirm stability
4. **Fix the issue** or skip the problematic task
5. **Continue with remaining tasks** (if dependencies allow)

### After Deployment to UAT

1. **Document the issue** with reproduction steps
2. **Determine severity**: Can it be fixed quickly? Or need rollback?
3. **If quick fix**: Apply fix and redeploy
4. **If rollback needed**: Revert PR and redeploy previous version

### After Deployment to Production

1. **Immediate**: Use GitHub Actions backup mechanism
    - `Secrets.DEPLOY_FOLDER_PROD_BACKUP` contains previous version
2. **Short-term**: Revert the merge commit to `main`
3. **Long-term**: Fix issues in feature branch and re-deploy

### Partial Rollback Strategy

If only one task causes issues (e.g., Vitest migration problematic):

-   Can selectively revert that task
-   May need to adjust dependencies (e.g., keep Karma if reverting Vitest)
-   Update CI/CD accordingly

## Risk Assessment

### High-Risk Tasks

**Task 04: Vitest Migration** (Risk: Medium-High)

-   Largest infrastructure change
-   Test framework migration can have unexpected issues
-   **Mitigation**: Angular's schematic is well-tested; have rollback plan ready

**Task 05: CI/CD Updates** (Risk: Medium)

-   Changes deployment pipeline
-   Issues could prevent deployments
-   **Mitigation**: Test in feature branch first; can quickly revert workflow files

### Low-Risk Tasks

**Task 01: Core Upgrade** (Risk: Low)

-   Well-established upgrade path
-   Angular CLI migrations handle most changes
-   Widely tested by community

**Task 02: NgRx Upgrade** (Risk: Low)

-   No breaking changes for traditional usage
-   Known test fixes already identified

**Task 03: ESLint Upgrade** (Risk: Low)

-   Linting doesn't affect runtime behavior
-   Can be adjusted or rolled back easily

## Timeline Estimate

### Optimistic (Parallel Execution)

-   Phase 1: 1.5 hours
-   Phase 2: 1.5 hours (parallel)
-   Phase 3: 2 hours
-   Phase 4: 2 hours
-   **Total**: ~7 hours

### Realistic (Parallel Execution)

-   Phase 1: 1.5 hours
-   Phase 2: 1.5 hours (parallel)
-   Phase 3: 2.5 hours
-   Phase 4: 2.5 hours
-   **Total**: ~8 hours

### Conservative (Sequential Execution)

-   Task 01: 1.5 hours
-   Task 02: 1.5 hours
-   Task 03: 1.5 hours
-   Task 04: 3 hours
-   Task 05: 2.5 hours
-   **Total**: ~10 hours

### With Buffer (Recommended)

-   Execution: 8-10 hours
-   Testing & fixes: 2-3 hours
-   **Total**: 10-13 hours (spread over 2-3 days)

## Post-Upgrade Actions

After successful completion and deployment:

### Documentation

-   [ ] Update project README with new Angular/NgRx versions
-   [ ] Document any changes to development workflow
-   [ ] Archive `baseline-tests.txt` and version reports for reference

### Team Communication

-   [ ] Notify team of upgrade completion
-   [ ] Share any new development practices (e.g., Vitest usage)
-   [ ] Document lessons learned

### Monitoring

-   [ ] Monitor production for 24-48 hours
-   [ ] Check for any user-reported issues
-   [ ] Compare performance metrics (bundle size, build times)
-   [ ] Verify CI/CD pipeline performance

### Cleanup

-   [ ] Delete feature branch after successful production deployment
-   [ ] Remove backup files (`package-lock.json.backup`, `baseline-tests.txt`)
-   [ ] Close related GitHub issues/tickets

## Notes

This coordinator plan is designed to be flexible. Teams can choose between:

-   **Aggressive parallel execution** for faster completion (requires git merge confidence)
-   **Conservative sequential execution** for simpler workflow (adds ~2 hours)

The critical path is approximately 8 hours of focused work, but spreading this over 2-3 days allows for proper testing and reduces the risk of errors from fatigue.

Each sub-task specification contains detailed instructions and can be executed independently once its prerequisites are met.
