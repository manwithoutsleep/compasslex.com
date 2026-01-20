import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { ContactUsComponent } from './contact-us.component';
import { GmapFakeComponent } from '../shared/gmap/gmap.fake.component';

describe('ContactUsComponent', () => {
    let component: ContactUsComponent;
    let fixture: ComponentFixture<ContactUsComponent>;

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [ContactUsComponent, GmapFakeComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ContactUsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
