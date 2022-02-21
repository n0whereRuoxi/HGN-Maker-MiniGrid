( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b200 - block
    b754 - block
    b649 - block
    b283 - block
    b667 - block
    b467 - block
    b295 - block
    b690 - block
    b33 - block
    b527 - block
    b334 - block
    b335 - block
    b946 - block
    b933 - block
    b163 - block
    b90 - block
    b374 - block
    b460 - block
    b685 - block
    b360 - block
    b708 - block
    b977 - block
    b907 - block
    b394 - block
    b399 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b200 )
    ( on b754 b200 )
    ( on b649 b754 )
    ( on b283 b649 )
    ( on b667 b283 )
    ( on b467 b667 )
    ( on b295 b467 )
    ( on b690 b295 )
    ( on b33 b690 )
    ( on b527 b33 )
    ( on b334 b527 )
    ( on b335 b334 )
    ( on b946 b335 )
    ( on b933 b946 )
    ( on b163 b933 )
    ( on b90 b163 )
    ( on b374 b90 )
    ( on b460 b374 )
    ( on b685 b460 )
    ( on b360 b685 )
    ( on b708 b360 )
    ( on b977 b708 )
    ( on b907 b977 )
    ( on b394 b907 )
    ( on b399 b394 )
    ( on b222 b399 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b200 )
    )
  )
)
