( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b90 - block
    b770 - block
    b980 - block
    b552 - block
    b623 - block
    b381 - block
    b410 - block
    b961 - block
    b465 - block
    b210 - block
    b753 - block
    b717 - block
    b754 - block
    b535 - block
    b611 - block
    b462 - block
    b979 - block
    b461 - block
    b548 - block
    b458 - block
    b425 - block
    b455 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b90 )
    ( on b770 b90 )
    ( on b980 b770 )
    ( on b552 b980 )
    ( on b623 b552 )
    ( on b381 b623 )
    ( on b410 b381 )
    ( on b961 b410 )
    ( on b465 b961 )
    ( on b210 b465 )
    ( on b753 b210 )
    ( on b717 b753 )
    ( on b754 b717 )
    ( on b535 b754 )
    ( on b611 b535 )
    ( on b462 b611 )
    ( on b979 b462 )
    ( on b461 b979 )
    ( on b548 b461 )
    ( on b458 b548 )
    ( on b425 b458 )
    ( on b455 b425 )
    ( clear b455 )
  )
  ( :goal
    ( and
      ( clear b90 )
    )
  )
)
