( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b196 - block
    b789 - block
    b625 - block
    b50 - block
    b434 - block
    b424 - block
    b482 - block
    b322 - block
    b940 - block
    b267 - block
    b450 - block
    b45 - block
    b19 - block
    b336 - block
    b737 - block
    b560 - block
    b752 - block
    b42 - block
    b330 - block
    b700 - block
    b358 - block
    b591 - block
    b52 - block
    b755 - block
    b117 - block
    b932 - block
    b744 - block
    b327 - block
    b90 - block
    b702 - block
    b507 - block
    b22 - block
    b687 - block
    b793 - block
    b57 - block
    b984 - block
    b781 - block
    b126 - block
    b862 - block
    b907 - block
    b829 - block
    b429 - block
    b734 - block
    b455 - block
    b215 - block
    b728 - block
    b557 - block
    b28 - block
    b680 - block
    b104 - block
    b345 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b196 )
    ( on b789 b196 )
    ( on b625 b789 )
    ( on b50 b625 )
    ( on b434 b50 )
    ( on b424 b434 )
    ( on b482 b424 )
    ( on b322 b482 )
    ( on b940 b322 )
    ( on b267 b940 )
    ( on b450 b267 )
    ( on b45 b450 )
    ( on b19 b45 )
    ( on b336 b19 )
    ( on b737 b336 )
    ( on b560 b737 )
    ( on b752 b560 )
    ( on b42 b752 )
    ( on b330 b42 )
    ( on b700 b330 )
    ( on b358 b700 )
    ( on b591 b358 )
    ( on b52 b591 )
    ( on b755 b52 )
    ( on b117 b755 )
    ( on b932 b117 )
    ( on b744 b932 )
    ( on b327 b744 )
    ( on b90 b327 )
    ( on b702 b90 )
    ( on b507 b702 )
    ( on b22 b507 )
    ( on b687 b22 )
    ( on b793 b687 )
    ( on b57 b793 )
    ( on b984 b57 )
    ( on b781 b984 )
    ( on b126 b781 )
    ( on b862 b126 )
    ( on b907 b862 )
    ( on b829 b907 )
    ( on b429 b829 )
    ( on b734 b429 )
    ( on b455 b734 )
    ( on b215 b455 )
    ( on b728 b215 )
    ( on b557 b728 )
    ( on b28 b557 )
    ( on b680 b28 )
    ( on b104 b680 )
    ( on b345 b104 )
    ( clear b345 )
  )
  ( :goal
    ( and
      ( clear b196 )
    )
  )
)
