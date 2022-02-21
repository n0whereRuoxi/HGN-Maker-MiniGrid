( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b294 - block
    b864 - block
    b3 - block
    b495 - block
    b13 - block
    b262 - block
    b80 - block
    b900 - block
    b118 - block
    b902 - block
    b288 - block
    b283 - block
    b325 - block
    b774 - block
    b969 - block
    b649 - block
    b641 - block
    b947 - block
    b235 - block
    b295 - block
    b49 - block
    b574 - block
    b218 - block
    b263 - block
    b382 - block
    b2 - block
    b317 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b294 )
    ( on b864 b294 )
    ( on b3 b864 )
    ( on b495 b3 )
    ( on b13 b495 )
    ( on b262 b13 )
    ( on b80 b262 )
    ( on b900 b80 )
    ( on b118 b900 )
    ( on b902 b118 )
    ( on b288 b902 )
    ( on b283 b288 )
    ( on b325 b283 )
    ( on b774 b325 )
    ( on b969 b774 )
    ( on b649 b969 )
    ( on b641 b649 )
    ( on b947 b641 )
    ( on b235 b947 )
    ( on b295 b235 )
    ( on b49 b295 )
    ( on b574 b49 )
    ( on b218 b574 )
    ( on b263 b218 )
    ( on b382 b263 )
    ( on b2 b382 )
    ( on b317 b2 )
    ( clear b317 )
  )
  ( :goal
    ( and
      ( clear b294 )
    )
  )
)
