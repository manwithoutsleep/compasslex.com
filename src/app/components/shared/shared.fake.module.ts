import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ErrorPageFakeComponent } from './error-page/error-page.fake.component';

// This is a fake module that is used to test the controllers.
// All other tests use the real SharedModule.

@NgModule({
    declarations: [
        ErrorPageFakeComponent
    ],
    imports: [
        CommonModule
    ],
    exports: [
        CommonModule,
        ErrorPageFakeComponent
    ]
})
export class SharedFakeModule { }
