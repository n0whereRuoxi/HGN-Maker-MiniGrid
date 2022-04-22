( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b947 - block
    b440 - block
    b350 - block
    b108 - block
    b534 - block
    b65 - block
    b870 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b947 )
    ( on b440 b947 )
    ( on b350 b440 )
    ( on b108 b350 )
    ( on b534 b108 )
    ( on b65 b534 )
    ( on b870 b65 )
    ( clear b870 )
  )
  ( :goal
    ( and
      ( clear b947 )
    )
  )
)
