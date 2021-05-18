import { Component, OnInit } from '@angular/core';

import { Post } from 'src/app/models/post';

@Component({
  selector: 'tome-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  posts: Post[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
