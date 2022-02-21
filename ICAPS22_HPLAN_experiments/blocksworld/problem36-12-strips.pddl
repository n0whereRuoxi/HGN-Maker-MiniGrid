( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b97 - block
    b118 - block
    b703 - block
    b804 - block
    b784 - block
    b787 - block
    b511 - block
    b274 - block
    b499 - block
    b99 - block
    b170 - block
    b420 - block
    b669 - block
    b201 - block
    b694 - block
    b544 - block
    b733 - block
    b684 - block
    b906 - block
    b423 - block
    b831 - block
    b792 - block
    b416 - block
    b521 - block
    b797 - block
    b200 - block
    b246 - block
    b553 - block
    b746 - block
    b263 - block
    b157 - block
    b860 - block
    b565 - block
    b498 - block
    b289 - block
    b843 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b97 )
    ( on b118 b97 )
    ( on b703 b118 )
    ( on b804 b703 )
    ( on b784 b804 )
    ( on b787 b784 )
    ( on b511 b787 )
    ( on b274 b511 )
    ( on b499 b274 )
    ( on b99 b499 )
    ( on b170 b99 )
    ( on b420 b170 )
    ( on b669 b420 )
    ( on b201 b669 )
    ( on b694 b201 )
    ( on b544 b694 )
    ( on b733 b544 )
    ( on b684 b733 )
    ( on b906 b684 )
    ( on b423 b906 )
    ( on b831 b423 )
    ( on b792 b831 )
    ( on b416 b792 )
    ( on b521 b416 )
    ( on b797 b521 )
    ( on b200 b797 )
    ( on b246 b200 )
    ( on b553 b246 )
    ( on b746 b553 )
    ( on b263 b746 )
    ( on b157 b263 )
    ( on b860 b157 )
    ( on b565 b860 )
    ( on b498 b565 )
    ( on b289 b498 )
    ( on b843 b289 )
    ( on b126 b843 )
    ( clear b126 )
  )
  ( :goal
    ( and
      ( clear b97 )
    )
  )
)
