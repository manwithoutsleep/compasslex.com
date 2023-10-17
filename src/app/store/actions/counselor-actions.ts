import { createAction, props } from '@ngrx/store';
import { CounselorData } from 'src/app/models/counselor-data';

export const getCounselorListAction = createAction('[Counselor Actions] GET COUNSELOR LIST');
export const getCounselorListFailuireAction = createAction('[Counselor Actions] GET COUNSELOR LIST FAILURE');
export const getCounselorListSuccessAction = createAction('[Counselor Actions] GET COUNSELOR LIST SUCCESS', props<CounselorData>());


