( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b621 - block
    b899 - block
    b396 - block
    b447 - block
    b524 - block
    b198 - block
    b363 - block
    b432 - block
    b317 - block
    b804 - block
    b357 - block
    b602 - block
    b90 - block
    b456 - block
    b508 - block
    b726 - block
    b720 - block
    b627 - block
    b485 - block
    b778 - block
    b744 - block
    b306 - block
    b501 - block
    b54 - block
    b84 - block
    b985 - block
    b133 - block
    b105 - block
    b139 - block
    b582 - block
    b564 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b621 b93 )
    ( on b899 b621 )
    ( on b396 b899 )
    ( on b447 b396 )
    ( on b524 b447 )
    ( on b198 b524 )
    ( on b363 b198 )
    ( on b432 b363 )
    ( on b317 b432 )
    ( on b804 b317 )
    ( on b357 b804 )
    ( on b602 b357 )
    ( on b90 b602 )
    ( on b456 b90 )
    ( on b508 b456 )
    ( on b726 b508 )
    ( on b720 b726 )
    ( on b627 b720 )
    ( on b485 b627 )
    ( on b778 b485 )
    ( on b744 b778 )
    ( on b306 b744 )
    ( on b501 b306 )
    ( on b54 b501 )
    ( on b84 b54 )
    ( on b985 b84 )
    ( on b133 b985 )
    ( on b105 b133 )
    ( on b139 b105 )
    ( on b582 b139 )
    ( on b564 b582 )
    ( clear b564 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
