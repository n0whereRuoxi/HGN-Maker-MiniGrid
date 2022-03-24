( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b932 - block
    b298 - block
    b930 - block
    b765 - block
    b84 - block
    b581 - block
    b198 - block
    b131 - block
    b938 - block
    b92 - block
    b444 - block
    b722 - block
    b788 - block
    b190 - block
    b733 - block
    b266 - block
    b305 - block
    b210 - block
    b354 - block
    b362 - block
    b532 - block
    b260 - block
    b963 - block
    b968 - block
    b261 - block
    b597 - block
    b203 - block
    b536 - block
    b991 - block
    b415 - block
    b145 - block
    b770 - block
    b769 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b932 b70 )
    ( on b298 b932 )
    ( on b930 b298 )
    ( on b765 b930 )
    ( on b84 b765 )
    ( on b581 b84 )
    ( on b198 b581 )
    ( on b131 b198 )
    ( on b938 b131 )
    ( on b92 b938 )
    ( on b444 b92 )
    ( on b722 b444 )
    ( on b788 b722 )
    ( on b190 b788 )
    ( on b733 b190 )
    ( on b266 b733 )
    ( on b305 b266 )
    ( on b210 b305 )
    ( on b354 b210 )
    ( on b362 b354 )
    ( on b532 b362 )
    ( on b260 b532 )
    ( on b963 b260 )
    ( on b968 b963 )
    ( on b261 b968 )
    ( on b597 b261 )
    ( on b203 b597 )
    ( on b536 b203 )
    ( on b991 b536 )
    ( on b415 b991 )
    ( on b145 b415 )
    ( on b770 b145 )
    ( on b769 b770 )
    ( on b328 b769 )
    ( clear b328 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)
