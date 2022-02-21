( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b685 - block
    b521 - block
    b630 - block
    b471 - block
    b999 - block
    b418 - block
    b715 - block
    b777 - block
    b316 - block
    b126 - block
    b242 - block
    b708 - block
    b720 - block
    b902 - block
    b990 - block
    b714 - block
    b214 - block
    b177 - block
    b198 - block
    b600 - block
    b813 - block
    b578 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b685 )
    ( on b521 b685 )
    ( on b630 b521 )
    ( on b471 b630 )
    ( on b999 b471 )
    ( on b418 b999 )
    ( on b715 b418 )
    ( on b777 b715 )
    ( on b316 b777 )
    ( on b126 b316 )
    ( on b242 b126 )
    ( on b708 b242 )
    ( on b720 b708 )
    ( on b902 b720 )
    ( on b990 b902 )
    ( on b714 b990 )
    ( on b214 b714 )
    ( on b177 b214 )
    ( on b198 b177 )
    ( on b600 b198 )
    ( on b813 b600 )
    ( on b578 b813 )
    ( clear b578 )
  )
  ( :goal
    ( and
      ( clear b685 )
    )
  )
)
