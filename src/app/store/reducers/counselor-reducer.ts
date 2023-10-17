import { createCounselorState } from '../states/counselor-state';
import { createReducer, on } from '@ngrx/store';
import { getCounselorListSuccessAction } from '../actions/counselor-actions';
import { Counselor } from 'src/app/models/counselor';

export const initialCounselorState = createCounselorState([] as readonly Counselor[], false);

export const counselorReducer = createReducer(
    initialCounselorState,
    on(getCounselorListSuccessAction, (_state, { counselorList }) => createCounselorState(counselorList, true))
);
