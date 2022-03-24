( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b969 - block
    b883 - block
    b775 - block
    b492 - block
    b337 - block
    b626 - block
    b727 - block
    b572 - block
    b509 - block
    b200 - block
    b830 - block
    b184 - block
    b611 - block
    b17 - block
    b528 - block
    b85 - block
    b193 - block
    b159 - block
    b524 - block
    b477 - block
    b771 - block
    b766 - block
    b559 - block
    b763 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b969 )
    ( on b883 b969 )
    ( on b775 b883 )
    ( on b492 b775 )
    ( on b337 b492 )
    ( on b626 b337 )
    ( on b727 b626 )
    ( on b572 b727 )
    ( on b509 b572 )
    ( on b200 b509 )
    ( on b830 b200 )
    ( on b184 b830 )
    ( on b611 b184 )
    ( on b17 b611 )
    ( on b528 b17 )
    ( on b85 b528 )
    ( on b193 b85 )
    ( on b159 b193 )
    ( on b524 b159 )
    ( on b477 b524 )
    ( on b771 b477 )
    ( on b766 b771 )
    ( on b559 b766 )
    ( on b763 b559 )
    ( clear b763 )
  )
  ( :goal
    ( and
      ( clear b969 )
    )
  )
)
