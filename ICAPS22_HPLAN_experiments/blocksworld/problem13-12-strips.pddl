( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b170 - block
    b471 - block
    b875 - block
    b888 - block
    b668 - block
    b754 - block
    b20 - block
    b867 - block
    b926 - block
    b246 - block
    b842 - block
    b360 - block
    b992 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b170 )
    ( on b471 b170 )
    ( on b875 b471 )
    ( on b888 b875 )
    ( on b668 b888 )
    ( on b754 b668 )
    ( on b20 b754 )
    ( on b867 b20 )
    ( on b926 b867 )
    ( on b246 b926 )
    ( on b842 b246 )
    ( on b360 b842 )
    ( on b992 b360 )
    ( on b571 b992 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b170 )
    )
  )
)
