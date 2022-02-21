( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b5 - block
    b738 - block
    b840 - block
    b458 - block
    b127 - block
    b694 - block
    b736 - block
    b910 - block
    b22 - block
    b29 - block
    b515 - block
    b601 - block
    b374 - block
    b311 - block
    b561 - block
    b611 - block
    b722 - block
    b74 - block
    b180 - block
    b80 - block
    b439 - block
    b39 - block
    b879 - block
    b32 - block
    b286 - block
    b90 - block
    b723 - block
    b710 - block
    b914 - block
    b730 - block
    b159 - block
    b847 - block
    b71 - block
    b473 - block
    b608 - block
    b763 - block
    b507 - block
    b453 - block
    b533 - block
    b857 - block
    b786 - block
    b304 - block
    b25 - block
    b839 - block
    b112 - block
    b992 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b5 )
    ( on b738 b5 )
    ( on b840 b738 )
    ( on b458 b840 )
    ( on b127 b458 )
    ( on b694 b127 )
    ( on b736 b694 )
    ( on b910 b736 )
    ( on b22 b910 )
    ( on b29 b22 )
    ( on b515 b29 )
    ( on b601 b515 )
    ( on b374 b601 )
    ( on b311 b374 )
    ( on b561 b311 )
    ( on b611 b561 )
    ( on b722 b611 )
    ( on b74 b722 )
    ( on b180 b74 )
    ( on b80 b180 )
    ( on b439 b80 )
    ( on b39 b439 )
    ( on b879 b39 )
    ( on b32 b879 )
    ( on b286 b32 )
    ( on b90 b286 )
    ( on b723 b90 )
    ( on b710 b723 )
    ( on b914 b710 )
    ( on b730 b914 )
    ( on b159 b730 )
    ( on b847 b159 )
    ( on b71 b847 )
    ( on b473 b71 )
    ( on b608 b473 )
    ( on b763 b608 )
    ( on b507 b763 )
    ( on b453 b507 )
    ( on b533 b453 )
    ( on b857 b533 )
    ( on b786 b857 )
    ( on b304 b786 )
    ( on b25 b304 )
    ( on b839 b25 )
    ( on b112 b839 )
    ( on b992 b112 )
    ( clear b992 )
  )
  ( :goal
    ( and
      ( clear b5 )
    )
  )
)
