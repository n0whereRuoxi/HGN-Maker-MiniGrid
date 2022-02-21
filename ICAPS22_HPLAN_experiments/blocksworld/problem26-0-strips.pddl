( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b849 - block
    b284 - block
    b741 - block
    b907 - block
    b121 - block
    b644 - block
    b432 - block
    b879 - block
    b223 - block
    b516 - block
    b301 - block
    b630 - block
    b955 - block
    b492 - block
    b892 - block
    b491 - block
    b950 - block
    b89 - block
    b36 - block
    b712 - block
    b273 - block
    b187 - block
    b390 - block
    b383 - block
    b293 - block
    b512 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b849 )
    ( on b284 b849 )
    ( on b741 b284 )
    ( on b907 b741 )
    ( on b121 b907 )
    ( on b644 b121 )
    ( on b432 b644 )
    ( on b879 b432 )
    ( on b223 b879 )
    ( on b516 b223 )
    ( on b301 b516 )
    ( on b630 b301 )
    ( on b955 b630 )
    ( on b492 b955 )
    ( on b892 b492 )
    ( on b491 b892 )
    ( on b950 b491 )
    ( on b89 b950 )
    ( on b36 b89 )
    ( on b712 b36 )
    ( on b273 b712 )
    ( on b187 b273 )
    ( on b390 b187 )
    ( on b383 b390 )
    ( on b293 b383 )
    ( on b512 b293 )
    ( on b370 b512 )
    ( clear b370 )
  )
  ( :goal
    ( and
      ( clear b849 )
    )
  )
)
