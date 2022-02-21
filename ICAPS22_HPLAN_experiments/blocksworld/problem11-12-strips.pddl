( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b938 - block
    b305 - block
    b249 - block
    b752 - block
    b129 - block
    b573 - block
    b300 - block
    b651 - block
    b862 - block
    b669 - block
    b436 - block
    b685 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b938 )
    ( on b305 b938 )
    ( on b249 b305 )
    ( on b752 b249 )
    ( on b129 b752 )
    ( on b573 b129 )
    ( on b300 b573 )
    ( on b651 b300 )
    ( on b862 b651 )
    ( on b669 b862 )
    ( on b436 b669 )
    ( on b685 b436 )
    ( clear b685 )
  )
  ( :goal
    ( and
      ( clear b938 )
    )
  )
)
