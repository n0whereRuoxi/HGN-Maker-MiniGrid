( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b630 - block
    b363 - block
    b619 - block
    b400 - block
    b174 - block
    b922 - block
    b404 - block
    b687 - block
    b876 - block
    b229 - block
    b757 - block
    b316 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b363 b630 )
    ( on b619 b363 )
    ( on b400 b619 )
    ( on b174 b400 )
    ( on b922 b174 )
    ( on b404 b922 )
    ( on b687 b404 )
    ( on b876 b687 )
    ( on b229 b876 )
    ( on b757 b229 )
    ( on b316 b757 )
    ( on b523 b316 )
    ( clear b523 )
  )
  ( :goal
    ( and
      ( clear b630 )
    )
  )
)
