( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b000 - block
    b001 - block
    b002 - block
    b003 - block    
    b004 - block
  )
  ( :init
    ( on-table b000 )
    ( on b001 b000 )
    ( on b002 b001 )
    ( on b003 b002 )
    ( on b004 b003 )
    ( clear b004 )
    ( hand-empty )
  )
  ( :goal
    ( and
      ( clear b000 )
    )
  )
)

