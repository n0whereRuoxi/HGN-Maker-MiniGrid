( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b409 - block
    b432 - block
    b641 - block
    b788 - block
    b83 - block
    b908 - block
    b534 - block
    b245 - block
    b121 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b409 )
    ( on b432 b409 )
    ( on b641 b432 )
    ( on b788 b641 )
    ( on b83 b788 )
    ( on b908 b83 )
    ( on b534 b908 )
    ( on b245 b534 )
    ( on b121 b245 )
    ( clear b121 )
  )
  ( :goal
    ( and
      ( clear b409 )
    )
  )
)
