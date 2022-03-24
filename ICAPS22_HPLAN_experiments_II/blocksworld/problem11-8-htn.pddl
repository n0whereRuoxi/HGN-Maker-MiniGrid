( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b454 - block
    b48 - block
    b427 - block
    b459 - block
    b125 - block
    b355 - block
    b703 - block
    b381 - block
    b198 - block
    b244 - block
    b554 - block
    b617 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b454 )
    ( on b48 b454 )
    ( on b427 b48 )
    ( on b459 b427 )
    ( on b125 b459 )
    ( on b355 b125 )
    ( on b703 b355 )
    ( on b381 b703 )
    ( on b198 b381 )
    ( on b244 b198 )
    ( on b554 b244 )
    ( on b617 b554 )
    ( clear b617 )
  )
  ( :tasks
    ( Make-11Pile b48 b427 b459 b125 b355 b703 b381 b198 b244 b554 b617 )
  )
)
