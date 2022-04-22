( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b274 - block
    b630 - block
    b835 - block
    b624 - block
    b550 - block
    b55 - block
    b142 - block
    b385 - block
    b290 - block
    b251 - block
    b232 - block
    b523 - block
    b969 - block
    b932 - block
    b102 - block
    b350 - block
    b988 - block
    b582 - block
    b800 - block
    b477 - block
    b796 - block
    b468 - block
    b188 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b274 )
    ( on b630 b274 )
    ( on b835 b630 )
    ( on b624 b835 )
    ( on b550 b624 )
    ( on b55 b550 )
    ( on b142 b55 )
    ( on b385 b142 )
    ( on b290 b385 )
    ( on b251 b290 )
    ( on b232 b251 )
    ( on b523 b232 )
    ( on b969 b523 )
    ( on b932 b969 )
    ( on b102 b932 )
    ( on b350 b102 )
    ( on b988 b350 )
    ( on b582 b988 )
    ( on b800 b582 )
    ( on b477 b800 )
    ( on b796 b477 )
    ( on b468 b796 )
    ( on b188 b468 )
    ( clear b188 )
  )
  ( :goal
    ( and
      ( clear b274 )
    )
  )
)
