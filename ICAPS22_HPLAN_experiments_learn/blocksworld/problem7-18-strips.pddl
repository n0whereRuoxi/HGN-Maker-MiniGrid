( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b774 - block
    b777 - block
    b61 - block
    b129 - block
    b942 - block
    b685 - block
    b896 - block
    b55 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b774 )
    ( on b777 b774 )
    ( on b61 b777 )
    ( on b129 b61 )
    ( on b942 b129 )
    ( on b685 b942 )
    ( on b896 b685 )
    ( on b55 b896 )
    ( clear b55 )
  )
  ( :goal
    ( and
      ( clear b774 )
    )
  )
)
