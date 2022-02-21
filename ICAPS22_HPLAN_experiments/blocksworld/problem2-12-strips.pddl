( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b844 - block
    b539 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b844 b742 )
    ( on b539 b844 )
    ( clear b539 )
  )
  ( :goal
    ( and
      ( clear b742 )
    )
  )
)
