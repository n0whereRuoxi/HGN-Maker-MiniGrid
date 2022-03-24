( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b660 - block
    b375 - block
    b869 - block
    b712 - block
    b185 - block
    b583 - block
    b76 - block
    b253 - block
    b481 - block
    b675 - block
    b387 - block
    b117 - block
    b347 - block
    b830 - block
    b300 - block
    b699 - block
    b181 - block
    b283 - block
    b571 - block
    b49 - block
    b764 - block
    b42 - block
    b495 - block
    b79 - block
    b547 - block
    b361 - block
    b654 - block
    b113 - block
    b657 - block
    b954 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b660 )
    ( on b375 b660 )
    ( on b869 b375 )
    ( on b712 b869 )
    ( on b185 b712 )
    ( on b583 b185 )
    ( on b76 b583 )
    ( on b253 b76 )
    ( on b481 b253 )
    ( on b675 b481 )
    ( on b387 b675 )
    ( on b117 b387 )
    ( on b347 b117 )
    ( on b830 b347 )
    ( on b300 b830 )
    ( on b699 b300 )
    ( on b181 b699 )
    ( on b283 b181 )
    ( on b571 b283 )
    ( on b49 b571 )
    ( on b764 b49 )
    ( on b42 b764 )
    ( on b495 b42 )
    ( on b79 b495 )
    ( on b547 b79 )
    ( on b361 b547 )
    ( on b654 b361 )
    ( on b113 b654 )
    ( on b657 b113 )
    ( on b954 b657 )
    ( clear b954 )
  )
  ( :goal
    ( and
      ( clear b660 )
    )
  )
)
