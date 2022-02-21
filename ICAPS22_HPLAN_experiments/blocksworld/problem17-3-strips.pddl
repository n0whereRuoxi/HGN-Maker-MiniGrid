( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b201 - block
    b359 - block
    b674 - block
    b687 - block
    b343 - block
    b802 - block
    b270 - block
    b294 - block
    b589 - block
    b250 - block
    b25 - block
    b907 - block
    b109 - block
    b775 - block
    b895 - block
    b561 - block
    b631 - block
    b85 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b201 )
    ( on b359 b201 )
    ( on b674 b359 )
    ( on b687 b674 )
    ( on b343 b687 )
    ( on b802 b343 )
    ( on b270 b802 )
    ( on b294 b270 )
    ( on b589 b294 )
    ( on b250 b589 )
    ( on b25 b250 )
    ( on b907 b25 )
    ( on b109 b907 )
    ( on b775 b109 )
    ( on b895 b775 )
    ( on b561 b895 )
    ( on b631 b561 )
    ( on b85 b631 )
    ( clear b85 )
  )
  ( :goal
    ( and
      ( clear b201 )
    )
  )
)
