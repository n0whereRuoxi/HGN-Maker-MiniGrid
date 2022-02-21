( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b392 - block
    b825 - block
    b896 - block
    b385 - block
    b389 - block
    b614 - block
    b781 - block
    b204 - block
    b560 - block
    b174 - block
    b983 - block
    b441 - block
    b289 - block
    b407 - block
    b498 - block
    b660 - block
    b648 - block
    b996 - block
    b345 - block
    b516 - block
    b311 - block
    b160 - block
    b861 - block
    b626 - block
    b285 - block
    b267 - block
    b179 - block
    b66 - block
    b597 - block
    b984 - block
    b343 - block
    b350 - block
    b459 - block
    b867 - block
    b716 - block
    b897 - block
    b136 - block
    b367 - block
    b798 - block
    b503 - block
    b877 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b392 )
    ( on b825 b392 )
    ( on b896 b825 )
    ( on b385 b896 )
    ( on b389 b385 )
    ( on b614 b389 )
    ( on b781 b614 )
    ( on b204 b781 )
    ( on b560 b204 )
    ( on b174 b560 )
    ( on b983 b174 )
    ( on b441 b983 )
    ( on b289 b441 )
    ( on b407 b289 )
    ( on b498 b407 )
    ( on b660 b498 )
    ( on b648 b660 )
    ( on b996 b648 )
    ( on b345 b996 )
    ( on b516 b345 )
    ( on b311 b516 )
    ( on b160 b311 )
    ( on b861 b160 )
    ( on b626 b861 )
    ( on b285 b626 )
    ( on b267 b285 )
    ( on b179 b267 )
    ( on b66 b179 )
    ( on b597 b66 )
    ( on b984 b597 )
    ( on b343 b984 )
    ( on b350 b343 )
    ( on b459 b350 )
    ( on b867 b459 )
    ( on b716 b867 )
    ( on b897 b716 )
    ( on b136 b897 )
    ( on b367 b136 )
    ( on b798 b367 )
    ( on b503 b798 )
    ( on b877 b503 )
    ( clear b877 )
  )
  ( :goal
    ( and
      ( clear b392 )
    )
  )
)
