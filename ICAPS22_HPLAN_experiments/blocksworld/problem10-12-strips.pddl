( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b425 - block
    b172 - block
    b816 - block
    b410 - block
    b449 - block
    b737 - block
    b849 - block
    b349 - block
    b633 - block
    b427 - block
    b712 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b425 )
    ( on b172 b425 )
    ( on b816 b172 )
    ( on b410 b816 )
    ( on b449 b410 )
    ( on b737 b449 )
    ( on b849 b737 )
    ( on b349 b849 )
    ( on b633 b349 )
    ( on b427 b633 )
    ( on b712 b427 )
    ( clear b712 )
  )
  ( :goal
    ( and
      ( clear b425 )
    )
  )
)
