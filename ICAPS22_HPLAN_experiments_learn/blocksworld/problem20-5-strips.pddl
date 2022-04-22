( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b557 - block
    b953 - block
    b570 - block
    b800 - block
    b470 - block
    b436 - block
    b627 - block
    b154 - block
    b75 - block
    b601 - block
    b411 - block
    b201 - block
    b54 - block
    b548 - block
    b334 - block
    b556 - block
    b921 - block
    b919 - block
    b943 - block
    b542 - block
    b650 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b557 )
    ( on b953 b557 )
    ( on b570 b953 )
    ( on b800 b570 )
    ( on b470 b800 )
    ( on b436 b470 )
    ( on b627 b436 )
    ( on b154 b627 )
    ( on b75 b154 )
    ( on b601 b75 )
    ( on b411 b601 )
    ( on b201 b411 )
    ( on b54 b201 )
    ( on b548 b54 )
    ( on b334 b548 )
    ( on b556 b334 )
    ( on b921 b556 )
    ( on b919 b921 )
    ( on b943 b919 )
    ( on b542 b943 )
    ( on b650 b542 )
    ( clear b650 )
  )
  ( :goal
    ( and
      ( clear b557 )
    )
  )
)
