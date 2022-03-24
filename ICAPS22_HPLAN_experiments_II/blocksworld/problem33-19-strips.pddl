( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b356 - block
    b17 - block
    b405 - block
    b963 - block
    b685 - block
    b550 - block
    b698 - block
    b4 - block
    b23 - block
    b265 - block
    b155 - block
    b543 - block
    b109 - block
    b176 - block
    b853 - block
    b664 - block
    b446 - block
    b459 - block
    b267 - block
    b430 - block
    b547 - block
    b582 - block
    b6 - block
    b216 - block
    b742 - block
    b165 - block
    b118 - block
    b59 - block
    b966 - block
    b630 - block
    b83 - block
    b26 - block
    b954 - block
    b135 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b17 b356 )
    ( on b405 b17 )
    ( on b963 b405 )
    ( on b685 b963 )
    ( on b550 b685 )
    ( on b698 b550 )
    ( on b4 b698 )
    ( on b23 b4 )
    ( on b265 b23 )
    ( on b155 b265 )
    ( on b543 b155 )
    ( on b109 b543 )
    ( on b176 b109 )
    ( on b853 b176 )
    ( on b664 b853 )
    ( on b446 b664 )
    ( on b459 b446 )
    ( on b267 b459 )
    ( on b430 b267 )
    ( on b547 b430 )
    ( on b582 b547 )
    ( on b6 b582 )
    ( on b216 b6 )
    ( on b742 b216 )
    ( on b165 b742 )
    ( on b118 b165 )
    ( on b59 b118 )
    ( on b966 b59 )
    ( on b630 b966 )
    ( on b83 b630 )
    ( on b26 b83 )
    ( on b954 b26 )
    ( on b135 b954 )
    ( clear b135 )
  )
  ( :goal
    ( and
      ( clear b356 )
    )
  )
)
