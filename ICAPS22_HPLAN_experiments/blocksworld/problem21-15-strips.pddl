( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b116 - block
    b280 - block
    b395 - block
    b121 - block
    b824 - block
    b300 - block
    b20 - block
    b201 - block
    b37 - block
    b145 - block
    b316 - block
    b620 - block
    b213 - block
    b248 - block
    b442 - block
    b737 - block
    b243 - block
    b516 - block
    b767 - block
    b401 - block
    b723 - block
    b198 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b116 )
    ( on b280 b116 )
    ( on b395 b280 )
    ( on b121 b395 )
    ( on b824 b121 )
    ( on b300 b824 )
    ( on b20 b300 )
    ( on b201 b20 )
    ( on b37 b201 )
    ( on b145 b37 )
    ( on b316 b145 )
    ( on b620 b316 )
    ( on b213 b620 )
    ( on b248 b213 )
    ( on b442 b248 )
    ( on b737 b442 )
    ( on b243 b737 )
    ( on b516 b243 )
    ( on b767 b516 )
    ( on b401 b767 )
    ( on b723 b401 )
    ( on b198 b723 )
    ( clear b198 )
  )
  ( :goal
    ( and
      ( clear b116 )
    )
  )
)
