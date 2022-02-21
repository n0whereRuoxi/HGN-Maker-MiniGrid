( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b682 - block
    b545 - block
    b774 - block
    b548 - block
    b737 - block
    b161 - block
    b152 - block
    b871 - block
    b246 - block
    b197 - block
    b302 - block
    b524 - block
    b77 - block
    b80 - block
    b177 - block
    b432 - block
    b567 - block
    b934 - block
    b287 - block
    b478 - block
    b757 - block
    b998 - block
    b255 - block
    b535 - block
    b442 - block
    b801 - block
    b996 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b682 b424 )
    ( on b545 b682 )
    ( on b774 b545 )
    ( on b548 b774 )
    ( on b737 b548 )
    ( on b161 b737 )
    ( on b152 b161 )
    ( on b871 b152 )
    ( on b246 b871 )
    ( on b197 b246 )
    ( on b302 b197 )
    ( on b524 b302 )
    ( on b77 b524 )
    ( on b80 b77 )
    ( on b177 b80 )
    ( on b432 b177 )
    ( on b567 b432 )
    ( on b934 b567 )
    ( on b287 b934 )
    ( on b478 b287 )
    ( on b757 b478 )
    ( on b998 b757 )
    ( on b255 b998 )
    ( on b535 b255 )
    ( on b442 b535 )
    ( on b801 b442 )
    ( on b996 b801 )
    ( clear b996 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
