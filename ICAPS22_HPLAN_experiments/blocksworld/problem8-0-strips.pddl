( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b950 - block
    b703 - block
    b550 - block
    b482 - block
    b647 - block
    b912 - block
    b252 - block
    b348 - block
    b934 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b950 )
    ( on b703 b950 )
    ( on b550 b703 )
    ( on b482 b550 )
    ( on b647 b482 )
    ( on b912 b647 )
    ( on b252 b912 )
    ( on b348 b252 )
    ( on b934 b348 )
    ( clear b934 )
  )
  ( :goal
    ( and
      ( clear b950 )
    )
  )
)
