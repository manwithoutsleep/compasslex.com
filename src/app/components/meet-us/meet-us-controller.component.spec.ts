import { MeetUsControllerComponent } from './meet-us-controller.component';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { createCounselorState } from 'src/app/store/states/counselor-state';
import { ErrorPageFakeComponent } from '../shared/error-page/error-page.fake.component';
import { MeetUsFakeComponent } from './meet-us.fake.component';

describe('MeetUsControllerComponent', () => {
    let component: MeetUsControllerComponent;
    let fixture: ComponentFixture<MeetUsControllerComponent>;
    let mockReduxStore: MockStore<{}>;

    const initialState = {
        counselors: createCounselorState([], false),
    };
    const moduleDef = {
        declarations: [MeetUsControllerComponent, MeetUsFakeComponent, ErrorPageFakeComponent],
        providers: [provideMockStore({ initialState })],
    };

    beforeEach(() => {
        TestBed.configureTestingModule(moduleDef).compileComponents();

        mockReduxStore = TestBed.inject(MockStore);

        spyOn(mockReduxStore, 'dispatch').and.callThrough();

        fixture = TestBed.createComponent(MeetUsControllerComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    afterEach(() => {
        fixture.destroy();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
