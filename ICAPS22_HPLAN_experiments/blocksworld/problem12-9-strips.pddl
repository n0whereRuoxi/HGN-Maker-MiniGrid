( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b514 - block
    b71 - block
    b138 - block
    b232 - block
    b746 - block
    b848 - block
    b67 - block
    b181 - block
    b861 - block
    b424 - block
    b309 - block
    b986 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b514 b293 )
    ( on b71 b514 )
    ( on b138 b71 )
    ( on b232 b138 )
    ( on b746 b232 )
    ( on b848 b746 )
    ( on b67 b848 )
    ( on b181 b67 )
    ( on b861 b181 )
    ( on b424 b861 )
    ( on b309 b424 )
    ( on b986 b309 )
    ( clear b986 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
