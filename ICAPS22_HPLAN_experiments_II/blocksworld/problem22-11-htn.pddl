( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b559 - block
    b67 - block
    b36 - block
    b933 - block
    b433 - block
    b184 - block
    b696 - block
    b715 - block
    b527 - block
    b374 - block
    b59 - block
    b958 - block
    b546 - block
    b741 - block
    b238 - block
    b148 - block
    b14 - block
    b671 - block
    b675 - block
    b334 - block
    b935 - block
    b930 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b559 b790 )
    ( on b67 b559 )
    ( on b36 b67 )
    ( on b933 b36 )
    ( on b433 b933 )
    ( on b184 b433 )
    ( on b696 b184 )
    ( on b715 b696 )
    ( on b527 b715 )
    ( on b374 b527 )
    ( on b59 b374 )
    ( on b958 b59 )
    ( on b546 b958 )
    ( on b741 b546 )
    ( on b238 b741 )
    ( on b148 b238 )
    ( on b14 b148 )
    ( on b671 b14 )
    ( on b675 b671 )
    ( on b334 b675 )
    ( on b935 b334 )
    ( on b930 b935 )
    ( clear b930 )
  )
  ( :tasks
    ( Make-22Pile b559 b67 b36 b933 b433 b184 b696 b715 b527 b374 b59 b958 b546 b741 b238 b148 b14 b671 b675 b334 b935 b930 )
  )
)
