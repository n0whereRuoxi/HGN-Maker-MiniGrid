( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b438 - block
    b72 - block
    b889 - block
    b672 - block
    b627 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b438 )
    ( on b72 b438 )
    ( on b889 b72 )
    ( on b672 b889 )
    ( on b627 b672 )
    ( on b789 b627 )
    ( clear b789 )
  )
  ( :goal
    ( and
      ( clear b438 )
      ( clear b438 )
      ( clear b438 )
      ( clear b438 )
      ( clear b438 )
      ( clear b438 )
    )
  )
)
