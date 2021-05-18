export interface Post {
  id: number;
  title: string;
  slug: string;
  // banner?: string;
  // filename?: string;
  summary: string;
  content: string;
  // tags: string[];
  featured: boolean;
  published: boolean;
  publishedAt: Date;
  createdAt: Date;
  updatedAt: Date;
}
