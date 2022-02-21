( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b51 - block
    b825 - block
    b998 - block
    b244 - block
    b895 - block
    b776 - block
    b600 - block
    b959 - block
    b711 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b51 )
    ( on b825 b51 )
    ( on b998 b825 )
    ( on b244 b998 )
    ( on b895 b244 )
    ( on b776 b895 )
    ( on b600 b776 )
    ( on b959 b600 )
    ( on b711 b959 )
    ( clear b711 )
  )
  ( :goal
    ( and
      ( clear b51 )
    )
  )
)
