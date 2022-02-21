( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b980 - block
    b374 - block
    b92 - block
    b675 - block
    b127 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b980 b825 )
    ( on b374 b980 )
    ( on b92 b374 )
    ( on b675 b92 )
    ( on b127 b675 )
    ( clear b127 )
  )
  ( :goal
    ( and
      ( clear b825 )
      ( clear b825 )
      ( clear b825 )
      ( clear b825 )
      ( clear b825 )
      ( clear b825 )
    )
  )
)
