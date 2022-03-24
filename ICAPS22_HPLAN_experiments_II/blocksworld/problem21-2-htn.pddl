( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b211 - block
    b559 - block
    b103 - block
    b571 - block
    b370 - block
    b950 - block
    b27 - block
    b41 - block
    b386 - block
    b804 - block
    b288 - block
    b295 - block
    b180 - block
    b622 - block
    b201 - block
    b168 - block
    b607 - block
    b802 - block
    b363 - block
    b883 - block
    b326 - block
    b770 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b211 )
    ( on b559 b211 )
    ( on b103 b559 )
    ( on b571 b103 )
    ( on b370 b571 )
    ( on b950 b370 )
    ( on b27 b950 )
    ( on b41 b27 )
    ( on b386 b41 )
    ( on b804 b386 )
    ( on b288 b804 )
    ( on b295 b288 )
    ( on b180 b295 )
    ( on b622 b180 )
    ( on b201 b622 )
    ( on b168 b201 )
    ( on b607 b168 )
    ( on b802 b607 )
    ( on b363 b802 )
    ( on b883 b363 )
    ( on b326 b883 )
    ( on b770 b326 )
    ( clear b770 )
  )
  ( :tasks
    ( Make-21Pile b559 b103 b571 b370 b950 b27 b41 b386 b804 b288 b295 b180 b622 b201 b168 b607 b802 b363 b883 b326 b770 )
  )
)
