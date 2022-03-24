( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b52 - block
    b168 - block
    b826 - block
    b329 - block
    b414 - block
    b957 - block
    b942 - block
    b108 - block
    b230 - block
    b993 - block
    b569 - block
    b411 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b52 )
    ( on b168 b52 )
    ( on b826 b168 )
    ( on b329 b826 )
    ( on b414 b329 )
    ( on b957 b414 )
    ( on b942 b957 )
    ( on b108 b942 )
    ( on b230 b108 )
    ( on b993 b230 )
    ( on b569 b993 )
    ( on b411 b569 )
    ( clear b411 )
  )
  ( :tasks
    ( Make-11Pile b168 b826 b329 b414 b957 b942 b108 b230 b993 b569 b411 )
  )
)
