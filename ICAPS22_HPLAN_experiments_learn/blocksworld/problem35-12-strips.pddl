( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b889 - block
    b22 - block
    b728 - block
    b704 - block
    b854 - block
    b192 - block
    b382 - block
    b499 - block
    b516 - block
    b329 - block
    b154 - block
    b194 - block
    b934 - block
    b82 - block
    b521 - block
    b73 - block
    b983 - block
    b342 - block
    b23 - block
    b999 - block
    b505 - block
    b687 - block
    b745 - block
    b455 - block
    b879 - block
    b714 - block
    b293 - block
    b518 - block
    b393 - block
    b734 - block
    b384 - block
    b399 - block
    b85 - block
    b926 - block
    b981 - block
    b246 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b889 )
    ( on b22 b889 )
    ( on b728 b22 )
    ( on b704 b728 )
    ( on b854 b704 )
    ( on b192 b854 )
    ( on b382 b192 )
    ( on b499 b382 )
    ( on b516 b499 )
    ( on b329 b516 )
    ( on b154 b329 )
    ( on b194 b154 )
    ( on b934 b194 )
    ( on b82 b934 )
    ( on b521 b82 )
    ( on b73 b521 )
    ( on b983 b73 )
    ( on b342 b983 )
    ( on b23 b342 )
    ( on b999 b23 )
    ( on b505 b999 )
    ( on b687 b505 )
    ( on b745 b687 )
    ( on b455 b745 )
    ( on b879 b455 )
    ( on b714 b879 )
    ( on b293 b714 )
    ( on b518 b293 )
    ( on b393 b518 )
    ( on b734 b393 )
    ( on b384 b734 )
    ( on b399 b384 )
    ( on b85 b399 )
    ( on b926 b85 )
    ( on b981 b926 )
    ( on b246 b981 )
    ( clear b246 )
  )
  ( :goal
    ( and
      ( clear b889 )
    )
  )
)
