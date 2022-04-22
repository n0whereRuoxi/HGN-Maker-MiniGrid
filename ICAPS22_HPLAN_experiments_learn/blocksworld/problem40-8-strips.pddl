( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b27 - block
    b175 - block
    b116 - block
    b290 - block
    b591 - block
    b302 - block
    b967 - block
    b816 - block
    b323 - block
    b645 - block
    b522 - block
    b471 - block
    b567 - block
    b260 - block
    b655 - block
    b833 - block
    b624 - block
    b52 - block
    b406 - block
    b200 - block
    b524 - block
    b125 - block
    b365 - block
    b62 - block
    b77 - block
    b247 - block
    b364 - block
    b342 - block
    b22 - block
    b981 - block
    b355 - block
    b690 - block
    b830 - block
    b139 - block
    b272 - block
    b923 - block
    b934 - block
    b572 - block
    b396 - block
    b230 - block
    b66 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b27 )
    ( on b175 b27 )
    ( on b116 b175 )
    ( on b290 b116 )
    ( on b591 b290 )
    ( on b302 b591 )
    ( on b967 b302 )
    ( on b816 b967 )
    ( on b323 b816 )
    ( on b645 b323 )
    ( on b522 b645 )
    ( on b471 b522 )
    ( on b567 b471 )
    ( on b260 b567 )
    ( on b655 b260 )
    ( on b833 b655 )
    ( on b624 b833 )
    ( on b52 b624 )
    ( on b406 b52 )
    ( on b200 b406 )
    ( on b524 b200 )
    ( on b125 b524 )
    ( on b365 b125 )
    ( on b62 b365 )
    ( on b77 b62 )
    ( on b247 b77 )
    ( on b364 b247 )
    ( on b342 b364 )
    ( on b22 b342 )
    ( on b981 b22 )
    ( on b355 b981 )
    ( on b690 b355 )
    ( on b830 b690 )
    ( on b139 b830 )
    ( on b272 b139 )
    ( on b923 b272 )
    ( on b934 b923 )
    ( on b572 b934 )
    ( on b396 b572 )
    ( on b230 b396 )
    ( on b66 b230 )
    ( clear b66 )
  )
  ( :goal
    ( and
      ( clear b27 )
    )
  )
)
