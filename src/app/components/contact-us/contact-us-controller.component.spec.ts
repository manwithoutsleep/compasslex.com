import { ContactUsControllerComponent } from './contact-us-controller.component';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { createCounselorState } from 'src/app/store/states/counselor-state';
import { ErrorPageFakeComponent } from '../shared/error-page/error-page.fake.component';
import { ContactUsFakeComponent } from './contact-us.fake.component';
import { SharedFakeModule } from '../shared/shared.fake.module';
import { RouterTestingModule } from '@angular/router/testing';

describe('ContactUsControllerComponent', () => {
    let component: ContactUsControllerComponent;
    let fixture: ComponentFixture<ContactUsControllerComponent>;
    let mockReduxStore: MockStore<{}>;

    const initialState = {
        counselors: createCounselorState([], false)
    };
    const moduleDef = {
        declarations: [
            ContactUsControllerComponent,
            ContactUsFakeComponent,
            ErrorPageFakeComponent
        ],
        imports: [
            SharedFakeModule,
            RouterTestingModule.withRoutes([])
        ],
        providers: [
            provideMockStore({ initialState })
        ]
    };

    beforeEach(() => {
        TestBed.configureTestingModule(moduleDef).compileComponents();

        mockReduxStore = TestBed.inject(MockStore);

        spyOn(mockReduxStore, 'dispatch').and.callThrough();

        fixture = TestBed.createComponent(ContactUsControllerComponent);
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
