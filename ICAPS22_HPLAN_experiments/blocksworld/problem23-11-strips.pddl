( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b819 - block
    b850 - block
    b704 - block
    b929 - block
    b532 - block
    b569 - block
    b244 - block
    b242 - block
    b295 - block
    b148 - block
    b877 - block
    b782 - block
    b565 - block
    b500 - block
    b768 - block
    b440 - block
    b446 - block
    b165 - block
    b454 - block
    b238 - block
    b579 - block
    b930 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b819 b387 )
    ( on b850 b819 )
    ( on b704 b850 )
    ( on b929 b704 )
    ( on b532 b929 )
    ( on b569 b532 )
    ( on b244 b569 )
    ( on b242 b244 )
    ( on b295 b242 )
    ( on b148 b295 )
    ( on b877 b148 )
    ( on b782 b877 )
    ( on b565 b782 )
    ( on b500 b565 )
    ( on b768 b500 )
    ( on b440 b768 )
    ( on b446 b440 )
    ( on b165 b446 )
    ( on b454 b165 )
    ( on b238 b454 )
    ( on b579 b238 )
    ( on b930 b579 )
    ( on b366 b930 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
