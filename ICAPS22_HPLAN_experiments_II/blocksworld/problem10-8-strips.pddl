( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b858 - block
    b933 - block
    b841 - block
    b86 - block
    b274 - block
    b671 - block
    b804 - block
    b907 - block
    b318 - block
    b727 - block
    b755 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b858 )
    ( on b933 b858 )
    ( on b841 b933 )
    ( on b86 b841 )
    ( on b274 b86 )
    ( on b671 b274 )
    ( on b804 b671 )
    ( on b907 b804 )
    ( on b318 b907 )
    ( on b727 b318 )
    ( on b755 b727 )
    ( clear b755 )
  )
  ( :goal
    ( and
      ( clear b858 )
    )
  )
)
