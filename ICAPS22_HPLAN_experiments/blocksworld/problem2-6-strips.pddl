( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b997 - block
    b793 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b997 b742 )
    ( on b793 b997 )
    ( clear b793 )
  )
  ( :goal
    ( and
      ( clear b742 )
      ( clear b742 )
      ( clear b742 )
    )
  )
)
