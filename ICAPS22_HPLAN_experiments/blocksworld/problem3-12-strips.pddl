( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b711 - block
    b330 - block
    b202 - block
    b966 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b711 )
    ( on b330 b711 )
    ( on b202 b330 )
    ( on b966 b202 )
    ( clear b966 )
  )
  ( :goal
    ( and
      ( clear b711 )
      ( clear b711 )
      ( clear b711 )
      ( clear b711 )
    )
  )
)
