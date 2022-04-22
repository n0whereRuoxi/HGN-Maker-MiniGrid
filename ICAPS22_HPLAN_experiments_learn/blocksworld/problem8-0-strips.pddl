( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b469 - block
    b974 - block
    b516 - block
    b701 - block
    b34 - block
    b178 - block
    b774 - block
    b923 - block
    b546 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b469 )
    ( on b974 b469 )
    ( on b516 b974 )
    ( on b701 b516 )
    ( on b34 b701 )
    ( on b178 b34 )
    ( on b774 b178 )
    ( on b923 b774 )
    ( on b546 b923 )
    ( clear b546 )
  )
  ( :goal
    ( and
      ( clear b469 )
    )
  )
)
