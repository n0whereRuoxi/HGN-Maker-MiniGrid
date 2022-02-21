( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b121 - block
    b24 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b121 b742 )
    ( on b24 b121 )
    ( clear b24 )
  )
  ( :goal
    ( and
      ( clear b742 )
      ( clear b742 )
      ( clear b742 )
    )
  )
)
