( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b224 - block
    b924 - block
    b301 - block
    b813 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b224 b642 )
    ( on b924 b224 )
    ( on b301 b924 )
    ( on b813 b301 )
    ( clear b813 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)