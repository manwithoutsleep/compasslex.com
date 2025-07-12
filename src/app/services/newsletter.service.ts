import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { NewsletterData } from '../models/newsletter-data';

@Injectable({
    providedIn: 'root'
})
export class NewsletterService {
    private baseUrl = '../assets/data/newsletter.json';

    constructor(private http: HttpClient) { }

    public getNewsletterList(): Observable<NewsletterData> {
        return this.http.get<NewsletterData>(this.baseUrl);
    }
}
