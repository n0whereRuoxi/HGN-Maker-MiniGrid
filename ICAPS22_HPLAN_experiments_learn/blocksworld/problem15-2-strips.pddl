( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b19 - block
    b843 - block
    b565 - block
    b951 - block
    b728 - block
    b291 - block
    b324 - block
    b392 - block
    b1 - block
    b897 - block
    b643 - block
    b146 - block
    b133 - block
    b638 - block
    b861 - block
    b774 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b19 )
    ( on b843 b19 )
    ( on b565 b843 )
    ( on b951 b565 )
    ( on b728 b951 )
    ( on b291 b728 )
    ( on b324 b291 )
    ( on b392 b324 )
    ( on b1 b392 )
    ( on b897 b1 )
    ( on b643 b897 )
    ( on b146 b643 )
    ( on b133 b146 )
    ( on b638 b133 )
    ( on b861 b638 )
    ( on b774 b861 )
    ( clear b774 )
  )
  ( :goal
    ( and
      ( clear b19 )
    )
  )
)
