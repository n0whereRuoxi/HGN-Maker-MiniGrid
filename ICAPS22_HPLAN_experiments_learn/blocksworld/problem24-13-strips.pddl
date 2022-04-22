( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b805 - block
    b478 - block
    b269 - block
    b943 - block
    b818 - block
    b800 - block
    b677 - block
    b279 - block
    b27 - block
    b987 - block
    b58 - block
    b562 - block
    b401 - block
    b472 - block
    b662 - block
    b198 - block
    b106 - block
    b239 - block
    b59 - block
    b959 - block
    b638 - block
    b193 - block
    b215 - block
    b896 - block
    b163 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b805 )
    ( on b478 b805 )
    ( on b269 b478 )
    ( on b943 b269 )
    ( on b818 b943 )
    ( on b800 b818 )
    ( on b677 b800 )
    ( on b279 b677 )
    ( on b27 b279 )
    ( on b987 b27 )
    ( on b58 b987 )
    ( on b562 b58 )
    ( on b401 b562 )
    ( on b472 b401 )
    ( on b662 b472 )
    ( on b198 b662 )
    ( on b106 b198 )
    ( on b239 b106 )
    ( on b59 b239 )
    ( on b959 b59 )
    ( on b638 b959 )
    ( on b193 b638 )
    ( on b215 b193 )
    ( on b896 b215 )
    ( on b163 b896 )
    ( clear b163 )
  )
  ( :goal
    ( and
      ( clear b805 )
    )
  )
)
