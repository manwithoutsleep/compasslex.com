import { CounselorControllerComponent } from './counselor-controller.component';
import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { convertToParamMap, ActivatedRoute, provideRouter } from '@angular/router';
import { createCounselorState } from 'src/app/store/states/counselor-state';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { CounselorFakeComponent } from './counselor.fake.component';
import { Random } from 'random-test-values';
import { SharedFakeModule } from '../shared/shared.fake.module';

describe('CounselorControllerComponent', () => {
    let component: CounselorControllerComponent;
    let fixture: ComponentFixture<CounselorControllerComponent>;
    let mockReduxStore: MockStore<{}>;

    const firstName = Random.String();
    const routeSpy = {
        snapshot: { paramMap: convertToParamMap({ firstname: firstName }) },
    };
    const initialState = { counselors: createCounselorState([], false) };

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [CounselorControllerComponent, CounselorFakeComponent],
            imports: [NoopAnimationsModule, SharedFakeModule],
            providers: [
                provideRouter([]),
                provideMockStore({ initialState }),
                { provide: ActivatedRoute, useValue: routeSpy },
            ],
        }).compileComponents();

        mockReduxStore = TestBed.inject(MockStore);

        spyOn(mockReduxStore, 'dispatch').and.callThrough();

        fixture = TestBed.createComponent(CounselorControllerComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));

    afterEach(() => {
        fixture.destroy();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
