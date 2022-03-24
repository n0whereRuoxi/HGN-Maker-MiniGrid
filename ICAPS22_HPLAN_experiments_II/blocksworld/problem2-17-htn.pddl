( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b885 - block
    b554 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b885 )
    ( on b554 b885 )
    ( on b617 b554 )
    ( clear b617 )
  )
  ( :tasks
    ( Make-2Pile b554 b617 )
  )
)
