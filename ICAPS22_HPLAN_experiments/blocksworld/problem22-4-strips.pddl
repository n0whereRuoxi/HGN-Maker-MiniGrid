( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b578 - block
    b949 - block
    b973 - block
    b668 - block
    b39 - block
    b693 - block
    b920 - block
    b327 - block
    b979 - block
    b777 - block
    b971 - block
    b936 - block
    b435 - block
    b594 - block
    b8 - block
    b94 - block
    b732 - block
    b224 - block
    b841 - block
    b861 - block
    b493 - block
    b140 - block
    b244 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b578 )
    ( on b949 b578 )
    ( on b973 b949 )
    ( on b668 b973 )
    ( on b39 b668 )
    ( on b693 b39 )
    ( on b920 b693 )
    ( on b327 b920 )
    ( on b979 b327 )
    ( on b777 b979 )
    ( on b971 b777 )
    ( on b936 b971 )
    ( on b435 b936 )
    ( on b594 b435 )
    ( on b8 b594 )
    ( on b94 b8 )
    ( on b732 b94 )
    ( on b224 b732 )
    ( on b841 b224 )
    ( on b861 b841 )
    ( on b493 b861 )
    ( on b140 b493 )
    ( on b244 b140 )
    ( clear b244 )
  )
  ( :goal
    ( and
      ( clear b578 )
    )
  )
)
