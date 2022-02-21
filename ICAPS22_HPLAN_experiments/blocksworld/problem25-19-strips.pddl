( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b101 - block
    b774 - block
    b23 - block
    b1 - block
    b85 - block
    b371 - block
    b518 - block
    b225 - block
    b140 - block
    b566 - block
    b233 - block
    b638 - block
    b683 - block
    b483 - block
    b422 - block
    b570 - block
    b138 - block
    b280 - block
    b856 - block
    b898 - block
    b650 - block
    b887 - block
    b808 - block
    b906 - block
    b126 - block
    b511 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b101 )
    ( on b774 b101 )
    ( on b23 b774 )
    ( on b1 b23 )
    ( on b85 b1 )
    ( on b371 b85 )
    ( on b518 b371 )
    ( on b225 b518 )
    ( on b140 b225 )
    ( on b566 b140 )
    ( on b233 b566 )
    ( on b638 b233 )
    ( on b683 b638 )
    ( on b483 b683 )
    ( on b422 b483 )
    ( on b570 b422 )
    ( on b138 b570 )
    ( on b280 b138 )
    ( on b856 b280 )
    ( on b898 b856 )
    ( on b650 b898 )
    ( on b887 b650 )
    ( on b808 b887 )
    ( on b906 b808 )
    ( on b126 b906 )
    ( on b511 b126 )
    ( clear b511 )
  )
  ( :goal
    ( and
      ( clear b101 )
    )
  )
)
