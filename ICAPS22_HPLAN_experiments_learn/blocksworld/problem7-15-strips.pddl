( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b245 - block
    b973 - block
    b234 - block
    b994 - block
    b592 - block
    b913 - block
    b74 - block
    b56 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b245 )
    ( on b973 b245 )
    ( on b234 b973 )
    ( on b994 b234 )
    ( on b592 b994 )
    ( on b913 b592 )
    ( on b74 b913 )
    ( on b56 b74 )
    ( clear b56 )
  )
  ( :goal
    ( and
      ( clear b245 )
    )
  )
)
