( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b92 - block
    b944 - block
    b170 - block
    b912 - block
    b822 - block
    b870 - block
    b499 - block
    b657 - block
    b623 - block
    b432 - block
    b716 - block
    b989 - block
    b904 - block
    b446 - block
    b476 - block
    b6 - block
    b994 - block
    b573 - block
    b291 - block
    b293 - block
    b277 - block
    b244 - block
    b829 - block
    b242 - block
    b861 - block
    b72 - block
    b580 - block
    b713 - block
    b913 - block
    b598 - block
    b19 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b92 )
    ( on b944 b92 )
    ( on b170 b944 )
    ( on b912 b170 )
    ( on b822 b912 )
    ( on b870 b822 )
    ( on b499 b870 )
    ( on b657 b499 )
    ( on b623 b657 )
    ( on b432 b623 )
    ( on b716 b432 )
    ( on b989 b716 )
    ( on b904 b989 )
    ( on b446 b904 )
    ( on b476 b446 )
    ( on b6 b476 )
    ( on b994 b6 )
    ( on b573 b994 )
    ( on b291 b573 )
    ( on b293 b291 )
    ( on b277 b293 )
    ( on b244 b277 )
    ( on b829 b244 )
    ( on b242 b829 )
    ( on b861 b242 )
    ( on b72 b861 )
    ( on b580 b72 )
    ( on b713 b580 )
    ( on b913 b713 )
    ( on b598 b913 )
    ( on b19 b598 )
    ( clear b19 )
  )
  ( :goal
    ( and
      ( clear b92 )
    )
  )
)
