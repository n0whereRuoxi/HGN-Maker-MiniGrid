( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b193 - block
    b217 - block
    b98 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b193 )
    ( on b217 b193 )
    ( on b98 b217 )
    ( clear b98 )
  )
  ( :tasks
    ( Make-2Pile b217 b98 )
  )
)
