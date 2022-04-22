( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b172 - block
    b396 - block
    b688 - block
    b244 - block
    b658 - block
    b159 - block
    b736 - block
    b610 - block
    b187 - block
    b459 - block
    b595 - block
    b118 - block
    b777 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b396 b172 )
    ( on b688 b396 )
    ( on b244 b688 )
    ( on b658 b244 )
    ( on b159 b658 )
    ( on b736 b159 )
    ( on b610 b736 )
    ( on b187 b610 )
    ( on b459 b187 )
    ( on b595 b459 )
    ( on b118 b595 )
    ( on b777 b118 )
    ( clear b777 )
  )
  ( :goal
    ( and
      ( clear b172 )
    )
  )
)
