( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b552 - block
    b361 - block
    b67 - block
    b534 - block
    b938 - block
    b159 - block
    b286 - block
    b685 - block
    b73 - block
    b448 - block
    b559 - block
    b287 - block
    b377 - block
    b7 - block
    b308 - block
    b215 - block
    b318 - block
    b591 - block
    b164 - block
    b499 - block
    b219 - block
    b459 - block
    b806 - block
    b672 - block
    b191 - block
    b105 - block
    b945 - block
    b95 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b361 b552 )
    ( on b67 b361 )
    ( on b534 b67 )
    ( on b938 b534 )
    ( on b159 b938 )
    ( on b286 b159 )
    ( on b685 b286 )
    ( on b73 b685 )
    ( on b448 b73 )
    ( on b559 b448 )
    ( on b287 b559 )
    ( on b377 b287 )
    ( on b7 b377 )
    ( on b308 b7 )
    ( on b215 b308 )
    ( on b318 b215 )
    ( on b591 b318 )
    ( on b164 b591 )
    ( on b499 b164 )
    ( on b219 b499 )
    ( on b459 b219 )
    ( on b806 b459 )
    ( on b672 b806 )
    ( on b191 b672 )
    ( on b105 b191 )
    ( on b945 b105 )
    ( on b95 b945 )
    ( clear b95 )
  )
  ( :goal
    ( and
      ( clear b552 )
    )
  )
)
