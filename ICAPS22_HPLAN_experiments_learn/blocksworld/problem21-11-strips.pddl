( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b169 - block
    b173 - block
    b52 - block
    b5 - block
    b105 - block
    b407 - block
    b423 - block
    b827 - block
    b567 - block
    b140 - block
    b339 - block
    b279 - block
    b125 - block
    b832 - block
    b969 - block
    b6 - block
    b530 - block
    b679 - block
    b464 - block
    b759 - block
    b345 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b169 )
    ( on b173 b169 )
    ( on b52 b173 )
    ( on b5 b52 )
    ( on b105 b5 )
    ( on b407 b105 )
    ( on b423 b407 )
    ( on b827 b423 )
    ( on b567 b827 )
    ( on b140 b567 )
    ( on b339 b140 )
    ( on b279 b339 )
    ( on b125 b279 )
    ( on b832 b125 )
    ( on b969 b832 )
    ( on b6 b969 )
    ( on b530 b6 )
    ( on b679 b530 )
    ( on b464 b679 )
    ( on b759 b464 )
    ( on b345 b759 )
    ( on b263 b345 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b169 )
    )
  )
)
