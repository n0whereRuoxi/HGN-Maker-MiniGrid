( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b860 - block
    b305 - block
    b441 - block
    b698 - block
    b166 - block
    b30 - block
    b667 - block
    b637 - block
    b482 - block
    b784 - block
    b641 - block
    b179 - block
    b325 - block
    b87 - block
    b517 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b860 b20 )
    ( on b305 b860 )
    ( on b441 b305 )
    ( on b698 b441 )
    ( on b166 b698 )
    ( on b30 b166 )
    ( on b667 b30 )
    ( on b637 b667 )
    ( on b482 b637 )
    ( on b784 b482 )
    ( on b641 b784 )
    ( on b179 b641 )
    ( on b325 b179 )
    ( on b87 b325 )
    ( on b517 b87 )
    ( clear b517 )
  )
  ( :goal
    ( and
      ( clear b20 )
    )
  )
)
