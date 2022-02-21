( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b519 - block
    b323 - block
    b489 - block
    b759 - block
    b83 - block
    b612 - block
    b894 - block
    b508 - block
    b667 - block
    b811 - block
    b256 - block
    b76 - block
    b160 - block
    b116 - block
    b827 - block
    b403 - block
    b134 - block
    b933 - block
    b267 - block
    b876 - block
    b396 - block
    b805 - block
    b147 - block
    b982 - block
    b926 - block
    b364 - block
    b587 - block
    b397 - block
    b807 - block
    b31 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b519 )
    ( on b323 b519 )
    ( on b489 b323 )
    ( on b759 b489 )
    ( on b83 b759 )
    ( on b612 b83 )
    ( on b894 b612 )
    ( on b508 b894 )
    ( on b667 b508 )
    ( on b811 b667 )
    ( on b256 b811 )
    ( on b76 b256 )
    ( on b160 b76 )
    ( on b116 b160 )
    ( on b827 b116 )
    ( on b403 b827 )
    ( on b134 b403 )
    ( on b933 b134 )
    ( on b267 b933 )
    ( on b876 b267 )
    ( on b396 b876 )
    ( on b805 b396 )
    ( on b147 b805 )
    ( on b982 b147 )
    ( on b926 b982 )
    ( on b364 b926 )
    ( on b587 b364 )
    ( on b397 b587 )
    ( on b807 b397 )
    ( on b31 b807 )
    ( on b309 b31 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b519 )
    )
  )
)
