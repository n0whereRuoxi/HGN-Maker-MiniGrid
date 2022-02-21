( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b974 - block
    b446 - block
    b884 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b974 )
    ( on b446 b974 )
    ( on b884 b446 )
    ( clear b884 )
  )
  ( :goal
    ( and
      ( clear b974 )
    )
  )
)
