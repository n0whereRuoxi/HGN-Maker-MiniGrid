( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b295 - block
    b615 - block
    b258 - block
    b246 - block
    b932 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b295 )
    ( on b615 b295 )
    ( on b258 b615 )
    ( on b246 b258 )
    ( on b932 b246 )
    ( clear b932 )
  )
  ( :goal
    ( and
      ( clear b295 )
    )
  )
)
