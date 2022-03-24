( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b879 - block
    b836 - block
    b113 - block
    b275 - block
    b298 - block
    b315 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b879 )
    ( on b836 b879 )
    ( on b113 b836 )
    ( on b275 b113 )
    ( on b298 b275 )
    ( on b315 b298 )
    ( clear b315 )
  )
  ( :tasks
    ( Make-5Pile b836 b113 b275 b298 b315 )
  )
)
