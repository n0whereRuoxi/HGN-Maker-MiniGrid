( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b261 - block
    b292 - block
    b132 - block
    b442 - block
    b881 - block
    b348 - block
    b697 - block
    b680 - block
    b98 - block
    b239 - block
    b363 - block
    b172 - block
    b519 - block
    b714 - block
    b398 - block
    b939 - block
    b963 - block
    b790 - block
    b396 - block
    b687 - block
    b983 - block
    b77 - block
    b786 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b261 )
    ( on b292 b261 )
    ( on b132 b292 )
    ( on b442 b132 )
    ( on b881 b442 )
    ( on b348 b881 )
    ( on b697 b348 )
    ( on b680 b697 )
    ( on b98 b680 )
    ( on b239 b98 )
    ( on b363 b239 )
    ( on b172 b363 )
    ( on b519 b172 )
    ( on b714 b519 )
    ( on b398 b714 )
    ( on b939 b398 )
    ( on b963 b939 )
    ( on b790 b963 )
    ( on b396 b790 )
    ( on b687 b396 )
    ( on b983 b687 )
    ( on b77 b983 )
    ( on b786 b77 )
    ( clear b786 )
  )
  ( :goal
    ( and
      ( clear b261 )
    )
  )
)
