import { Component, OnInit, Input } from '@angular/core';
import { StoreStatus } from './resolvers/store-status';

@Component({
    selector: 'app-error-page',
    templateUrl: './error-page.component.html',
    styleUrls: ['./error-page.component.scss'],
    standalone: false,
})
export class ErrorPageComponent implements OnInit {
    @Input() errorTypes: StoreStatus[] | null | undefined;
    @Input() messageResolver: ((messageType: StoreStatus) => string)[] | null | undefined;

    constructor() {}

    ngOnInit(): void {}

    hasError(): boolean {
        if (this.errorTypes) {
            return this.errorTypes.some((error) => error !== undefined);
        } else {
            return false;
        }
    }

    getErrorMessage(): string {
        if (this.messageResolver && this.errorTypes) {
            for (const resolver of this.messageResolver) {
                for (const error of this.errorTypes) {
                    const message = resolver(error);
                    if (message) {
                        return message;
                    }
                }
            }
        }
        return '';
    }
}
