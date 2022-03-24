( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b777 - block
    b109 - block
    b82 - block
    b695 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b777 )
    ( on b109 b777 )
    ( on b82 b109 )
    ( on b695 b82 )
    ( clear b695 )
  )
  ( :tasks
    ( Make-3Pile b109 b82 b695 )
  )
)
