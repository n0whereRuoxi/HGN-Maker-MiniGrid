( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b617 - block
    b877 - block
    b445 - block
    b734 - block
    b781 - block
    b463 - block
    b261 - block
    b963 - block
    b882 - block
    b931 - block
    b880 - block
    b540 - block
    b620 - block
    b439 - block
    b869 - block
    b339 - block
    b858 - block
    b202 - block
    b351 - block
    b86 - block
    b17 - block
    b710 - block
    b571 - block
    b940 - block
    b612 - block
    b985 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b617 b180 )
    ( on b877 b617 )
    ( on b445 b877 )
    ( on b734 b445 )
    ( on b781 b734 )
    ( on b463 b781 )
    ( on b261 b463 )
    ( on b963 b261 )
    ( on b882 b963 )
    ( on b931 b882 )
    ( on b880 b931 )
    ( on b540 b880 )
    ( on b620 b540 )
    ( on b439 b620 )
    ( on b869 b439 )
    ( on b339 b869 )
    ( on b858 b339 )
    ( on b202 b858 )
    ( on b351 b202 )
    ( on b86 b351 )
    ( on b17 b86 )
    ( on b710 b17 )
    ( on b571 b710 )
    ( on b940 b571 )
    ( on b612 b940 )
    ( on b985 b612 )
    ( on b738 b985 )
    ( clear b738 )
  )
  ( :goal
    ( and
      ( clear b180 )
    )
  )
)
