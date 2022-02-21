( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b332 - block
    b898 - block
    b945 - block
    b408 - block
    b364 - block
    b113 - block
    b42 - block
    b785 - block
    b621 - block
    b109 - block
    b529 - block
    b1 - block
    b77 - block
    b378 - block
    b574 - block
    b955 - block
    b148 - block
    b931 - block
    b765 - block
    b453 - block
    b13 - block
    b871 - block
    b964 - block
    b967 - block
    b411 - block
    b114 - block
    b657 - block
    b687 - block
    b348 - block
    b226 - block
    b504 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b898 b332 )
    ( on b945 b898 )
    ( on b408 b945 )
    ( on b364 b408 )
    ( on b113 b364 )
    ( on b42 b113 )
    ( on b785 b42 )
    ( on b621 b785 )
    ( on b109 b621 )
    ( on b529 b109 )
    ( on b1 b529 )
    ( on b77 b1 )
    ( on b378 b77 )
    ( on b574 b378 )
    ( on b955 b574 )
    ( on b148 b955 )
    ( on b931 b148 )
    ( on b765 b931 )
    ( on b453 b765 )
    ( on b13 b453 )
    ( on b871 b13 )
    ( on b964 b871 )
    ( on b967 b964 )
    ( on b411 b967 )
    ( on b114 b411 )
    ( on b657 b114 )
    ( on b687 b657 )
    ( on b348 b687 )
    ( on b226 b348 )
    ( on b504 b226 )
    ( on b667 b504 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b332 )
    )
  )
)
