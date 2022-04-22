( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b960 - block
    b213 - block
    b223 - block
    b358 - block
    b216 - block
    b662 - block
    b799 - block
    b587 - block
    b844 - block
    b771 - block
    b765 - block
    b834 - block
    b200 - block
    b722 - block
    b357 - block
    b633 - block
    b854 - block
    b212 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b960 b424 )
    ( on b213 b960 )
    ( on b223 b213 )
    ( on b358 b223 )
    ( on b216 b358 )
    ( on b662 b216 )
    ( on b799 b662 )
    ( on b587 b799 )
    ( on b844 b587 )
    ( on b771 b844 )
    ( on b765 b771 )
    ( on b834 b765 )
    ( on b200 b834 )
    ( on b722 b200 )
    ( on b357 b722 )
    ( on b633 b357 )
    ( on b854 b633 )
    ( on b212 b854 )
    ( clear b212 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
