( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b631 - block
    b711 - block
    b505 - block
    b221 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b631 )
    ( on b711 b631 )
    ( on b505 b711 )
    ( on b221 b505 )
    ( clear b221 )
  )
  ( :goal
    ( and
      ( clear b631 )
    )
  )
)
