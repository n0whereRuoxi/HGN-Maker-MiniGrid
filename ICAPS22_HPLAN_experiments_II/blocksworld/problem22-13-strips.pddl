( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b763 - block
    b610 - block
    b854 - block
    b132 - block
    b100 - block
    b524 - block
    b271 - block
    b777 - block
    b809 - block
    b603 - block
    b368 - block
    b386 - block
    b437 - block
    b936 - block
    b919 - block
    b970 - block
    b282 - block
    b671 - block
    b27 - block
    b341 - block
    b759 - block
    b961 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b763 )
    ( on b610 b763 )
    ( on b854 b610 )
    ( on b132 b854 )
    ( on b100 b132 )
    ( on b524 b100 )
    ( on b271 b524 )
    ( on b777 b271 )
    ( on b809 b777 )
    ( on b603 b809 )
    ( on b368 b603 )
    ( on b386 b368 )
    ( on b437 b386 )
    ( on b936 b437 )
    ( on b919 b936 )
    ( on b970 b919 )
    ( on b282 b970 )
    ( on b671 b282 )
    ( on b27 b671 )
    ( on b341 b27 )
    ( on b759 b341 )
    ( on b961 b759 )
    ( on b75 b961 )
    ( clear b75 )
  )
  ( :goal
    ( and
      ( clear b763 )
    )
  )
)
