( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b4 - block
    b130 - block
    b831 - block
    b420 - block
    b199 - block
    b751 - block
    b637 - block
    b309 - block
    b675 - block
    b178 - block
    b323 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b130 b4 )
    ( on b831 b130 )
    ( on b420 b831 )
    ( on b199 b420 )
    ( on b751 b199 )
    ( on b637 b751 )
    ( on b309 b637 )
    ( on b675 b309 )
    ( on b178 b675 )
    ( on b323 b178 )
    ( on b792 b323 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b4 )
    )
  )
)
