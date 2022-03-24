( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b442 - block
    b389 - block
    b764 - block
    b539 - block
    b944 - block
    b777 - block
    b511 - block
    b386 - block
    b653 - block
    b545 - block
    b22 - block
    b833 - block
    b451 - block
    b308 - block
    b551 - block
    b672 - block
    b851 - block
    b313 - block
    b861 - block
    b498 - block
    b17 - block
    b774 - block
    b179 - block
    b406 - block
    b209 - block
    b427 - block
    b157 - block
    b670 - block
    b792 - block
    b561 - block
    b228 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b442 b918 )
    ( on b389 b442 )
    ( on b764 b389 )
    ( on b539 b764 )
    ( on b944 b539 )
    ( on b777 b944 )
    ( on b511 b777 )
    ( on b386 b511 )
    ( on b653 b386 )
    ( on b545 b653 )
    ( on b22 b545 )
    ( on b833 b22 )
    ( on b451 b833 )
    ( on b308 b451 )
    ( on b551 b308 )
    ( on b672 b551 )
    ( on b851 b672 )
    ( on b313 b851 )
    ( on b861 b313 )
    ( on b498 b861 )
    ( on b17 b498 )
    ( on b774 b17 )
    ( on b179 b774 )
    ( on b406 b179 )
    ( on b209 b406 )
    ( on b427 b209 )
    ( on b157 b427 )
    ( on b670 b157 )
    ( on b792 b670 )
    ( on b561 b792 )
    ( on b228 b561 )
    ( on b136 b228 )
    ( clear b136 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
