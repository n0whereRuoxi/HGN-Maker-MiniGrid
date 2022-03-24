( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b997 - block
    b156 - block
    b59 - block
    b97 - block
    b315 - block
    b757 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b997 )
    ( on b156 b997 )
    ( on b59 b156 )
    ( on b97 b59 )
    ( on b315 b97 )
    ( on b757 b315 )
    ( on b292 b757 )
    ( clear b292 )
  )
  ( :goal
    ( and
      ( clear b997 )
    )
  )
)
