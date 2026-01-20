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
    selectAllCounselors,
    selectCounselorListLoadState,
    selectCounselorListStateError,
} from 'src/app/store/selectors/counselor-selector';

@Component({
    selector: 'app-meet-us-controller',
    template: `<app-meet-us [counselorList]="counselorList$ | async"> </app-meet-us>
        <app-error-page [errorTypes]="errors$ | async" [messageResolver]="errorMessageResolver">
        </app-error-page>`,
    styles: [],
    standalone: false,
})
export class MeetUsControllerComponent implements OnInit {
    public counselorList$ = new Observable<readonly Counselor[] | null | undefined>();
    public counselorListLoaded$ = new Observable<boolean>();
    public errors$ = new Observable<CounselorListStoreStatus[] | null | undefined>();
    public errorMessageResolver = [counselorListErrorMessageResolver];

    constructor(private store: Store<{}>) {}

    ngOnInit(): void {
        this.store.dispatch(getCounselorListAction());
        this.counselorListLoaded$ = this.store.select(selectCounselorListLoadState);
        this.counselorList$ = this.store
            .select(selectAllCounselors)
            .pipe(map((counselorState) => counselorState?.counselorList));
        this.errors$ = this.store
            .select(selectCounselorListStateError)
            .pipe(map((error) => [error as CounselorListStoreStatus]));
    }
}
