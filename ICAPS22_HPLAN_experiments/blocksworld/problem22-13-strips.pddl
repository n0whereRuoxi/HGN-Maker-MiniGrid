( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b693 - block
    b287 - block
    b91 - block
    b294 - block
    b184 - block
    b284 - block
    b840 - block
    b518 - block
    b213 - block
    b414 - block
    b35 - block
    b103 - block
    b557 - block
    b560 - block
    b413 - block
    b344 - block
    b36 - block
    b54 - block
    b309 - block
    b395 - block
    b22 - block
    b975 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b693 )
    ( on b287 b693 )
    ( on b91 b287 )
    ( on b294 b91 )
    ( on b184 b294 )
    ( on b284 b184 )
    ( on b840 b284 )
    ( on b518 b840 )
    ( on b213 b518 )
    ( on b414 b213 )
    ( on b35 b414 )
    ( on b103 b35 )
    ( on b557 b103 )
    ( on b560 b557 )
    ( on b413 b560 )
    ( on b344 b413 )
    ( on b36 b344 )
    ( on b54 b36 )
    ( on b309 b54 )
    ( on b395 b309 )
    ( on b22 b395 )
    ( on b975 b22 )
    ( on b830 b975 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b693 )
    )
  )
)
