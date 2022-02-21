( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b7 - block
    b114 - block
    b896 - block
    b674 - block
    b26 - block
    b451 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b114 b7 )
    ( on b896 b114 )
    ( on b674 b896 )
    ( on b26 b674 )
    ( on b451 b26 )
    ( on b794 b451 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b7 )
    )
  )
)
