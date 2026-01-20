import { createFeatureSelector, createSelector } from '@ngrx/store';
import { CounselorState } from '../states/counselor-state';
import * as StoreLabels from '../store-labels';
import { Counselor } from 'src/app/models/counselor';
import { CounselorListStoreStatus } from 'src/app/components/shared/error-page/resolvers/counselor-list-error-message-resolver';

const getCounselorStoreState = createFeatureSelector<CounselorState>(StoreLabels.counselors);

export const selectAllCounselors = createSelector(
    getCounselorStoreState,
    (state: CounselorState): CounselorState | undefined => {
        //if (!state) { return undefined; }
        return state;
    }
);

export const selectCounselorByFirstName = (firstName: string | null) =>
    createSelector(getCounselorStoreState, (state: CounselorState): Counselor | undefined => {
        if (state?.counselorList === undefined) {
            return undefined;
        }
        return state.counselorList.find((counselor) => counselor.firstname === firstName);
    });

export const selectCounselorListLoadState = createSelector(
    getCounselorStoreState,
    (state: CounselorState) => (state ? state.isLoaded : false)
);

export const selectCounselorListStateError = createSelector(
    getCounselorStoreState,
    (state: CounselorState): string | undefined => {
        if (state === undefined || state.isLoaded === false) {
            return CounselorListStoreStatus.LOADING_COUNSELOR_LIST;
        } else if (state.counselorList === undefined || state.counselorList.length === 0) {
            return CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE;
        }
        return undefined;
    }
);

export const selectCounselorStateError = (firstName: string | null) =>
    createSelector(
        getCounselorStoreState,
        (state: CounselorState): CounselorListStoreStatus | undefined => {
            if (state === undefined || state.isLoaded === false) {
                return CounselorListStoreStatus.LOADING_COUNSELOR_LIST;
            } else if (state.counselorList === undefined || state.counselorList.length === 0) {
                return CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE;
            }
            const selectedCounselor = state.counselorList.find(
                (counselor) => counselor.firstname === firstName
            );
            if (selectedCounselor === undefined) {
                return CounselorListStoreStatus.REQUESTED_COUNSELOR_NOT_FOUND;
            }
            return undefined;
        }
    );
