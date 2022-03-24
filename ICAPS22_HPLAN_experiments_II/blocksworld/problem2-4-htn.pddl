( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b571 - block
    b879 - block
    b295 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b571 )
    ( on b879 b571 )
    ( on b295 b879 )
    ( clear b295 )
  )
  ( :tasks
    ( Make-2Pile b879 b295 )
  )
)
