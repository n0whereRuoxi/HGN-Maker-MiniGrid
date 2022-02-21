( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b175 - block
    b544 - block
    b381 - block
    b625 - block
    b749 - block
    b645 - block
    b272 - block
    b796 - block
    b982 - block
    b159 - block
    b105 - block
    b881 - block
    b91 - block
    b530 - block
    b489 - block
    b992 - block
    b316 - block
    b468 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b175 )
    ( on b544 b175 )
    ( on b381 b544 )
    ( on b625 b381 )
    ( on b749 b625 )
    ( on b645 b749 )
    ( on b272 b645 )
    ( on b796 b272 )
    ( on b982 b796 )
    ( on b159 b982 )
    ( on b105 b159 )
    ( on b881 b105 )
    ( on b91 b881 )
    ( on b530 b91 )
    ( on b489 b530 )
    ( on b992 b489 )
    ( on b316 b992 )
    ( on b468 b316 )
    ( on b512 b468 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b175 )
    )
  )
)
