( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b77 - block
    b355 - block
    b84 - block
    b435 - block
    b601 - block
    b222 - block
    b749 - block
    b438 - block
    b189 - block
    b996 - block
    b216 - block
    b998 - block
    b150 - block
    b392 - block
    b732 - block
    b481 - block
    b587 - block
    b24 - block
    b721 - block
    b451 - block
    b68 - block
    b723 - block
    b416 - block
    b759 - block
    b419 - block
    b311 - block
    b751 - block
    b275 - block
    b362 - block
    b550 - block
    b655 - block
    b872 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b77 )
    ( on b355 b77 )
    ( on b84 b355 )
    ( on b435 b84 )
    ( on b601 b435 )
    ( on b222 b601 )
    ( on b749 b222 )
    ( on b438 b749 )
    ( on b189 b438 )
    ( on b996 b189 )
    ( on b216 b996 )
    ( on b998 b216 )
    ( on b150 b998 )
    ( on b392 b150 )
    ( on b732 b392 )
    ( on b481 b732 )
    ( on b587 b481 )
    ( on b24 b587 )
    ( on b721 b24 )
    ( on b451 b721 )
    ( on b68 b451 )
    ( on b723 b68 )
    ( on b416 b723 )
    ( on b759 b416 )
    ( on b419 b759 )
    ( on b311 b419 )
    ( on b751 b311 )
    ( on b275 b751 )
    ( on b362 b275 )
    ( on b550 b362 )
    ( on b655 b550 )
    ( on b872 b655 )
    ( clear b872 )
  )
  ( :goal
    ( and
      ( clear b77 )
    )
  )
)
