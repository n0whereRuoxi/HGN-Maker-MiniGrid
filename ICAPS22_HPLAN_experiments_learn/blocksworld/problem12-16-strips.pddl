( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b72 - block
    b755 - block
    b867 - block
    b534 - block
    b23 - block
    b60 - block
    b597 - block
    b323 - block
    b61 - block
    b858 - block
    b690 - block
    b313 - block
    b181 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b72 )
    ( on b755 b72 )
    ( on b867 b755 )
    ( on b534 b867 )
    ( on b23 b534 )
    ( on b60 b23 )
    ( on b597 b60 )
    ( on b323 b597 )
    ( on b61 b323 )
    ( on b858 b61 )
    ( on b690 b858 )
    ( on b313 b690 )
    ( on b181 b313 )
    ( clear b181 )
  )
  ( :goal
    ( and
      ( clear b72 )
    )
  )
)
