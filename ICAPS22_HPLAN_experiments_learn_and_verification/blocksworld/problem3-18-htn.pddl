( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b767 - block
    b204 - block
    b198 - block
    b758 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b204 b767 )
    ( on b198 b204 )
    ( on b758 b198 )
    ( clear b758 )
  )
  ( :tasks
    ( Make-3Pile b204 b198 b758 )
  )
)