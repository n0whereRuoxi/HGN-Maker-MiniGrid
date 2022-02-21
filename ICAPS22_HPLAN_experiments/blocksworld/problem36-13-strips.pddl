( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b455 - block
    b737 - block
    b182 - block
    b503 - block
    b90 - block
    b471 - block
    b651 - block
    b478 - block
    b335 - block
    b767 - block
    b841 - block
    b957 - block
    b168 - block
    b800 - block
    b83 - block
    b614 - block
    b113 - block
    b42 - block
    b630 - block
    b539 - block
    b80 - block
    b674 - block
    b354 - block
    b223 - block
    b602 - block
    b202 - block
    b310 - block
    b669 - block
    b316 - block
    b231 - block
    b490 - block
    b753 - block
    b787 - block
    b24 - block
    b825 - block
    b661 - block
    b267 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b455 )
    ( on b737 b455 )
    ( on b182 b737 )
    ( on b503 b182 )
    ( on b90 b503 )
    ( on b471 b90 )
    ( on b651 b471 )
    ( on b478 b651 )
    ( on b335 b478 )
    ( on b767 b335 )
    ( on b841 b767 )
    ( on b957 b841 )
    ( on b168 b957 )
    ( on b800 b168 )
    ( on b83 b800 )
    ( on b614 b83 )
    ( on b113 b614 )
    ( on b42 b113 )
    ( on b630 b42 )
    ( on b539 b630 )
    ( on b80 b539 )
    ( on b674 b80 )
    ( on b354 b674 )
    ( on b223 b354 )
    ( on b602 b223 )
    ( on b202 b602 )
    ( on b310 b202 )
    ( on b669 b310 )
    ( on b316 b669 )
    ( on b231 b316 )
    ( on b490 b231 )
    ( on b753 b490 )
    ( on b787 b753 )
    ( on b24 b787 )
    ( on b825 b24 )
    ( on b661 b825 )
    ( on b267 b661 )
    ( clear b267 )
  )
  ( :goal
    ( and
      ( clear b455 )
    )
  )
)
