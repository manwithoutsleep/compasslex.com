import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { NewsletterData } from '../models/newsletter-data';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root'
})
export class NewsletterService {
    private baseUrl = environment.currentBaseUrl + '/newsletter';

    constructor(private http: HttpClient) { }

    public getNewsletterList(): Observable<NewsletterData> {
        return this.http.get(this.baseUrl) as Observable<NewsletterData>;
    }
}
