( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b482 - block
    b992 - block
    b906 - block
    b115 - block
    b189 - block
    b26 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b992 b482 )
    ( on b906 b992 )
    ( on b115 b906 )
    ( on b189 b115 )
    ( on b26 b189 )
    ( clear b26 )
  )
  ( :goal
    ( and
      ( clear b482 )
    )
  )
)
