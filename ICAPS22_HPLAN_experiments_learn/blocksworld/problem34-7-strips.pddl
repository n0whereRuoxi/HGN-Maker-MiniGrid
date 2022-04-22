( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b723 - block
    b102 - block
    b921 - block
    b620 - block
    b264 - block
    b530 - block
    b347 - block
    b433 - block
    b574 - block
    b26 - block
    b512 - block
    b785 - block
    b317 - block
    b15 - block
    b647 - block
    b987 - block
    b293 - block
    b480 - block
    b503 - block
    b88 - block
    b389 - block
    b534 - block
    b287 - block
    b425 - block
    b983 - block
    b300 - block
    b81 - block
    b693 - block
    b509 - block
    b103 - block
    b176 - block
    b865 - block
    b256 - block
    b386 - block
    b582 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b102 b723 )
    ( on b921 b102 )
    ( on b620 b921 )
    ( on b264 b620 )
    ( on b530 b264 )
    ( on b347 b530 )
    ( on b433 b347 )
    ( on b574 b433 )
    ( on b26 b574 )
    ( on b512 b26 )
    ( on b785 b512 )
    ( on b317 b785 )
    ( on b15 b317 )
    ( on b647 b15 )
    ( on b987 b647 )
    ( on b293 b987 )
    ( on b480 b293 )
    ( on b503 b480 )
    ( on b88 b503 )
    ( on b389 b88 )
    ( on b534 b389 )
    ( on b287 b534 )
    ( on b425 b287 )
    ( on b983 b425 )
    ( on b300 b983 )
    ( on b81 b300 )
    ( on b693 b81 )
    ( on b509 b693 )
    ( on b103 b509 )
    ( on b176 b103 )
    ( on b865 b176 )
    ( on b256 b865 )
    ( on b386 b256 )
    ( on b582 b386 )
    ( clear b582 )
  )
  ( :goal
    ( and
      ( clear b723 )
    )
  )
)
