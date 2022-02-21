( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b847 - block
    b354 - block
    b507 - block
    b636 - block
    b577 - block
    b556 - block
    b534 - block
    b137 - block
    b876 - block
    b160 - block
    b509 - block
    b407 - block
    b295 - block
    b698 - block
    b260 - block
    b188 - block
    b510 - block
    b50 - block
    b292 - block
    b350 - block
    b49 - block
    b134 - block
    b945 - block
    b870 - block
    b626 - block
    b421 - block
    b926 - block
    b135 - block
    b428 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b847 b892 )
    ( on b354 b847 )
    ( on b507 b354 )
    ( on b636 b507 )
    ( on b577 b636 )
    ( on b556 b577 )
    ( on b534 b556 )
    ( on b137 b534 )
    ( on b876 b137 )
    ( on b160 b876 )
    ( on b509 b160 )
    ( on b407 b509 )
    ( on b295 b407 )
    ( on b698 b295 )
    ( on b260 b698 )
    ( on b188 b260 )
    ( on b510 b188 )
    ( on b50 b510 )
    ( on b292 b50 )
    ( on b350 b292 )
    ( on b49 b350 )
    ( on b134 b49 )
    ( on b945 b134 )
    ( on b870 b945 )
    ( on b626 b870 )
    ( on b421 b626 )
    ( on b926 b421 )
    ( on b135 b926 )
    ( on b428 b135 )
    ( on b126 b428 )
    ( clear b126 )
  )
  ( :goal
    ( and
      ( clear b892 )
    )
  )
)
