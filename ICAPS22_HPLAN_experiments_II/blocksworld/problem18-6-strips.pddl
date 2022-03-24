( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b677 - block
    b108 - block
    b223 - block
    b669 - block
    b176 - block
    b151 - block
    b202 - block
    b305 - block
    b721 - block
    b731 - block
    b8 - block
    b68 - block
    b716 - block
    b29 - block
    b33 - block
    b370 - block
    b598 - block
    b290 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b677 )
    ( on b108 b677 )
    ( on b223 b108 )
    ( on b669 b223 )
    ( on b176 b669 )
    ( on b151 b176 )
    ( on b202 b151 )
    ( on b305 b202 )
    ( on b721 b305 )
    ( on b731 b721 )
    ( on b8 b731 )
    ( on b68 b8 )
    ( on b716 b68 )
    ( on b29 b716 )
    ( on b33 b29 )
    ( on b370 b33 )
    ( on b598 b370 )
    ( on b290 b598 )
    ( on b806 b290 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b677 )
    )
  )
)
