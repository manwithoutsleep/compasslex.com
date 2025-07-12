# Angular 18.2.8 to Angular 20 Migration Prompt

You are an expert Angular developer tasked with upgrading an Angular project from version 18.2.8 to Angular 20. Please provide a comprehensive migration plan and execute the necessary changes.

## Project Context
- **Current Version**: Angular 18.2.8
- **Target Version**: Angular 20
- **Project Type**: Simple Angular application
- **Package Manager**: npm (assumed - adjust if using yarn/pnpm)

## Current Dependencies
```json
{
  "dependencies": {
    "@angular/animations": "^18.2.8",
    "@angular/cdk": "^18.2.9",
    "@angular/common": "^18.2.8",
    "@angular/compiler": "^18.2.8",
    "@angular/core": "^18.2.8",
    "@angular/forms": "^18.2.8",
    "@angular/google-maps": "^18.2.9",
    "@angular/material": "^18.2.9",
    "@angular/platform-browser": "^18.2.8",
    "@angular/platform-browser-dynamic": "^18.2.8",
    "@angular/router": "^18.2.8",
    "@googlemaps/js-api-loader": "^1.16.6",
    "@ngrx/effects": "^18.1.0",
    "@ngrx/operators": "^18.0.0",
    "@ngrx/store": "^18.1.0",
    "@types/google.maps": "^3.54.3",
    "rxjs": "~7.8.0",
    "tslib": "^2.3.0",
    "zone.js": "~0.14.10"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "^18.2.9",
    "@angular-eslint/builder": "18.3.1",
    "@angular-eslint/eslint-plugin": "18.3.1",
    "@angular-eslint/eslint-plugin-template": "18.3.1",
    "@angular-eslint/schematics": "18.3.1",
    "@angular-eslint/template-parser": "18.3.1",
    "@angular/cli": "^18.2.9",
    "@angular/compiler-cli": "^18.2.8",
    "@ngrx/eslint-plugin": "^18.1.0",
    "@types/jasmine": "~4.3.0",
    "@types/node": "^20.8.6",
    "@typescript-eslint/eslint-plugin": "^7.2.0",
    "@typescript-eslint/parser": "^7.2.0",
    "eslint": "^8.57.0",
    "eslint-config-prettier": "^9.0.0",
    "eslint-plugin-deprecation": "^2.0.0",
    "eslint-plugin-prettier": "^5.0.1",
    "jasmine-core": "~4.6.0",
    "karma": "~6.4.0",
    "karma-chrome-launcher": "~3.2.0",
    "karma-coverage": "~2.2.0",
    "karma-jasmine": "~5.1.0",
    "karma-jasmine-html-reporter": "~2.1.0",
    "ngrx-store-freeze": "^0.2.4",
    "prettier": "^3.0.3",
    "prettier-eslint": "^16.1.1",
    "random-test-values": "^2.0.0",
    "rxjs-marbles": "^7.0.1",
    "typescript": "~5.4.5"
  }
}
```

## Migration Requirements and Instructions

### 1. Pre-Migration Checklist
- [ ] Ensure Node.js version is at least 20.19.0
- [ ] Commit all current changes to version control
- [ ] Create and checkout a new Git branch called `angular-19-20-upgrade`
- [ ] Run `npm audit` to check for security vulnerabilities
- [ ] Verify all tests pass before migration

### 2. Breaking Changes to Address

#### A. Control Flow Migration (Critical)
- **Issue**: `*ngIf`, `*ngFor`, and `*ngSwitch` structural directives are now deprecated
- **Action Required**: 
  - Run the Angular schematic: `ng generate @angular/core:control-flow`
  - Manually review and update any remaining structural directives
  - Convert to new control flow syntax (`@if`, `@for`, `@switch`)

#### B. InjectFlags API Removal
- **Issue**: The deprecated `InjectFlags` API has been removed
- **Action Required**: 
  - Run the migration schematic to automatically convert code
  - Update any manual inject() calls that use InjectFlags

#### C. Zone.js Considerations
- **Opportunity**: Angular 20 introduces zoneless change detection
- **Action**: Consider migrating to zoneless mode for better performance
- **Note**: This is optional but recommended for new applications

### 3. Step-by-Step Migration Process

#### Step 1: Update Angular CLI Globally
```bash
npm uninstall -g @angular/cli
npm install -g @angular/cli@20
```

#### Step 2: First Migration - Angular 18 to 19
**IMPORTANT**: Angular only supports migrating one major version at a time. You must migrate to Angular 19 first.

```bash
# Update to Angular 19
ng update @angular/core@19 @angular/cli@19
ng update @angular/material@19 @angular/cdk@19
```

