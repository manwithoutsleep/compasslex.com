import { environment } from 'src/environments/environment';
import { MetaReducer, StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { storeFreeze } from 'ngrx-store-freeze';
import { NgModule } from '@angular/core';
import { counselorReducer } from './reducers/counselor-reducer';
import { CounselorServiceEffects } from './effects/counselor-service-effects.service';
import { newsletterReducer } from './reducers/newsletter-reducer';
import { NewsletterServiceEffects } from './effects/newsletter-service-effects.service';

export const metaReducers: MetaReducer<any>[] = !environment.production ? [storeFreeze] : [];

@NgModule({
    declarations: [],
    imports: [
        StoreModule.forRoot({}, { metaReducers }),
        StoreModule.forRoot({
            counselors: counselorReducer,
            newsletters: newsletterReducer,
        }),
        EffectsModule.forRoot([CounselorServiceEffects, NewsletterServiceEffects]),
    ],
    exports: [StoreModule],
})
export class AppStoreModule {}
