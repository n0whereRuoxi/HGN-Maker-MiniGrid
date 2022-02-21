( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b396 - block
    b8 - block
    b857 - block
    b73 - block
    b72 - block
    b58 - block
    b983 - block
    b640 - block
    b992 - block
    b645 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b396 )
    ( on b8 b396 )
    ( on b857 b8 )
    ( on b73 b857 )
    ( on b72 b73 )
    ( on b58 b72 )
    ( on b983 b58 )
    ( on b640 b983 )
    ( on b992 b640 )
    ( on b645 b992 )
    ( on b452 b645 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b396 )
    )
  )
)
