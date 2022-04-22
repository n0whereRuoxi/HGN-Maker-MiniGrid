( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b657 - block
    b888 - block
    b192 - block
    b199 - block
    b426 - block
    b887 - block
    b327 - block
    b361 - block
    b389 - block
    b156 - block
    b237 - block
    b278 - block
    b246 - block
    b257 - block
    b81 - block
    b638 - block
    b45 - block
    b894 - block
    b185 - block
    b83 - block
    b661 - block
    b521 - block
    b628 - block
    b108 - block
    b583 - block
    b626 - block
    b497 - block
    b950 - block
    b720 - block
    b428 - block
    b844 - block
    b773 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b657 )
    ( on b888 b657 )
    ( on b192 b888 )
    ( on b199 b192 )
    ( on b426 b199 )
    ( on b887 b426 )
    ( on b327 b887 )
    ( on b361 b327 )
    ( on b389 b361 )
    ( on b156 b389 )
    ( on b237 b156 )
    ( on b278 b237 )
    ( on b246 b278 )
    ( on b257 b246 )
    ( on b81 b257 )
    ( on b638 b81 )
    ( on b45 b638 )
    ( on b894 b45 )
    ( on b185 b894 )
    ( on b83 b185 )
    ( on b661 b83 )
    ( on b521 b661 )
    ( on b628 b521 )
    ( on b108 b628 )
    ( on b583 b108 )
    ( on b626 b583 )
    ( on b497 b626 )
    ( on b950 b497 )
    ( on b720 b950 )
    ( on b428 b720 )
    ( on b844 b428 )
    ( on b773 b844 )
    ( clear b773 )
  )
  ( :goal
    ( and
      ( clear b657 )
    )
  )
)
