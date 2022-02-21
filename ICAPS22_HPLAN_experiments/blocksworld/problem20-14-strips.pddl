( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b512 - block
    b822 - block
    b873 - block
    b946 - block
    b561 - block
    b630 - block
    b291 - block
    b269 - block
    b829 - block
    b969 - block
    b578 - block
    b353 - block
    b663 - block
    b200 - block
    b652 - block
    b358 - block
    b888 - block
    b692 - block
    b187 - block
    b622 - block
    b592 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b512 )
    ( on b822 b512 )
    ( on b873 b822 )
    ( on b946 b873 )
    ( on b561 b946 )
    ( on b630 b561 )
    ( on b291 b630 )
    ( on b269 b291 )
    ( on b829 b269 )
    ( on b969 b829 )
    ( on b578 b969 )
    ( on b353 b578 )
    ( on b663 b353 )
    ( on b200 b663 )
    ( on b652 b200 )
    ( on b358 b652 )
    ( on b888 b358 )
    ( on b692 b888 )
    ( on b187 b692 )
    ( on b622 b187 )
    ( on b592 b622 )
    ( clear b592 )
  )
  ( :goal
    ( and
      ( clear b512 )
    )
  )
)
