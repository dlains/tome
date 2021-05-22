import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { of } from 'rxjs';

class MockActivatedRoute extends ActivatedRoute {
  constructor() {
      super();
      this.params = of({ slug: 'post-title' });
  }
}

import { PostViewComponent } from './post-view.component';

describe('PostViewComponent', () => {
  let component: PostViewComponent;
  let fixture: ComponentFixture<PostViewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PostViewComponent ],
      providers: [
        { provide: ActivatedRoute, useValue: new MockActivatedRoute() }
      ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PostViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
