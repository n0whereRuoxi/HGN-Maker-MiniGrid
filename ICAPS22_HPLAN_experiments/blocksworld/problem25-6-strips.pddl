( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b869 - block
    b920 - block
    b45 - block
    b67 - block
    b991 - block
    b987 - block
    b305 - block
    b897 - block
    b383 - block
    b633 - block
    b588 - block
    b745 - block
    b275 - block
    b938 - block
    b77 - block
    b477 - block
    b142 - block
    b232 - block
    b503 - block
    b659 - block
    b507 - block
    b178 - block
    b804 - block
    b174 - block
    b19 - block
    b155 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b869 )
    ( on b920 b869 )
    ( on b45 b920 )
    ( on b67 b45 )
    ( on b991 b67 )
    ( on b987 b991 )
    ( on b305 b987 )
    ( on b897 b305 )
    ( on b383 b897 )
    ( on b633 b383 )
    ( on b588 b633 )
    ( on b745 b588 )
    ( on b275 b745 )
    ( on b938 b275 )
    ( on b77 b938 )
    ( on b477 b77 )
    ( on b142 b477 )
    ( on b232 b142 )
    ( on b503 b232 )
    ( on b659 b503 )
    ( on b507 b659 )
    ( on b178 b507 )
    ( on b804 b178 )
    ( on b174 b804 )
    ( on b19 b174 )
    ( on b155 b19 )
    ( clear b155 )
  )
  ( :goal
    ( and
      ( clear b869 )
    )
  )
)
