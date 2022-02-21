( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b635 - block
    b778 - block
    b74 - block
    b248 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b635 )
    ( on b778 b635 )
    ( on b74 b778 )
    ( on b248 b74 )
    ( clear b248 )
  )
  ( :goal
    ( and
      ( clear b635 )
      ( clear b635 )
      ( clear b635 )
      ( clear b635 )
    )
  )
)
