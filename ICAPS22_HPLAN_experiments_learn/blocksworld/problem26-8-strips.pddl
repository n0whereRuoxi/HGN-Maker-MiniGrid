( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b653 - block
    b393 - block
    b598 - block
    b158 - block
    b336 - block
    b805 - block
    b579 - block
    b35 - block
    b275 - block
    b484 - block
    b469 - block
    b979 - block
    b604 - block
    b767 - block
    b945 - block
    b376 - block
    b593 - block
    b489 - block
    b20 - block
    b426 - block
    b938 - block
    b271 - block
    b2 - block
    b38 - block
    b566 - block
    b229 - block
    b284 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b653 )
    ( on b393 b653 )
    ( on b598 b393 )
    ( on b158 b598 )
    ( on b336 b158 )
    ( on b805 b336 )
    ( on b579 b805 )
    ( on b35 b579 )
    ( on b275 b35 )
    ( on b484 b275 )
    ( on b469 b484 )
    ( on b979 b469 )
    ( on b604 b979 )
    ( on b767 b604 )
    ( on b945 b767 )
    ( on b376 b945 )
    ( on b593 b376 )
    ( on b489 b593 )
    ( on b20 b489 )
    ( on b426 b20 )
    ( on b938 b426 )
    ( on b271 b938 )
    ( on b2 b271 )
    ( on b38 b2 )
    ( on b566 b38 )
    ( on b229 b566 )
    ( on b284 b229 )
    ( clear b284 )
  )
  ( :goal
    ( and
      ( clear b653 )
    )
  )
)
