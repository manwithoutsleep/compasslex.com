import { NgModule } from '@angular/core';
import { AppMaterialModule } from './shared/app.material.module';
import { NavigationComponent } from './navigation/navigation.component';
import { AppRoutingModule } from '../app-routing.module';



@NgModule({
  declarations: [
    NavigationComponent
  ],
  imports: [
    AppMaterialModule,
    AppRoutingModule
  ],
  exports: [
    NavigationComponent
  ]
})
export class AppComponentsModule { }
