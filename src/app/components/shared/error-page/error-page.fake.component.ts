import { Component, Input } from '@angular/core';
import { StoreStatus } from './resolvers/store-status';

@Component({
    selector: 'app-error-page',
    template: '',
    standalone: false
})
export class ErrorPageFakeComponent {
    @Input() errorTypes: StoreStatus[] | null | undefined;
    @Input() messageResolver: ((messageType: StoreStatus) => string)[] | null | undefined;
}

