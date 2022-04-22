( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b791 - block
    b74 - block
    b142 - block
    b494 - block
    b697 - block
    b756 - block
    b610 - block
    b305 - block
    b419 - block
    b118 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b791 )
    ( on b74 b791 )
    ( on b142 b74 )
    ( on b494 b142 )
    ( on b697 b494 )
    ( on b756 b697 )
    ( on b610 b756 )
    ( on b305 b610 )
    ( on b419 b305 )
    ( on b118 b419 )
    ( clear b118 )
  )
  ( :goal
    ( and
      ( clear b791 )
    )
  )
)
