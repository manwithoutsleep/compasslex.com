import { Component, OnInit } from '@angular/core';
import { Newsletter } from 'src/app/models/newsletter';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import { getNewsletterListAction } from 'src/app/store/actions/newsletter-actions';
import { map } from 'rxjs/operators';
import {
    NewsletterListStoreStatus,
    newsletterListErrorMessageResolver,
} from '../shared/error-page/resolvers/newsletter-list-error-message-resolver';
import {
    selectNewsletterListLoadState,
    selectNewsletterListErrors,
    selectLatestNewsletter,
} from 'src/app/store/selectors/newsletter-selector';

@Component({
    selector: 'app-home-page-controller',
    template: `<app-home-page [latestNewsletter]="latestNewsletter$ | async"> </app-home-page>
        <app-error-page [errorTypes]="errors$ | async" [messageResolver]="errorMessageResolver">
        </app-error-page>`,
    styles: [],
    standalone: false,
})
export class HomePageControllerComponent implements OnInit {
    public latestNewsletter$ = new Observable<Newsletter | null | undefined>();
    public newsletterListLoaded$ = new Observable<boolean>();
    public errors$ = new Observable<NewsletterListStoreStatus[] | null | undefined>();
    public errorMessageResolver = [newsletterListErrorMessageResolver];

    constructor(private store: Store<{}>) {}

    ngOnInit(): void {
        this.store.dispatch(getNewsletterListAction());

        this.newsletterListLoaded$ = this.store.select(selectNewsletterListLoadState);
        this.latestNewsletter$ = this.store.select(selectLatestNewsletter);
        this.errors$ = this.store
            .select(selectNewsletterListErrors)
            .pipe(map((error) => [error as NewsletterListStoreStatus]));
    }
}
