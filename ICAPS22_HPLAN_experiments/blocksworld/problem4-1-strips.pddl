( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b968 - block
    b523 - block
    b417 - block
    b339 - block
    b516 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b968 )
    ( on b523 b968 )
    ( on b417 b523 )
    ( on b339 b417 )
    ( on b516 b339 )
    ( clear b516 )
  )
  ( :goal
    ( and
      ( clear b968 )
    )
  )
)
