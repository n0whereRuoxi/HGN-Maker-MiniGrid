( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b560 - block
    b879 - block
    b590 - block
    b737 - block
    b603 - block
    b111 - block
    b171 - block
    b74 - block
    b731 - block
    b953 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b879 b560 )
    ( on b590 b879 )
    ( on b737 b590 )
    ( on b603 b737 )
    ( on b111 b603 )
    ( on b171 b111 )
    ( on b74 b171 )
    ( on b731 b74 )
    ( on b953 b731 )
    ( clear b953 )
  )
  ( :goal
    ( and
      ( clear b560 )
    )
  )
)