Run Angular 19 migration schematics:
```bash
ng update @angular/core --migrate-only --from=18 --to=19
```

#### Step 3: Test the changes

Test the application thoroughly after Angular 19 upgrade:
```bash
npm install
ng build
ng test
ng serve
```

#### Step 4: Manual Verification and Checkpoint

**IMPORTANT**: STOP at this point to ensure a human has validated that the Angular 19 upgrade is successful.

#### Step 5: Create a Checkpoint

Commit the Angular 19 upgrade to the Git repo in the `angular-19-20-upgrade` branch.

#### Step 6: Second Migration - Angular 19 to 20
Only after Angular 19 is working correctly, proceed to Angular 20:

```bash
# Update to Angular 20
ng update @angular/core@20 @angular/cli@20
ng update @angular/material@20 @angular/cdk@20
```

#### Step 7: Run Angular 20 Migration Schematics
```bash
# Control flow migration (if not already done in Angular 19)
ng generate @angular/core:control-flow

# Other automatic migrations
ng update @angular/core --migrate-only --from=19 --to=20
```

#### Step 8: Manual Code Updates

##### A. Update Structural Directives
Convert remaining structural directives:

**Before (Angular 18):**
```html
<div *ngIf="condition">Content</div>
<div *ngFor="let item of items">{{item}}</div>
<div [ngSwitch]="value">
  <div *ngSwitchCase="'a'">Case A</div>
  <div *ngSwitchDefault>Default</div>
</div>
```

**After (Angular 20):**
```html
@if (condition) {
  <div>Content</div>
}
@for (item of items; track item) {
  <div>{{item}}</div>
}
@switch (value) {
  @case ('a') {
    <div>Case A</div>
  }
  @default {
    <div>Default</div>
  }
}
```

##### B. Update Inject Calls
**Before:**
```typescript
import { inject, InjectFlags } from '@angular/core';

constructor() {
  this.service = inject(MyService, InjectFlags.Optional);
}
```

**After:**
```typescript
import { inject } from '@angular/core';

constructor() {
  this.service = inject(MyService, { optional: true });
}
```

#### Step 9: Test the changes

Test the application thoroughly after Angular 19 upgrade:
```bash
npm install
ng build
ng test
ng serve
```

#### Step 10: Manual Verification and Checkpoint

**IMPORTANT**: STOP at this point to ensure a human has validated that the Angular 20 upgrade is successful.

#### Step 11: Create a Checkpoint

Commit the Angular 20 upgrade to the Git repo in the `angular-19-20-upgrade` branch.

### 4. Testing and Validation

#### Post-Migration Checklist
- [ ] Run `npm install` to install updated dependencies
- [ ] Run `ng build` to ensure the project compiles
- [ ] Run `ng test` to verify all tests pass
- [ ] Run `ng lint` to check for linting issues
- [ ] Run `ng serve` to test the application locally
- [ ] Test all major features and user flows
- [ ] Check browser console for any warnings or errors

### 5. Performance Optimization Opportunities

#### Consider Zoneless Change Detection
Angular 20 introduces zoneless change detection for better performance:

```typescript
// In main.ts
import { bootstrapApplication } from '@angular/platform-browser';
import { provideZoneChangeDetection } from '@angular/core';

bootstrapApplication(AppComponent, {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    // other providers
  ]
});
```

#### Signal-Based Components
Consider updating to signal-based inputs and queries:

```typescript
// New signal-based approach
@Component({
  selector: 'app-example',
  template: `<p>{{count()}}</p>`
})
export class ExampleComponent {
  count = signal(0);
  
  increment() {
    this.count.update(value => value + 1);
  }
}
```

### 6. Final Steps and Verification

1. **Update Documentation**: Update any project documentation to reflect Angular 20 usage
2. **Update CI/CD**: Ensure build pipelines use Node.js 20.19+
3. **Team Communication**: Inform the team about the migration and new patterns
4. **Performance Testing**: Benchmark the application to verify performance improvements

### 7. Rollback Plan

If issues arise during migration:
1. Restore from backup/version control
2. Identify specific failing components
3. Migrate incrementally, component by component
4. Consider staying on Angular 19 as an intermediate step

## Expected Outcomes

After successful migration:
- ✅ Application runs on Angular 20
- ✅ All tests pass
- ✅ No deprecated API usage
- ✅ Improved performance with new control flow
- ✅ Modern Angular patterns implemented
- ✅ Ready for future Angular updates

## Support Resources

- Angular Update Guide: https://update.angular.io/
- Angular 20 Migration Guide: https://angular.dev/update-guide
- Angular Discord/Community for specific issues

Please execute this migration plan step by step and provide feedback on any issues encountered during the process.