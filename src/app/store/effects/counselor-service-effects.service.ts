import { Injectable } from '@angular/core';
import { CounselorService } from 'src/app/services/counselor.service';
import {
    getCounselorListAction,
    getCounselorListSuccessAction,
    getCounselorListFailuireAction,
} from '../actions/counselor-actions';
import { CounselorData } from 'src/app/models/counselor-data';
import { mergeMap, map, catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { Actions, createEffect, ofType } from '@ngrx/effects';

@Injectable({
    providedIn: 'root',
})
export class CounselorServiceEffects {
    constructor(
        private counselorService: CounselorService,
        private actions: Actions
    ) {}

    public getCounselorList$ = createEffect(() => {
        return this.actions.pipe(
            ofType(getCounselorListAction().type),
            mergeMap(() =>
                this.counselorService.getCounselorList().pipe(
                    map((response) => getCounselorListSuccessAction(response as CounselorData)),
                    catchError(() => of(getCounselorListFailuireAction()))
                )
            )
        );
    });
}
