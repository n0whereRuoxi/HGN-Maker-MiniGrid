( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b221 - block
    b534 - block
    b551 - block
    b690 - block
    b983 - block
    b697 - block
    b628 - block
    b809 - block
    b213 - block
    b566 - block
    b333 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b221 )
    ( on b534 b221 )
    ( on b551 b534 )
    ( on b690 b551 )
    ( on b983 b690 )
    ( on b697 b983 )
    ( on b628 b697 )
    ( on b809 b628 )
    ( on b213 b809 )
    ( on b566 b213 )
    ( on b333 b566 )
    ( clear b333 )
  )
  ( :goal
    ( and
      ( clear b221 )
    )
  )
)
