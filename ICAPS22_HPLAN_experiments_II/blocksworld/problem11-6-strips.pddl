( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b709 - block
    b488 - block
    b85 - block
    b777 - block
    b751 - block
    b220 - block
    b772 - block
    b664 - block
    b22 - block
    b917 - block
    b519 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b709 )
    ( on b488 b709 )
    ( on b85 b488 )
    ( on b777 b85 )
    ( on b751 b777 )
    ( on b220 b751 )
    ( on b772 b220 )
    ( on b664 b772 )
    ( on b22 b664 )
    ( on b917 b22 )
    ( on b519 b917 )
    ( on b667 b519 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b709 )
    )
  )
)
