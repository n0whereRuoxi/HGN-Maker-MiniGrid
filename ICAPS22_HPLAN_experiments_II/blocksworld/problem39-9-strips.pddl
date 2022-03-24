( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b692 - block
    b359 - block
    b592 - block
    b198 - block
    b79 - block
    b148 - block
    b641 - block
    b947 - block
    b385 - block
    b334 - block
    b650 - block
    b812 - block
    b973 - block
    b204 - block
    b929 - block
    b837 - block
    b377 - block
    b809 - block
    b178 - block
    b509 - block
    b985 - block
    b273 - block
    b395 - block
    b689 - block
    b659 - block
    b690 - block
    b326 - block
    b987 - block
    b478 - block
    b345 - block
    b521 - block
    b835 - block
    b673 - block
    b786 - block
    b846 - block
    b436 - block
    b782 - block
    b587 - block
    b980 - block
    b585 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b692 )
    ( on b359 b692 )
    ( on b592 b359 )
    ( on b198 b592 )
    ( on b79 b198 )
    ( on b148 b79 )
    ( on b641 b148 )
    ( on b947 b641 )
    ( on b385 b947 )
    ( on b334 b385 )
    ( on b650 b334 )
    ( on b812 b650 )
    ( on b973 b812 )
    ( on b204 b973 )
    ( on b929 b204 )
    ( on b837 b929 )
    ( on b377 b837 )
    ( on b809 b377 )
    ( on b178 b809 )
    ( on b509 b178 )
    ( on b985 b509 )
    ( on b273 b985 )
    ( on b395 b273 )
    ( on b689 b395 )
    ( on b659 b689 )
    ( on b690 b659 )
    ( on b326 b690 )
    ( on b987 b326 )
    ( on b478 b987 )
    ( on b345 b478 )
    ( on b521 b345 )
    ( on b835 b521 )
    ( on b673 b835 )
    ( on b786 b673 )
    ( on b846 b786 )
    ( on b436 b846 )
    ( on b782 b436 )
    ( on b587 b782 )
    ( on b980 b587 )
    ( on b585 b980 )
    ( clear b585 )
  )
  ( :goal
    ( and
      ( clear b692 )
    )
  )
)
