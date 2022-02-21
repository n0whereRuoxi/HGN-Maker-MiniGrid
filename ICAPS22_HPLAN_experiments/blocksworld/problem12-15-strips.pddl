( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b560 - block
    b380 - block
    b855 - block
    b848 - block
    b43 - block
    b491 - block
    b833 - block
    b80 - block
    b552 - block
    b854 - block
    b745 - block
    b869 - block
    b38 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b380 b560 )
    ( on b855 b380 )
    ( on b848 b855 )
    ( on b43 b848 )
    ( on b491 b43 )
    ( on b833 b491 )
    ( on b80 b833 )
    ( on b552 b80 )
    ( on b854 b552 )
    ( on b745 b854 )
    ( on b869 b745 )
    ( on b38 b869 )
    ( clear b38 )
  )
  ( :goal
    ( and
      ( clear b560 )
    )
  )
)
