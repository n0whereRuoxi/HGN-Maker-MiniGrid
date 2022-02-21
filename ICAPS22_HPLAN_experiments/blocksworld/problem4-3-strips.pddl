( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b470 - block
    b427 - block
    b877 - block
    b127 - block
    b46 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b470 )
    ( on b427 b470 )
    ( on b877 b427 )
    ( on b127 b877 )
    ( on b46 b127 )
    ( clear b46 )
  )
  ( :goal
    ( and
      ( clear b470 )
    )
  )
)
