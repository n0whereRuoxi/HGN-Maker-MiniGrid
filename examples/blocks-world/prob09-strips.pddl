( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b000 - block
    b001 - block
    b002 - block
    b003 - block    
    b004 - block
    b005 - block
    b006 - block
  )
  ( :init
    ( on-table b000 )
    ( on b001 b000 )
    ( on b002 b001 )
    ( on b003 b002 )
    ( clear b003 )
    ( on-table b004 )
    ( on b005 b004 )
    ( on b006 b005 )
    ( clear b006 )
    ( hand-empty )
  )
  ( :goal
    ( and
      ( clear b002 )
    )
  )
)

