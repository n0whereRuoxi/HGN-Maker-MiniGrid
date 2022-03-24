( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b630 - block
    b383 - block
    b502 - block
    b822 - block
    b196 - block
    b254 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b383 b630 )
    ( on b502 b383 )
    ( on b822 b502 )
    ( on b196 b822 )
    ( on b254 b196 )
    ( clear b254 )
  )
  ( :goal
    ( and
      ( clear b630 )
    )
  )
)
