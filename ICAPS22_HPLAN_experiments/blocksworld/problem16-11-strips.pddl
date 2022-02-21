( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b338 - block
    b739 - block
    b163 - block
    b97 - block
    b59 - block
    b883 - block
    b435 - block
    b281 - block
    b948 - block
    b96 - block
    b263 - block
    b49 - block
    b785 - block
    b735 - block
    b954 - block
    b946 - block
    b705 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b338 )
    ( on b739 b338 )
    ( on b163 b739 )
    ( on b97 b163 )
    ( on b59 b97 )
    ( on b883 b59 )
    ( on b435 b883 )
    ( on b281 b435 )
    ( on b948 b281 )
    ( on b96 b948 )
    ( on b263 b96 )
    ( on b49 b263 )
    ( on b785 b49 )
    ( on b735 b785 )
    ( on b954 b735 )
    ( on b946 b954 )
    ( on b705 b946 )
    ( clear b705 )
  )
  ( :goal
    ( and
      ( clear b338 )
    )
  )
)
