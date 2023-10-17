import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';
import { MeetCounselorCardComponent } from './meet-counselor-card.component';
import { counselorBuilder } from 'src/app/models/builders/counselor-builder';
import { Random } from 'random-test-values';

describe('CounselorCardComponent', () => {
    let component: MeetCounselorCardComponent;
    let fixture: ComponentFixture<MeetCounselorCardComponent>;

    beforeEach(waitForAsync(() => {
        TestBed.configureTestingModule({
            declarations: [MeetCounselorCardComponent],
        }).compileComponents();
        fixture = TestBed.createComponent(MeetCounselorCardComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    }));

    it('should create', () => {
        expect(component).toBeTruthy();
    });

    describe('getCounselorName', () => {
        it('should return the first and last name', () => {
            component.counselor = counselorBuilder();

            const expected = component.counselor.firstname + ' ' + component.counselor.lastname;
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });

        it('should return empty string when the counselor is undefined', () => {
            component.counselor = undefined;

            const expected = '';
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });

        it('should append Clinical Director when the counselor name is Linda Fentress', () => {
            component.counselor = counselorBuilder( {
                firstname: 'Linda',
                lastname: 'Fentress'
            });

            const expected = 'Linda Fentress, Clinical Director';
            const actual = component.getCounselorName();

            expect(actual).toEqual(expected);
        });
    });

    describe('getImageLink', () => {
        it('should return the correct link to the counselor image', () => {
            component.counselor = counselorBuilder({
                firstname: 'X' + Random.String(),
            });

            const expected =
                '/assets/site-images/' +
                component.counselor.firstname.toLowerCase() +
                '-meet-us-182x235.jpg';

            const actual = component.getImageLink();
            expect(actual).toEqual(expected);
        });
    });

    describe('getFirstName', () => {
        it('should return the counselor first name', () => {
            component.counselor = counselorBuilder();
            const actual = component.getFirstName();
            expect(actual).toEqual(component.counselor.firstname);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getFirstName();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getFirstName();
            expect(actual).toEqual('');
        });
    });

    describe('getShortDescription', () => {
        it('should return the counselor last name', () => {
            component.counselor = counselorBuilder();
            const actual = component.getShortDescription();
            expect(actual).toEqual(component.counselor.shortdescription);
        });
        it('should return an empty string when the counselor is null', () => {
            component.counselor = null;
            const actual = component.getShortDescription();
            expect(actual).toEqual('');
        });
        it('should return an empty string when the counselor is undefined', () => {
            component.counselor = undefined;
            const actual = component.getShortDescription();
            expect(actual).toEqual('');
        });
    });
});
