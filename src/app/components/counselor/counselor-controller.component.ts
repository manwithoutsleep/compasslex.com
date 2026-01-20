import { Component, OnInit } from '@angular/core';
import { Counselor } from 'src/app/models/counselor';
import { Observable } from 'rxjs';
import { Store } from '@ngrx/store';
import { getCounselorListAction } from 'src/app/store/actions/counselor-actions';
import { map } from 'rxjs/operators';
import {
    CounselorListStoreStatus,
    counselorListErrorMessageResolver,
} from '../shared/error-page/resolvers/counselor-list-error-message-resolver';
import {
    selectCounselorListLoadState,
    selectCounselorListStateError,
    selectCounselorByFirstName,
} from 'src/app/store/selectors/counselor-selector';
import { ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-counselor-controller',
    template: `<app-counselor [counselor]="counselor$ | async"> </app-counselor>
        <app-error-page [errorTypes]="errors$ | async" [messageResolver]="errorMessageResolver">
        </app-error-page>`,
    styles: [],
    standalone: false,
})
export class CounselorControllerComponent implements OnInit {
    public counselor$ = new Observable<Counselor | null | undefined>();
    public counselorListLoaded$ = new Observable<boolean>();
    public errors$ = new Observable<CounselorListStoreStatus[] | null | undefined>();
    public errorMessageResolver = [counselorListErrorMessageResolver];

    constructor(
        private store: Store<{}>,
        private route: ActivatedRoute
    ) {}

    ngOnInit(): void {
        const firstName = this.route.snapshot.paramMap.get('firstname');
        this.store.dispatch(getCounselorListAction());
        this.counselorListLoaded$ = this.store.select(selectCounselorListLoadState);
        this.counselor$ = this.store.select(selectCounselorByFirstName(firstName));
        this.errors$ = this.store
            .select(selectCounselorListStateError)
            .pipe(map((error) => [error as CounselorListStoreStatus]));
    }
}
