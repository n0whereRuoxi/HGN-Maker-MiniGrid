( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b624 - block
    b869 - block
    b43 - block
    b80 - block
    b540 - block
    b424 - block
    b838 - block
    b283 - block
    b123 - block
    b657 - block
    b425 - block
    b698 - block
    b879 - block
    b504 - block
    b649 - block
    b66 - block
    b619 - block
    b831 - block
    b531 - block
    b913 - block
    b306 - block
    b679 - block
    b387 - block
    b197 - block
    b23 - block
    b319 - block
    b462 - block
    b812 - block
    b280 - block
    b39 - block
    b848 - block
    b203 - block
    b376 - block
    b801 - block
    b581 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b624 b613 )
    ( on b869 b624 )
    ( on b43 b869 )
    ( on b80 b43 )
    ( on b540 b80 )
    ( on b424 b540 )
    ( on b838 b424 )
    ( on b283 b838 )
    ( on b123 b283 )
    ( on b657 b123 )
    ( on b425 b657 )
    ( on b698 b425 )
    ( on b879 b698 )
    ( on b504 b879 )
    ( on b649 b504 )
    ( on b66 b649 )
    ( on b619 b66 )
    ( on b831 b619 )
    ( on b531 b831 )
    ( on b913 b531 )
    ( on b306 b913 )
    ( on b679 b306 )
    ( on b387 b679 )
    ( on b197 b387 )
    ( on b23 b197 )
    ( on b319 b23 )
    ( on b462 b319 )
    ( on b812 b462 )
    ( on b280 b812 )
    ( on b39 b280 )
    ( on b848 b39 )
    ( on b203 b848 )
    ( on b376 b203 )
    ( on b801 b376 )
    ( on b581 b801 )
    ( clear b581 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
