( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b743 - block
    b372 - block
    b545 - block
    b49 - block
    b637 - block
    b146 - block
    b933 - block
    b854 - block
    b325 - block
    b193 - block
    b32 - block
    b489 - block
    b423 - block
    b656 - block
    b606 - block
    b952 - block
    b230 - block
    b579 - block
    b179 - block
    b868 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b743 )
    ( on b372 b743 )
    ( on b545 b372 )
    ( on b49 b545 )
    ( on b637 b49 )
    ( on b146 b637 )
    ( on b933 b146 )
    ( on b854 b933 )
    ( on b325 b854 )
    ( on b193 b325 )
    ( on b32 b193 )
    ( on b489 b32 )
    ( on b423 b489 )
    ( on b656 b423 )
    ( on b606 b656 )
    ( on b952 b606 )
    ( on b230 b952 )
    ( on b579 b230 )
    ( on b179 b579 )
    ( on b868 b179 )
    ( clear b868 )
  )
  ( :goal
    ( and
      ( clear b743 )
    )
  )
)
