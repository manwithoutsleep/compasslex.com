import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { ErrorPageComponent } from './error-page.component';
import { CounselorListStoreStatus, counselorListErrorMessageResolver } from './resolvers/counselor-list-error-message-resolver';

describe('ErrorPageComponent', () => {
    let component: ErrorPageComponent;
    let fixture: ComponentFixture<ErrorPageComponent>;

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [ErrorPageComponent],
        }).compileComponents();
        fixture = TestBed.createComponent(ErrorPageComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));

    it('should create', () => {
        expect(component).toBeTruthy();
    });

    describe('hasError', () => {
        it('should return true when errorTypes is not empty', () => {
            component.errorTypes = [
                CounselorListStoreStatus.LOADING_COUNSELOR_LIST,
            ];
            expect(component.hasError()).toBeTrue();
        });

        it('should return true when errorTypes is empty', () => {
            component.errorTypes = [];
            expect(component.hasError()).toBeFalse();
        });
    });

    describe('getErrorMessage', () => {
        it('should return the first error message when one exists', () => {
            component.errorTypes = [
                CounselorListStoreStatus.LOADING_COUNSELOR_LIST,
            ];

            component.messageResolver = [counselorListErrorMessageResolver];

            const actual = component.getErrorMessage();

            expect(actual).toEqual(counselorListErrorMessageResolver(CounselorListStoreStatus.LOADING_COUNSELOR_LIST));
        });

        it('should return an empty string if there is no error', () => {
            component.errorTypes = [];

            component.messageResolver = [counselorListErrorMessageResolver];

            const actual = component.getErrorMessage();

            expect(actual).toEqual('');
        });
    });
});
