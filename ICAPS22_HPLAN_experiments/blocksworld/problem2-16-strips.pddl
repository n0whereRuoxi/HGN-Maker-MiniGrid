( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b996 - block
    b867 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b996 )
    ( on b867 b996 )
    ( on b30 b867 )
    ( clear b30 )
  )
  ( :goal
    ( and
      ( clear b996 )
    )
  )
)
