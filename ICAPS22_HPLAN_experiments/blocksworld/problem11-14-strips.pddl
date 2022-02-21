( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b712 - block
    b634 - block
    b770 - block
    b148 - block
    b788 - block
    b954 - block
    b108 - block
    b35 - block
    b379 - block
    b583 - block
    b546 - block
    b796 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b712 )
    ( on b634 b712 )
    ( on b770 b634 )
    ( on b148 b770 )
    ( on b788 b148 )
    ( on b954 b788 )
    ( on b108 b954 )
    ( on b35 b108 )
    ( on b379 b35 )
    ( on b583 b379 )
    ( on b546 b583 )
    ( on b796 b546 )
    ( clear b796 )
  )
  ( :goal
    ( and
      ( clear b712 )
    )
  )
)
