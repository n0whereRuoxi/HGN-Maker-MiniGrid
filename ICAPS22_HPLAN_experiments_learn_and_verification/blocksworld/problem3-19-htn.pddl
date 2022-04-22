( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b9 - block
    b65 - block
    b782 - block
    b962 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b9 )
    ( on b65 b9 )
    ( on b782 b65 )
    ( on b962 b782 )
    ( clear b962 )
  )
  ( :tasks
    ( Make-3Pile b65 b782 b962 )
  )
)