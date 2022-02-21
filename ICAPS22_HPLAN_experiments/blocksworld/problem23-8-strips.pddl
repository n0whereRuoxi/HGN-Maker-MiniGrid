( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b754 - block
    b332 - block
    b709 - block
    b810 - block
    b282 - block
    b759 - block
    b278 - block
    b313 - block
    b416 - block
    b429 - block
    b284 - block
    b454 - block
    b542 - block
    b687 - block
    b854 - block
    b91 - block
    b866 - block
    b575 - block
    b409 - block
    b705 - block
    b247 - block
    b74 - block
    b764 - block
    b12 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b754 )
    ( on b332 b754 )
    ( on b709 b332 )
    ( on b810 b709 )
    ( on b282 b810 )
    ( on b759 b282 )
    ( on b278 b759 )
    ( on b313 b278 )
    ( on b416 b313 )
    ( on b429 b416 )
    ( on b284 b429 )
    ( on b454 b284 )
    ( on b542 b454 )
    ( on b687 b542 )
    ( on b854 b687 )
    ( on b91 b854 )
    ( on b866 b91 )
    ( on b575 b866 )
    ( on b409 b575 )
    ( on b705 b409 )
    ( on b247 b705 )
    ( on b74 b247 )
    ( on b764 b74 )
    ( on b12 b764 )
    ( clear b12 )
  )
  ( :goal
    ( and
      ( clear b754 )
    )
  )
)
