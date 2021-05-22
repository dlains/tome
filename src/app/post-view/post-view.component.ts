import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

// import { PostsService } from 'src/app/shared/services/posts.service';
import { Post } from 'src/app/models/post';

@Component({
  selector: 'tome-post-view',
  templateUrl: './post-view.component.html',
  styleUrls: ['./post-view.component.scss']
})
export class PostViewComponent implements OnInit {
  public post: Post;

  constructor(
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
       let slug = params.get('slug');
       if (slug === null) {
         slug = '';
       }

       this.post = {
        id: 1,
        title: 'First Post',
        slug: slug,
        // banner?: string;
        // filename?: string;
        summary: 'This is the post summary',
        content: 'This is the post content, it should be a bit longer than the summary.',
        // tags: string[];
        featured: true,
        published: true,
        publishedAt: new Date(),
        createdAt: new Date(),
        updatedAt: new Date()
       }

      // this.postsService.getPost(this.slug).subscribe((post) => {
      //   this.post = post;
      // });
    });
  }
}