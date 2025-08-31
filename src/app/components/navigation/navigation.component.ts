import { Component } from '@angular/core';

@Component({
    selector: 'app-navigation',
    templateUrl: './navigation.component.html',
    styleUrls: ['./navigation.component.scss'],
    standalone: false
})
export class NavigationComponent {
    sidenavOpen = false;

    toggleSidenav() {
        this.sidenavOpen = !this.sidenavOpen;
    }

    closeSidenav() {
        this.sidenavOpen = false;
    }
}
