( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b78 - block
    b944 - block
    b563 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b78 )
    ( on b944 b78 )
    ( on b563 b944 )
    ( on b15 b563 )
    ( clear b15 )
  )
  ( :tasks
    ( Make-3Pile b944 b563 b15 )
  )
)
