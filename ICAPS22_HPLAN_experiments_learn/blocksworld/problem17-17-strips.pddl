( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b274 - block
    b582 - block
    b814 - block
    b26 - block
    b832 - block
    b452 - block
    b829 - block
    b60 - block
    b567 - block
    b929 - block
    b147 - block
    b156 - block
    b680 - block
    b2 - block
    b927 - block
    b682 - block
    b267 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b274 b942 )
    ( on b582 b274 )
    ( on b814 b582 )
    ( on b26 b814 )
    ( on b832 b26 )
    ( on b452 b832 )
    ( on b829 b452 )
    ( on b60 b829 )
    ( on b567 b60 )
    ( on b929 b567 )
    ( on b147 b929 )
    ( on b156 b147 )
    ( on b680 b156 )
    ( on b2 b680 )
    ( on b927 b2 )
    ( on b682 b927 )
    ( on b267 b682 )
    ( clear b267 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
