( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b57 - block
    b734 - block
    b276 - block
    b227 - block
    b700 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b57 )
    ( on b734 b57 )
    ( on b276 b734 )
    ( on b227 b276 )
    ( on b700 b227 )
    ( clear b700 )
  )
  ( :goal
    ( and
      ( clear b57 )
    )
  )
)
