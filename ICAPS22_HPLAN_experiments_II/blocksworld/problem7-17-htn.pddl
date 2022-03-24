( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b461 - block
    b172 - block
    b316 - block
    b343 - block
    b658 - block
    b978 - block
    b238 - block
    b402 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b461 )
    ( on b172 b461 )
    ( on b316 b172 )
    ( on b343 b316 )
    ( on b658 b343 )
    ( on b978 b658 )
    ( on b238 b978 )
    ( on b402 b238 )
    ( clear b402 )
  )
  ( :tasks
    ( Make-7Pile b172 b316 b343 b658 b978 b238 b402 )
  )
)
