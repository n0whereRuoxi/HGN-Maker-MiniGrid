( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b414 - block
    b989 - block
    b239 - block
    b696 - block
    b611 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b414 )
    ( on b989 b414 )
    ( on b239 b989 )
    ( on b696 b239 )
    ( on b611 b696 )
    ( clear b611 )
  )
  ( :goal
    ( and
      ( clear b414 )
      ( clear b414 )
      ( clear b414 )
      ( clear b414 )
      ( clear b414 )
    )
  )
)
