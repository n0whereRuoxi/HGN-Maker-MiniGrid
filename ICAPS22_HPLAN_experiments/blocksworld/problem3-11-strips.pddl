( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b884 - block
    b825 - block
    b76 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b884 b63 )
    ( on b825 b884 )
    ( on b76 b825 )
    ( clear b76 )
  )
  ( :goal
    ( and
      ( clear b63 )
      ( clear b63 )
      ( clear b63 )
      ( clear b63 )
    )
  )
)
