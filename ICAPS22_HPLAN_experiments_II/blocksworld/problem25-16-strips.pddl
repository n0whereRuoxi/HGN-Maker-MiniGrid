( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b130 - block
    b459 - block
    b102 - block
    b580 - block
    b53 - block
    b655 - block
    b121 - block
    b493 - block
    b98 - block
    b31 - block
    b838 - block
    b148 - block
    b579 - block
    b746 - block
    b996 - block
    b673 - block
    b347 - block
    b908 - block
    b811 - block
    b50 - block
    b546 - block
    b21 - block
    b101 - block
    b521 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b130 b401 )
    ( on b459 b130 )
    ( on b102 b459 )
    ( on b580 b102 )
    ( on b53 b580 )
    ( on b655 b53 )
    ( on b121 b655 )
    ( on b493 b121 )
    ( on b98 b493 )
    ( on b31 b98 )
    ( on b838 b31 )
    ( on b148 b838 )
    ( on b579 b148 )
    ( on b746 b579 )
    ( on b996 b746 )
    ( on b673 b996 )
    ( on b347 b673 )
    ( on b908 b347 )
    ( on b811 b908 )
    ( on b50 b811 )
    ( on b546 b50 )
    ( on b21 b546 )
    ( on b101 b21 )
    ( on b521 b101 )
    ( on b601 b521 )
    ( clear b601 )
  )
  ( :goal
    ( and
      ( clear b401 )
    )
  )
)
