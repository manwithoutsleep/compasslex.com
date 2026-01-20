import { StoreStatus } from './store-status';

export class CounselorListStoreStatus extends StoreStatus {
    static readonly LOADING_COUNSELOR_LIST = '<CounselorListStoreStatus> LOADING_COUNSELOR_LIST';
    static readonly NO_COUNSELORS_RETURNED_FROM_DATA_STORE =
        '<CounselorListStoreStatus> NO_COUNSELORS_RETURNED_FROM_SERVER';
    static readonly REQUESTED_COUNSELOR_NOT_FOUND =
        '<CounselorListStoreStatus> REQUESTED_COUNSELOR_NOT_FOUND';
}

export function counselorListErrorMessageResolver(messageType: CounselorListStoreStatus): string {
    switch (messageType) {
        case CounselorListStoreStatus.LOADING_COUNSELOR_LIST:
            return 'Loading Counselors';
        case CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE:
            return 'No counselors found<br /><a href="/">Return to home page</a>';
        case CounselorListStoreStatus.REQUESTED_COUNSELOR_NOT_FOUND:
            return 'The requested counselor was not found<br /><a href="/">Return to home page</a>';
        case CounselorListStoreStatus.NO_ERROR:
        default:
            return '';
    }
}
