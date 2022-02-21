( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b5 - block
    b974 - block
    b711 - block
    b858 - block
    b976 - block
    b576 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b5 )
    ( on b974 b5 )
    ( on b711 b974 )
    ( on b858 b711 )
    ( on b976 b858 )
    ( on b576 b976 )
    ( clear b576 )
  )
  ( :goal
    ( and
      ( clear b5 )
      ( clear b5 )
      ( clear b5 )
      ( clear b5 )
      ( clear b5 )
      ( clear b5 )
    )
  )
)
