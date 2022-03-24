( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b996 - block
    b294 - block
    b577 - block
    b808 - block
    b516 - block
    b552 - block
    b819 - block
    b495 - block
    b546 - block
    b874 - block
    b581 - block
    b237 - block
    b545 - block
    b438 - block
    b613 - block
    b392 - block
    b282 - block
    b471 - block
    b853 - block
    b408 - block
    b484 - block
    b851 - block
    b719 - block
    b106 - block
    b395 - block
    b800 - block
    b883 - block
    b953 - block
    b11 - block
    b337 - block
    b900 - block
    b483 - block
    b881 - block
    b796 - block
    b747 - block
    b993 - block
    b947 - block
    b62 - block
    b842 - block
    b221 - block
    b170 - block
    b114 - block
    b876 - block
    b927 - block
    b266 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b996 )
    ( on b294 b996 )
    ( on b577 b294 )
    ( on b808 b577 )
    ( on b516 b808 )
    ( on b552 b516 )
    ( on b819 b552 )
    ( on b495 b819 )
    ( on b546 b495 )
    ( on b874 b546 )
    ( on b581 b874 )
    ( on b237 b581 )
    ( on b545 b237 )
    ( on b438 b545 )
    ( on b613 b438 )
    ( on b392 b613 )
    ( on b282 b392 )
    ( on b471 b282 )
    ( on b853 b471 )
    ( on b408 b853 )
    ( on b484 b408 )
    ( on b851 b484 )
    ( on b719 b851 )
    ( on b106 b719 )
    ( on b395 b106 )
    ( on b800 b395 )
    ( on b883 b800 )
    ( on b953 b883 )
    ( on b11 b953 )
    ( on b337 b11 )
    ( on b900 b337 )
    ( on b483 b900 )
    ( on b881 b483 )
    ( on b796 b881 )
    ( on b747 b796 )
    ( on b993 b747 )
    ( on b947 b993 )
    ( on b62 b947 )
    ( on b842 b62 )
    ( on b221 b842 )
    ( on b170 b221 )
    ( on b114 b170 )
    ( on b876 b114 )
    ( on b927 b876 )
    ( on b266 b927 )
    ( clear b266 )
  )
  ( :goal
    ( and
      ( clear b996 )
    )
  )
)
