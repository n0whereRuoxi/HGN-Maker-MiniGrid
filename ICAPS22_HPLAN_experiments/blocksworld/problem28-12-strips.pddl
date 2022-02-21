( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b739 - block
    b929 - block
    b522 - block
    b487 - block
    b669 - block
    b633 - block
    b282 - block
    b566 - block
    b7 - block
    b622 - block
    b733 - block
    b621 - block
    b461 - block
    b603 - block
    b555 - block
    b313 - block
    b223 - block
    b199 - block
    b856 - block
    b373 - block
    b578 - block
    b558 - block
    b972 - block
    b294 - block
    b678 - block
    b927 - block
    b613 - block
    b163 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b739 b918 )
    ( on b929 b739 )
    ( on b522 b929 )
    ( on b487 b522 )
    ( on b669 b487 )
    ( on b633 b669 )
    ( on b282 b633 )
    ( on b566 b282 )
    ( on b7 b566 )
    ( on b622 b7 )
    ( on b733 b622 )
    ( on b621 b733 )
    ( on b461 b621 )
    ( on b603 b461 )
    ( on b555 b603 )
    ( on b313 b555 )
    ( on b223 b313 )
    ( on b199 b223 )
    ( on b856 b199 )
    ( on b373 b856 )
    ( on b578 b373 )
    ( on b558 b578 )
    ( on b972 b558 )
    ( on b294 b972 )
    ( on b678 b294 )
    ( on b927 b678 )
    ( on b613 b927 )
    ( on b163 b613 )
    ( clear b163 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
