( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b523 - block
    b902 - block
    b34 - block
    b605 - block
    b382 - block
    b50 - block
    b944 - block
    b753 - block
    b202 - block
    b870 - block
    b869 - block
    b750 - block
    b466 - block
    b527 - block
    b577 - block
    b766 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b523 )
    ( on b902 b523 )
    ( on b34 b902 )
    ( on b605 b34 )
    ( on b382 b605 )
    ( on b50 b382 )
    ( on b944 b50 )
    ( on b753 b944 )
    ( on b202 b753 )
    ( on b870 b202 )
    ( on b869 b870 )
    ( on b750 b869 )
    ( on b466 b750 )
    ( on b527 b466 )
    ( on b577 b527 )
    ( on b766 b577 )
    ( clear b766 )
  )
  ( :goal
    ( and
      ( clear b523 )
    )
  )
)
