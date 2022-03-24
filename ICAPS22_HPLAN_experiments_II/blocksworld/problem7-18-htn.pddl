( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b390 - block
    b114 - block
    b814 - block
    b269 - block
    b482 - block
    b554 - block
    b703 - block
    b696 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b390 )
    ( on b114 b390 )
    ( on b814 b114 )
    ( on b269 b814 )
    ( on b482 b269 )
    ( on b554 b482 )
    ( on b703 b554 )
    ( on b696 b703 )
    ( clear b696 )
  )
  ( :tasks
    ( Make-7Pile b114 b814 b269 b482 b554 b703 b696 )
  )
)
