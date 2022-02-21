( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b383 - block
    b467 - block
    b687 - block
    b744 - block
    b820 - block
    b537 - block
    b281 - block
    b512 - block
    b876 - block
    b650 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b383 )
    ( on b467 b383 )
    ( on b687 b467 )
    ( on b744 b687 )
    ( on b820 b744 )
    ( on b537 b820 )
    ( on b281 b537 )
    ( on b512 b281 )
    ( on b876 b512 )
    ( on b650 b876 )
    ( clear b650 )
  )
  ( :goal
    ( and
      ( clear b383 )
    )
  )
)
