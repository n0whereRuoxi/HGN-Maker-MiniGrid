( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b828 - block
    b426 - block
    b962 - block
    b286 - block
    b421 - block
    b122 - block
    b777 - block
    b720 - block
    b791 - block
    b750 - block
    b471 - block
    b674 - block
    b275 - block
    b66 - block
    b27 - block
    b104 - block
    b417 - block
    b437 - block
    b374 - block
    b51 - block
    b537 - block
    b334 - block
    b428 - block
    b9 - block
    b543 - block
    b658 - block
    b264 - block
    b688 - block
    b465 - block
    b199 - block
    b606 - block
    b463 - block
    b991 - block
    b221 - block
    b949 - block
    b494 - block
    b113 - block
    b461 - block
    b729 - block
    b595 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b828 )
    ( on b426 b828 )
    ( on b962 b426 )
    ( on b286 b962 )
    ( on b421 b286 )
    ( on b122 b421 )
    ( on b777 b122 )
    ( on b720 b777 )
    ( on b791 b720 )
    ( on b750 b791 )
    ( on b471 b750 )
    ( on b674 b471 )
    ( on b275 b674 )
    ( on b66 b275 )
    ( on b27 b66 )
    ( on b104 b27 )
    ( on b417 b104 )
    ( on b437 b417 )
    ( on b374 b437 )
    ( on b51 b374 )
    ( on b537 b51 )
    ( on b334 b537 )
    ( on b428 b334 )
    ( on b9 b428 )
    ( on b543 b9 )
    ( on b658 b543 )
    ( on b264 b658 )
    ( on b688 b264 )
    ( on b465 b688 )
    ( on b199 b465 )
    ( on b606 b199 )
    ( on b463 b606 )
    ( on b991 b463 )
    ( on b221 b991 )
    ( on b949 b221 )
    ( on b494 b949 )
    ( on b113 b494 )
    ( on b461 b113 )
    ( on b729 b461 )
    ( on b595 b729 )
    ( clear b595 )
  )
  ( :goal
    ( and
      ( clear b828 )
    )
  )
)
