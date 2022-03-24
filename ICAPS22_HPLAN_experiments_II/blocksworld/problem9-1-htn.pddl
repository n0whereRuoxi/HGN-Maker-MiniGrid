( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b146 - block
    b82 - block
    b177 - block
    b651 - block
    b516 - block
    b798 - block
    b503 - block
    b762 - block
    b595 - block
    b195 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b146 )
    ( on b82 b146 )
    ( on b177 b82 )
    ( on b651 b177 )
    ( on b516 b651 )
    ( on b798 b516 )
    ( on b503 b798 )
    ( on b762 b503 )
    ( on b595 b762 )
    ( on b195 b595 )
    ( clear b195 )
  )
  ( :tasks
    ( Make-9Pile b82 b177 b651 b516 b798 b503 b762 b595 b195 )
  )
)
