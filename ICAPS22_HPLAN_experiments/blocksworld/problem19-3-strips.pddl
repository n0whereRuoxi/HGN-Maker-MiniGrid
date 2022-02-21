( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b362 - block
    b295 - block
    b801 - block
    b882 - block
    b238 - block
    b763 - block
    b124 - block
    b235 - block
    b165 - block
    b563 - block
    b478 - block
    b534 - block
    b267 - block
    b536 - block
    b302 - block
    b83 - block
    b406 - block
    b164 - block
    b12 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b362 b431 )
    ( on b295 b362 )
    ( on b801 b295 )
    ( on b882 b801 )
    ( on b238 b882 )
    ( on b763 b238 )
    ( on b124 b763 )
    ( on b235 b124 )
    ( on b165 b235 )
    ( on b563 b165 )
    ( on b478 b563 )
    ( on b534 b478 )
    ( on b267 b534 )
    ( on b536 b267 )
    ( on b302 b536 )
    ( on b83 b302 )
    ( on b406 b83 )
    ( on b164 b406 )
    ( on b12 b164 )
    ( clear b12 )
  )
  ( :goal
    ( and
      ( clear b431 )
    )
  )
)
