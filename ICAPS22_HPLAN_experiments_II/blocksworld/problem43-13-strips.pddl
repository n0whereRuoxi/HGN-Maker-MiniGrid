( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b4 - block
    b471 - block
    b716 - block
    b539 - block
    b840 - block
    b203 - block
    b173 - block
    b687 - block
    b226 - block
    b11 - block
    b61 - block
    b778 - block
    b93 - block
    b677 - block
    b817 - block
    b309 - block
    b894 - block
    b764 - block
    b725 - block
    b905 - block
    b949 - block
    b298 - block
    b279 - block
    b694 - block
    b367 - block
    b145 - block
    b581 - block
    b649 - block
    b663 - block
    b752 - block
    b592 - block
    b861 - block
    b15 - block
    b709 - block
    b481 - block
    b206 - block
    b402 - block
    b39 - block
    b710 - block
    b693 - block
    b512 - block
    b873 - block
    b291 - block
    b553 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b471 b4 )
    ( on b716 b471 )
    ( on b539 b716 )
    ( on b840 b539 )
    ( on b203 b840 )
    ( on b173 b203 )
    ( on b687 b173 )
    ( on b226 b687 )
    ( on b11 b226 )
    ( on b61 b11 )
    ( on b778 b61 )
    ( on b93 b778 )
    ( on b677 b93 )
    ( on b817 b677 )
    ( on b309 b817 )
    ( on b894 b309 )
    ( on b764 b894 )
    ( on b725 b764 )
    ( on b905 b725 )
    ( on b949 b905 )
    ( on b298 b949 )
    ( on b279 b298 )
    ( on b694 b279 )
    ( on b367 b694 )
    ( on b145 b367 )
    ( on b581 b145 )
    ( on b649 b581 )
    ( on b663 b649 )
    ( on b752 b663 )
    ( on b592 b752 )
    ( on b861 b592 )
    ( on b15 b861 )
    ( on b709 b15 )
    ( on b481 b709 )
    ( on b206 b481 )
    ( on b402 b206 )
    ( on b39 b402 )
    ( on b710 b39 )
    ( on b693 b710 )
    ( on b512 b693 )
    ( on b873 b512 )
    ( on b291 b873 )
    ( on b553 b291 )
    ( clear b553 )
  )
  ( :goal
    ( and
      ( clear b4 )
    )
  )
)
