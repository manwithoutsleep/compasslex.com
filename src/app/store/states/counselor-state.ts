import { Counselor } from 'src/app/models/counselor';

export interface CounselorState {
    counselorList: readonly Counselor[];
    isLoaded: boolean;
}

export function createCounselorState(
    counselorList: readonly Counselor[],
    isLoaded: boolean
): CounselorState {
    return {
        counselorList,
        isLoaded,
    };
}
