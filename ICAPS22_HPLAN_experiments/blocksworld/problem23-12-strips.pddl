( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b76 - block
    b201 - block
    b609 - block
    b524 - block
    b901 - block
    b109 - block
    b766 - block
    b131 - block
    b774 - block
    b552 - block
    b156 - block
    b616 - block
    b960 - block
    b480 - block
    b126 - block
    b487 - block
    b244 - block
    b62 - block
    b203 - block
    b697 - block
    b649 - block
    b690 - block
    b435 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b76 )
    ( on b201 b76 )
    ( on b609 b201 )
    ( on b524 b609 )
    ( on b901 b524 )
    ( on b109 b901 )
    ( on b766 b109 )
    ( on b131 b766 )
    ( on b774 b131 )
    ( on b552 b774 )
    ( on b156 b552 )
    ( on b616 b156 )
    ( on b960 b616 )
    ( on b480 b960 )
    ( on b126 b480 )
    ( on b487 b126 )
    ( on b244 b487 )
    ( on b62 b244 )
    ( on b203 b62 )
    ( on b697 b203 )
    ( on b649 b697 )
    ( on b690 b649 )
    ( on b435 b690 )
    ( on b667 b435 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b76 )
    )
  )
)
