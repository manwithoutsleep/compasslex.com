import { counselorBuilder } from 'src/app/models/builders/counselor-builder';
import { getCounselorListSuccessAction } from '../actions/counselor-actions';
import { CounselorData } from 'src/app/models/counselor-data';
import { counselorReducer, initialCounselorState } from './counselor-reducer';

describe('counselorReducer', () => {
    it('returns the given state if the action type is not in the list of actions', () => {
        const action = { type: 'Unknown' };
        const newState = counselorReducer(initialCounselorState, action);
        expect(newState).toBe(initialCounselorState);
    });

    it('returns the default state if the action type is not in the list of actions and the initial state is undefined', () => {
        const action = { type: 'Unknown' };
        const newState = counselorReducer(undefined, action);

        expect(newState).toBe(initialCounselorState);
        expect(newState.isLoaded).toBe(false);
    });

    it('should replace the counselor state when the getCounselorListSuccessAction is fired', () => {
        const expectedCounselorState = { counselorList: [
            counselorBuilder(),
            counselorBuilder(),
            counselorBuilder()
        ] } as CounselorData;

        const action = getCounselorListSuccessAction(expectedCounselorState);

        const newState = counselorReducer(initialCounselorState, action);

        expect(newState).not.toBe(initialCounselorState);
        expect(newState.counselorList).toEqual(expectedCounselorState.counselorList);
        expect(newState.isLoaded).toBeTrue();
    });
});
