( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b386 - block
    b942 - block
    b909 - block
    b35 - block
    b374 - block
    b872 - block
    b556 - block
    b121 - block
    b339 - block
    b524 - block
    b814 - block
    b10 - block
    b583 - block
    b972 - block
    b302 - block
    b68 - block
    b727 - block
    b508 - block
    b569 - block
    b404 - block
    b824 - block
    b258 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b386 )
    ( on b942 b386 )
    ( on b909 b942 )
    ( on b35 b909 )
    ( on b374 b35 )
    ( on b872 b374 )
    ( on b556 b872 )
    ( on b121 b556 )
    ( on b339 b121 )
    ( on b524 b339 )
    ( on b814 b524 )
    ( on b10 b814 )
    ( on b583 b10 )
    ( on b972 b583 )
    ( on b302 b972 )
    ( on b68 b302 )
    ( on b727 b68 )
    ( on b508 b727 )
    ( on b569 b508 )
    ( on b404 b569 )
    ( on b824 b404 )
    ( on b258 b824 )
    ( on b309 b258 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b386 )
    )
  )
)
