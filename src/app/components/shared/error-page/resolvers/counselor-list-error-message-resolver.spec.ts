import {
    counselorListErrorMessageResolver,
    CounselorListStoreStatus,
} from './counselor-list-error-message-resolver';

describe('counselorListErrorMessageResolver', () => {
    it('should return the appropriate error message when given CounselorListStoreStatus.LOADING_COUNSELOR_LIST', () => {
        const actual = counselorListErrorMessageResolver(
            CounselorListStoreStatus.LOADING_COUNSELOR_LIST
        );
        expect(actual).toEqual('Loading Counselors');
    });
    it('should return the appropriate error message when given CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE', () => {
        const actual = counselorListErrorMessageResolver(
            CounselorListStoreStatus.NO_COUNSELORS_RETURNED_FROM_DATA_STORE
        );
        expect(actual).toEqual('No counselors found<br /><a href="/">Return to home page</a>');
    });
    it('should return the appropriate error message when given CounselorListStoreStatus.REQUESTED_COUNSELOR_NOT_FOUND', () => {
        const actual = counselorListErrorMessageResolver(
            CounselorListStoreStatus.REQUESTED_COUNSELOR_NOT_FOUND
        );
        expect(actual).toEqual(
            'The requested counselor was not found<br /><a href="/">Return to home page</a>'
        );
    });
    it('should return no error message when given CounselorListStoreStatus.NO_ERROR', () => {
        const actual = counselorListErrorMessageResolver(CounselorListStoreStatus.NO_ERROR);
        expect(actual).toEqual('');
    });
});
