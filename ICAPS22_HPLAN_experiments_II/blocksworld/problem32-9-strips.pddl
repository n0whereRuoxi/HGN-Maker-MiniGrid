( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b449 - block
    b623 - block
    b692 - block
    b630 - block
    b249 - block
    b797 - block
    b370 - block
    b559 - block
    b955 - block
    b22 - block
    b333 - block
    b146 - block
    b785 - block
    b269 - block
    b226 - block
    b71 - block
    b970 - block
    b614 - block
    b405 - block
    b366 - block
    b898 - block
    b760 - block
    b999 - block
    b471 - block
    b331 - block
    b50 - block
    b638 - block
    b115 - block
    b11 - block
    b284 - block
    b578 - block
    b722 - block
    b822 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b623 b449 )
    ( on b692 b623 )
    ( on b630 b692 )
    ( on b249 b630 )
    ( on b797 b249 )
    ( on b370 b797 )
    ( on b559 b370 )
    ( on b955 b559 )
    ( on b22 b955 )
    ( on b333 b22 )
    ( on b146 b333 )
    ( on b785 b146 )
    ( on b269 b785 )
    ( on b226 b269 )
    ( on b71 b226 )
    ( on b970 b71 )
    ( on b614 b970 )
    ( on b405 b614 )
    ( on b366 b405 )
    ( on b898 b366 )
    ( on b760 b898 )
    ( on b999 b760 )
    ( on b471 b999 )
    ( on b331 b471 )
    ( on b50 b331 )
    ( on b638 b50 )
    ( on b115 b638 )
    ( on b11 b115 )
    ( on b284 b11 )
    ( on b578 b284 )
    ( on b722 b578 )
    ( on b822 b722 )
    ( clear b822 )
  )
  ( :goal
    ( and
      ( clear b449 )
    )
  )
)
