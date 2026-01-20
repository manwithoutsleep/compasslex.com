import { Injectable } from '@angular/core';
import { NewsletterService } from 'src/app/services/newsletter.service';
import {
    getNewsletterListAction,
    getNewsletterListSuccessAction,
    getNewsletterListFailuireAction,
} from '../actions/newsletter-actions';
import { NewsletterData } from 'src/app/models/newsletter-data';
import { mergeMap, map, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { Actions, createEffect, ofType } from '@ngrx/effects';

@Injectable({
    providedIn: 'root',
})
export class NewsletterServiceEffects {
    constructor(
        private newsletterService: NewsletterService,
        private actions: Actions
    ) {}

    public getNewsletterList$ = createEffect(() => {
        return this.actions.pipe(
            ofType(getNewsletterListAction),
            mergeMap(() =>
                this.newsletterService.getNewsletterList().pipe(
                    map((response) => getNewsletterListSuccessAction(response as NewsletterData)),
                    catchError(() => of(getNewsletterListFailuireAction()))
                )
            )
        );
    });
}
