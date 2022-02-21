( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b634 - block
    b668 - block
    b407 - block
    b309 - block
    b371 - block
    b523 - block
    b934 - block
    b706 - block
    b112 - block
    b548 - block
    b275 - block
    b845 - block
    b267 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b634 )
    ( on b668 b634 )
    ( on b407 b668 )
    ( on b309 b407 )
    ( on b371 b309 )
    ( on b523 b371 )
    ( on b934 b523 )
    ( on b706 b934 )
    ( on b112 b706 )
    ( on b548 b112 )
    ( on b275 b548 )
    ( on b845 b275 )
    ( on b267 b845 )
    ( clear b267 )
  )
  ( :goal
    ( and
      ( clear b634 )
    )
  )
)
