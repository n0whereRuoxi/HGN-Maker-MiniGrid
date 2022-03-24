( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b128 - block
    b912 - block
    b82 - block
    b478 - block
    b759 - block
    b886 - block
    b749 - block
    b628 - block
    b831 - block
    b770 - block
    b858 - block
    b42 - block
    b974 - block
    b318 - block
    b372 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b128 b203 )
    ( on b912 b128 )
    ( on b82 b912 )
    ( on b478 b82 )
    ( on b759 b478 )
    ( on b886 b759 )
    ( on b749 b886 )
    ( on b628 b749 )
    ( on b831 b628 )
    ( on b770 b831 )
    ( on b858 b770 )
    ( on b42 b858 )
    ( on b974 b42 )
    ( on b318 b974 )
    ( on b372 b318 )
    ( clear b372 )
  )
  ( :goal
    ( and
      ( clear b203 )
    )
  )
)
