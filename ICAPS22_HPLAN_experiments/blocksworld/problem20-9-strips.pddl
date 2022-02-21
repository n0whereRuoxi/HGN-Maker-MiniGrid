( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b681 - block
    b164 - block
    b377 - block
    b436 - block
    b149 - block
    b358 - block
    b825 - block
    b516 - block
    b964 - block
    b129 - block
    b790 - block
    b433 - block
    b651 - block
    b347 - block
    b787 - block
    b951 - block
    b616 - block
    b900 - block
    b381 - block
    b171 - block
    b439 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b681 )
    ( on b164 b681 )
    ( on b377 b164 )
    ( on b436 b377 )
    ( on b149 b436 )
    ( on b358 b149 )
    ( on b825 b358 )
    ( on b516 b825 )
    ( on b964 b516 )
    ( on b129 b964 )
    ( on b790 b129 )
    ( on b433 b790 )
    ( on b651 b433 )
    ( on b347 b651 )
    ( on b787 b347 )
    ( on b951 b787 )
    ( on b616 b951 )
    ( on b900 b616 )
    ( on b381 b900 )
    ( on b171 b381 )
    ( on b439 b171 )
    ( clear b439 )
  )
  ( :goal
    ( and
      ( clear b681 )
    )
  )
)
