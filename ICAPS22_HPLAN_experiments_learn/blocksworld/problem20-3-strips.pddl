( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b207 - block
    b743 - block
    b929 - block
    b619 - block
    b482 - block
    b439 - block
    b821 - block
    b710 - block
    b242 - block
    b834 - block
    b898 - block
    b747 - block
    b841 - block
    b536 - block
    b835 - block
    b840 - block
    b88 - block
    b355 - block
    b466 - block
    b708 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b207 )
    ( on b743 b207 )
    ( on b929 b743 )
    ( on b619 b929 )
    ( on b482 b619 )
    ( on b439 b482 )
    ( on b821 b439 )
    ( on b710 b821 )
    ( on b242 b710 )
    ( on b834 b242 )
    ( on b898 b834 )
    ( on b747 b898 )
    ( on b841 b747 )
    ( on b536 b841 )
    ( on b835 b536 )
    ( on b840 b835 )
    ( on b88 b840 )
    ( on b355 b88 )
    ( on b466 b355 )
    ( on b708 b466 )
    ( on b730 b708 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b207 )
    )
  )
)
