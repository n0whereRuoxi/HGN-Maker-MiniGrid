( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b691 - block
    b38 - block
    b593 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b691 b20 )
    ( on b38 b691 )
    ( on b593 b38 )
    ( clear b593 )
  )
  ( :goal
    ( and
      ( clear b20 )
      ( clear b20 )
      ( clear b20 )
      ( clear b20 )
    )
  )
)
