( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b801 - block
    b315 - block
    b628 - block
    b354 - block
    b738 - block
    b448 - block
    b839 - block
    b364 - block
    b484 - block
    b461 - block
    b348 - block
    b8 - block
    b189 - block
    b937 - block
    b781 - block
    b964 - block
    b292 - block
    b16 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b801 )
    ( on b315 b801 )
    ( on b628 b315 )
    ( on b354 b628 )
    ( on b738 b354 )
    ( on b448 b738 )
    ( on b839 b448 )
    ( on b364 b839 )
    ( on b484 b364 )
    ( on b461 b484 )
    ( on b348 b461 )
    ( on b8 b348 )
    ( on b189 b8 )
    ( on b937 b189 )
    ( on b781 b937 )
    ( on b964 b781 )
    ( on b292 b964 )
    ( on b16 b292 )
    ( clear b16 )
  )
  ( :goal
    ( and
      ( clear b801 )
    )
  )
)
