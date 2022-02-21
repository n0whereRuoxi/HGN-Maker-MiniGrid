( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b276 - block
    b304 - block
    b869 - block
    b667 - block
    b773 - block
    b396 - block
    b378 - block
    b256 - block
    b186 - block
    b714 - block
    b853 - block
    b489 - block
    b550 - block
    b657 - block
    b926 - block
    b539 - block
    b645 - block
    b683 - block
    b219 - block
    b377 - block
    b792 - block
    b519 - block
    b825 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b276 )
    ( on b304 b276 )
    ( on b869 b304 )
    ( on b667 b869 )
    ( on b773 b667 )
    ( on b396 b773 )
    ( on b378 b396 )
    ( on b256 b378 )
    ( on b186 b256 )
    ( on b714 b186 )
    ( on b853 b714 )
    ( on b489 b853 )
    ( on b550 b489 )
    ( on b657 b550 )
    ( on b926 b657 )
    ( on b539 b926 )
    ( on b645 b539 )
    ( on b683 b645 )
    ( on b219 b683 )
    ( on b377 b219 )
    ( on b792 b377 )
    ( on b519 b792 )
    ( on b825 b519 )
    ( clear b825 )
  )
  ( :goal
    ( and
      ( clear b276 )
    )
  )
)
