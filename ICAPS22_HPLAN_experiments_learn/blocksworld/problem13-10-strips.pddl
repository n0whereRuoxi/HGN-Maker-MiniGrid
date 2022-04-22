( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b827 - block
    b474 - block
    b75 - block
    b8 - block
    b323 - block
    b938 - block
    b865 - block
    b948 - block
    b628 - block
    b333 - block
    b771 - block
    b202 - block
    b311 - block
    b60 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b827 )
    ( on b474 b827 )
    ( on b75 b474 )
    ( on b8 b75 )
    ( on b323 b8 )
    ( on b938 b323 )
    ( on b865 b938 )
    ( on b948 b865 )
    ( on b628 b948 )
    ( on b333 b628 )
    ( on b771 b333 )
    ( on b202 b771 )
    ( on b311 b202 )
    ( on b60 b311 )
    ( clear b60 )
  )
  ( :goal
    ( and
      ( clear b827 )
    )
  )
)
