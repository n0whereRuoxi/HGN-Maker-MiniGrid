( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b80 - block
    b418 - block
    b779 - block
    b553 - block
    b120 - block
    b333 - block
    b283 - block
    b485 - block
    b434 - block
    b566 - block
    b132 - block
    b524 - block
    b520 - block
    b987 - block
    b288 - block
    b739 - block
    b94 - block
    b703 - block
    b490 - block
    b817 - block
    b294 - block
    b629 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b80 )
    ( on b418 b80 )
    ( on b779 b418 )
    ( on b553 b779 )
    ( on b120 b553 )
    ( on b333 b120 )
    ( on b283 b333 )
    ( on b485 b283 )
    ( on b434 b485 )
    ( on b566 b434 )
    ( on b132 b566 )
    ( on b524 b132 )
    ( on b520 b524 )
    ( on b987 b520 )
    ( on b288 b987 )
    ( on b739 b288 )
    ( on b94 b739 )
    ( on b703 b94 )
    ( on b490 b703 )
    ( on b817 b490 )
    ( on b294 b817 )
    ( on b629 b294 )
    ( clear b629 )
  )
  ( :tasks
    ( Make-21Pile b418 b779 b553 b120 b333 b283 b485 b434 b566 b132 b524 b520 b987 b288 b739 b94 b703 b490 b817 b294 b629 )
  )
)
