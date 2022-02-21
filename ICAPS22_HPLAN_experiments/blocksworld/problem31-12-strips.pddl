( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b471 - block
    b147 - block
    b216 - block
    b702 - block
    b455 - block
    b349 - block
    b951 - block
    b655 - block
    b874 - block
    b441 - block
    b590 - block
    b163 - block
    b677 - block
    b162 - block
    b810 - block
    b673 - block
    b557 - block
    b347 - block
    b716 - block
    b954 - block
    b237 - block
    b415 - block
    b118 - block
    b482 - block
    b361 - block
    b343 - block
    b68 - block
    b96 - block
    b542 - block
    b180 - block
    b933 - block
    b670 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b471 )
    ( on b147 b471 )
    ( on b216 b147 )
    ( on b702 b216 )
    ( on b455 b702 )
    ( on b349 b455 )
    ( on b951 b349 )
    ( on b655 b951 )
    ( on b874 b655 )
    ( on b441 b874 )
    ( on b590 b441 )
    ( on b163 b590 )
    ( on b677 b163 )
    ( on b162 b677 )
    ( on b810 b162 )
    ( on b673 b810 )
    ( on b557 b673 )
    ( on b347 b557 )
    ( on b716 b347 )
    ( on b954 b716 )
    ( on b237 b954 )
    ( on b415 b237 )
    ( on b118 b415 )
    ( on b482 b118 )
    ( on b361 b482 )
    ( on b343 b361 )
    ( on b68 b343 )
    ( on b96 b68 )
    ( on b542 b96 )
    ( on b180 b542 )
    ( on b933 b180 )
    ( on b670 b933 )
    ( clear b670 )
  )
  ( :goal
    ( and
      ( clear b471 )
    )
  )
)
