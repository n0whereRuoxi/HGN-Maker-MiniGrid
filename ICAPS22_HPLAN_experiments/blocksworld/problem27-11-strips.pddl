( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b605 - block
    b29 - block
    b962 - block
    b94 - block
    b775 - block
    b922 - block
    b856 - block
    b484 - block
    b852 - block
    b25 - block
    b186 - block
    b975 - block
    b817 - block
    b8 - block
    b18 - block
    b598 - block
    b575 - block
    b362 - block
    b264 - block
    b647 - block
    b216 - block
    b579 - block
    b935 - block
    b302 - block
    b103 - block
    b773 - block
    b358 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b605 b339 )
    ( on b29 b605 )
    ( on b962 b29 )
    ( on b94 b962 )
    ( on b775 b94 )
    ( on b922 b775 )
    ( on b856 b922 )
    ( on b484 b856 )
    ( on b852 b484 )
    ( on b25 b852 )
    ( on b186 b25 )
    ( on b975 b186 )
    ( on b817 b975 )
    ( on b8 b817 )
    ( on b18 b8 )
    ( on b598 b18 )
    ( on b575 b598 )
    ( on b362 b575 )
    ( on b264 b362 )
    ( on b647 b264 )
    ( on b216 b647 )
    ( on b579 b216 )
    ( on b935 b579 )
    ( on b302 b935 )
    ( on b103 b302 )
    ( on b773 b103 )
    ( on b358 b773 )
    ( clear b358 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
